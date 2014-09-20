require 'shellwords'
require 'dr/bool'

module DR
  #git functions helper
  module Git
    extend(self)
    def git?(quiet:false)
      launch="git rev-parse"
      launch=launch + " 2>/dev/null" if quiet
      system launch
      return Bool.to_bool($?)
    end
    def gitdir?
      return Bool.to_bool(%x/git rev-parse --is-inside-git-dir/)
    end
    def worktree?
      return Bool.to_bool(%x/git rev-parse --is-inside-work-tree/)
    end
    def bare? 
      return Bool.to_bool(%x/git rev-parse --is-bare-repository/)
    end

    def toplevel 
      return %x/git rev-parse --show-toplevel/.chomp
    end
    def prefix 
      return %x/git rev-parse --show-prefix/.chomp
    end
    def gitdir 
      return %x/git rev-parse --git-dir/.chomp
    end

    def cd_to_toplevel(&block)
      dir=%x/git rev-parse --show-cdup/.chomp
      Dir.chdir(dir,&block) unless dir.empty?
    end

    def get_current_branch(always=true)
      branchname= %x/git symbolic-ref -q --short HEAD/.chomp!
      branchname ||= %x/git rev-parse --verify HEAD/.chomp! if always
      return branchname
    end

    def name_branch(branch="HEAD", method: "name", always: true)
      case method
      when "sha1"
        describe=%x"git rev-parse --short #{branch.shellescape}".chomp!
      when "describe"
        describe=%x"git describe #{branch.shellescape}".chomp!
      when "contains"
        describe=%x"git describe --contains #{branch.shellescape}".chomp!
      when "match"
        describe=%x"git describe --tags --exact-match #{branch.shellescape}".chomp!
      when "topic"
        describe=%x"git describe --all #{branch.shellescape}".chomp!
      when "branch"
        describe=%x"git describe --contains --all #{branch.shellescape}".chomp!
      when "topic-fb" #try --all, then --contains all
        describe=%x"git describe --all #{branch.shellescape}".chomp!
        describe=%x"git describe --contains --all #{branch.shellescape}".chomp! if describe.nil? or describe.empty?
      when "branch" #try --contains all, then --all
        describe=%x"git describe --contains --all #{branch.shellescape}".chomp!
        describe=%x"git describe --all #{branch.shellescape}".chomp! if describe.nil? or describe.empty?
      when "magic" 
        describe1=%x"git describe --contains --all #{branch.shellescape}".chomp!
        describe2=%x"git describe --all #{branch.shellescape}".chomp!
        describe= describe1.length < describe2.length ? describe1 : describe2
        describe=describe1 if describe2.empty?
        describe=describe2 if describe1.empty?
      when "name"
        describe=%x"git rev-parse --abbrev-ref --symbolic-full-name #{branch.shellescape}".chomp!
      else
        describe=%x/#{method}/.chomp! unless method.nil? or method.empty?
      end
      if (describe.nil? or describe.empty?) and always
        describe=%x/git rev-parse --short #{branch.shellescape}/.chomp!
      end
      return describe
    end

    def branch_rebase?(branch=get_current_branch)
      rb=%x/git config --bool branch.shellescape.#{branch.shellescape}.rebase/.chomp!
      rb||=%x/git config --bool pull.rebase/.chomp!
    end
    def branch_remote(branch=get_current_branch)
      rb=%x/git config --get branch.shellescape.#{branch.shellescape}.remote/.chomp!
      rb||="origin"
    end
    def branch_upstream(branch=get_current_branch)
      %x/git rev-parse --abbrev-ref --symbolic-full-name #{branch.shellescape}@{u}/.chomp!
    end

    #return all branches that have an upstream
    #if branches=:all look throug all branches
    def all_upstream_branches(branches)
      upstreams=%x!git for-each-ref --format='%(upstream:short)' refs/heads/branch/!
    end

    def get_topic_branches(*branches, complete: :local)
      if branches.length >= 2
        return [branches[0], branches[1]]
      elsif branches.length == 1
        if complete == :local
          return [get_current_branch, branches[0]]
        elsif complete == :remote
          return [branches[0], branch_upstream(branches[0])]
        else
          fail "complete keyword should be :local or :remote"
        end
      else
        return [get_current_branch, branch_upstream]
      end
    end
  end
end
