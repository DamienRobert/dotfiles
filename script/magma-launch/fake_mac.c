/*
  gcc -Wall -O2 -fPIC -c fake_mac.c
  ld -Bshareable -o fake_mac.so fake_mac.o -ldl
  LD_PRELOAD=./fake_mac.so ./my_executable

or:

  LD_PRELOAD=./fake_mac.so ifconfig
 */
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <dlfcn.h>
#include <net/if.h>
#include <linux/sockios.h>

static void *libc_handle = NULL;
static int (*o_ioctl)(int d, int req, void *arg);

unsigned char forced_hwaddr[IFHWADDRLEN]={
0x00, 0x0d, 0x56, 0x04, 0x9b, 0x43, };

int ioctl_for_hwaddr(int d, int req, struct ifreq * arg)
{
	int res;
	if (strncmp(arg->ifr_name,"eth",3)==0 || strncmp(arg->ifr_name,"en",2)==0) {
		fprintf(stderr,"Trapped SIOCGIFHWADDR on %s\n", arg->ifr_name);
		res=o_ioctl(d, req, arg);
		if (res<0) return res;
		char * hwaddr_loc=arg->ifr_hwaddr.sa_data;
		memcpy(hwaddr_loc, forced_hwaddr, IFHWADDRLEN);
	} else {
		res= o_ioctl(d, req, arg);
	}
	return res;
}


int ioctl(int d, int req, void * arg)
{
	if (req==SIOCGIFHWADDR)
		return ioctl_for_hwaddr(d,req,arg);
	return o_ioctl(d, req, arg);
}

void _init(void)
{
	char * p;
	if ((p = getenv("FAKE_MAC")) != NULL) {
		unsigned int hw[6];
		int r,i;
		r = sscanf(p,"%02x:%02x:%02x:%02x:%02x:%02x",
				hw+0,
				hw+1,
				hw+2,
				hw+3,
				hw+4,
				hw+5);
		if (r != 6) {
			fprintf(stderr, "FAKE_MAC variable is bad\n");
		}
		for(i = 0 ; i < 6 ; i++) {
			forced_hwaddr[i] = (unsigned char) hw[i];
		}
	}
	if ((libc_handle = dlopen("libc.so", RTLD_NOW)) == NULL) {
		if ((libc_handle = dlopen("libc.so.6", RTLD_NOW)) == NULL) {
			fprintf(stderr,"Can't find libc !\n");
			exit (1);
		}
	}
	if (!(o_ioctl = dlsym(libc_handle, "ioctl"))) {
		fprintf(stderr, "ioctl() not found in libc!\n");
		exit(-1);
	}

	dlclose(libc_handle);
}
