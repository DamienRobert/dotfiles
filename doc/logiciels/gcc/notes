vim: foldmethod=expr ft=markdownlight

# Programming

Arrays
------

In C99, you can add qualifiers for an array in a parameter list:
http://stackoverflow.com/questions/2374875/should-i-declare-the-expected-size-of-an-array-passed-as-function-argument
  The main reason to add an array size is for documentation purposes. Also,
  with C99, you can add qualifiers within the square brackets which will be
  used to modify the pointer declaration to which the array declaration will
  be converted if it occurs within a parameter list.

gcc crt files
-------------

https://dev.gentoo.org/~vapier/crt.txt
(functions prologs and epilogs)
cf http://www.bottomupcs.com/compilation_example.xhtml
   http://www.bottomupcs.com/starting_a_process.xhtml#startup

libc
----
http://www.etalabs.net/compare_libcs.html
musl vs uClibc vs dietlibc vs glibc

# Tools

Elf
---
Tools to read elf formats:

- readelf
readelf -d =mpd IG NEEDED

- objdump
objdump -p =mpd | grep NEEDED
objdump -x =mpd | grep RPATH
http://stackoverflow.com/questions/8979664/readelf-vs-objdump-why-are-both-needed
[In summary use objdump to see what ld will see, and readelf to see what
really is in the binary]

- ldd
ldd =mpd
ldd -v =mpd #recursive
(but see http://www.catonmat.net/blog/ldd-arbitrary-code-execution/)

Symbol versioning
-----------------

http://www.trevorpounds.com/blog/?p=33

Detecting memory leaks
----------------------

Valgrind, Electric fence
Cf http://elinux.org/Memory_Debuggers

Autotools
---------

* autoreconf: aclocal, autoconf, automake
  https://developer.gnome.org/anjuta-build-tutorial/stable/create-autotools.html.en [cf autotools/]
  https://www.lrde.epita.fr/~adl/autotools.html

  aclocal: configure.ac => aclocal.m4
  autoconf: configure.ac + aclocal.m4 => configure
  automake --add-missing --foreign: configure.ac + aclocal.m4 + Makefile.am => Makefile.in
  ./configure => .deps/, Makefile, config.log, config.status
  make => tut_prog

  autoreconf --install -m [--verbose --force]: do all the steps above
    -m: when applicable, re-run ./configure && make
    --install: copy missing auxiliary files

  Note: there maybe a script called autogen.sh or bootstrap that calls
  `autoreconf`, cf https://www.gnu.org/software/automake/faq/autotools-faq.html#What-does-_002e_002fbootstrap-or-_002e_002fautogen_002esh-do_003f

* libtool
  libtool permet d'abstraire la création de librairies (par exemple en en
  créant à la fois des statiques et des dynamiques)

* pkg-config
  pkg-config a le même but que libtool, pour les différences cf
  http://wiki.gentoo.org/wiki/Pkg-config
  [summary: libtool uses specific archive file format (so-called .la files) to provide additional compiler and linker flags when linking against a library; it is implicit while pkg-config is explicit]
  Newer version: https://github.com/pkgconf/pkgconf/

  Exemple: `pkg-config --cflags --libs qt-mt` pour utiliser une librairie extérieure
  --cflags    This prints pre-processor and compile flags required to  compile
              the  packages on the command line, including flags for all their
              dependencies. Flags are "compressed" so that each identical flag
              appears  only once.
  --libs This  option is identical to "--cflags", only it prints the link flags.

  Variables:
  $ pkg-config --variable pc_path pkg-config #where pkg-config looks for pkc files
  /usr/local/lib/x86_64-linux-gnu/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig:/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig
  
  # get the value of 'prefix' for the pkg-config file of libarchive
  # + looks for a custom path
  PKG_CONFIG_PATH="/home/imb/damienrobert/opt/packages/libarchive/lib/pkgconfig:" pkg-config --variable prefix libarchive

