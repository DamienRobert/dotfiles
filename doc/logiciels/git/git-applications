vim: foldmethod=expr ft=markdownlight:

# Git scripts and utilities

(Legend: - already seen, x to see, ! installed, + look promising, look again in some future time, ++ really interesting, -- non maintained anymore)

Installed in archlinux: tig

## Installed in git my
cf git-my below for more tools used

This is a list of github links for tools that are incorporated to git-my
(or were until I replaced them with something better)

* Extra utilities
! https://github.com/mhagger/git-imerge #git imerge: incremental merge and rebase for git
! http://rtyley.github.com/bfg-repo-cleaner/ #commme filter-branch, en plus rapide pour ce qu'il fait (effacer des fichiers/du texte) (use java :-()
! https://github.com/webmat/git_remote_branch #publishing a branch (g my
grb)
! http://gitstats.sourceforge.net/ #stats... (g my stats html)
! https://github.com/felipec/git-reintegrate # This tool allows the regeneration of integration branches. (g my reintegrate)
! https://github.com/trast/tbdiff.git #topic branch diff (g my topic diff)
- https://github.com/MarkLodato/git-reparent #changer les parents d'un commit

* some usefull scripts
! https://github.com/mhagger/git-when-merged #-> (g my topic whenmerged)
! https://github.com/aspiers/git-config #set of git utilities
  [-> https://github.com/aspiers/git-deps: git commit dependency analysis tool; not yet incorporated]
- https://github.com/tj/git-extras: some extra cmds for git
- https://github.com/cypher/dotfiles.git #some script for git, copied in git/scripts/
- http://git-wt-commit.rubyforge.org/ #git-mainline

## git utilities

* Gui
- https://github.com/pomber/git-history
  Quickly browse the history of a file from any git repository https://githistory.xyz/
  -> Go to a file in GitHub (or GitLab, or Bitbucket); Replace github.com with github.githistory.xyz
- https://lib.rs/crates/git-brws [rust]
  Command line tool to open a repository, file, commit, diff, tag, pull request, issue or project’s website in your web browser from command line (compatible with github and gitlab). Similar to 'hub browse'
- https://gitgraphjs.com/
  Create (false) graphs of git commits, for tutorials
- https://insanesharpness.gitlab.io/GitVine/
  A simpler visualisation of Git Commits, inspired by Clearcase Version Tree.
-- https://github.com/demian85/git-watcher #Git Watcher is a multi-platform desktop app written in pure HTML and Javascript using node-webkit. It shows diff information about local staged/unstaged files and allows you to commit changes. UI is updated in real-time by detecting file changes and git index changes. Submodules also inform changes to their parent module.

* Topic helpers
++ https://github.com/apenwarr/git-subtrac Keep the content for your git submodules all in one place: the parent repo.
! https://github.com/greenrd/topgit #patch manager, last version (old one was porridge/topgit)
++ https://github.com/git-series/git-series #Track changes to a patch series over time 
- https://github.com/SethRobertson/git-what-branch #Discover what branch a particular commit was made on or near
- https://github.com/petervanderdoes/gitflow #a workflow helper
-- https://github.com/aanand/git-up #fetch and rebase all locally-tracked remote branches (a bit like 'git my up' does, but for all tracked branches)
- https://github.com/patchew-project/patchew A patch email tracking and testing system
- https://opensource.com/article/20/1/bash-scripts-git => scripts to search and format the log

* Rebase
- https://gitrebasetool.mitmaro.ca/ [rust]
  Git Interactive Rebase Tool, An improved sequence editor for Git
-- https://github.com/max630/git-rehi/ #more powerfull rebase in perl
-- https://github.com/dankeder/git-rebranch #rebase branch according to layout
   eg feature1 and feature2 based on common based on master
-- https://github.com/cool-RR/git-cascade
  -> git cascade - Cascade changes from each branch to its dependents. Use
  git forward-merge internally. Eg with 'development > staging > master',
  git cascade foo master merge foo in master, staging and development.
  -> git forward-merge - Merge branches without checking them out, using a temporary git index file and working directory
  [cf git my update-worktree -- --tmp worktree opts -- git command]
-- https://git.csx.cam.ac.uk/x/ucs/git/git-repub.git #The 'git repub' command maintains a "repub branch" that you can use to record the history of another "rebasing branch" that is repeatedly rewound. Updates to the repub branch are fast-forwards, so they are convenient to publish.
    Very similar to git-merging-rebase, except that it merges after the
    rebase rather than before, and the rebase is done manually. Essentially
    each commit of the pub branch is a new state of the rw branch (via a
    merge so that forwardibility is preserved), ie it keeps the history of
    the rw branch. More precisely it maintains a ff branch and a rw branch.
    git repub --rw rw --ff ff wille merge rw into ff (using rw's tree). It
    also has some facilities to associate a ff/rw branch to another one via
    git config, and can unpub an branch, by fast forwarding it to ff^2 (and
    checking that the history makes sense).

* Stats
+ https://github.com/sensorflo/git-draw/wiki #git-draw draws nearly the full content of a tiny git repository as a graph.
+ https://github.com/hoduche/git-graph #another git graph viewer (show only
  the graph, not the content)
- https://github.com/acaudwell/Gource # software version control visualization (OpenGL-based 3D visualisation tool for source control repositories.)
- https://github.com/IonicaBizau/git-stats
  A GitHub-like contributions calendar, but locally, with all your git commits. 

* Deploy
+ https://lib.rs/crates/git-journal [rust]
  The Git Commit Message and Changelog Generation Framework => generate nice changelogs
- https://github.com/mislav/git-deploy
  Ruby gem that set up git push hooks for deployment, heroku like
-- https://github.com/tpope/git-bump
  Create Git release commits and tags with changelogs

* Tools
++ https://github.com/newren/git-filter-repo
  filter-branch replacement [difference with bfg? => gère les empty
  commits, fais plus de choses]
  cf https://git.github.io/rev_news/2019/08/21/edition-54/#an-introduction-to-git-filter-repo--written-by-elijah-newren
- http://git-repair.branchable.com/ #git-repair is a complement to git fsck, which only finds problems, but does not try to fix them.
- https://github.com/GitAlias/gitalias
  Git alias commands for faster easier version control [incorporated the interesting ones already]
  (The readme mention other utilities.)
- https://github.com/magicmonty/bash-git-prompt
  An informative and fancy bash prompt for Git users
- https://github.com/src-d/gitbase
  SQL interface to Git repositories, written in Go. https://docs.sourced.tech/gitbase
-- https://github.com/jeffWelling/ticgit # bug tracker

* Files
+ git-annex #needs cabal
  http://git-annex.branchable.com/install/ArchLinux/
  => Has a bup backend: https://git-annex.branchable.com/special_remotes/bup/
- https://git-lfs.github.com/ #Git Large File Support
  a recent alternative to git-annex
  
* Hooks
! https://github.com/mhagger/git-multimail #post receive hook

* Password manager using git:
+ www.passwordstore.org (on arch: pass)
- https://github.com/peff/pass

## Global VCS handlers

+ https://github.com/nosarthur/gita
  Manage multiple git repos side by side for sanity
- https://myrepos.branchable.com/
  A combination of `vcs` and `gitfolders`

* Rust:
! https://lib.rs/crates/git-find A tool (cli & lib) to find local git repositories
=> Look at the current and subdirectories, and for each git dir, output
[CMU] filename fullpath  remote remote_url

! https://lib.rs/crates/git-global Keep track of all your the git repositories on your machine 
=> git global info/list/scan/[status]
=> git global: show the output of 'git status' in each repo [if non empty]

## Felipe scripts
! https://github.com/felipec/git-related (g my related)
! https://github.com/felipec/git-reintegrate (g my reintegrate)
+ https://github.com/felipec/git-send-series
+ https://github.com/felipec/git-remote-hg
  See also https://github.com/glandium/git-cinnabar which doesn't use a local mercurial clone under the hood
  List of remote-hg utilities: https://github.com/buchuki/gitifyhg/wiki/List-of-git-hg-bridges
+ https://github.com/felipec/git-remote-bzr

Hooks:
------

* git-multimail, use as a post-receivehook [with python2]
Ex: avisogenies@gforge-inria
exec /usr/bin/python /home/users/robertdamien/git-multimail/git-multimail/post-receive "$@"
and in git-config:
[multimailhook]
  mailingList = avisogenies-commits@lists.gforge.inria.fr
  replyTo = avisogenies-commits@lists.gforge.inria.fr
  announceShortlog = true

exec /usr/bin/python2 /home/imb/damienrobert/usr/dist/@git/git-multimail/git-multimail/git_multimail.py "$@"
[multimailhook]
•·mailingList = lfant@inria.fr
•·refchangeList = "" #reference change email
•·replyTo = lfant@inria.fr
•·announceShortlog = true

Gitignore
---------

Sample gitignore files: https://github.com/github/gitignore
    gitignore() {
        wget \
        https://raw.githubusercontent.com/github/gitignore/master/Global/OSX.gitignore \
        https://raw.githubusercontent.com/github/gitignore/master/$1.gitignore \
        -O .gitignore
    }

- https://www.gitignore.io/
git config --global alias.ignore '!gi() { curl -L -s https://www.gitignore.io/api/$@ ;}; gi'

git-my
======

## Commands
$ git my help
    archive        - Archive current directory [=git-archive]
    bfg            - Delete files from repo [=dist/bfg]
    changelog      - Output changelog from git log [=git-changelog.rb]
  > contrib        - Contrib helpers: contacts/hash/jump/mailmap/packs/rerere-train/resurrect/subtree
    current        - Show current branch = [GitHelpers.current_branch]
    deploy         - Deploy repository [=git-deploy]
  > extra          - Extra helpers: aliases/cherry/fork/hg/obliterate/runcmd/set_pr/uncommit/update-worktree/whitespace
    gc             - Run gc with more aggressive settings [=direct code]
                     [increase window size+run prune=now and reflog expire=now]
    grb            - Manipulates published branches [=dist/grb]
  > help           - Shows a list of commands or help for one command
    imerge         - Merge interactive [=dist/mhagger/imerge]
    latexdiff      - git wrapper around latexdiff [=dist/git-latexdiff]
  > ls             - Ls helpers: *blame/files/removed
    merging-rebase - Rebase, preserving fastforwardabiliy [=script/git-merging-rebase]
    notes-remote   - Wrapper around 'git notes' to make it easier to share notes to and from remote repositories. [=dist/aspiers/git-rnotes]
    patch          - Manage patches [=git-patches]
    rebuild        - Rebuild patches and integration branches [=git-rebuild]
    reintegrate    - Merge topic branches on base into integration branch [=dist/felipc/git-reintegrate]
    related        - People interested by a patch (ruby version of git contacts) [=dist/felipec/git-related]
    setrebase      - Configure branch to be rebased [=git-setrebase]
    squash         - Update and squash branch [=git-squash]
    stash          - Custom stash command [=git-mystash]
  > stats          - Statistics: authors/diff/files/html/infos/lines/size/*summary
    store          - Store commits in a ref [=git-reflog-store]
    subadd         - Add a git folder as a submodule [=git-subadd]
    test           - Create a git test dir [=direct code]
  > topic          - Topic helpers: cherry/log/logs/*infos/...
    trivial        - Create empty commits and trivial merges [=git-trivial]
    update         - Update repo [=direct code]

$ git my contrib help
    contacts     - Find who contributed on a patched line
    hash         - Shows hash prefixes
    jump         - Quick jump for editor
    mailmap      - Find mailmap candidates
    packs        - Give informations on packs
    rerere-train - Prime rerere database from existing merge commits
    resurrect    - Try to resurrect a deleted branch
    subtree      - Merge subtrees together and split repository into subtrees

$ git my extra help
    aliases         - Show all aliases [=GitHelpers.aliases]
    cherry          - Wrapper around git cherry [=dist/aspiers/git-icing]
    cherry-menu     - Interactive menu around git my cherry [=dist/aspiers/git-cherry-menu]
    fork            - Set up a github fork as a three way repo
                      [hub fork && ... git config remote.pushDefault DamienRobert]
    hg              - Remote hg helper [=dist/felipc/hg]
    obliterate      - Use filter-branch to remove a file [=direct code]
    runcmd          - run command on git revisions [=direct code]
    set_pr          - Set up 'pr' and 'pr-clean' local git aliases for github pull requests [=direct code]
    uncommit        - Remove changes from your previous commit [=git-uncommit]
    update-worktree - Update the worktree [=git-update-worktree]
    whitespace      - Removes whitespace errors [=scripts/git-nows]

$ git my ls help
   *blame   - Like 'git blame', but for a directory (default) [=dist/aspiers/git-ls-dir]
    files   - Number of commits modifying each files [=GitHelpers.output_commit_by_files]
    removed - Show removed files [=GitHelpers.output_removed_files]

$ git my stats help
    authors - Shows list of authors (ranking by number of commits) [=direct code]
    cal     - Calendar [git-cal/git-cal]
    diff    - Count lines of diffs by authors [=GitHelpers.output_stats_diff]
    files   - Statistics by files changed by authors [=GitHelpers.output_stats_authors]

    html    - Statistics (html) [=dist/gitstats]
    infos   - General informations [=GitHelpers.infos]
    lines   - Number of currently written lines by authors [=GitHelpers.output_stats_lines]
    size    - Compute various size metrics for a Git repository, flagging those that might cause problems [=dist/git-sizer]
   *summary - Summary (default) [=GitHelpers.summary]

$ git my topic help
   *infos      - Info on topic branches
    cherry     - Shows log between current branch and its remote, in left-right format [=direct code]
                 [= git log --left-right --topo-order --oneline local..remote
                  = condensed 'my topic log' = nicer 'git cherry']
    diff       - topic diff [=dist/tbdiff !Obsolete, use `range-diff`]
                 [shows the differences between two versions of a patch series]
    log [--diff] - Shows log between current branch and its remote (default) [=direct code]
                 [=> -Incoming:... -Outgoing:...]
    logs       - Shows log between branches and their upstreams [=direct code]
                 [=> call 'my topic log' for each branch]

    start      - Start new topic
    push       - Push topic branches
    sync       - Sync topics
    rename     - Rename topic [or tag]
    delete     - Delete topics [or tags]

    children   - Show direct children of a commit [=GitHelpers.output_commit_children]
    diverged   - Find when two branches first diverged [=git-topic-diverged]
    neck       - Show commits until first branching point [=GitHelpers.neck]
    trails     - Show all branching points [=GitHelpers.output_trails]
    whenmerged - Find when a commit was merged into one or more branches. [=dist/mhagger/git-when-merged]

## Scripts incorporated
### Mine

- git-archive (g my archive)
- git-changelog.rb (g my changelog)
- git-current-branch (g my extra current-branch)
- git-deploy (g my deploy)
- git-mystash (g my stash)
- git-patches (g patch)
- git-rebuild (g my rebuild)
  Rebase branches and then merge themp
- git-reflog-rebase #Obsolete; integrated into git
- git-reflog-store (g my reflog-store)
  Store things in the reflog
- git-setrebase (g my setrebase)
  Set branch to be rebased
- git-squash (g my squash)
- git-topic-diverged (g my topic-diverged)
  Find when two branches first diverged
- git-trivial (g my trivial)
- git-uncommit (g my extra-uncommit)
  Uncommit some commited files from previous commit
- git-update-worktree (g my worktree-update)
  Low level update-worktree helper
- git_move_subdir

### Contrib

- git-common-hash (g my contrib hash)
  Largest common hash prefix
- git-contacts (g my contrib contact)
  Like git my related
- git-resurrect (g my contrib resurrect)
  Resurrect a deleted branch
- git-subtree.sh (g my subtree)
- mailmap (g my contrib mailmap)
  Check for mailmap candidates
- packinfo.pl (g my contrib packs)
- rerere-train.sh (g my contrib rerere-train)

### Scripts

- git-diffblame #seems buggy, not integrated
- git-happening (g my topic-merged)
- git-merging-rebase (g my merging-rebase)
- git-neck (g my topic-neck)
- git-trail (g my topic-trail)
- git-nows: remove extra whitespaces (g my extra whitespace)

### Programs

- bfg-1.13.0.jar -> g my bfg
  Faster git-filter-branch to remove files.
  Ex: java -jar ~/usr/dist/@git/bfg-1.13.0.jar --delete-folders .crypt
      java -jar ~/usr/dist/@git/bfg-1.13.0.jar --delete-files foo.jpg
- git-imerge/ (mhagger) -> git my imerge
  git-imerge can merge/rebase with the smallest patchset each time
- git-latexdiff/ (Matthieu Moy) -> g my latexdiff
  git wrapper around latexdiff
- git-multimail (mhagger)
  Push hook to send mails
- git-reintegrate/ (felipec) -> g my reintegrate
  Merge topic branches on base into integration branch
- git-related/ (felipec) -> g my related
  who to send patch to
- git-remote-hg (felipec) -> g my hg
- git-when-merged (mhagger) -> g my topic whenmerged
  find when a commit was merged
- git_remote_branch/ -> g my grb
  Manipulates published branches
- gitstats/ -> g my stats-html
  stats
- tbdiff/ (trast) -> g my topic diff [obsolete]
  topic branch interdiff
- topgit/
  patches via branches [notused]
- git-deps
  [Not integrated, it is difficult to install]
- git-sizer -> g my stat size
  Infos on different git object sizes

### Collection of scripts

- aspiers_git-config/
  git-icing and git-cherry-menu: wrappers around git cherry
  git-rnotes: makes it easier to share notes
  git-lsdir: git blame for a directory
  -> g my cherry/cherry-menu/notes-remotes/ls-blame
- git-aliae/
  Contains git-nows used above, copied to ~/script/git/scripts
- git-mainline/
  git-wtf: shows state of the repo topic branches
  -> was g my topic status [was rewriten]
- visionmedia [notused]


## Exemples

### Topic
* g my topic infos:
$ g my topic infos #default to --local
 master  @{u}=origin/master↑1  @{push}=origin/master↑1
*plim  @{u}=master↑1

$ g my topic infos -s
 master  @{u}=origin/master↑1  @{push}=origin/master↑1
  < 27fa0aa foobar
*plim  @{u}=master
  < fcaed64 bla

$ g my topic infos --compare plim master
 master↓1  @{u}=origin/master↑1  @{push}=origin/master↑1

$ g my topic infos --merged master
=> 'plim' is in red
$ g my topic infos --merged master,plim
=> 'plim' is not in red

* g my topic log
$ g my topic log #compare @ and @{u}
  g my topic log other_upstream #compare @ and other_upstream
  g my topic log local upstream #compare local and upstream
- Incoming:
- Outgoing:
- Stats:

$ g my topic log -d #replace 'Stats:' by 'Diff:'

$ g my topic cherry
		local,remote=DR::Git.get_topic_branches(*args)
		system("git -c color.ui=always --no-pager log --left-right --topo-order --oneline #{local.shellescape}...#{remote.shellescape}")
Note that I have the following aliases:
	llr = log --left-right --topo-order --oneline
	ch = "! git --no-pager llr ${1-HEAD}...${1-HEAD}@{u}"

$ g my topic push branch1 branch2
=> Automatically push these branches to their remotes
Option: -u => set the push branch as upstream

$ g my topic start branch [current]
=> start a new topic branch (on current), and then push it via 'topic push'
Option: -to => push to 'to' rather than use 'topic push'
        -u: set push branch as upstream
Note: -to is needed for a start branch unless we have a default pushremote

$ g my topic sync branches
=> update; topic push

$ g my topic delete name
=> delete the branch and the remote (push) branch
   (also work with tags)

$ g my topic rename [old=HEAD] new
=> rename branch old to new; topic push new; delete old remote (push) branch
   (also work with tags)

$ g my topic trail
2019-04-05: 2049709 – autostash~1, master
2019-04-05: a2baf29 – conflict~1, noconflict~1
2019-04-05: 20d9538 – bar~5, foo~3, stash~6

Exemple:
*-*-*-*-* master
  |-*-*-* foo
        |-*-* bar
|-* quz
va donner sur master
2019-04-05: 2049709 – master
2019-04-05: 20d9538 – bar~5, foo~3
2019-04-05: 1234567 – quz~1

$ g my topic neck
2049709 (HEAD -> master) plimo (Fri Apr 5 16:44:19 2019 +0200) <Damien Robert>
b75fb95 plimo (Fri Apr 5 16:44:18 2019 +0200) <Damien Robert>
c1bfba9 Adding d, new line to b (Fri Apr 5 16:44:04 2019 +0200) <Damien Robert>

$ g my topic children master~4
master~4: a2baf29, 208e3a6

### ls
$ g my ls blame
2049709d 2019-04-05 16:44:19 +0200 Damien Robert a  [plimo]
c1bfba9a 2019-04-05 16:44:04 +0200 Damien Robert b  [Adding d, new line to b]
c1bfba9a 2019-04-05 16:44:04 +0200 Damien Robert d  [Adding d, new line to b]

$ g my ls files
- 02.test: 1 (active: 1 days)
- doc/Arithmetic: 3 (active: 1 days)
- doc/precomp: 7 (active: 3 days)
- examples/curve-db-plot.m: 3 (active: 1 days)

$ g my ls removed
2014-06-11 5bef557^:paper/00gvim
2014-06-11 5bef557^:paper/Makefile

### Stats
$ g my stats = g my stats summary
 project  : code-avisogenies
 repo age : 5 years 
 active   : 22 days
 commits  : 36
 files    : 38
 authors  : Damien Robert, Gaetan Bisson, Alina Dudeanu (Total: 36)
 - Damien Robert: 25 (69.4%)
 - Gaetan Bisson: 6 (16.7%)
 - Alina Dudeanu: 5 (13.9%)

$ g my stats authors
    25  Damien Robert
     6  Gaetan Bisson
     5  Alina Dudeanu
Total: 36

$ g my stats diff
Damien Robert <damien.olivier.robert+git@gmail.com>: 30889 lines of diff (+20717/-10172)
Alina Dudeanu <dudeanu@Sysadmins-MacBook-Pro-5.local>: 939 lines of diff (+939/-0)
Alina Dudeanu <dudeanu@lacalpc24.epfl.ch>: 116 lines of diff (+70/-46)
Alina Dudeanu <dudeanu@tsf-428-wpa-1-082.epfl.ch>: 59 lines of diff (+31/-28)
Gaetan Bisson <bisson@archlinux.org>: 33 lines of diff (+19/-14)
Alina Dudeanu <dudeanu@tsf-428-wpa-5-049.epfl.ch>: 4 lines of diff (+2/-2)

$ g my stats infos
 ## Remote URLs:
 
 durin	ssh://gitolite@durin/avisogenies (fetch)
 durin	ssh://gitolite@durin/avisogenies (push)
 gforge	git+ssh://robertdamien@scm.gforge.inria.fr//gitroot/avisogenies/avisogenies.git (fetch)
 gforge	git+ssh://robertdamien@scm.gforge.inria.fr//gitroot/avisogenies/avisogenies.git (push)
 mathrice	git@plmlab.math.cnrs.fr:drobert/avisogenies.git (fetch)
 mathrice	git@plmlab.math.cnrs.fr:drobert/avisogenies.git (push)
 
 ## Remote Branches:
 
   durin/master             gforge/refactorisation   mathrice/old/master
   durin/old/master         git-svn
   gforge/master            mathrice/master
 
 ## Local Branches:
 
   master            old/master      * refactorisation
 
 ## Most Recent Commit:
 
 commit 61ec0b1abe6016c6c220a1b87fde30d715b5a849 (HEAD -> refactorisation, gforge/refactorisation)
 Author: Damien Robert <damien.olivier.robert+git@gmail.com>
 
     Split IsogenieG2 into IsogenieG2 and IsogenieG2Theta

$ g my stats lines
- Damien Robert: 11458 (99.3%)
- Alina Dudeanu: 55 (0.5%)
- Not Committed Yet: 19 (0.2%)
- Gaetan Bisson: 1 (0.0%)
Total lines: 11533

$ g my stats size
Processing blobs: 927                        
Processing trees: 843                        
Processing commits: 539                        
Matching commits to trees: 539                        
Processing annotated tags: 12                        
Processing references: 26                        
| Name                         | Value     | Level of concern               |
| ---------------------------- | --------- | ------------------------------ |
| History structure            |           |                                |
| * Maximum tag depth      [1] |     1     | *                              |

[1]  e628f39d3b5e4d1a9c341a443bbdddbe664c0403 (refs/tags/v0.1)

## Obsolete exemples

git my topic status was 'wtf'

$ g my topic status -- plimo master noconflict conflict -r
  # without the -r the integration/feature branches are not shown
  # except for plimo which do not have a remote branch
  # The legend is as follow: for local/remote branches
  # -> [x] in sync; [] not in sync
  # For integration feature branches
  # -> (), {}, []: branch exist locally, on a remote, both
  # -> x, ~, ' ': branch is merged locally and remotely, only locally, not

* Local branch: plimo

Integration branches:
[ ] NOT merged into master (1 commit ahead)
    - ploum [2ce1d30]

* Local branch: master
[ ] NOT in sync with remote (you should push after rebase / merge)
    - Merge branch 'noconflict' [0b9ec7b]
    - plimo [0e6b1ec]
    - Adding c, new line to a [77721c3]
Remote branch: origin/master (/tmp/foo/first)
[ ] NOT in sync with local (you should rebase / merge)
    - add a new commit [b4c18fe]

WARNING: local and remote branches have diverged. A merge will occur unless you rebase.

Feature branches:
[ ] conflict is NOT merged in (1 commit ahead)
    - Changing line on b [7392e6a]
[~] noconflict merged in (only locally)
( ) plimo (local-only) is NOT merged in (1 commit ahead)
    - ploum [2ce1d30]
{ } origin/plouf is NOT merged in (3 commits ahead)
    - ploufhop [e7b1338]
    - plom [937205b]
    - Changing line on b [7392e6a]

* Local branch: noconflict
[ ] NOT in sync with remote (you should push)
    - plimo [0e6b1ec]
Remote branch: origin/noconflict (/tmp/foo/first)
[x] in sync with local

Integration branches:
[x] merged into master

* Local branch: conflict
[x] in sync with remote
Remote branch: origin/conflict (/tmp/foo/first)
[ ] NOT in sync with local (you should merge)
    - plom [937205b]

Integration branches:
[ ] NOT merged into master (1 commit ahead)
    - Changing line on b [7392e6a]

$ g my topic merged
* refs/heads/master: 3 years, 6 months ago <Damien Robert> TODO++
* refs/heads/refactorisation: 4 days ago <Damien Robert> Split IsogenieG2 into IsogenieG2 and IsogenieG2Theta
* refs/remotes/durin/master: 3 years, 6 months ago <Damien Robert> TODO++
* refs/remotes/gforge/refactorisation: 4 days ago <Damien Robert> Split IsogenieG2 into IsogenieG2 and IsogenieG2Theta
* refs/remotes/mathrice/master: 4 years, 7 months ago <Damien Robert> index.html: Cosmetic change
* refs/heads/old/master: 5 years ago <Damien Robert> my squash changed its parameters

