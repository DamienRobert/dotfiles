vim: ft=markdownlight fdm=expr

makepkg
=======

https://wiki.archlinux.org/index.php/PKGBUILD
https://wiki.archlinux.org/index.php/creating_packages
man PKGBUILD

Options [excerpt]
-------

* Clean up:
  -c, --clean: clean up work files after build
  -C, --cleanbuild Remove $srcdir/ dir before building the package
  -L, --log: logs to $logdest/pkgname-pkgver-pkgrel-arch.log

* Checks:
  -d, --nodeps: don't check deps
  -f, --force: overrides an already built package
  --skipchecksums  Do not verify checksums of the source files
  --skipinteg      Do not perform any verification checks on source files
  --skippgpcheck   Do not verify source files with PGP signatures
  --verifysource: only download sources and perform integrity checks

* Infos:
  --packagelist    Only list package filepaths that would be produced
  --printsrcinfo   Print the generated SRCINFO and exit
  -g: generate integrity checks; ex makepkg -g >> PKGBUILD

* Process:
  --pkg list: only build listed packages from a split package
  -S, --source: build a source-only (PKGBUILD) tarball [into $SRCPKGDEST]
    [except if --allsource is passed where the full source are downloaded:
     --allsource: build a full source-only (PKGBUILD+ the real source code) tarball]

  -R, --repackage: Repackage contents of the package without rebuilding the package. (calls the 'package() function)
  -i, --install: install successful built package

  --check/--nocheck: run/don't run the check() function
  -o, --nobuild: download, extract and prepare, but don't build
  -e, --noextract: don't extract (or prepare), only build (use existing $srcdir)
  --noarchive      Do not create package archive
  --noprepare      Do not run the prepare() function in the PKGBUILD
  --sign/--nosign: sign/don't sign the package

* Pacman related opts:
  --noconfirm,--needed,--asdeps: Passed to pacman
  -s: install missing dependencies with pacman (-r to remove them after succesfull build)

Environment
----------

[If not defined, they default to $startdir]
Ex:
LOGDEST=~/opt/arch/pkgs/log
SRCDEST=~/opt/arch/pkgs/src
SRCPKGDEST=~/opt/arch/pkgs/pkgsrc
PKGDEST=~/opt/arch/pkgs/pkgdest
BUILDDIR=~/opt/arch/pkgs/build
[Note that makepkg symlink the built archive in $PKGDEST to $startdir]

Note: PKGDEST=foo makepkg
is overwritten by reading makepkg.conf, the solution is to do, like for
makefiles: `makepkg PKGDEST=foo`

Variables defined by makepkg
----------------------------
- startdir
    This contains the absolute path to the directory where the PKGBUILD
    file is located.
- srcdir (./src || $BUILDDIR/$pkgbase/src)
    This points to the directory where makepkg extracts or symlinks all
    files in the source array.
    This is where the build() and package() are run
- pkgdir (./pkg/$pkgbase || $BUILDDIR/$pkgbase/pkg/$pkgbase)
    This points to the directory where makepkg bundles the installed
    package, which becomes the root directory of your built package.

    if [[ $BUILDDIR = "$startdir" ]]; then
    •·srcdir="$BUILDDIR/src"
    •·pkgdirbase="$BUILDDIR/pkg"
    else
    •·srcdir="$BUILDDIR/$pkgbase/src"
    •·pkgdirbase="$BUILDDIR/$pkgbase/pkg"
    fi
    pkgdir="$pkgdirbase/$pkgbase"

- télécharge les sources dans $SRCDEST (cf download_sources dans /usr/share/makepkg/source.sh)
- symlink et extrait les sources dans $srcdir (et rm $srcdir si -C)
- compile dans $srcdir [build()]
- installe le package dans $pkgdir [package()]
- archive $pkgdir dans $pkg_file=$PKGDEST/${pkgname}-${fullver}-${pkgarch}${PKGEXT}"
 # - si $PKGDEST != $startdir, symlinke $pkg_file dans $startdir/${pkgname}-${fullver}-${pkgarch}${PKGEXT}" [OBSOLETE]

- avec makepkg -L, les log du build sont dans $LOGDEST (*-build.log, *-package.log)
- source package (makepkg -S) [create_srcpackage()] fait juste un tarball
  du PKGBUILD et des fichiers annexes du PKGBUILD (comme le .SRCINFO qui
  est généré à la volée) et le met dans
  $SRCPKGDEST/${pkgbase}-${fullver}${SRCEXT}
  # + un symlink dans $startdir si $SRCPKGDEST != $startdir [OBSOLETE]
- --allsource: comme --source, mais télécharge aussi les vraies sources

Note: avec -c les logs sont clean en cas de succès, ainsi que $pkgdirbase et $srcdir

Variables
---------
pkgname, pkgver, pkgrel, and arch are all mandatory
license is not mandatory, but a warning is printed if omited

- pkgname: The name(s) of the package(s). It should consist of alphanumeric and any of the following characters @ . _ + -
- pkgver: The version of the package.
- pkgrel: The release number of the package specific to Arch Linux.
- pkgdir: This variable reflects the root directory of what will be put into the package. It is commonly used in make DESTDIR="$pkgdir" install
- epoch: Used to force the package to be seen as newer than any previous versions with a lower epoch, even if the version number would normally not trigger such an upgrade.
- pkgbase: An optional global directive is available when building a split package, pkgbase is used to refer to the group of packages in the output of makepkg and in the naming of source-only tarballs.
- pkgdesc: The description of the package.
- arch: An array of architectures that the PKGBUILD file is known to build and work on.
- url: The URL of the official site of the software being packaged.
- license: The license under which the software is distributed.
- groups: The group the package belongs in. For instance, when you install the kdebase package, it installs all packages that belong in the kde group.
- depends: An array of package names that must be installed before this software can be run
- optdepends: An array of package names that are not needed for the software to function but provides additional features
- makedepends: An array of package names that must be installed to build the software but unnecessary for using the software after installation.
- checkdepends: An array of packages this package depends on to run its test suite but are not needed at runtime.
- provides: An array of package names that this package provides the features of (or a virtual package such as cron or sh).
- conflicts: An array of package names that may cause problems with this package if installed
- replaces: An array of obsolete package names that are replaced by this package, e.g. replaces=('wireshark') for the wireshark-gtk package
- backup: An array of files that can contain user-made changes and should be preserved during upgrade or removal of a package, primarily intended for configuration files in /etc.
- options: This array allows you to override some of the default behavior of makepkg, defined in /etc/makepkg.conf
- install: The name of the .install script to be included in the package [by default pkgname.install]. pacman has the ability to store and execute a package-specific script when it installs, removes or upgrades a package. pacman chroot() and then chdir() to the root directory in every install script executed. The script contains the following functions which run at different times:
  - pre_install - The script is run right before files are extracted. One argument is passed: new package version.
  - post_install - The script is run right after files are extracted. One argument is passed: new package version.
  - pre_upgrade - The script is run right before files are extracted. Two arguments are passed in the following order: new package version, old package version.
  - post_upgrade - The script is run right after files are extracted. Two arguments are passed in the following order: new package version, old package version.
  - pre_remove - The script is run right before files are removed. One argument is passed: old package version.
  - post_remove - The script is run right after files are removed. One argument is passed: old package version.
- changelog: The name of the package changelog. To view changelogs for installed packages (that have this file): pacman -Qc pkgname
- source: An array of files which are needed to build the package (e.g. source=("https://example.com/$pkgname-$pkgver.tar.gz")).
- validpgpkeys: An array of PGP fingerprints. If this array is non-empty, makepkg will only accept signatures from the keys listed here and will ignore the trust values from the keyring. If the source file was
- noextract: An array of files listed under the source array which should not be extracted from their archive format by makepkg
- md5sums/sha1sums/sha256sums/sha384sums/sha512sums: An array of MD5 checksums of the files listed in the source array (use 'SKIP' to skip the test for a source file)

Functions called
----------------
* pkgver() function

You can update the pkgver variable during a makepkg. pkgver() is run right after the sources are fetched and extracted.

* prepare() function

In this function, commands that are used to prepare sources for building are run, such as patching. This function is run before the build function and after package extraction. If extraction is skipped (makepkg -e), then prepare() is not run.

* build() function

This function uses common shell commands in Bash syntax to automatically compile software and create a pkg directory to install the software to.
The first step in the build() function is to change into the directory created by uncompressing the source tarball ($srcdir); therefore, in most cases, the first command will look like this:
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make

* check() function

Place for calls to make check and similar testing routines (like make check)

* package() function

(run with fakeroot)
The final step is to put the compiled files in a directory where makepkg can retrieve them to create a package. This by default is the pkg directory—a simple fakeroot environment. The pkg directory replicates the hierarchy of the root file system of the software's installation paths.
  ex: make DESTDIR="$pkgdir/" install

Split packages
--------------

From man PKGBUILD:
 makepkg supports building multiple packages from a single PKGBUILD.
 This is achieved by assigning an array of package names to the pkgname
 directive. Each split package uses a corresponding packaging function
 with name package_foo(), where foo is the name of the split package.
 All options and directives for the split packages default to the global
 values given in the PKGBUILD. Nevertheless, the following ones can be
 overridden within each split package’s packaging function: pkgdesc,
 arch, url, license, groups, depends, optdepends, provides, conflicts,
 replaces, backup, options, install, and changelog.
 An optional global directive is available when building a split
 package:
 pkgbase
     The name used to refer to the group of packages in the output of
     makepkg and in the naming of source-only tarballs. If not
     specified, the first element in the pkgname array is used. The
     variable is not allowed to begin with a hyphen.

Check the archive
-----------------
You can use pacman's query functions to display a list of files contained in the package and the dependencies it requires with pacman -Qlp [package file] and pacman -Qip [package file] respectively.

$ namcap PKGBUILD
$ namcap <package file name>.pkg.tar.xz

Example
-------

  # $Id: PKGBUILD 198596 2013-10-30 16:56:01Z bisson $
  # Maintainer: Gaetan Bisson <bisson@archlinux.org>
  # Contributor: Andrea Scarpino <andrea@archlinux.org>
  
  pkgname=libmpdclient
  pkgver=2.9
  pkgrel=1
  pkgdesc='Asynchronous API library for interfacing MPD in the C, C++ & Objective C languages'
  url='http://www.musicpd.org/libs/libmpdclient/'
  license=('custom:BSD')
  arch=('i686' 'x86_64')
  source=("http://www.musicpd.org/download/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz")
  sha1sums=('1a3557d4d1f78085db6285a8c8cb9085c300d9d3')
  
  build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr --disable-documentation
    make
  }
  
  package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    cd "${pkgdir}"
    install -d usr/share/licenses/libmpdclient
    ln -s ../../doc/libmpdclient/COPYING usr/share/licenses/libmpdclient/COPYING
  }