* http://www.pell.portland.or.us/~orc/Code/configure/
  A simpler configure

# gcc options
gcc: -O2 -Wall -Wextra -std=c99 -Wpedantic -march=native -mtune=native -pipe -fstack-protector-strong -D_FORTIFY_SOURCE=2
ld: -Wl,-O1,--sort-common,--as-needed,-z,relro

Optimized: gcc -O3 -Wall -Wextra -std=c99 -Wpedantic -march=native -mtune=native -pipe

[More warnings: -Wwrite-strings -Wcast-qual -Wstrict-prototypes]
-D_GNU_SOURCE pour dire que le programme utilise des features de la libc
cf http://stackoverflow.com/questions/18676944/gcc-gnu-should-i-still-define-gnu-source-when-i-compile-with-std-gnu99

Note:
-march (or -mcpu) builds exclusively for an architecture
-mtune optimizes for an architecture, but builds for whole processor family
-Ofast: imprecise floating points

To check what is enabled:
gcc -march=x86-64 -Q --help=target
           If the -Q option appears on the command line before the --help=
           option, then the descriptive text displayed by --help= is changed.
           Instead of describing the displayed options, an indication is given
           as to whether the option is enabled, disabled or set to a specific
           value

Warnings
--------

-O2 -Wall -Wextra -std=c99 -pedantic -Wwrite-strings -Wcast-qual -Wpointer-arith -Wstrict-prototypes

Je pense que je dirais plus vite qu'il faut compiler avec -O2. En
particulier pour les warnings, puisque le compilo fait une analyse plus
poussee, et que donc la qualite des diagnostics en -Wall -W -O2 est
notablement meilleure qu'en -O0.

-O6 / -g pour le debug
-Wall -Wextra
-std=c99
-pedantic  // pas de features supplementaires
-Wwrite-strings -Wcast-qual -Wpointer-arith -Wstrict-prototypes

-Wwrite-strings
         When compiling C, give string constants the type "const
         char[length]" so that copying the address of one into a
         non-"const" "char *" pointer will get a warning; when
         compiling C++, warn about the deprecated conversion from
         string constants to "char *".  These warnings will help
         you find at compile time code that can try to write into
         a string constant, but only if you have been very care
         ful about using "const" in declarations and prototypes.
         Otherwise, it will just be a nuisance; this is why we
         did not make -Wall request these warnings.
 -Wcast-qual
         Warn whenever a pointer is cast so as to remove a type
         qualifier from the target type.  For example, warn if a
         "const char *" is cast to an ordinary "char *".
 -Wpointer-arith
         Warn about anything that depends on the ``size of'' a
         function type or of "void".  GNU C assigns these types a
         size of 1, for convenience in calculations with "void *"
         pointers and pointers to functions.
         (implied by -Wpedentic)
 -Wstrict-prototypes (C only)
         Warn if a function is declared or defined without speci
         fying the argument types.  (An old-style function defi
         nition is permitted without a warning if preceded by a
         declaration which specifies the argument types.)

Optimisations
-------------
-march -> compiler pour cette archi
-mtune -> optimiser pour cette archi

