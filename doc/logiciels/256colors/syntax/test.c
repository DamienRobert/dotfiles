//http://www.normalesup.org/~bisson/src/stirfs-1.4.c
//http://www.normalesup.org/~bisson/src/
/*
 * Copyright (C) 2010-2013, Gaetan Bisson <bisson@archlinux.org>.
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
 * SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
 * OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
 * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

/*
 * StirFS. The secure, transparent and irresistible filesystem.
 *
 * StirFS is an encrypted filesystem for FUSE; its design focuses are
 * minimalism, flexibility, and security. Minimalism should be obvious at the
 * view of this single, short C file; flexibility means StirFS just encrypts
 * filenames and blocks, and relies on a host filesystem for the rest; security
 * stems from strong cryptographic primitives and modes of operation.
 *
 * Compile with:
 *
 *   cc -O2 -lfuse -lcrypto -o stirfs stirfs.c
 */

/*
 * INTERNALS OVERVIEW
 *
 * An AES256 master key is derived from the input password by computing the
 * SHA256 digest of its concatenation with a fixed salt value.
 *
 * Filenames are encrypted as follows: pad them with just enough NULL bytes to
 * get a length divisible by the AES block size (128 bits), encrypt by AES256
 * in CBC mode, then xor the last block into the first one, encrypt again (to
 * ensure two-way diffusion), and finally base64-encode.
 *
 * The first block of each file is a nonce; following blocks consist of actual
 * data (with offsets shifted) encrypted by AES256 in (modified) CTR mode.
 */

/*
 * DESIGN NOTES
 *
 * We have no use for the strn*() family of string functions since they are
 * impractical and irrelevant here from a security standpoint; from a stability
 * standpoint, if the user wants very long paths, let them increase PATH_MAX.
 *
 * PATH_MAX could be superseded by dynamic allocation, since FUSE now supports
 * arbitrarily-long pathnames, but it certainly wouldn't be as efficient.
 *
 * The CTR mode of operation is elegant, but leaks information when distinct
 * plain texts (such as versions of the same file) are encrypted using the same
 * key and nonce. Here, stir_encblock() uses a novel mode of operation which is
 * more secure than CTR but preserves its flexibility at the byte level.
 *
 * We use the uintptr_t type for efficient counter arithmetic on both 32- and
 * 64-bit platforms; as a drawback, bits after the first 2^32 are encrypted
 * differently on each architecture.
 */


/* ****************************************************************************
 *
 * HEADERS
 *
 */


#define _XOPEN_SOURCE 700
#define _FILE_OFFSET_BITS 64

#include <errno.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

#define DTTOIF(dirtype) ((dirtype)<<12)
#include <dirent.h>
#include <termios.h>
#include <sys/xattr.h>

#define FUSE_USE_VERSION 26
#define PATH_MAX 4096
#include <fuse.h>

#include <openssl/aes.h>
#include <openssl/sha.h>


/* ****************************************************************************
 *
 * STIRFS INTERNAL STRUCTURES
 *
 */


/* FUSE context data */
struct stir_ctx {
	char *root;    /* root backend directory */
	AES_KEY *enc;  /* AES encryption key     */
	AES_KEY *dec;  /* AES decryption key     */
};

/* Access the FUSE context data */
#define CTX ((struct stir_ctx *)fuse_get_context()->private_data)

/* FUSE file handler data */
struct stir_fh {
	intptr_t fd;  /* backend file descriptor */
	char *nonce;  /* file nonce or NULL      */
};

/* Access the FUSE file handler data */
#define FH ((struct stir_fh *)(intptr_t)fi->fh)

/* Create the FUSE file handler data */
#define MKFH { fi->fh = (intptr_t)malloc(sizeof(struct stir_fh)); }


/* ****************************************************************************
 *
 * STIRFS INTERNAL PRIMITIVES
 *
 */


/* Helper for base64 encoding */
const char stir_encode_aux[] =
	"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,-";

/* Helper for base64 decoding */
const int stir_decode_aux[] = {
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,  0, 62, 63, -1, -1,
	52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1,
	-1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
	41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1,
	-1,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14,
	15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1,
	};