Exemple 2
---------

  http://ix.io/66p
  # Maintainer: Somebody <somebody[at]foo[dot]tld>
  pkgname=foo
  pkgver=10.0.2
  pkgrel=2
  pkgdesc="Foo is an example package for this PKGBUILD file."
  url="http://www.foo.tld"
  arch=('x86_64' 'i686')
  license=('GPLv3')
  depends=('php' 'mysql')
  optdepends=('java-runtime')
  makedepends=()
  conflicts=()
  replaces=()
  backup=()
  install='foo.install'
  source=("http://www.server.tld/${pkgname}-${pkgver}.tar.gz"
          "foo.desktop")
  md5sums=('a0afa52d60cea6c0363a2a8cb39a4095'
           'a0afa52d60cea6c0363a2a8cb39a4095')
  
  build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
    make
  }
  
  package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  }

Ruby exemples
-------------

https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=ruby-json_pure

  _gemname=json_pure
  pkgname=ruby-$_gemname
  pkgver=1.8.3
  pkgrel=1
  pkgdesc='JSON Implementation for Ruby'
  arch=(any)
  url='http://flori.github.com/json'
  license=(Ruby)
  depends=(ruby)
  options=(!emptydirs)
  source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
  noextract=($_gemname-$pkgver.gem)
  sha1sums=('8deab664226574ff23a2f199d24ad18a42a9b10e')
  
  package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem #-i: --install-dir, -n: bindir
    rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  }