cpu: pentium4, amd64
-O
     -O1 Optimize.  Optimizing compilation takes somewhat more
         time, and a lot more memory for a large function.

         With -O, the compiler tries to reduce code size and exe
         cution time, without performing any optimizations that
         take a great deal of compilation time.

         -O turns on the following optimization flags: -fde
         fer-pop -fmerge-constants -fthread-jumps -floop-optimize
         -fif-conversion -fif-conversion2 -fdelayed-branch
         -fguess-branch-probability -fcprop-registers

         -O also turns on -fomit-frame-pointer on machines where
         doing so does not interfere with debugging.

     -O2 Optimize even more.  GCC performs nearly all supported
         optimizations that do not involve a space-speed trade
         off.  The compiler does not perform loop unrolling or
         function inlining when you specify -O2.  As compared to
         -O, this option increases both compilation time and the
         performance of the generated code.

         -O2 turns on all optimization flags specified by -O.  It
         also turns on the following optimization flags:
         -fforce-mem -foptimize-sibling-calls -fstrength-reduce
         -fcse-follow-jumps  -fcse-skip-blocks -fre
         run-cse-after-loop  -frerun-loop-opt -fgcse  -fgcse-lm
         -fgcse-sm  -fgcse-las -fdelete-null-pointer-checks -fex
         pensive-optimizations -fregmove -fschedule-insns
         -fschedule-insns2 -fsched-interblock  -fsched-spec
         -fcaller-saves -fpeephole2 -freorder-blocks  -fre
         order-functions -fstrict-aliasing -funit-at-a-time
         -falign-functions  -falign-jumps -falign-loops
         -falign-labels -fcrossjumping

         Please note the warning under -fgcse about invoking -O2
         on programs that use computed gotos.

     -O3 Optimize yet more.  -O3 turns on all optimizations spec
         ified by -O2 and also turns on the -finline-functions,
         -fweb and -frename-registers options.

-fomit-frame-pointer
         Don't keep the frame pointer in a register for functions
         that don't need one.  This avoids the instructions to
         save, set up and restore frame pointers; it also makes
         an extra register available in many functions.  It also
         makes debugging impossible on some machines.
  (active avec -O sur certaines machines)
-finline-functions
         Integrate all simple functions into their callers.  The
         compiler heuristically decides which functions are sim
         ple enough to be worth integrating in this way.

         If all calls to a given function are integrated, and the
         function is declared "static", then the function is nor
         mally not output as assembler code in its own right.

         Enabled at level -O3.

Unreliable arithmetic
---------------------

 -ffast-math
         Sets -fno-math-errno, -funsafe-math-optimizations,
         -fno-trapping-math, -ffinite-math-only, -fno-round
         ing-math and -fno-signaling-nans.

         This option causes the preprocessor macro
         "__FAST_MATH__" to be defined.

         This option should never be turned on by any -O option
         since it can result in incorrect output for programs
         which depend on an exact implementation of IEEE or ISO
         rules/specifications for math functions.

     -fno-math-errno
         Do not set ERRNO after calling math functions that are
         executed with a single instruction, e.g., sqrt.  A pro
         gram that relies on IEEE exceptions for math error han
         dling may want to use this flag for speed while main
         taining IEEE arithmetic compatibility.

         This option should never be turned on by any -O option
         since it can result in incorrect output for programs
         which depend on an exact implementation of IEEE or ISO
         rules/specifications for math functions.

         The default is -fmath-errno.

     -funsafe-math-optimizations
         Allow optimizations for floating-point arithmetic that
         (a) assume that arguments and results are valid and (b)
         may violate IEEE or ANSI standards.  When used at
         link-time, it may include libraries or startup files
         that change the default FPU control word or other simi
         lar optimizations.

         This option should never be turned on by any -O option
         since it can result in incorrect output for programs
         which depend on an exact implementation of IEEE or ISO
         rules/specifications for math functions.

         The default is -fno-unsafe-math-optimizations.

     -ffinite-math-only
         Allow optimizations for floating-point arithmetic that
         assume that arguments and results are not NaNs or
         +-Infs.

         This option should never be turned on by any -O option
         since it can result in incorrect output for programs
         which depend on an exact implementation of IEEE or ISO
         The default is -fno-finite-math-only.

     -fno-trapping-math
         Compile code assuming that floating-point operations
         cannot generate user-visible traps.  These traps include
         division by zero, overflow, underflow, inexact result
         and invalid operation.  This option implies -fno-signal
         ing-nans.  Setting this option may allow faster code if
         one relies on ``non-stop'' IEEE arithmetic, for example.

         This option should never be turned on by any -O option
         since it can result in incorrect output for programs
         which depend on an exact implementation of IEEE or ISO
         rules/specifications for math functions.

         The default is -ftrapping-math.

     -frounding-math
         Disable transformations and optimizations that assume
         default floating point rounding behavior.  This is
         round-to-zero for all floating point to integer conver
         sions, and round-to-nearest for all other arithmetic
         truncations.  This option should be specified for pro
         grams that change the FP rounding mode dynamically, or
         that may be executed with a non-default rounding mode.
         This option disables constant folding of floating point
         expressions at compile-time (which may be affected by
         rounding mode) and arithmetic transformations that are
         unsafe in the presence of sign-dependent rounding modes.

         The default is -fno-rounding-math.

         This option is experimental and does not currently guar
         antee to disable all GCC optimizations that are affected
         by rounding mode.  Future versions of GCC may provide
         finer control of this setting using C99's "FENV_ACCESS"
         pragma.  This command line option will be used to spec
         ify the default state for "FENV_ACCESS".

     -fsignaling-nans
         Compile code assuming that IEEE signaling NaNs may gen
         erate user-visible traps during floating-point opera
         tions.  Setting this option disables optimizations that
         may change the number of exceptions visible with signal
         ing NaNs.  This option implies -ftrapping-math.

         This option causes the preprocessor macro
         "__SUPPORT_SNAN__" to be defined.

         The default is -fno-signaling-nans.

         This option is experimental and does not currently guar
         antee to disable all GCC optimizations that affect sig
         naling NaN behavior.