/* Base64 encode n characters of buf into str */
void stir_encode (char *str, const unsigned char *buf, const int n) {
	int i, j, x;
	for (i=0,j=0; i<n; i+=3,j+=4) {
		x  =           buf[i+0]<<16;
		x += (i+1<n) ? buf[i+1]<<8 : 0;
		x += (i+2<n) ? buf[i+2]<<0 : 0;
		str[j+0] =           stir_encode_aux[(x>>18)&63];
		str[j+1] =           stir_encode_aux[(x>>12)&63];
		str[j+2] = (i+1<n) ? stir_encode_aux[(x>> 6)&63] : '+';
		str[j+3] = (i+2<n) ? stir_encode_aux[(x>> 0)&63] : '+';
	}
	str[j] = 0;
}

/* Base64 decode str into n characters of buf */
void stir_decode (unsigned char *buf, const char *str, int *n) {
	int i, j, x;
	for (i=0,j=0; str[j]; i+=3,j+=4) {
		x  = stir_decode_aux[(int)str[j+0]]<<18;
		x += stir_decode_aux[(int)str[j+1]]<<12;
		x += stir_decode_aux[(int)str[j+2]]<< 6;
		x += stir_decode_aux[(int)str[j+3]]<< 0;
		buf[i+0] = (x>>16)&255;
		buf[i+1] = (x>> 8)&255;
		buf[i+2] = (x>> 0)&255;
	}
	*n = i - (str[j-2]=='+' ? 2 : str[j-1]=='+' ? 1 : 0);
}

/* Xor block Y into X */
#define BLOCK_XOR(X,Y) { \
	int i; \
	for (i=0; i<AES_BLOCK_SIZE; i+=sizeof(size_t)) \
		*(size_t *)(X+i) ^= *(size_t *)(Y+i); \
}

/* Encrypt l characters of buf in CBC mode */
int stir_encbc (unsigned char *buf, const int l) {
	int n;
	memset(buf+l, 0, AES_BLOCK_SIZE);
	for (n=0; n<l; n+=AES_BLOCK_SIZE) {
		if (n) BLOCK_XOR(buf+n, buf+n-AES_BLOCK_SIZE);
		AES_encrypt(buf+n, buf+n, CTX->enc);
	}
	return n;
}

/* Decrypt l characters of buf in CBC mode */
void stir_decbc (unsigned char *buf, const int l) {
	int n;
	for (n=l-AES_BLOCK_SIZE; n>=0; n-=AES_BLOCK_SIZE) {
		AES_decrypt(buf+n, buf+n, CTX->dec);
		if (n) BLOCK_XOR(buf+n, buf+n-AES_BLOCK_SIZE);
	}
}

/* Encrypt basename dec into enc */
void stir_encbase (char *enc, const char *dec) {
	int n;
	char tmp[PATH_MAX];
	if (!strcmp(dec,"") || !strcmp(dec,".") || !strcmp(dec,"..")) {
		strcpy(enc, dec);
		return;
	}
	strcpy(tmp, dec);
	n = stir_encbc((unsigned char *)tmp, strlen(dec)+1);
	if (n>AES_BLOCK_SIZE) BLOCK_XOR(tmp, tmp+n-AES_BLOCK_SIZE);
	stir_encbc((unsigned char *)tmp, n);
	stir_encode(enc, (unsigned char *)tmp, n);
}

/* Decrypt basename enc into dec */
void stir_decbase (char *dec, const char *enc) {
	int n;
	if (!strcmp(enc,"") || !strcmp(enc,".") || !strcmp(enc,"..")) {
		strcpy(dec, enc);
		return;
	}
	stir_decode((unsigned char *)dec, enc, &n);
	stir_decbc((unsigned char *)dec, n);
	if (n>AES_BLOCK_SIZE) BLOCK_XOR(dec, dec+n-AES_BLOCK_SIZE);
	stir_decbc((unsigned char *)dec ,n);
}

/* Encrypt path dec into enc */
static void stir_encpath (char *enc, const char *dec) {
	char *h, *t, p[PATH_MAX];
	strcpy(p, dec);
	strcpy(enc, "");
	h = p;
	t = p;
	do if (*t=='/') {
		*t = 0;
		stir_encbase(enc+strlen(enc), h);
		strcat(enc, "/");
		h = t+1;
	} while (*(++t));
	stir_encbase(enc+strlen(enc), h);
}