https://git.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/ruby-hpricot

  _gemname=hpricot
  pkgname=ruby-$_gemname
  pkgver=0.8.6
  pkgrel=6
  pkgdesc='A swift, liberal HTML parser with a fantastic library'
  arch=(x86_64)
  url='http://code.whytheluckystiff.net/hpricot/'
  license=(MIT)
  depends=(ruby)
  options=(!emptydirs)
  source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
  noextract=($_gemname-$pkgver.gem)
  sha1sums=('87ce2c17960a5e1d7ceaa16d0591ca6a28379ce0')
  
  package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
    rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
    find "$pkgdir/$_gemdir/extensions/" -name *.so -delete
    rm -r "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/test"
    install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  
    rm -r "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/ext"
  }

Local Packages
==============

Get Pkgbuild
------------

Utiliser asp pour récupérer les PKGBUILD.
Les copier dans ~/opt/arch/pkgs/pkgbuild

ABS:
Web: https://www.archlinux.org/packages/?q=coreutils, https://www.archlinux.org/packages/core/x86_64/coreutils/
Source: https://projects.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/coreutils
Archive: https://www.archlinux.org/packages/core/x86_64/coreutils/download/

AUR:
pacaur -d $pkg
Web: https://aur.archlinux.org/packages/$pkg
Pkgbuild: wget "https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=$pkg"
Source: wget "https://aur.archlinux.org/cgit/aur.git/snapshot/$pkg.tar.gz"