Archlinux
---------

Options de archlinux:
CPPFLAGS="-D_FORTIFY_SOURCE=2"
CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fstack-protector-strong -fno-plt"
(OLDCFLAGS="-march=i686 -mtune=generic -O2 -pipe -fstack-protector --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2"
For my custom compilations I was also using: -march=native -mtune=native)
LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"

-pipe pour ne pas utiliser de fichiers temporaires
-fstack-protector
    Emit extra code to check for buffer overflows, such as stack
    smashing attacks.  This is done by adding a guard variable to
    functions with vulnerable objects.  This includes functions that
    call alloca, and functions with buffers larger than 8 bytes.  The
    guards are initialized when a function is entered and then checked
    when the function exits.  If a guard check fails, an error message
    is printed and the program exits.
--param: ssp-buffer-size
    The minimum size of buffers (i.e. arrays) that will receive
    stack smashing protection when -fstack-protection is used.
    Note: remplacé par -fstack-protector-strong, cf
          http://www.outflux.net/blog/archives/2014/01/27/fstack-protector-strong/
-fstack-protector-strong
    Like -fstack-protector but includes additional functions to be
    protected --- those that have local array definitions, or have
    references to local frame addresses.
-fno-plt
    Do not use the PLT for external function calls in position-
    independent code.  Instead, load the callee address at call sites
    from the GOT and branch to it.  This leads to more efficient code
    by eliminating PLT stubs and exposing GOT loads to optimizations.

FORTIFY_SOURCE: https://idea.popcount.org/2013-08-15-fortify_source/
  With FORTIFY_SOURCE whenever possible GCC tries to uses buffer-length aware replacements for functions like strcpy, memcpy, memset, etc.

Cf Linker Options below for LDFLAGS
}}}1

Linker options
--------------

Archilinux:
-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"

-O1: optimize output
--sort-common: sort symbol by size (prevent gap between symbols due to
alignement constraints)
--as-needed: causes a DT_NEEDED
           tag to only be emitted for a library that at that point in the link
           satisfies a non-weak undefined symbol reference from a regular
           object file
  cf https://wiki.ubuntu.com/ToolChain/CompilerFlags#A-Wl.2C--as-needed
  -> So with this option an object needing a library has to be put before
  the library (as for the static compilation)
-z relro:  Create an ELF "PT_GNU_RELRO" segment header in the object.
-z now: When generating an executable or shared library, mark it to
        tell the dynamic linker to resolve all symbols when the program
        is started, or when the shared library is linked to using
        dlopen, instead of deferring function call resolution to the
        point when the function is first called.

-Wl,-soname,libmean.so.1  => specify soname

