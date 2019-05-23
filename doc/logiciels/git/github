vim: ft=markdownlight foldmethod=expr
github integration:
===================

Git hub pull request branches are in refs/pull/551/head
If the branch is not yet merged, there is also refs/pull/551/merge:
the merge of 551/head with its upstream (if there were no merge conflicts).
See https://github.com/isaacs/github/issues/757

## hub: https://github.com/defunkt/hub

PR workflow:

hub clone $url
git my extra fork => hub fork && hub push DamienRobert : && git fetch DamienRobert && git config remote.pushDefault DamienRobert

1) Submit PR:
  g co -b feature
  <patch>
  g push DamienRobert #ou `git push`, DamienRobert étant le pushDefault
  hub pull-request
2) Rework PR:
  g co DamienRobert/feature
  g branch --set-upstream-to DamienRobert/master
  g rb
  <patch>
  g push -f DamienRobert

### Repo creation
* Create a repo:
hub init -g: add a remote from github
  > git init
  > git remote add origin git@github.com:YOUR_USER/REPO.git

* Add existing local repo:
hub create ploum -d 'It shall be mine, all mine!' -h 'url'
  create the repo ploum on git hub with description blabla and add the corresponding remote
  $ hub create recipes
  [ repo created on GitHub ]
  > git remote add origin git@github.com:YOUR_USER/recipes.git
Pusher la branch: git push --set-upstream origin master

* Delete repo: hub delete repo

* Fork remote repo:
hub fork: fork the current repo into github
       $ hub fork
       [ repo forked on GitHub ]
       > git remote add -f USER git@github.com:USER/REPO.git

### Git command with github url shortcuts:
hub clone/'remote add'/'submodule add'/fetch user/repo
  will use the repo from git://github.com/user/repo.git
  - If user=="origin" => substitute user to YOUR_USER
  - If repo is empty => use current repo name
Note: `hub fetch user/repo` will also add the missing remotes
[I have also the insteadOf shortcuts gh: et dr: in my .gitconfig]

hub push origin,staging,qa bert_timeout
  push bert_timeout to origin, staging and qa

hub am/apply/checkout/cherry-pick/merge: can also take a github url
(generally a pull request url)
  Exemples:
       $ hub merge https://github.com/jingweno/gh/pull/73
       > git fetch origin refs/pull/73/head
       > git merge FETCH_HEAD --no-ff -m "Merge pull request #73 from jingweno/feature..."

       $ hub checkout https://github.com/defunkt/hub/pull/73 custom-branch-name

  `hub am` and `hub cherry-pick` can also take commit urls:
       $ hub cherry-pick http://github.com/mislav/REPO/commit/SHA
       $ hub cherry-pick mislav@SHA (use REPO=CURRENT_REPO)

### github pull requests

* Pull requests:
hub pull-request:
  # while on a topic branch called "feature":
  $ hub pull-request
  [ opens text editor to edit title & body for the request ]
  [ opened pull request on GitHub for "YOUR_USER:feature" ]
  # explicit title, pull base & head:
  $ hub pull-request "I've implemented feature X" -b defunkt:master -h mislav:feature

* List pull requests
hub pr list
hub pr checkout pr-number [branch_name]

### Workflows
=> Shortcut: 
   hub clone $url
   git my extra fork => hub fork && hub push DamienRobert : && git fetch DamienRobert && git config remote.pushDefault DamienRobert
   git checkout -b feature // git checkout DamienRobert/feature

-> Workflow: propose a pull request
  hub clone $url
  hub fork #this copy all branches
  g co -b feature
  <patch>
  #g push DamienRobert feature:feature; 
  #g push DamienRobert feature => default to feature:feature
  g push DamienRobert
  hub pull-request # -h DamienRobert:feature => default to current branch
  g my patch format origin/master #edit cover-letter with the pr message
  mv .patches/ ~/usr/dist/.patches/ghi

-> Rework on a pull request
  hub clone $url
  hub fork # this creates up to date remote/DamienRobert/* branches (locally) from upstream, but do not update the existing remote DamienRobert branches
  git push DamienRobert : #update the remote DamienRobert branches with the ones from upstream
  git fetch DamienRobert #get my patches
  git checkout DamienRobert/feature
  git branch --set-upstream-to DamienRobert/master
  git rebase
  # Si on ne veut mettre aucune branche à jour, on peut faire directement après le fetch:
  # git rebase DamienRobert/master DamienRobert/feature --onto origin/master
  <patch>
  git push -f DamienRobert

Note: pour ne pas préciser `git push DamienRobert`
  git config branch.feature.pushRemote DamienRobert
voire
  git config remote.pushDefault DamienRobert

### Browsing / Comparing

* Browsing: hub browse user/repo -- subpage
$ hub browse
> open https://github.com/YOUR_USER/CURRENT_REPO
$ hub browse -- commit/SHA
> open https://github.com/YOUR_USER/CURRENT_REPO/commit/SHA
$ hub browse -- issues
> open https://github.com/YOUR_USER/CURRENT_REPO/issues
$ hub browse schacon/ticgit commit/SHA
> open https://github.com/schacon/ticgit/commit/SHA