Make Local Packages
-------------------

makepkg construit alors le package
(makepkg -d to not check for deps)
  - télécharge les sources dans $srcdest [src/]
  - compile dans $build [build/]
  - les log du build sont dans $logdest
  - installe le package dans $pkgdest [pkgdest/]
    (avec makepkg -S fait juste un tarball du PKGBUILD et des fichiers
    annexes nécessaires (mais pas ceux qu'on peut télécharger) et met dans
    $srcpkgdest) [pkgsrc/]
- db pour l'information sur la database
- cache pour les packages téléchargés et pas construits dans dest

alias pacman_local='fakeroot pacman --config ~/.local/.pacman.conf'
pacman_local -Udd ~/opt/arch/pkgs/pkgdest/monpckg installe le package
  -d, --nodeps
  Skips dependency version checks. Package names are still checked.
  Normally, pacman will always check a package’s dependency fields to
  ensure that all dependencies are installed and there are no package
  conflicts in the system. Specify this option twice to skip all
  dependency checks.

Config
------

[.config/pacman/pacman.conf]
RootDir     = $HOME/opt/arch
DBPath      = $HOME/opt/arch/pkgs/pacman/db/
CacheDir    = $HOME/opt/arch/pkgs/pacman/cache/
LogFile     = $HOME/opt/arch/pkgs/pacman/pacman.log
GPGDir      = $HOME/opt/arch/pkgs/pacman/gnupg/

Notes
-----

There is one problem when compiling/installing to a custom directory in a
PKGBUILD.

PREFIX=$HOME/opt/arch
ex:
  PREFIX=$HOME/opt/arch
  build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=$PREFIX/usr --sysconfdir=$PREFIX/etc --libexecdir=$PREFIX/usr/lib --with-stroke-library
    make
  }
  package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
  }

make will install the files in $pkgdir/$PREFIX/usr
So I use the script
$HOME/script/extra/makepkg_move_prefix ${pkgdir} $PREFIX
which move the files in $pkgdir/$PREFIX into $pkgdir (and remove $PREFIX)
See the examples in ~usr/pkgbuild

[Indeed, otherwise since in .pacman.conf I have
RootDir     = /home/dams/opt/arch
the paths under $pkgdir get added to RootDir, so with prefix=$HOME/arch,
pacman -U will install the packages under
$HOME/opt/arch/$HOME/opt/arch unless I use makepkg_move_prefix as above.
I could set the RootDir=/, but in this case I need to be sure the packages
built have all their files under $prefix]

Better solution: use make prefix= rather than make DESTDIR=
http://stackoverflow.com/questions/11307465/destdir-and-prefix-of-make
    There's a fourth case that isn't asked about: make install prefix=/foo/bar/baz. That's going to install it to a different place but not create all the directories as DESTDIR=/foo/bar/baz would. It's commonly used with GNU stow via ./configure --prefix=/usr/local && make && sudo make install prefix=/usr/local/stow/foo, which would install binaries in /usr/local/stow/foo/bin. (make install DESTDIR=/usr/local/stow/foo, by comparison, would install binaries in /usr/local/stow/foo/usr/local/bin)

=> Il faut être sûr de n'utiliser que --prefix dans le ./configure, sinon
le Makefile va hardcoder les autres variables (comme sysconfdir) et ne pas
mettre à jour quand on change 'prefix'

Installing pacman (for non archlinux computers)
=================