Example from http://www.catonmat.net/blog/ldd-arbitrary-code-execution/
  app/bin$ L=/home/you/app/uclibc
  app/bin$ gcc -Wl,--dynamic-linker,$L/lib/ld-uClibc.so.0 \
    -Wl,-rpath-link,$L/lib \
    -nostdlib \
    myapp.c -o myapp \
    $L/usr/lib/crt*.o \
    -L$L/usr/lib/ \
    -lc
  Here is the explanation of options passed to gcc:
    -Wl,--dynamic-linker,$L/lib/ld-uClibc.so.0 -- specifies the new loader,
    -Wl,-rpath-link,$L/lib -- specifies the primary directory where the dynamic loader will look for dependencies, (ie like -rpath but only during link time, not at run time)
    -nostdlib -- don't use system libraries,
    myapp.c -o myapp -- compile myapp.c to executable myapp,
    $L/usr/lib/crt*.o -- statically link to initial runtime code, function prolog, epilog,
    -L$L/usr/lib/ -- search for libc in this directory,
    -lc -- link with the C library.

--gc-sections
--no-gc-sections
    Enable garbage collection of unused input sections.  It is ignored
    on targets that do not support this option.  The default behaviour
    (of not performing this garbage collection) can be restored by
    specifying --no-gc-sections on the command line.
-> Cf gmane.comp.sysutils.systemd.devel:25445:
    I'm okay with the change to remove gc-sections.
    systemd is pretty good at not leaving crap in its code, then results
    are pretty small as we saw.
    My only comment is that we should also remove:
            -ffunction-sections -fdata-sections
    those are only useful to enable gc-sections.
    From time to time someone should run a build with
            -ffunction-sections -fdata-sections
            -Wl,--gc-sections -Wl,--print-gc-sections
    so we print out sections that are dangling and then we could remove
    them from source code if needed.
-> gmane.comp.sysutils.systemd.devel:25510:
     Btw., you run with LTO, which makes --gc-sections obsolete. But we
     don't enable LTO for debug builds and I think distributions may
     disable it, too. Until we decide to rely on LTO, I'd strongly suggest
     keeping our --gc-sections + function/data-section. Either LTO _or_
     --gc-sections is required!
[-flto is a gcc option: -flto[=n]
           This option runs the standard link-time optimizer.]

# Compilation
## Environnement et flags
-Dmacro
CPPFLAGS comme variable d'environement

Include:
-I libdir: ajout libdir pour chercher les headers
CPATH comme variable d'environnement

foo.o -lz bar.o #searches library z (z.a) after file foo.o but before bar.o.
-L libdir pour spécifier ou chercher les librairies
LIBRARY_PATH comme variable d'environnement

Linkers:
-Wl,-rpath,mylibrarydir
  le -Wl pour dire que c'est une option à passer à ld.so
  -rpath pour mettre en place le rpath (run time path de la librairie)
LD_RUN_PATH comme variable d'environnement
(ie pour mettre en place le rpath dans le binaire elf)
cf patchELF et chrpath pour modifier le rpath d'un binaire directement