/* Decrypt path enc into dec */
static void stir_decpath (char *dec, const char *enc) {
	char *h, *t, p[PATH_MAX];
	strcpy(p, enc);
	strcpy(dec, "");
	h = p;
	t = p;
	do if (*t=='/') {
		*t = 0;
		stir_decbase(dec+strlen(dec), h);
		strcat(dec, "/");
		h = t+1;
	} while (*(++t));
	stir_decbase(dec+strlen(dec), h);
}

/* Encrypt path dec into absolute path enc */
static void stir_abspath (char *enc, const char *dec) {
	strcpy(enc, CTX->root);
	strcat(enc, "/");
	stir_encpath(enc+strlen(CTX->root)+1, dec);
}

/* Encrypt count characters of buf, using off and nonce */
void stir_encblock (char *buf, size_t count, off_t off, char *nonce) {
	uintptr_t c, d;
	unsigned char ivc[AES_BLOCK_SIZE], mask[2*AES_BLOCK_SIZE], *e;
	memcpy(ivc, nonce, AES_BLOCK_SIZE);
	*(uintptr_t *)ivc += off/AES_BLOCK_SIZE;
	for (c=0,d=off; c<count; c++,d++,e++) {
		if (!(d%AES_BLOCK_SIZE) || !c) {
			AES_encrypt(ivc, mask, CTX->enc);
			memcpy(mask+AES_BLOCK_SIZE, mask, AES_BLOCK_SIZE);
			e = mask+(d%AES_BLOCK_SIZE);
			(*(uintptr_t *)ivc)++;
		}
		buf[c] = ( ( ( ( ( ( ( ( ( ( ( ( buf[c]
			) ^ e[2] ) + e[3] ) ^ e[5] ) + e[7] ) ^ e[11] ) + e[13]
			) ^ e[1] ) + e[4] ) ^ e[6] ) + e[9] ) ^ e[10] ) + e[14]
		;
	}
}

/* Decrypt count characters of buf, using off and nonce */
void stir_decblock (char *buf, size_t count, off_t off, char *nonce) {
	uintptr_t c, d;
	unsigned char ivc[AES_BLOCK_SIZE], mask[2*AES_BLOCK_SIZE], *e;
	memcpy(ivc, nonce, AES_BLOCK_SIZE);
	*(uintptr_t *)ivc += off/AES_BLOCK_SIZE;
	for (c=0,d=off; c<count; c++,d++,e++) {
		if (!(d%AES_BLOCK_SIZE) || !c) {
			AES_encrypt(ivc, mask, CTX->enc);
			memcpy(mask+AES_BLOCK_SIZE, mask, AES_BLOCK_SIZE);
			e = mask+(d%AES_BLOCK_SIZE);
			(*(uintptr_t *)ivc)++;
		}
		buf[c] = ( ( ( ( ( ( ( ( ( ( ( ( buf[c]
			) - e[14] ) ^ e[10] ) - e[9] ) ^ e[6] ) - e[4] ) ^ e[1]
			) - e[13] ) ^ e[11] ) - e[7] ) ^ e[5] ) - e[3] ) ^ e[2]
		;
	}
}


/* ****************************************************************************
 *
 * SITRFS FUSE PRIMITIVES
 *
 * See `struct fuse_operations` from: /usr/include/fuse/fuse.h
 *
 */


/* Get file attributes */
int stir_getattr (const char *path, struct stat *buf) {
	int r;
	char abs[PATH_MAX];
	stir_abspath(abs, path);
	r = lstat(abs, buf);
	if (r) return -errno;
	if (S_ISREG(buf->st_mode)) buf->st_size -= AES_BLOCK_SIZE;
	return 0;
}

/* Read the target of a symbolic link */
int stir_readlink (const char *path, char *buf, size_t size) {
	int r;
	char enc[PATH_MAX];
	if (size<PATH_MAX) return -ENAMETOOLONG;
	stir_abspath(buf, path);
	r = readlink(buf, enc, PATH_MAX);
	if (r<0) return -errno;
	enc[r]=0;
	stir_decpath(buf, enc);
	return 0;
}

/* Create a file node */
int stir_mknod (const char *path, mode_t mode, dev_t dev) {
	int r;
	char abs[PATH_MAX];
	stir_abspath(abs, path);
	r = mknod(abs, mode, dev);
	if (r) return -errno;
	return 0;
}

/* Create a directory */
int stir_mkdir (const char *path, mode_t mode) {
	int r;
	char abs[PATH_MAX];
	stir_abspath(abs, path);
	r = mkdir(abs, mode);
	if (r) return -errno;
	return 0;
}

