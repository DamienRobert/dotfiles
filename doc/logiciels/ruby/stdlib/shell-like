# vim: foldmethod=marker ft=markdownlight

#facets {{{1
Numenor ~gems/facets-2.9.3/lib/core/facets/file $ ls
append.rb        create.rb       read_list.rb  split_all.rb
atomic_id.rb     ext.rb          rewrite.rb    split_root.rb
atomic_open.rb   null.rb         rootname.rb   write.rb
atomic_write.rb  read_binary.rb  sanitize.rb   writelines.rb

Numenor ~gems/facets-2.9.3/lib/core/facets $ ls dir
ascend.rb  descend.rb  each_child.rb  multiglob.rb  parent.rb  recurse.rb

Numenor ~gems/facets-2.9.3/lib/standard/facets/fileutils $ ls
amass.rb  head.rb  outofdate.rb  slice.rb  tail.rb  whereis.rb
cp_rx.rb  ln_r.rb  safe_ln.rb    stage.rb  wc.rb    which.rb

Mithrim …s-3.0.0/lib/standard/facets/pathname $ ls                          ⚡36
chdir.rb   home.rb      outofdate.rb  safe.rb        uptodate.rb
empty.rb   null.rb      readline.rb   split_root.rb  visit.rb
exists.rb  op_div.rb    root.rb       to_path.rb     work.rb
glob.rb    op_fetch.rb  rootname.rb   to_str.rb

# standard/facets/shellwords
rajoute shellwords aux hash et array

-> Ecrire un fichier: file.write("ploum")
Ou File.write(path,data) avec facets
}}}1

FileUtils: {{{1
=========

  cd(dir, options)
  cd(dir, options) {|dir| .... }
  pwd()
  mkdir(dir, options)
  mkdir(list, options)
  mkdir_p(dir, options)
  mkdir_p(list, options)
  rmdir(dir, options)
  rmdir(list, options)
  ln(old, new, options) [=link]
  ln(list, destdir, options)
  ln_s(old, new, options)
  ln_s(list, destdir, options) [=symlink]
  ln_sf(src, dest, options)
  cp(src, dest, options)
  cp(list, dir, options)
  cp_r(src, dest, options)
  cp_r(list, dir, options)
  mv(src, dest, options)
  mv(list, dir, options)
  rm(list, options)
  rm_r(list, options)
  rm_rf(list, options)
  install(src, dest, mode = <srcs>, options)
  chmod(mode, list, options)
  chmod_R(mode, list, options)
  chown(user, group, list, options)
  chown_R(user, group, list, options)
  touch(list, options)
Low level functions:
  copy_entry(src, dest, preserve = false, dereference = false) #can copy directories
  copy_file(src, dest, preserve = false, dereference = true)
  copy_stream(srcstream, deststream)
  remove_entry(path, force = false)
  remove_entry_secure(path, force = false)
  remove_file(path, force = false)
  compare_file(path_a, path_b) [= cmp, identical?]
  compare_stream(stream_a, stream_b)
  uptodate?(file, cmp_list)
module FileUtils::Verbose
  This module has all methods of FileUtils module, but it outputs messages
  before acting. This equates to passing the :verbose flag to methods in
  FileUtils.
module FileUtils::NoWrite
  This module has all methods of FileUtils module, but never changes
  files/directories. This equates to passing the :noop flag to methods in
  FileUtils.
module FileUtils::DryRun
  This module has all methods of FileUtils module, but never changes
  files/directories. This equates to passing the :noop and :verbose flags to
  methods in FileUtils.

FileUtils Options:
{"chdir"/"cd"=>[:verbose],
 "mkdir"=>[:mode, :noop, :verbose],
 "mkdir_p"/"mkpath"/"makedirs"=>[:mode, :noop, :verbose],
 "rmdir"=>[:parents, :noop, :verbose],
 "ln"/"link"=>[:force, :noop, :verbose],
 "ln_s","symlink"=>[:force, :noop, :verbose],
 "ln_sf"=>[:noop, :verbose],
 "cp"/"copy"=>[:preserve, :noop, :verbose],
 "cp_r"=>[:preserve, :noop, :verbose, :dereference_root, :remove_destination],
 "mv"/"move"=>[:force, :noop, :verbose, :secure],
 "rm"/"remove"=>[:force, :noop, :verbose],
 "safe_unlink"=>[:noop, :verbose],
 "rm_f"=>[:noop, :verbose],
 "rm_r"=>[:force, :noop, :verbose, :secure],
 "rm_rf"/"rmtree"=>[:noop, :verbose, :secure],
 "install"=>[:mode, :preserve, :noop, :verbose],
 "chmod"=>[:noop, :verbose],
 "chmod_R"=>[:noop, :verbose, :force],
 "chown"=>[:noop, :verbose],
 "chown_R"=>[:noop, :verbose, :force],
 "touch"=>[:noop, :verbose, :mtime, :nocreate]}
[preserve: mean preserve metadata, aka owner, group, mtime]
Note: strangely the low level copy_file has the option 'dereference', which
is true by default [dereference the source]; this option is not available
for 'cp'; but it is available for cp_r which use copy_entry as a low level
function, so these options are available for cp_r:
- dereference_root: dereference source
- remove_destination: remove all files in dest before copy
- preserve: preserve modes
Warning: these options are all false for copy_entry, but dereference_root
is true for cp_r!]

Notes on rm:
- FileUtils.rm(%w(file1 file2), verbose: true, noop: true, force: true)
(Remove file(s) specified in list.  This method cannot remove directories.
All StandardErrors are ignored when the :force option is set.)
- FileUtils.rm_r(%w(file1 file2), verbose: true, noop: true, force: true)
(similar but can remove directories)
- FileUtils.rm_rf or FileUtils.rmtree: alias for FileUtils.rm_r(...,force: true)
- FileUtils.rmdir %w(otherdir somedir), :verbose => true, :noop => true, parents: false
(wrapper autour de Dir.rmdir, qui permet de gérer les options, en
particulier parents qui est similaire à rmdir -p, ie essaie d'enlever les
parents également)

[They can all also accept just a file rather than a list]

cp and mv:
on the shell, mv symlink dest does not dereference 'symlink', and
mv source symlink overwrites 'symlink' if it refers to a file otherwise it
will put source in the directory referenced by 'symlink'
The same is true for cp -r, except that cp -r -H symlink dest does dereference
'symlink' [and also cp -r -L, where the latter also affects the -r options:
http://superuser.com/questions/593196/cp-h-vs-cp-l-what-is-a-command-line-symbolic-link]
However 'cp symlink foo' dereferences symlink, one needs 'cp -P symlink foo'
to not dereference
ln -s foo bar dereference bar except if -n is used
Ex: ln -s foo symlink_to_dir => put the symlink in dir
    ln -sf foo symlink_to_dir => overwrite dir/foo
    ln -snf foo symlink_to_dir => overwrite symlink
    ln -s foo symlink_to_file => error
    ln -sf foo symlink_to_file => overwrite symlink

FileUtils.{mv,ln_sf} behave similarly
FileUtils.{cp,cp_r} dereference symlinks, one need to use FileUtils.copy_entry to not dereference, or use FileUtils.cp_r(dereference_root: false)
}}}1