See ~script/extra/install_pacman
Then edit ~/opt/packages/pacman/etc/pacman.conf from ~/.local/.pacman.conf;
optionally removing signatures check.

  ---- (Ex on imb) -------------------------------------------------------
  #Generated @2014-09-18T14:48:10+0200
  # /etc/pacman.conf
  # See the pacman.conf(5) manpage for option and repository directives
  
  [options]
  RootDir     = /home/imb/damienrobert/opt/archfull
  DBPath      = /home/imb/damienrobert/opt/archfull/pkgs/pacman/db/
  CacheDir    = /home/imb/damienrobert/opt/archfull/pkgs/pacman/cache/
  LogFile     = /home/imb/damienrobert/opt/archfull/pkgs/pacman/pacman.log
  GPGDir      = /home/imb/damienrobert/opt/archfull/pkgs/pacman/gnupg/
  
  HoldPkg     = pacman glibc
  
  Architecture = auto
  Color
  TotalDownload
  CheckSpace
  #VerbosePkgLists
  
  [core]
  Include = /home/imb/damienrobert/.local/.pacman.mirrorlist
  
  [extra]
  Include = /home/imb/damienrobert/.local/.pacman.mirrorlist
  
  [community]
  Include = /home/imb/damienrobert/.local/.pacman.mirrorlist
  --------------------------------------------------------------------

Compile local packages
----------------------

Just install the libraries locally and compile with makepkg

Ex for mpd:
pacman_local -Sdd --needed libao libmad libogg libpulse yajl libmpdclient libsystemd libid3tag ffmpeg
./makepkg_env; cd ~/usr/pkgbuild/mpd; makepkg
Needs a recent gcc:
pacman_local -Sdd --needed gcc-libs libmpc cloog binutils #build gcc

Where makepkg_env is (normally this is already in my environment)
  ---
  #To compile an archlinux local package, source this file
  #This put all archlinux local files at the top of the env variables
  PATH="$HOME/opt/arch/usr/bin:$PATH"
  MANPATH="$HOME/opt/arch/usr/share/man:$MANPATH"
  INFOPATH="$HOME/opt/arch/usr/share/info:$INFOPATH"
  CPATH="$HOME/opt/arch/usr/include:$CPATH"
  LD_LIBRARY_PATH="$HOME/opt/arch/usr/lib:$LD_LIBRARY_PATH"
  LIBRARY_PATH="$LD_LIBRARY_PATH"
  PKG_CONFIG_PATH="$HOME/opt/arch/usr/lib/pkgconfig:$HOME/opt/arch/usr/share/pkgconfig:$PKG_CONFIG_PATH"
  
  export PATH MANPATH INFOPATH CPATH LIBRARY_PATH LD_LIBRARY_PATH PKG_CONFIG_PATH
  ---

Direct local packages installation
----------------------------------

Either do a full install:
pacman -S mpd mpc ncmpcpp

Or look at ~/script/library_dependency.rb to find which packages are really needed:
- Packages lib from which mpd depends (~/script/library_dependency.rb -r --packages =mpd)
- Packages lib from which mpd mpc and ncmpcpp depends (~/script/library_dependency.rb -r --packages =mpc =mpd =ncmpcpp)
[ Compare with packages from which mpd depends: pactree -d mpd]

pacman -Sdd packages
Upgrade with pacman -Syudd
[See ~/script/archlinux/update_local_packages.rb for clean up of these
dependencies]

Now installed program will probably not work because the linker will link
them with the syst libraries rather than our local libraries (since we
installed them from a mirror the LD_PATH are not set correctly). So we use
archfull_wrapper to launch them via
  exec "$ARCH/usr/lib/ld-linux-x86-64.so.2" --library-path "$ARCH/usr/lib:$ARCH/usr/lib/pulseaudio:$LD_LIBRARY_PATH" "$BINPATH" "$@"
To launch them via this wrapper, just symlinks them to archfull_bin:
  exec "$HOME/script/extra/archfull_wrapper" "$(basename $0)" "$@"

Another solution is to use patchelf:
ARCH="$HOME/opt/archfull"
~script/archlinux/archfull_wrapper patchelf --set-interpreter $ARCH/usr/lib/ld-linux-x86-64.so.2 $ARCH/usr/bin/patchelf
~script/archlinux/archfull_wrapper patchelf --set-rpath $ARCH/usr/lib $ARCH/usr/bin/patchelf
~script/archlinux/archfull_wrapper patchelf --set-rpath $ARCH/usr/lib $ARCH/usr/lib/libstdc++.so.6