/* Remove a file */
int stir_unlink (const char *path) {
	int r;
	char abs[PATH_MAX];
	stir_abspath(abs, path);
	r = unlink(abs);
	if (r) return -errno;
	return 0;
}

/* Remove a directory */
int stir_rmdir (const char *path) {
	int r;
	char abs[PATH_MAX];
	stir_abspath(abs, path);
	r = rmdir(abs);
	if (r) return -errno;
	return 0;
}

/* Create a symbolic link */
int stir_symlink (const char *buf, const char *path) {
	int r;
	char enc[PATH_MAX], abs[PATH_MAX];
	stir_encpath(enc, buf);
	stir_abspath(abs, path);
	r = symlink(enc, abs);
	if (r) return -errno;
	return 0;
}

/* Rename a file */
int stir_rename (const char *old, const char *new) {
	int r;
	char absold[PATH_MAX], absnew[PATH_MAX];
	stir_abspath(absold, old);
	stir_abspath(absnew, new);
	r = rename(absold, absnew);
	if (r) return -errno;
	return 0;
}

/* Create a hard link to a file */
int stir_link (const char *buf, const char *path) {
	int r;
	char enc[PATH_MAX], abs[PATH_MAX];
	stir_abspath(enc, buf);
	stir_abspath(abs, path);
	r = link(enc, abs);
	if (r) return -errno;
	return 0;
}

/* Change the permission bits of a file */
int stir_chmod (const char *path, mode_t mode) {
	int r;
	char abs[PATH_MAX];
	stir_abspath(abs, path);
	r = chmod(abs, mode);
	if (r) return -errno;
	return 0;
}

/* Change the owner and group of a file */
int stir_chown (const char *path, uid_t uid, gid_t gid) {
	int r;
	char abs[PATH_MAX];
	stir_abspath(abs, path);
	r = chown(abs, uid, gid);
	if (r) return -errno;
	return 0;
}

/* Change the size of a file */
int stir_truncate (const char *path, off_t off) {
	int r;
	char abs[PATH_MAX];
	stir_abspath(abs, path);
	r = truncate(abs, off+AES_BLOCK_SIZE);
	if (r) return -errno;
	return 0;
}

/* File open operation */
int stir_open (const char *path, struct fuse_file_info *fi) {
	int fd, r;
	struct stat buf;
	char abs[PATH_MAX];
	stir_abspath(abs, path);
	if (fi->flags&O_WRONLY) fi->flags ^= O_WRONLY|O_RDWR;
	fd = open(abs, fi->flags);
	if (fd<0) return -errno;
	MKFH;
	FH->fd = fd;
	fstat(fd, &buf);
	if (S_ISREG(buf.st_mode)) {
		FH->nonce = malloc(AES_BLOCK_SIZE);
		r = pread(fd, FH->nonce, AES_BLOCK_SIZE, 0);
		if (r<AES_BLOCK_SIZE) return -EIO;
	} else FH->nonce = NULL;
	return 0;
}

/* Read data from an open file */
int stir_read (const char *path, char *buf, size_t count, off_t off, struct fuse_file_info *fi) {
	int r;
	r = pread(FH->fd, buf, count, off+AES_BLOCK_SIZE);
	if (r<0) return -errno;
	if (FH->nonce) stir_decblock(buf, count, off, FH->nonce);
	return r;
}

/* Write data to an open file */
int stir_write (const char *path, const char *buf, size_t count, off_t off, struct fuse_file_info *fi) {
	int r;
	char *enc;
	enc = malloc(count);
	memcpy(enc, buf, count);
	if (FH->nonce) stir_encblock(enc, count, off, FH->nonce);
	r = pwrite(FH->fd, enc, count, off+AES_BLOCK_SIZE);
	free(enc);
	if (r<0) return -errno;
	return r;
}

/* Get file system statistics */
int stir_statfs (const char *path, struct statvfs *stat) {
	int r;
	char abs[PATH_MAX];
	stir_abspath(abs, path);
	r = statvfs(abs, stat);
	if (r) return -errno;
	return 0;
}

/* Possibly flush cached data */
int stir_flush (const char *path, struct fuse_file_info *fi) {
	return 0;
}

/* Release an open file */
int stir_release (const char *path, struct fuse_file_info *fi) {
	int r;
	r = close(FH->fd);
	if (r) return -errno;
	free(FH->nonce);
	free(FH);
	return 0;
}