Dir {{{1
===
    ::[]
    ::chdir
    ::chroot
    ::delete ::rmdir ::unlink
    ::entries
    ::exist?
    ::exists?
    ::foreach
    ::glob
    ::home
    ::mkdir
    ::new
    ::open
    ::pwd ::getwd
    #close
    #each
    #inspect
    #path #to_path
    #pos #tell
    #read
    #rewind
    #seek #pos=

require 'tmpdir'
Dir.tmpdir #=> "/tmp"
Dir::Tmpname.create(prefix) do |path, n, opts| end
Dir::Tmpname.create([prefix, suffix], tmpdir, max_try, **opts) do |path, n, opts| end

~~~ Dir.mktmpdir
def self.mktmpdir(prefix_suffix=nil, *rest)
  path = Tmpname.create(prefix_suffix || "d", *rest) {|n| mkdir(n, 0700)}
  if block_given?
    begin
      yield path
    ensure
      ...
      FileUtils.remove_entry path
    end
  else
    path
  end
end
~~~

require 'tmpfile'
Tempfile.new(basename = "", [tmpdir = Dir.tmpdir], [options])
  # calls :Dir::Tmpname.create(basename, tmpdir, options)
Tempfile.open('foo', '/home/temp') do |f|
   ... do something with f ...
end
 # Note: Tempfile.create(...) do the same thing as Tempfile.open, but
 # creates a regular File, not a Tempfile
}}}1