* Comparing branches: hub compare [user=CURRENT_USER] branch
$ hub compare refactor
> open https://github.com/CURRENT_REPO/compare/refactor
$ hub compare -u fix #get url
> (https://github.com/CURRENT_REPO/compare/fix)
$ hub compare 1.0..1.1
> open https://github.com/CURRENT_REPO/compare/1.0...1.1
$ hub compare other-user patch
> open https://github.com/other-user/REPO/compare/patch

* Check ci status: hub ci-status [-v] [commit=HEAD]

### Issues
hub issue
hub issue create
hub issue labels

### Releases
hub release
hub release show TAG
hub release create TAG
hub release edit TAG
hub release download TAG
hub release delete TAG

### Misc
hub sync
       ·   If the local branch is outdated, fast-forward it;
       ·   If the local branch contains unpushed work, warn about it;
       ·   If  the  branch  seems  merged and its upstream branch was deleted, delete it.


## gist / github api
! https://github.com/defunkt/gist
  gist -h, en gros:
  gist -p -o ploum.rb: fait un jist de ploum.rb, -p pour le rendre public et -o pour l'ouvrir dans le navigateur
  gist -l: list
  gist -u id: update gist

! https://github.com/stephencelis/ghi
  ruby gem to access github issues from the command line

- https://github.com/peter-murach/github
  ruby gem around github's api
! https://github.com/octokit/octokit.rb
  another ruby wrapper around github's api
- https://github.com/ingydotnet/git-hub
  Bash script using the github rest api
- https://github.com/sociomantic/git-hub
  Python github wrapper

## Pull requests
https://help.github.com/articles/checking-out-pull-requests-locally/
- git fetch origin pull/ID/head:BRANCHNAME
- git config --add remote.origin.fetch '+refs/pull/*/head:refs/remotes/origin/pr/*' => check all pull requests, cf https://gist.github.com/piscisaureus/3342247

Notes: 
- to get a sane behaviour with respect to git fetch --prune, it may be
better to add the pull/ refspec before the standard heads/ refspec rather
than afterwards.
- to not pollute the origin remote, one could use instead
  fetch = +refs/pull/*/head:refs/gh-pull-requests/remotes/origin/*

Voir aussi les alias de https://gist.github.com/gnarf/5406589
[alias]
pr = "!f() { git fetch -fu ${2:-origin} refs/pull/$1/head:pr/$1 && git checkout pr/$1; }; f"
pr-clean = "!git for-each-ref refs/heads/pr/* --format='%(refname)' | while read ref ; do branch=${ref#refs/heads/} ; git branch -D $branch ; done" 

Tokens
======

.config/hub, .gist -> ~mine/crypt/.auth/github_tokens
gist -> only gist
hub -> repo, user, gist
ghi -> repo, public_repo

ghi
---
GHI_TOKEN=$(cat ~mine/crypt/.auth/github_tokens/ghi) ghi

Octokit
-------

https://github.com/octokit/octokit.rb
Octokit is the official ruby wrapper around github's api

~~~ ruby
require 'octokit'
oauth=YAML.load_file(ENV['HOME']+"/mine/crypt/.auth/github_tokens/hub")["github.com"].first["oauth_token"]
client = Octokit::Client.new(:access_token => oauth)
client.user
~~~

Web applications
================

Github Oauth: c4science.ch [public infos], Code Climate [public infos], Travis CI for Open Source [Public infos + Write repository hooks]
-> https://github.com/settings/applications

Tokens: https://github.com/settings/tokens

- travis: run tests when code is pushed
- code climate: how much code is covered by tests
  [codecov.io: code coverage (similar to code climate)]
- inch ci: how much code is covered by documentation
- gemnasium: check if dependencies are up to date

travis: https://travis-ci.org, https://travis-ci.org/profile/DamienRobert
- add a repository on the web interface (this activates the 'Travis CI' service in the repo)
- push a .travis.yml (cf rubygems)
- badge: https://travis-ci.org/DamienRobert/tiny_singleton.svg?branch=master

code climate: https://codeclimate.com, https://codeclimate.com/oss/dashboard
- adds the repo on the web interface (apparently does not need to activate a service on the github repo)
- Configure with a .codeclimate.yml
- badges: cf https://docs.codeclimate.com/docs/how-grades-are-calculated
  All badges: https://lima.codeclimate.com/github/DamienRobert/tiny_singleton/badges
  - https://codeclimate.com/github/DamienRobert/tiny_singleton/badges/gpa.svg
  - https://codeclimate.com/github/DamienRobert/tiny_singleton/badges/coverage.svg

inch: https://inch-ci.org/, https://inch-ci.org/github/DamienRobert
- Add a webhook, cf https://inch-ci.org/help/webhook
  This activates the https://inch-ci.org/rebuild webhook
  Ex: https://github.com/DamienRobert/tiny_singleton/settings/hooks
  => Projects are built automatically each time you push your code to GitHub.
  (Otherwise go to the profile page and refresh manually)
- Badge: https://inch-ci.org/github/DamienRobert/tiny_singleton.svg?branch=master&style=flat

Gemnasium: https://gemnasium.com/dashboard
- add a new project in the web interface (this activates the 'Gemnasium' service in the repo)
=> Closed (integrated into gitlab)

Badges
======

Example: bundler badges https://raw.githubusercontent.com/bundler/bundler/master/README.md
[![Version     ](https://img.shields.io/gem/v/bundler.svg?style=flat)](https://rubygems.org/gems/bundler)
[![Build Status](https://img.shields.io/travis/bundler/bundler/master.svg?style=flat)](https://travis-ci.org/bundler/bundler)
[![Code Climate](https://img.shields.io/codeclimate/github/bundler/bundler.svg?style=flat)](https://codeclimate.com/github/bundler/bundler)
[![Inline docs ](http://inch-ci.org/github/bundler/bundler.svg?style=flat)](http://inch-ci.org/github/bundler/bundler)

https://shields.io/ is an api to have nice badges
See also https://badge.fury.io/ to get a badge for a gem version: https://badge.fury.io/for/rb/simplecolor