/* Synchronize file contents */
int stir_fsync (const char *path, int data, struct fuse_file_info *fi) {
	int r;
	r = data ? fdatasync(FH->fd) : fsync(FH->fd);
	if (r) return -errno;
	return 0;
}

/* Set extended attributes */
int stir_setxattr (const char *path, const char *name, const char *value, size_t size, int flags) {
	int r;
	char abs[PATH_MAX];
	stir_abspath(abs, path);
	r = lsetxattr(abs, name, value, size, flags);
	if (r) return -errno;
	return 0;
}

/* Get extended attributes */
int stir_getxattr (const char *path, const char *name, char *value, size_t size) {
	int r;
	char abs[PATH_MAX];
	stir_abspath(abs, path);
	r = lgetxattr(abs, name, value, size);
	if (r<0) return -errno;
	return r;
}

/* List extended attributes */
int stir_listxattr (const char *path, char *list, size_t size) {
	int r;
	char abs[PATH_MAX];
	stir_abspath(abs, path);
	r = llistxattr(abs, list, size);
	if (r<0) return -errno;
	return r;
}

/* Remove extended attributes */
int stir_removexattr (const char *path, const char *name) {
	int r;
	char abs[PATH_MAX];
	stir_abspath(abs, path);
	r = lremovexattr(abs, name);
	if (r) return -errno;
	return 0;
}

/* Open directory */
int stir_opendir (const char *path, struct fuse_file_info *fi) {
	DIR *dp;
	char abs[PATH_MAX];
	stir_abspath(abs, path);
	dp = opendir(abs);
	if (!dp) return -errno;
	MKFH;
	FH->fd = (intptr_t)dp;
	return 0;
}

/* Read directory */
int stir_readdir (const char *path, void *entry, fuse_fill_dir_t fill, off_t off, struct fuse_file_info *fi) {
	DIR *dp;
	struct stat buf;
	struct dirent *de;
	char name[PATH_MAX];
	dp = (DIR *)FH->fd;
	seekdir(dp, off);
	while ((de=readdir(dp))) {
		stir_decbase(name, de->d_name);
		memset(&buf, 0, sizeof(buf));
		buf.st_ino = de->d_ino;
		buf.st_mode = DTTOIF(de->d_type);
		if (fill(entry,name,&buf,telldir(dp))) break;
	}
	return 0;
}

/* Release directory */
int stir_releasedir (const char *path, struct fuse_file_info *fi) {
	int r;
	r = closedir((DIR *)FH->fd);
	if (r) return -errno;
	free(FH);
	return 0;
}

/* Synchronize directory contents */
int stir_fsyncdir (const char *path, int data, struct fuse_file_info *fi) {
	int r;
	r = data ? fdatasync(FH->fd) : fsync(FH->fd);
	if (r) return -errno;
	return 0;
}

/* Initialize filesystem */
void *stir_init (struct fuse_conn_info *conn) {
	return CTX;
}

/* Clean up filesystem */
void stir_destroy (void *ctx) {
	free(CTX->root);
	memset(CTX->enc, 0, sizeof(AES_KEY));
	memset(CTX->dec, 0, sizeof(AES_KEY));
	free(CTX->enc);
	free(CTX->dec);
	free(ctx);
}

/* Check file access permissions */
int stir_access (const char *path, int mode) {
	int r;
	char abs[PATH_MAX];
	stir_abspath(abs, path);
	r = access(abs, mode);
	if (r) return -errno;
	return 0;
}

/* Create and open a file */
int stir_create (const char *path, mode_t mode, struct fuse_file_info *fi) {
	int fd, r, rnd[4];
	char abs[PATH_MAX];
	stir_abspath(abs, path);
	fd = open(abs, fi->flags, mode);
	if (fd<0) return -errno;
	MKFH;
	FH->fd = fd;
	if (S_ISREG(mode)) {
		FH->nonce = malloc(SHA256_DIGEST_LENGTH);
		rnd[0]=time(NULL);
		rnd[1]=rand();
		rnd[2]=clock();
		rnd[3]=rand();
		SHA256((unsigned char *)rnd, sizeof(rnd), (unsigned char *)FH->nonce);
		r = pwrite(fd, FH->nonce, AES_BLOCK_SIZE, 0);
		if (r<AES_BLOCK_SIZE) return -EIO;
	} else FH->nonce = NULL;
	return 0;
}