LD_LIBRARY_PATH=mylibrarydir monprog
  pour modifier le run time path à l'execution
  (cf plus bas pour voir la précédence entre LD_LIBRARY_PATH et le rpath de
  l'executable)

LD_PRELOAD pour surcharger une librairie
(If you set LD_PRELOAD to the path of a shared object, that file will be loaded before any other library (including the C runtime, libc.so). So to run ls with your special malloc() implementation, do this:
$ LD_PRELOAD=/path/to/my/malloc.so /bin/ls)

## Rpath
(En résumé si --enable-new-dtags est activé dans ld.so, alors
LD_LIBRARY_PATH a précédence sur le rpath de l'executable)

http://blog.tremily.us/posts/rpath/
https://wiki.debian.org/RpathIssue
http://en.wikipedia.org/wiki/Rpath

The dynamic linker of the GNU C Library and its derivative Embedded GLIBC implement a rather complicated algorithm for searching for shared libraries. The basic search order is:[1]
    - The (colon-separated) paths in the DT_RPATH dynamic section attribute of the binary if present and DT_RUNPATH attribute does not exist.
    - The (colon-separated) paths in the environment variable LD_LIBRARY_PATH, unless the executable is a setuid/setgid binary, in which case it is ignored. LD_LIBRARY_PATH can be overridden by calling the dynamic linker with the option --library-path (e.g. /lib/ld-linux.so.2 --library-path $HOME/mylibs myprogram).
    - The (colon-separated) paths in the DT_RUNPATH dynamic section attribute of the binary if present.
    - Lookup based on the ldconfig cache file (often located at /etc/ld.so.cache) which contains a compiled list of candidate libraries previously found in the augmented library path (set by /etc/ld.so.conf). If, however, the binary was linked with the -z nodeflib linker option, libraries in the default library paths are skipped.
    - In the trusted default path /lib, and then /usr/lib. If the binary was linked with the -z nodeflib linker option, this step is skipped.
Notes:
    - The option --inhibit-rpath LIST of the dynamic linker instructs it to ignore DT_RPATH and DT_RUNPATH attributes of the object names in LIST.
    - Libraries specified by the environment variable LD_PRELOAD and then those listed in /etc/ld.so.preload are loaded before the search begins. A preload can thus be used to replace some (or all) of the requested library's normal functionalities, or it can simply be used to supply a library that would otherwise not be found.
    - Static libraries are searched and linked into the ELF file at link time and are not linked at run time.
The role of GNU ld
The GNU Linker (GNU ld) implements a feature which it calls "new-dtags": [2]
If the new-dtags feature is enabled in the linker (at run time using --enable-new-dtags), GNU ld, besides setting the DT_RPATH attribute, also sets the DT_RUNPATH attribute to the same string. At run time, if the dynamic linker finds a DT_RUNPATH attribute, it ignores the value of the DT_RPATH attribute, with the effect that LD_LIBRARY_PATH is checked next and the paths in the DT_RUNPATH attribute are only searched after it.
This means that in such configurations, the paths in LD_LIBRARY_PATH are searched before those given at link time using -rpath if --enable-new-dtags was active.
Instead of specifying the -rpath to the linker, the environment variable LD_RUN_PATH can be set to the same effect.

In summary: [DT_RPATH] -> LD_LIBRARY_PATH -> DT_RUNPATH -> `ldconfig` -> /lib,/usr/lib

## Librairie
http://stackoverflow.com/questions/14884126/build-so-file-from-c-file-using-gcc-command-line

To generate a shared library you need first to compile your C code with the -fPIC (position independent code) flag.
    gcc -c -fPIC hello.c -o hello.o
(-c means to create an intermediary object file, rather than an executable.)

This will generate an object file (.o), now you take it and create the .so file:
    gcc hello.o -shared -o libhello.so
All at once:
    gcc -shared -o libhello.so -fPIC hello.c

Using it:
 gcc -Ifoo -Lfoo -Wl,-rpath=foo -Wall -o test main.c -lfoo

For a static library:
http://stackoverflow.com/questions/2734719/how-to-compile-a-static-library-in-linux
http://www.adp-gmbh.ch/cpp/gcc/create_lib.html
    gcc -c -o out.o out.c
    ar rcs libout.a out.o
Using it: gcc -static main.c -L. -lmean -o statically_linked

For the elf structure and DT_NEEDED, see
http://www.bottomupcs.com/chapter08.html ->
http://www.bottomupcs.com/libraries_and_the_linker.html

Notes: fpic vs fpie
    -fpic
    Generate position-independent code (PIC) suitable for use in a shared library...
    - fPIC: same as -fpic but in a way that avoids any limit on the size of the global offset table
    -fpie/-fPIE
    These options are similar to -fpic and -fPIC, but generated position independent code can be only linked into executables....
