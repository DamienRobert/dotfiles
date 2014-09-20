#!/usr/bin/env ruby
# This script updates the installed git version on my systems

require 'pathname'
require 'shellwords'
require 'fileutils'

@git_dir = Pathname.new(%w(~/opt/dist/git).map{ |path| File.expand_path(path)}.detect { |path|
  File.exist?(path)
})

Dir.chdir(@git_dir) do
  @git_options = %w().join(" ")
  @packages_path=Pathname.new("~/opt/packages").expand_path
  @git_prefix =@packages_path+("git-"+`git describe`.chomp)
  @git_install="make prefix=#{@git_prefix} #{@git_options} install quick-install-man"
  #system "make prefix=#{@git_prefix} #{@git_options} all" or exit 1
  puts @git_install
  system @git_install or exit 1

  #we need to remove packages/git because ln_s do not known the -n option
  FileUtils::rm(@packages_path+"git", verbose:true)
  FileUtils::ln_s(@git_prefix.basename, @packages_path+"git", verbose:true)
  @bindir=(@packages_path+"../bin").expand_path
  Dir.chdir(@bindir) do
    FileUtils::ln_sf(Pathname.glob("../packages/git/bin/*"),@bindir, verbose:true)
  end
  system "git --version"
end