/* Change the size of an open file */
int stir_ftruncate (const char *path, off_t off, struct fuse_file_info *fi) {
	int r;
	r = ftruncate(FH->fd, off+AES_BLOCK_SIZE);
	if (r) return -errno;
	return 0;
}

/* Get attributes from an open file */
int stir_fgetattr (const char *path, struct stat *buf, struct fuse_file_info *fi) {
	int r;
	r = fstat(FH->fd, buf);
	if (r) return -errno;
	if (S_ISREG(buf->st_mode)) buf->st_size -= AES_BLOCK_SIZE;
	return 0;
}

/* Change the access and modification times of a file with nanosecond resolution */
int stir_utimens (const char *path, const struct timespec times[2]) {
	int r;
	char abs[PATH_MAX];
	stir_abspath(abs, path);
	r = utimensat(-1, abs, times, 0);
	if (r) return -errno;
	return 0;
}


/* ****************************************************************************
 *
 * PUTTING IT ALL TOGETHER
 *
 */


/* FUSE file system operation structure */
struct fuse_operations stir_op = {
	stir_getattr,
	stir_readlink,
	NULL, /* getdir, deprecated by readdir */
	stir_mknod,
	stir_mkdir,
	stir_unlink,
	stir_rmdir,
	stir_symlink,
	stir_rename,
	stir_link,
	stir_chmod,
	stir_chown,
	stir_truncate,
	NULL, /* utime, deprecated by utimens */
	stir_open,
	stir_read,
	stir_write,
	stir_statfs,
	stir_flush,
	stir_release,
	stir_fsync,
	stir_setxattr,
	stir_getxattr,
	stir_listxattr,
	stir_removexattr,
	stir_opendir,
	stir_readdir,
	stir_releasedir,
	stir_fsyncdir,
	stir_init,
	stir_destroy,
	stir_access,
	stir_create,
	stir_ftruncate,
	stir_fgetattr,
	NULL, /* lock, not implemented */
	stir_utimens,
	NULL, /* bmap, not implemented */
	1, /* flag_nullpath_ok */
	1, /* flag_nopath */
	1, /* flag_utime_omit_ok */
	0, /* flag_reserved */
	NULL, /* ioctl, not implemented */
	NULL, /* poll, not implemented */
	NULL, /* write_buf, not implemented */
	NULL, /* read_buf, not implemented */
	NULL, /* flock, not implemented */
};

/* Derive keys from password */
void stir_keys (AES_KEY *enc, AES_KEY *dec) {
	char passwd[PATH_MAX];
	struct termios term, pass;
	unsigned char hash[SHA256_DIGEST_LENGTH];

	tcgetattr(0, &term);
	pass = term;
	pass.c_lflag &= ~ECHO;
	tcsetattr(0, TCSANOW, &pass);
	printf("Password: ");
	while (!fgets(passwd, PATH_MAX, stdin));
	passwd[strlen(passwd)-1]=0;
	printf("\n");
	tcsetattr(0, TCSANOW, &term);

	strcat(passwd, "{StirFS}{StirFS}");
	SHA256((unsigned char *)passwd, strlen(passwd)+1, hash);
	AES_set_encrypt_key(hash, 256, enc);
	AES_set_decrypt_key(hash, 256, dec);
	memset(passwd, 0, PATH_MAX);
}

/* Run FUSE */
int main (int argc, char *argv[]) {
	struct stir_ctx *ctx;

	if (argc<3) {
		char *argh[] = { "stirfs rootdir", "-h" };
		printf("\
StirFS. The secure, transparent and irresistible filesystem.\n\
Copyright (C) 2010-2013 Gaetan Bisson. All rights reserved.\n\
Version 1.4; compiled on "__DATE__".\n\
\n\
Mounts an encrypted filesystem in mountpoint using rootdir as backend.\n\
\n\
");
		return fuse_main(2, argh, &stir_op, NULL);
	}

	ctx = malloc(sizeof(struct stir_ctx));
	ctx->enc = malloc(sizeof(AES_KEY));
	ctx->dec = malloc(sizeof(AES_KEY));

	ctx->root = realpath(argv[1], NULL);
	stir_keys(ctx->enc, ctx->dec);

	argv[1] = "stirfs";
	return fuse_main(argc-1, argv+1, &stir_op, ctx);
}