Pathname {{{1
========

Core methods
-----------
    These methods are effectively manipulating a String, because that’s all a
    path is. Except for mountpoint?, children, each_child, realdirpath and
    realpath, they don’t access the filesystem.
(Note: la différence entre entries et children c'est que entries sort aussi
'.' et '..')

+ join parent root? absolute? relative? relative_path_from each_filename
cleanpath realpath realdirpath children each_child mountpoint?

File status predicate methods
-------------------------------
    These methods are a facade for FileTest:

blockdev? chardev? directory? executable? executable_real? exist? file?
grpowned? owned? pipe? readable? world_readable? readable_real? setgid? setuid?
size size? socket? sticky? symlink? writable? world_writable? writable_real?
zero?

File property and manipulation methods
-------------------------------------
    These methods are a facade for File:

atime ctime mtime chmod(mode) lchmod(mode) chown(owner, group) lchown(owner,
group) fnmatch(pattern, *args) fnmatch?(pattern, *args) ftype make_link(old)
open(*args, &block) readlink rename(to) stat lstat make_symlink(old)
truncate(length) utime(atime, mtime) basename(*args) dirname extname
expand_path(*args) split

Directory methods
----------------
    These methods are a facade for Dir:

::glob ::getwd / ::pwd rmdir entries each_entry(&block) mkdir(*args)
opendir(*args)

IO
--
    These methods are a facade for IO:

each_line(*args, &block) read(*args) binread(*args) readlines(*args)
sysopen(*args)

Utilities
---------
    These methods are a mixture of Find, FileUtils, and others:

find(&block) mkpath rmtree unlink / delete

Special features
---------------

p1 = Pathname.new("/usr/lib")   # Pathname:/usr/lib
p2 = p1 + "ruby/1.8"            # Pathname:/usr/lib/ruby/1.8
p3 = p1.parent                  # Pathname:/usr
p4 = p2.relative_path_from(p3)  # Pathname:lib/ruby/1.8
pwd = Pathname.pwd              # Pathname:/home/gavin
pwd.absolute?                   # true
p5 = Pathname.new "."           # Pathname:.
p5 = p5 + "music/../articles"   # Pathname:music/../articles
p5.cleanpath                    # Pathname:articles
p5.realpath                     # Pathname:/home/gavin/articles
p5.children                     # [Pathname:/home/gavin/articles/linux, ...]

Notes for relative/absolute paths
---------------------------------

f.cleanpath
  Returns clean pathname of self with consecutive slashes and useless dots
  removed. The filesystem is not accessed.
  If consider_symlink is true, then a more conservative algorithm is used to
  avoid breaking symbolic linkages. This may retain more .. entries than
  absolutely necessary, but without accessing the filesystem, this can’t be
  avoided.
f.relative_path_from(base_directory)
  Returns a relative path from the given base_directory to the receiver.
  If self is absolute, then base_directory must be absolute too.
  If self is relative, then base_directory must be relative too.
  This method doesn’t access the filesystem. It assumes no symlinks.
f.realpath
  Returns the real (absolute) pathname for self in the actual filesystem.
  Does not contain symlinks or useless dots, .. and ..
  All components of the pathname must exist when this method is called.
f.realdirpath
  Like f.realpath but the last component can not exist

Pathname vs FileUtils
---------------------

FileUtils:                            Pathname:
  cd(dir, options) {|dir| .... }
  mkdir(dir, options)                 #From Dir
  mkdir_p(dir, options)               #mkpath from FileUtils
  rmdir(dir, options)                 #From Dir
  ln(old, new, options)
  ln_s(old, new, options)
  ln_sf(src, dest, options)
  cp(src, dest, options)
  cp_r(src, dest, options)
  mv(src, dest, options)
  rm(list, options)                  #delete/unlink from Dir and File
  rm_r(list, options)
  rm_rf(list, options)               #rmtree from FileUtils
  install(src, dest, mode = <srcs>, options)
  chmod(mode, list, options)         #from File
  chown(user, group, list, options)  #from File
  touch(list, options)
}}}1

Shellwords {{{1
==========
    ::shellescape
Escapes a string so that it can be safely used in a Bourne shell command line.
String#shellescape is a shorthand for this function.

    ::shelljoin
Builds a command line string from an argument list array joining all
elements escaped for Bourne shell and separated by a space.

    ::shellsplit
Splits a string into an array of tokens in the same way the UNIX Bourne shell does
String#shellsplit is a shorthand for this function.
}}}1

Thor::Actions {{{1
=============

Thor::Actions#methods: 
  action          destination_root      prepend_file                         
  add_file        destination_root=     prepend_to_file                      
  add_link        directory             relative_to_original_destination_root
  append_file     empty_directory       remove_dir                           
  append_to_file  find_in_source_paths  remove_file                          
  apply           get                   run                                  
  behavior        gsub_file             run_ruby_script                      
  behavior=       in_root               source_paths                         
  chmod           inject_into_class     template                             
  comment_lines   inject_into_file      thor                                 
  copy_file       insert_into_file      uncomment_lines                      
  create_file     inside              
  create_link     link_file           
Voir aussi thor/shell/*.rb pour des commandes d'output et d'input
