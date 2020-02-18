vim: foldmethod=expr ft=markdownlight

git-my: cf git-applications

Docs and bookmarks:
===================

- man: man git, gitrepository-layout
  gittutorial, gittutorial-2: tuto
  giteveryday, gitglossary, gitworkflows, gitcli
  gitcore-tutorial: overview of plumbing

- http://steveko.wordpress.com/2012/02/24/10-things-i-hate-about-git/
  Great diagrams of svn and git workflow
- gitk: http://sitaramc.github.com/1-basic-usage/gitk.html

- https://stackoverflow.com/questions/3639342/whats-the-difference-between-git-reset-and-git-checkout
Directory               Stage           History
          -> git add files   -> git commit
          <- git co -- files <- git reset --files
Note: `git co branch` affects HEAD, index and directory
      `git reset branch` affects HEAD, current branch, index (unless `--soft`) + directory if `--hard`

- bitmaps: https://githubengineering.com/counting-objects/
- https://github.com/k88hudson/git-flight-rules Howtos
- git aliases: http://www.gitalias.com/
  Cf also the topic-* aliases in https://news.ycombinator.com/item?id=14385813
- tips: http://gitready.com/ (not updated anymore)
- https://git.github.io/rev_news/ Development news
  https://git.github.io/rev_news/archive/
- http://changelog.com/topic/git Links on git articles

Everyday
========

## Working in the directory
  git add/rm/mv, git clean
  git status, git show
  git reset file, git checkout file
  git ls-files, git grep

## Infos
  git log, shortlog
  git blame, git bisect
  git notes

## Commits
  git init
  git commit/git revert
  git merge/git merge-base
  git tag/verify-tag

## Branches
  git branch/git show-branch
  git checkout

## Diff/Merge files
  git diff, git merge, git rerere
  git difftool, git mergetool
  (git read-tree, merge-tree, git merge-file)

## Manipulating history
  git cherry, git cherry-pick
  git reset, git stash
  git rebase, git filter-branch
  git reflog, git replace

## References
  git describe
  git show-ref, git for-each-ref, git ls-remote
  (git name-rev, git rev-parse, git rev-list)

## Exterior
  git archive
  git remote, git submodule
  git clone, git relink
  git fetch/pull/push, git request-pull
  git am/format-patch
  git imap-send, git send-email
  git svn, git instaweb

## Cleaning
  git count-objects / git count-objects -vH
  git gc, git fsck

## Gui
  git citool (=git gui citool), git gui
  gitk

Workflows
==========

## Reset

### Undo commit and redo (reset --soft, commit --ammend)
      $ git commit ...
      $ git reset --soft HEAD^      (1)
      $ edit                        (2)
      $ git commit -a -c ORIG_HEAD  (3)
  1. This is most often done when you remembered what you just
  committed is incomplete, or you misspelled your commit message, or
  both. Leaves working tree as it was before "reset".
  2. Make corrections to working tree files.
  3. "reset" copies the old head to `.git/ORIG_HEAD;` redo the commit
  by starting with its log message. If you do not need to edit the
  message further, you can give -C option instead.
-> shortcut: git commit --amend

### Undo a commit, making it a topic branch (reset --hard)
      $ git branch topic/wip     (1)
      $ git reset --hard HEAD~3  (2)
      $ git checkout topic/wip   (3)
  1. You have made some commits, but realize they were premature to
  be in the "master" branch. You want to continue polishing them in a
  topic branch, so create "topic/wip" branch off of the current HEAD.
  2. Rewind the master branch to get rid of those three commits.
  3. Switch to "topic/wip" branch and keep working.

### Undo a merge or pull (reset --hard)
      $ git pull                         (1)
      Auto-merging nitfol
      CONFLICT (content): Merge conflict in nitfol
      Automatic merge failed; fix conflicts and then commit the result.
      $ git reset --hard                 (2)
      $ git pull . topic/branch          (3)
      Updating from 41223... to 13134...
      Fast-forward
      $ git reset --hard ORIG_HEAD       (4)
  1. Try to update from the upstream resulted in a lot of conflicts;
  you were not ready to spend a lot of time merging right now, so you
  decide to do that later.
  2. "pull" has not made merge commit, so "git reset --hard" which is
  a synonym for "git reset --hard HEAD" clears the mess from the
  index file and the working tree.
  3. Merge a topic branch into the current branch, which resulted in
  a fast-forward.
  4. But you decided that the topic branch is not ready for public
  consumption yet. "pull" or "merge" always leaves the original tip
  of the current branch in `ORIG_HEAD`, so resetting hard to it brings
  your index file and the working tree back to that state, and resets
  the tip of the branch to that commit.

### Undo a merge or pull inside a dirty working tree (reset --merge)
      $ git pull                         (1)
      Auto-merging nitfol
      Merge made by recursive.
       nitfol                |   20 +++++----
      $ git reset --merge ORIG_HEAD      (2)
  1. Even if you may have local modifications in your working tree,
  you can safely say "git pull" when you know that the change in the
  other branch does not overlap with them.
  2. After inspecting the result of the merge, you may find that the
  change in the other branch is unsatisfactory. Running `"git reset
  --hard ORIG_HEAD"` will let you go back to where you were, but it
  will discard your local changes, which you do not want. "git reset
  --merge" keeps your local changes.

### Interrupted workflow (reset, stash)
  Suppose you are interrupted by an urgent fix request while you are
  in the middle of a large change. The files in your working tree are
  not in any shape to be committed yet, but you need to get to the
  other branch for a quick bugfix.
      $ git checkout feature ;# you were working in "feature" branch and
      $ work work work       ;# got interrupted
      $ git commit -a -m "snapshot WIP"                 (1)
      $ git checkout master
      $ fix fix fix
      $ git commit ;# commit with real log
      $ git checkout feature
      $ git reset --soft HEAD^ ;# go back to WIP state  (2)
      $ git reset                                       (3)
  1. This commit will get blown away so a throw-away log message is OK.
  2. This removes the WIP commit from the commit history, and sets
  your working tree to the state just before you made that snapshot.
  3. At this point the index file still has all the WIP changes you
  committed as snapshot WIP. This updates the index to show your WIP
  files as uncommitted.
  See also git-stash(1).

### Reset a single file in the index (reset)
  Suppose you have added a file to your index, but later decide you
  do not want to add it to your commit. You can remove the file from
  the index while keeping your changes with git reset.
      $ git reset -- frotz.c                      (1)
      $ git commit -m "Commit files in index"     (2)
      $ git add frotz.c                           (3)
  1. This removes the file from the index while keeping it in the
  working directory.
  2. This commits all other changes in the index.
  3. Adds the file to the index again.

### Keep changes in working tree while discarding some previous commits (reset --keep)
  Suppose you are working on something and you commit it, and then
  you continue working a bit more, but now you think that what you
  have in your working tree should be in another branch that has
  nothing to do with what you committed previously. You can start a
  new branch and reset it while keeping the changes in your working
  tree.
      $ git tag start
      $ git checkout -b branch1
      $ edit
      $ git commit ...                            (1)
      $ edit
      $ git checkout -b branch2                   (2)
      $ git reset --keep start                    (3)
  1. This commits your first edits in branch1.
  2. In the ideal world, you could have realized that the earlier
  commit did not belong to the new topic when you created and
  switched to branch2 (i.e. "git checkout -b branch2 start"), but
  nobody is perfect.
  3. But you can use "reset --keep" to remove the unwanted commit
  after you switched to "branch2".

## Stash

### Pulling into a dirty tree
  When you are in the middle of something, you learn that there are
  upstream changes that are possibly relevant to what you are doing.
  When your local changes do not conflict with the changes in the
  upstream, a simple git pull will let you move forward.

  However, there are cases in which your local changes do conflict
  with the upstream changes, and git pull refuses to overwrite your
  changes. In such a case, you can stash your changes away, perform a
  pull, and then unstash, like this:

      $ git pull
       ...
      file foobar not up to date, cannot merge.
      $ git stash
      $ git pull
      $ git stash pop

### Interrupted workflow
  When you are in the middle of something, your boss comes in and
  demands that you fix something immediately. Traditionally, you
  would make a commit to a temporary branch to store your changes
  away, and return to your original branch to make the emergency fix,
  like this:
      # ... hack hack hack ...
      $ git checkout -b my_wip
      $ git commit -a -m "WIP"
      $ git checkout master
      $ edit emergency fix
      $ git commit -a -m "Fix in a hurry"
      $ git checkout my_wip
      $ git reset --soft HEAD^
      # ... continue hacking ...
  You can use git stash to simplify the above, like this:
      # ... hack hack hack ...
      $ git stash
      $ edit emergency fix
      $ git commit -a -m "Fix in a hurry"
      $ git stash pop
      # ... continue hacking ...

### Testing partial commits
  You can use git stash save --keep-index when you want to make two
  or more commits out of the changes in the work tree, and you want
  to test each change before committing:

      # ... hack hack hack ...
      $ git add --patch foo            # add just first part to the index
      $ git stash save --keep-index    # save all other changes to the stash
      $ edit/build/test first part
      $ git commit -m 'First part'     # commit fully tested change
      $ git stash pop                  # prepare to work on all other changes
      # ... repeat above five steps until one commit remains ...
      $ edit/build/test remaining parts
      $ git commit foo -m 'Remaining parts'

### Recovering stashes that were cleared/dropped erroneously
  If you mistakenly drop or clear stashes, they cannot be recovered
  through the normal safety mechanisms. However, you can try the
  following incantation to get a list of stashes that are still in
  your repository, but not reachable any more:

      git fsck --unreachable |
      grep commit | cut -d\  -f3 |
      xargs git log --merges --no-walk --grep=WIP

## git diff
git show A..B montre tous les commits parents de B qui ne sont pas parents
de A.

git show A...B montre tous les commits parents de A ou de B qui ne sont pas
parents des 2 (différence symétrique).

git diff A..B est pareil que git diff A B: ça montre la différence entre A
et B

Le plus fort: git diff A...B montre les différences entre (l'ancêtre commun
de A et B) et B (ie c'est équivalent à git diff $(git-merge-base A B) B)!

## Basic file operations
git status

 On branch master
 Changes to be committed:
   (use "git reset HEAD <file>..." to unstage)

       renamed:    git-addremove -> ex/git-addremove

 Changes not staged for commit:
   (use "git add <file>..." to update what will be committed)
   (use "git checkout -- <file>..." to discard changes in working
irectory)

       modified:   ../logiciels/usbautosuspend

 Untracked files:
   (use "git add <file>..." to include in what will be committed)

       ../ruby/

## My patches
How I handle my patches

* create a dummy branch to store old patches
git my trivial -- -g -b old-patches
 #merge patch branch 'noconflict' into old-patches
git my trivial -- -g --merge -b old-patches noconflict

* rebase
git co noconflict && git rb -i

 # For patches eventually symlink .patches to ~/var/dist/.patches/prog/

* Generate patches:
git-mypatch format

* Apply

Git commands overview
=====================

## Blobs, trees, commits, tags objects
|git hash-object|:
  compute the hash
  use -w to write the object into the database
|git unpack-file|
  create a file from a blob

|git write-tree| fait un objet de type tree de l'index
|git mktree|
  Reads standard input in non-recursive ls-tree output format, and creates a tree object.
|git commit-tree| fait un objet de type commit depuis le tree

|git mktag|
  To create a tag object
         git mktag < signature_file
         object <sha1>
         type <typename>
         tag <tagname>
         tagger <tagger>
         followed by some optional free-form message

## Manipulating the index

* git add/git rm

git rm file #remove from index and working dir
git rm --cached file #remove from index
Options: -f to remove even if change not commited

git add file: add file to index
git add -u file: add file only if already in index
  git add -u default to git add -u .: update all files in index
git add -A: like -u but use all files in working dir
  => add new files, update all files, rm files that were removed
git add -N: only add the file to the index, not the content

git add --refresh: refresh the file in the index

git mv/git cp

git clean: Remove untracked files from the working tree.

|git update-index|: update index from working dir

Wortree -> Index: git add <files>
Index -> Commits: git commit
Worktree -> Commits: git commit -- <files>
Commits -> Index: git reset -- <files>
Index -> Worktree: git checkout -- <files>
Commits -> Worktree: git checkout HEAD -- <files>

## Commits and refs
git init
  (can be launched again in a non empty environnement to change default settingslike putting it to bare, or using --seperate-git-dir, or changing the shared option...)

* git commit:

  $ tree=$(git write-tree)
  $ commit=$(echo 'Initial commit' | git commit-tree $tree)
  $ git update-ref HEAD $commit

git citool: git gui commit version

git branch #List, create, or delete branches.
=> `git remote` to put shortcut to remote branches
git tag    #tags
=> git verify-tag signed-tag #check the tag signature

git revert  #revert the commits

git stash #"temp" commits

|git fmt-merge-msg|
  Produce a merge commit message, to be used when commiting after a git merge
|git patch-id|
  Compute unique ID (essantially the sha1) of a patch
  (allows to check for duplicate patch)
|git stripspace|
  Remove unnecessary whitespace (for text like commit, notes, tags, branchs description)

|git symbolic-ref|
  git symbolic-ref ploum show where ploum points to
  git symbolic-ref ploum plam makes ploum a symbolic ref to plam
|git update-ref|
  fait pointer HEAD sur l'objet commit
  git update-ref ref ploum store ploum in ref (possibly deferencing symb refs)
  git update-ref ref ploum plam is the same but verify that ref was equal to plam before updating it
|git show-ref|
  show references in a local repo
|git name-rev committish|
  find symbolic name for committish
git describe: give a nice description of a commitish
(use annoted tags by defaut, pass --all to use all refs)
    git describe --all HEAD~2 ->  heads/branch-3-g6a4285d
    git name-rev HEAD~2       -> HEAD~2 list~2
    donc HEAD~2 est 3 commits après branch, ou 2 commits avant list
    git describe --contains show tags that contains the commit, so is simmilar to name-rev
|git check-ref-format|
  ensure that a ref is well formed

## Moving around

* git checkout:

  git read-tree BRANCH
  git checkout-index -u -a
  git update-ref HEAD BRANCH
|git read-tree|: lit un tree dans l'index; -u pour updater le working dir
               -m pour merger, --reset équivalent à -m, mais enlève les
               unmerged entries au lieu de fail
               -i: faire l'opération même si l'index ou le wd sont dirty
|git checkout-index|: update le wd from the index
  -u: pour updater le stat info des files checked out
  -a: check out all files

* git reset:

(à la différence de git checkout, git reset ne change pas HEAD, mais ce qui est *pointé* par HEAD!)
  git read-tree --reset COMMIT (--mixed)
  git update-index --refresh   (--mixed)
  git checkout-index -u -a     (--hard)
  git update-ref $(git symbolic-ref HEAD) COMMIT   (--soft)
Options: --soft just reset the head to COMMIT
         --mixed: resets the index but not the wd
         --hard: reset index and wd
         --keep: comme --hard, mais ne change que les files qui ont changé
         entre COMMIT et HEAD (si une telle file a des local change par rapport à HEAD, abort)
         --merge: comme --hard, mais ne change que les files qui ont changé
         entre COMMIT et HEAD (si une telle file a des local change par rapport à *l'index* abort, sauf si index=commit=head).
         L'idée de reset --merge est de reverter un merge, donc on suppose
         que les fichiers qui ont changé par rapport à HEAD, mais qui sont
         égal à l'index, viennent du résultat du merge et qu'on peut les
         reverter. Si la version commit= la version head, alors index
         devrait être égal à la version head, d'où le abort si ce n'est pas
         le cas. (voir expert pour plus de détails)

## Merging

* git merge mybranch:
  mb=$(git merge-base HEAD mybranch) # |git merge-base|: best ancestor
  git read-tree -m -u $mb HEAD mybranch
  git merge-index git-merge-one-file -a
  |git merge-index|: Run a merge for files needing merging
  |git merge-one-file|: Default helper command to run a three-way file merge.
      (to be launched by git merge-index)

git merge-file: pour faire des three way merges sur des fichier à la main
git mergetool: lancer un merge externe

git rebase: move branches around

git cherry-pick:  Apply the changes introduced by some existing commits.
git cherry: to see which commit was applied by Upstream
  git cherry upstream: regarde tous les commits qui ont divergés depuis upstream, calcule leur pach-id, et si ce patch-id n'a pas été appliqué, output le commit

git merge-tree: comme git read-tree -m, mais ne modifie pas l'index, donne le résultat sur STDOUT

git rerere: record commit operation to replay it

## Info

gitk: gui for log infos

git status

* git show:

Wrapper autour de |git cat-files -p| (for blobs), |git ls-tree| (for trees), git diff-tree --cc (for commits)
ex: git show tag, git show tag^{commit}, git show tag^{tree}
    git show master:./file

git grep

git show-branch: show branches information
ex: git show-branch --topo-order --more=4

|git ls-files|: show files in index

* git log
git log
git log -n 3 #3 derniers commits
git log since..until
git log --follow file #history following renames
git log --source file #
Options: --after=date, --before=date, --author/--commiter=pattern
         --since/--until=date
         --(no-)merges: print only merge, --first-parent (follow only first
         parent)
         --all: show log for all refs in .git/refs
         --branches(=pattern), --tags, --remotes: show log for all refs in
            .git/refs/{heads,tags,remotes}
         -g: walk reflog
         --merge: only show log for files that are unmerged

git shortlog: summarizes git log output
  -e: add email
  => use .mailmap to coalesce commits
  ex: Real Foo Bar <foo@bar.org> <foo_false@bar.org> to replace the author matching foo_false by Real Foo Bar

git whatchanged: essentially like git log, with different defauts
  by defaut show raw diffs, does not show merge commits (unless -m is added, in which case it show a diff for each merge parent)
  (git log -p -m is the same as git whatchanged -p -m for the examples i tried)
  I find git log --stat or git log --name-status more readable than git whatchanged

=> |git for-each-ref|: output informations for each ref

git blame ploum: show which lines correspond to which commit
  => also use .mailmap
(git annotate: like git blame but with slightly different output, used for compatibility)

* git diff:
git diff -> |git diff-files -p|: diff between index and working dir
git diff HEAD -> |git diff-index -p HEAD|: diff between the working dir and HEAD
git diff --cached HEAD -> |git diff-index --cached HEAD|: diff between the index and HEAD
git diff TAG HEAD -> |git diff-tree -p TAG HEAD|: diff between HEAD and TAG
     (rmq: git diff-tree HEAD is equivalent to git diff-tree HEAD^ HEAD)
Options: --stat: stat
         --summary: list newly added, deleted, renamed and copied files

man gitdiffcore pour la génération des diffs
git difftool: lancer un diff externe

## Import /Export
git bundle create/git bundle uncreate: like git push/pull but in an offline way
git fast-export/git fast-import: like bundle, but in a human readable
  format, so can also filter things

git filter-branch: filtre les commits existants
  ex: git filter-branch --tree-filter 'rm supersecretfile' HEAD
Example:
    DIR=config/syst/network/netctl
    #git filter-branch -f --index-filter "git rm --cached --ignore-unmatch \"$DIR\"/eduroam \"$DIR\"/INRIA-bordeaux" HEAD
    git filter-branch -f --index-filter "git rm --cached --ignore-unmatch \"$DIR\"/wlan0-Eduroam"

git archive: create an archive from an index
 => git get-tar-commit-id (extract the commit from the archive)

git am (appliquer un ensemble de commits dans une mailbox)
    => |git apply| (appliquer un patch)
git format-patch #apply/send patches by email
  git imap-send: send patch by git format-patch to imap folder
  git send-email: send the patch by git format-patch by email
  |git mailinfo|
    Extracts patch and authorship from a single e-mail message
  |git mailsplit|
     Simple Unix mbox splitter program
  (used by git am)

git fetch
git push/git pull

  git request-pull start url [end]: generates a summary of pending changes

git clone #clone locally

git svn #bidirect link git <-> svn

|git ls-remote|
       Displays references available in a remote repository along with the
      associated commit IDs.

|git daemon|
  A really simple server for git repositories
|git fetch-pack|
  git-fetch-pack - Receive missing objects from another repository
  (used by git fecth)
  => |git upload-pack|
      Send objects packed back to git-fetch-pack
|git send-pack|
   Push objects over git protocol to another repository
   (used by git push)
   =>  |git receive-pack|
        Receive what is pushed into the repository
|git http-backend|
  Server side implementation of Git over HTTP
|git update-server-info|
  Update auxiliary info file to help dumb servers
  (info/refs, objects/info/packs)
|git http-fetch|
  Download from a remote git repository via HTTP
|git http-push|
  Push objects over HTTP/DAV to another repository
|git parse-remote|
  Routines to help parsing remote repository access parameters
|git shell|
  Restricted login shell for Git-only SSH access
  (see gitolite for a higher level program)
|git upload-archive|
  Send archive back to git-archive
  (called by git archive --remote)

## Housekeeping
git fsck, git fsck --lost-found [write dangling objects in .git/lost-found]
fsck --root: report root nodes
fsck --unreachable: report all unreachable objects
     [by default default to --dangling]
Terminologie: An unreachable object which is not reachable even from other unreachable objects; a dangling object has no references to it from any reference or
object in the repository.

git gc
 => |git prune-packed|: remove object already in packed files
git repack #pack objects
 => |git verify-pack| to verify packs
git pack-refs: pack refs (heads and tags)
git prune: prune all unreachable objects
git reflogs: recover unreachable objects

git relink: hardlink common object in different git repositories
git count-objects: count the place taken by unpacked objects
  #options: -v -> get the space by packed object, and how much gc can gain

|git pack-objects|
  create a pack of object list
|git unpack-objects|
  unpack the objects in the pack
|git pack-redundant|
  show packs which are redondant
|git show-index|
  print what is in a pack index
  (this is a subset of what is given in git verify-pack -v)
|git index-pack|
  create the index from a packed archive

## Divers
git config: set git options / |git var|: see git variable
git gui #gui...
git instaweb #browse git repo via html
  #man gitweb

git rev-parse: parse references
git rev-list: list commit objects

git replace foo bar:
  adds a replace reference in .git/refs/replace/`sha1 foo` to `sha1 bar`

git submodule: using submodules (sub git controlled dir)
 => use .git/.gitmodules

|git column|
  Display data in column

|git sh-setup|
  Helper sh functions used when writting porcelain scripts

glossary: git help glossary

man 5 gitattributes:
  specify if a file is a text/binary, how to diff them, how to
  merge them..
|git check-attr| pour les lire

man 5 gitignore:
  ignore files

man 7 gitnamespaces:
  name spaces in git, simulate having multiple repository, but
  store all the objects in the same .git. Only the refs differs
  (GIT_NAMESPACE=foo => they are stored in .git/refs/namespaces/foo)

man 5 gitrepository-layout
ex: info/grafts to record fake commit ancestry information

## Plumbing
Read:
       git cat-file(1)
           Provide content or type and size information for repository objects.
           = plumbing for git show
       git-ls-tree(1)
           List the contents of a tree object.
       git-read-tree(1)
           Reads tree information into the index.
       git-checkout-index(1) files
           Copy files from the index to the working tree.
           = plumbing for git checkout file

Branches:
       git-symbolic-ref(1)
           Read, modify and delete symbolic refs.
       git-update-ref(1)
           Update the object name stored in a ref safely.

Write:
       git-unpack-file(1)
           Creates a temporary file with a blob’s contents.
       git-hash-object(1)
           Compute object ID and optionally creates a blob from a file.
       git-mktree(1)
           Build a tree-object from ls-tree formatted text.
       git-update-index(1)
           Register file contents in the working tree to the index.
           = plumbing for git-add
       git-write-tree(1)
           Create a tree object from the current index.
       git-commit-tree(1)
           Create a new commit object.
       git-mktag(1)
           Creates a tag object.
           = plumbing for git tag

Diff:
       git-diff-files(1)
           Compares files in the working tree and the index.
       git-diff-index(1)
           Compare a tree to the working tree or index.
       git-diff-tree(1)
           Compares the content and mode of blobs found via two tree objects.
       git-patch-id(1)
           Compute unique ID for a patch.

Merge:
       git-apply(1)
           Apply a patch to files and/or to the index.
           = plumbing for git am
       git-merge-file(1) curent base other
           Run a three-way file merge.
       git-merge-index(1) merge-program [files]
           Run a merge for files needing merging.
       git-merge-base(1)
           Find as good common ancestors as possible for a merge.
       git-merge-tree(1)
           Show three-way merge without touching index.
           = This is similar to what three-way git read-tree -m does, but instead of storing the results in the index, the command outputs the entries to the standard output.

Packs:
       git-index-pack(1)
           Build pack index file for an existing packed archive.
           -> make a .idx from a .pack
       git-multi-pack-index(1)
           Write and verify multi-pack-indexes.
           -> make a .midx
       git-pack-objects(1) < object-list
           Create a packed archive of objects.
       git-unpack-objects(1)
           Unpack objects from a packed archive.
       git-prune-packed(1)
           Remove extra objects that are already in pack files.
       git-unpack-objects(1)
           Unpack objects from a packed archive.
       git-pack-redundant(1)
           Find redundant pack files.

## New commands and updates:
Cf for instance: https://github.com/blog/2360-git-2-13-has-been-released

git interpret-trailers
git worktree
git update-index --untracked-cache [=> set to true in .gitconfig]
git range-diff

Updates:
- git 2.3: receive.denyCurrentBranch=updateInstead to update a *clean* working tree in case of a push to a non bare directory
- git 2.4: 
     git status -v => run 'git diff --cached
     git status -vv => also run 'git diff'
- git 2.11:
  https://github.com/git/git/commit/00d27937bf0348e7da615f04b65f535a58e096c1
  Enhance "git status --porcelain" output by collecting more data on
  the state of the index and the working tree files, which may
  further be used to teach git-prompt (in contrib/) to make fewer
  calls to git.
  => git status --porcelain=v2 (default to v1)
- git 2.13: --decorate=auto is now the default for git log
- git 2.17: 'git fetch --prune-tags' may be used as a handy short-hand for getting rid of stale tags that are locally held.
- git 2.18: git rebase" learned "--rebase-merges" to transplant the whole topology of commit graph elsewhere.
- git 2.19: git range-diff
- git 2.21: new date format "--date=human"; "--date=auto:human"
- git 2.22: git branch --show-current
            git rebase [-i] --rebase-merges
- git 2.23: restore and switch; git merge --quit, git cherry-pick --skip
            git log will automatically apply .mailmap rewriting
- git 2.24: features $ git config feature.manyFiles true, commit graphs enabled by default
- git 2.25: git sparse-checkout (helper to configure partial clone, see
  https://github.blog/2020-01-13-highlights-from-git-2-25/)

Detailed git commands
=====================

## git log

--no-walk: show only the ref specified
-n 3: limit to 3 commits

--follow: follow renames

--decorate: show the ref name of a commit
--oneline: --pretty=oneline et --abbrev-commit
--stat: stat pour chaque fichiers
--shortstat: juste une ligne pour résumer les stats de chaque fichier
--dirstat: donne un % de changement des dossiers
--summary: donne les fichiers crées et removés
--name-only: show only names of changed files
--name-status: show status of changed files

--date=relative shows dates relative to the current time, e.g. "2 hours ago".
--date=local shows timestamps in user’s local timezone.
--date=iso (or --date=iso8601) shows timestamps in ISO 8601 format.
2012-08-29 21:05:26 +0200
--date=rfc (or --date=rfc2822) shows timestamps in RFC 2822 format, often found in E-mail messages.
Wed, 29 Aug 2012 21:05:26 +0200
--date=short shows only date but not time, in YYYY-MM-DD format.
--date=default shows timestamps in the original timezone (either committer’s or author’s).
Wed Aug 29 21:05:26 2012 +0200

Commit Ordering
  By default, the commits are shown in reverse chronological order.
  --topo-order
      This option makes them appear in topological order (i.e. descendant
      commits are shown before their parents).
  --date-order
      This option is similar to --topo-order in the sense that no parent
      comes before all of its children, but otherwise things are still
      ordered in the commit timestamp order.
  --reverse
      Output the commits in reverse order. Cannot be combined with
      --walk-reflogs.
--graph for a nice graph (enables topo-order)

### Cherry picking

git log --left-right A...B
  put a < for each commit comming from a
  and a > for each commit comming from b
git log --boundary: Output uninteresting commits at the boundary, which are usually not shown.
  (and put a - for these commits with --left-right)

       --cherry-pick
           Omit any commit that introduces the same change as another commit
           on the "other side" when the set of commits are limited with
           symmetric difference.
           For example, if you have two branches, A and B, a usual way to list
           all commits on only one side of them is with --left-right (see the
           example below in the description of the --left-right option). It
           however shows the commits that were cherry-picked from the other
           branch (for example, "3rd on b" may be cherry-picked from branch
           A). With this option, such pairs of commits are excluded from the
           output.
       --cherry-mark
           Like --cherry-pick but mark equivalent commits with =
           rather than omitting them, and inequivalent ones with +.
       --left-only, --right-only
           List only commits on the respective side of a symmetric range, i.e.
           only those which would be marked < resp.  > by --left-right.
           For example, --cherry-pick --right-only A...B omits those commits
           from B which are in A or are patch-equivalent to a commit in A. In
           other words, this lists the + commits from git cherry A B. More
           precisely, --cherry-pick --right-only --no-merges gives the exact
           list.
       --cherry
           A synonym for --right-only --cherry-mark --no-merges; useful to
           limit the output to the commits on our side and mark those that
           have been applied to the other side of a forked history with git
           log --cherry upstream...mybranch, similar to git cherry upstream
           mybranch.

git log --cherry-pick A...B give only commits that have not be applied to A and B
git log --cherry A...B give each commit comming from B, with a + if it has not been applied on A, and a = if it as

Remarque: git cherry A B give something similar as git log --cherry A...B:
       Every commit that doesn’t exist in the <upstream> branch has its id
       (sha1) reported, prefixed by a symbol. The ones that have equivalent
       change already in the <upstream> branch are prefixed with a minus (-)
       sign, and those that only exist in the <head> branch are prefixed with
       a plus (+) symbol:

### Diff formatting
  -m: for merge commit: show a diff for each parent
  -c: for merge commit: show combined diff
  --cc: like -c, mais enlève les hunks où il n'y a que deux versions chez les parents et le merge en a pris un (donc typiquement pour un three way merge, si on a pris le hunk de l'un des deux, ne l'affiche pas)

--word-diff: show word diffs
--minimal: spend extra time to produce the smallest diff
    --diff-algorithm={histogram|myers|minimal|patience}::
           Choose a diff algorithm.  The variants are as follows:
    histogram::
           [was the default]
           (si j'ai bien compris, c'est comme patience, mais match les lignes qui apparaissent peu fréquemment, pas celles qui n'apparaissent qu'une fois)
    myers::
            The classical Myers diff algorithm.  <state a reason why myers
            would be useful>
            (match surtout les lignes haute fréquences)
            [currently the default]
    minimal::
            Like 'myers', but spend extra time making sure that the diff
            is the shortest possible for the set of changes performed.
    patience::
            The patience diff algorithm, which first matches unique lines
            with each other.  This sometimes results in more readable (if
            longer) patches than the other algorithms.

-M90% consider a rename if 90% is the same
-C90% same for copy
--find-copies-harder (or -C -C): also inspect unmodified files as candidates for the source of a copy
-B60% if 60% of the file has changed, it should be considered as a delete followed by a create
-D: if a file was deleted, don't print the diff of what was deleteed

### Simplifying history:
git log ploum
   Default mode
       Commits are included if they are not TREESAME to any parent (though
       this can be changed, see --sparse below). If the commit was a
       merge, and it was TREESAME to one parent, follow only that parent.
       (Even if there are several TREESAME parents, follow only one of
       them.) Otherwise, follow all parents.
    You can change whether TREESAME affects inclusion:
          --dense (default)
              Commits that are walked are included if they are not TREESAME to
              any parent.
          --sparse
              All commits that are walked are included.
              Note that without --full-history, this still simplifies merges: if
              one of the parents is TREESAME, we follow only that one, so the
              other sides of the merge are never walked.
    --full-history
       Same as the default mode, but in case of merge walks all TREESAME parents
          (ie in case of merge show all parents)
    --full-history --parents
        Like --full-history but output a virtual parent (ie if a parent is omitted, replace it by one of its parent that was included)
       This force to always include merge commit (otherwise it would produce false merge)
     --simplify-merges
        Like --full-history --parents, but remove merge parents that are ancestors of other parents (and simplify recursively)
        ie additional option to --full-history that remove some needless merges
        from the resulting history, as there are no selected commits
        contributing to this merge.
   --ancestry-path
           When given a range of commits to display (e.g.  commit1..commit2 or
           commit2 ^commit1), only display commits that exist directly on the
           ancestry chain between the commit1 and commit2, i.e. commits that
           are both descendants of commit1, and ancestors of commit2.
    (by default commit1..commit2 show commits that are ancestors of commit2 and not ancestors of commit1, this option restrict to commits that are also descendant of commit1)

git log --simplify-by-decoration: show only logs that come from tags (or heads of branches)

### git show-branch:

For all commits until the one that are common to all branches, show the commit
and to which branch it belongs
Add --more=n to show n commits before the common commit
--sparse By default, the output omits merges that are reachable from only
           one tip being shown. This option makes them visible
--topics Shows only commits that are NOT on the first branch given.
Use --list to only list the last commit of each branch

--independent Among the <reference>s given, display only the ones that cannot be
           reached from any other <reference>.
--merge-base
           Instead of showing the commit list, determine possible merge bases
           for the specified commits. All merge bases will be contained in all
           specified commits. This is different from how git-merge-base(1)
           handles the case of three or more commits.

### git merge-base:

 --octopus
           Compute the best common ancestors of all supplied commits, in
           preparation for an n-way merge. This mimics the behavior of git
           show-branch --merge-base.
 --independent
           Instead of printing merge bases, print a minimal subset of the
           supplied commits with the same ancestors. In other words, among the
           commits given, list those which cannot be reached from any other.
           This mimics the behavior of git show-branch --independent.

## git rev-parse

* get full path of refs
$ git rev-parse --git-path refs/heads/master
.git/refs/heads/master

Useful in a worktree:
$ git rev-parse --git-path HEAD
/tmp/foo/.git/worktrees/foo_worktree/HEAD

* Exemples parsing refs:
$ git rev-parse 'master~1'
81db9ab1dd5b7e18d41ed393c888d978a332c195

$ git rev-parse --symbolic '81db9ab1dd5b7e18'
81db9ab1dd5b7e18

$ git rev-parse --symbolic 'master~1'
master~1

$ git rev-parse --short 'master~1'
81db9ab

 #full-name omits non branches
$ git rev-parse --symbolic-full-name master~1

$ git rev-parse --symbolic-full-name master
refs/heads/master

$ git rev-parse --abbrev-ref --symbolic-full-name master
master

 #From the source code, --abbrev-ref implies symbolic-full-name
$ git rev-parse --abbrev-ref heads/master

* Exemples getting flags
$ git rev-parse --flags -e -f X d -g -h
-e
-f
$ git rev-parse --flags -e -f -- -g -h
-e
-f

$ git rev-parse --no-flags -e -f master -- d e -g
  deddeb188792c0d95205008493baaa8fb1566bfc
  --
  d
  e
  -g

$ git rev-parse --revs-only -e -f master -- d e -g
deddeb188792c0d95205008493baaa8fb1566bfc

$ git rev-parse --no-revs -e -f master -- d e -g
  -e
  -f
  --
  d
  e
  -g

Summary: --flags pour les flags de rev-list
         --revs-only pour les revs de rev-list
         --no-flags --no-revs pour le reste

## git merge

git merge --continue: like 'git commit' but checks that MERGE_HEAD is present
git merge --abort: like 'git reset --merge' but checks that MERGE_HEAD is present

git merge --squash:
  Produce the working tree and index state as if a real merge happened
  (except for the merge information), but do not actually make a commit or
  move the HEAD, nor record `$GIT_DIR/MERGE_HEAD` to cause the next git commit
  command to create a merge commit. This allows you to create a single commit
  on top of the current branch whose effect is the same as merging another
  branch (or more in case of an octopus).

git merge --no-ff: forcer à faire un merge

Autrement dit, fait un merge, mais si on commite il ne montre pas les deux
parents. La différence avec git merge --no-commit c'est que le merge ne
fait pas le commit, mais prépare `MERGE_HEAD` de sorte que le prochain
commit sera considéré comme un merge.

* Merge strategies:

   - resolve: standard 3-way merge
   - recursive
           This can only resolve two heads using a 3-way merge algorithm. When
           there is more than one common ancestor that can be used for 3-way
           merge, it creates a merged tree of the common ancestors and uses
           that as the reference tree for the 3-way merge. This has been
           reported to result in fewer merge conflicts without causing
           mis-merges by tests done on actual merge commits taken from Linux
           2.6 kernel development history. Additionally this can detect and
           handle merges involving renames. This is the default merge strategy
           when pulling or merging one branch.
        options:
           ours
               This option forces conflicting hunks to be auto-resolved
               cleanly by favoring our version. Changes from the other tree
               that do not conflict with our side are reflected to the merge
               result.
               This should not be confused with the ours merge strategy, which
               does not even look at what the other tree contains at all. It
               discards everything the other tree did, declaring our history
               contains all that happened in it.
           theirs This is opposite of ours.
           patience
               With this option, merge-recursive spends a little extra time to
               avoid mismerges that sometimes occur due to unimportant
               matching lines (e.g., braces from distinct functions). Use this
               when the branches to be merged have diverged wildly. See also
               git-diff(1) --patience.
           ignore-space-change, ignore-all-space, ignore-space-at-eol
               Treats lines with the indicated type of whitespace change as
               unchanged for the sake of a three-way merge. Whitespace changes
               mixed with other changes to a line are not ignored. See also
               git-diff(1) -b, -w, and --ignore-space-at-eol.
               ·   If their version only introduces whitespace changes to a
                   line, our version is used;
               ·   If our version introduces whitespace changes but their
                   version includes a substantial change, their version is
                   used;
               ·   Otherwise, the merge proceeds in the usual way.
           renormalize
               This runs a virtual check-out and check-in of all three stages
               of a file when resolving a three-way merge. This option is
               meant to be used when merging branches with different clean
               filters or end-of-line normalization rules. See "Merging
               branches with differing checkin/checkout attributes" in
               gitattributes(5) for details.
           no-renormalize
               Disables the renormalize option. This overrides the
               merge.renormalize configuration variable.
           rename-threshold=<n>
               Controls the similarity threshold used for rename detection.
               See also git-diff(1) -M.
           subtree[=<path>]
               This option is a more advanced form of subtree strategy, where
               the strategy makes a guess on how two trees must be shifted to
               match with each other when merging. Instead, the specified path
               is prefixed (or stripped from the beginning) to make the shape
               of two trees to match.
       octopus
           This resolves cases with more than two heads, but refuses to do a
           complex merge that needs manual resolution. It is primarily meant
           to be used for bundling topic branch heads together. This is the
           default merge strategy when pulling or merging more than one
           branch.
       ours
           This resolves any number of heads, but the resulting tree of the
           merge is always that of the current branch head, effectively
           ignoring all changes from all other branches. It is meant to be
           used to supersede old development history of side branches. Note
           that this is different from the -Xours option to the recursive
           merge strategy.
       subtree
           This is a modified recursive strategy. When merging trees A and B,
           if B corresponds to a subtree of A, B is first adjusted to match
           the tree structure of A, instead of reading the trees at the same
           level. This adjustment is also done to the common ancestor tree.

### Ex: subtree merge strategy
http://www.kernel.org/pub/software/scm/git/docs/howto/using-merge-subtree.html

$ git remote add -f Bproject /path/to/B <1>
$ git merge -s ours --no-commit Bproject/master <2>
$ git read-tree --prefix=dir-B/ -u Bproject/master <3>
$ git commit -m "Merge B project as our subdirectory" <4>

$ git pull -s subtree Bproject master <5>

   <1> name the other project "Bproject", and fetch.
   <2> prepare for the later step to record the result as a merge.
   <3> read "master" branch of Bproject to the subdirectory "dir-B".
   <4> record the merge result.
   <5> maintain the result with subsequent merges using "subtree"
The first four commands are used for the initial merge, while the last one is to merge updates from B project.

### ours/theirs strategy in the merge

Des fois j'ai envie de faire un merge "trivial", ie de merger ploum et plam
mais de ne décider que de plam.

On peut faire git merge -Xours, ou git merge -Xtheirs pour résoudre les
conflits en faveur de ours ou theirs.
On peut faire git merge -s ours pour tout garder chez nous.

Sinon on peut aussi faire git read-tree -mu plam pour mettre l'arbre de
plam chez nous (après faut faire du plombing pour commiter plusieurs
parents, quitte à faire du plumbing, si on veut vraiment un truc identique,
on doit pouvoir commiter le tree de plam directement)

## git rebase

git rebase #default to rebasing current branch to its upstream (implies --fork-point)
git rebase upstream #change upstream
git rebase upstream branch #checkout to branch first
git rebase --onto base ... 

Options: --autosquash, --autostash

-r/--rebase-merges, -p/--preserve-merges
https://stackoverflow.com/questions/15915430/what-exactly-does-gits-rebase-preserve-merges-do-and-why
Good overview of the implem of preserve-merges, and the new implementation
rebase-merges (which can be combined with the interactive mode)

There are two backends of git rebase, the am backend which is used by
default (generate patches in a mailbox and uses git-am); and the
interactive backend which is used when these options are specified:
--keep-empty, --merge, --preserve-merges or --rebase-merges

## Sequencers
Sequencer information is showed in git status, cf
http://git.661346.n2.nabble.com/PATCHv2-git-status-show-short-sequencer-state-tc7569767.html#a7570756
et wt-status.c#wt_status_get_state

* Note on sequencers like cherry-pick, revert, am, rebase
they accept options:
--continue | --skip | --abort | --quit | --show-current-patch
Note: cherry-pick and revert do not accept skip

- quit is like abort except we don't reset the HEAD to ORIG_HEAD, ie simply
call sequencer_remove_state
- continue: si on a déjà commité, continue le sequencer.
  Comme facilité pour rb-i: si on a fait des changements, et que le HEAD est toujours égal à 'amend', 'commite --amend' (en faisant des trucs un peu compliqués pour les fixups et squash) pour nous quand on fait 'rebase --continue'.
  Pareil pour git cherry-pick.
  Par contre pour 'git am' il faut laisser l'index, il va le commiter pour nous

* rebase interactive:
  (cf git rebase --edit-todo pour éditer la todo-list)

  # Rebase 0cef107..4f4825f onto 0cef107 (2 commands)
  #
  # Commands:
  # p, pick <commit> = use commit
  # r, reword <commit> = use commit, but edit the commit message
  # e, edit <commit> = use commit, but stop for amending
  # s, squash <commit> = use commit, but meld into previous commit
  # f, fixup <commit> = like "squash", but discard this commit's log message
  # x, exec <command> = run command (the rest of the line) using shell
  # b, break = stop here (continue rebase later with 'git rebase --continue')
  # d, drop <commit> = remove commit
  # l, label <label> = label current HEAD with a name
  # t, reset <label> = reset HEAD to a label
  # m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
  # .       create a merge commit using the original merge commit's
  # .       message (or the oneline, if no original merge commit was
  # .       specified). Use -c <commit> to reword the commit message.
  #
  # These lines can be re-ordered; they are executed from top to bottom.
  #
  # If you remove a line here THAT COMMIT WILL BE LOST.
  #
  # However, if you remove everything, the rebase will be aborted.
  #
  # Note that empty commits are commented out

Exemple with --rebase-merges
           label onto

           # Branch: refactor-button
           reset onto
           pick 123456 Extract a generic Button class from the DownloadButton one
           pick 654321 Use the Button class for all buttons
           label refactor-button

           # Branch: report-a-bug
           reset refactor-button # Use the Button class for all buttons
           pick abcdef Add the feedback button
           label report-a-bug

           reset onto
           merge -C a1b2c3 refactor-button # Merge 'refactor-button'
           merge -C 6f5e4d report-a-bug # Merge 'report-a-bug'

* Infos
dans .git/rebase-merge ou rebase-apply

- for am (in ./rebase-apply):
$ ls
0001          applying       info  messageid  patch     sign
abort-safety  author-script  keep  msg        quiet     threeway
apply-opt     final-commit   last  next       scissors  utf8

000*: all patches to apply
abort-safely: hash of head when am stopped (to detect if we moved the head since when doing a --abort)
author-script: GIT_AUTHOR_*=
  GIT_AUTHOR_NAME='Damien Robert'
  GIT_AUTHOR_EMAIL='damien.olivier.robert+git@gmail.com'
  GIT_AUTHOR_DATE='@1555079063 +0200'
info: records the authorship and title
msg: is the rest of commit log message
patch: is the patch body.
final-commit: a cleaned-up commit message, with sign off applied
last: last patch number to apply
next: next patch number to apply
+ files for options: sign (signoff), keep, apply-opt, messagid, quiet,
scissors, sign, threeway, utf8

- rebase basic state:
head-name: original name of rebased branch
orig-head: original hash of rebased branch
onto: hash of onto commit
+ files that show options: autostash: $stash_abbrev, verbose, quiet, strategy, strategy_opts, allow_rerere_autoupdate, gpg_sign_opt, signoff, reschedule-failed-exec

- rebase am state:
$ ls
0001           final-commit  messageid  original-commit    rebasing  utf8
abort-safety   head-name     next       patch              scissors
apply-opt      keep          onto       patch-merge-index  sign
author-script  last          orig-head  quiet              threeway

original_commit: sha of original commit being applied

- rebase interactive state:
$ ls
author-script  git-rebase-todo         interactive  onto       stopped-sha
done           git-rebase-todo.backup  message      orig-head
end            head-name               msgnum       patch

amend: hash of current commit amended (via edit) or failed
done: actions done
end: number of actions to do
git-rebase-todo: action still to do
git-rebase-todo.backup: original rebase todo list
message: message of current rebased commit
msgnum: number of steps done
patch: current patch applied
rewritten-list: map old original hash -> new rebased hash
stopped-sha: short hash of original commit hash we are applying
message-{squash,fixup}

- for cherry-pick/revert (in ./sequencer)
abort-safely
head #head before cherry-picking
opts
todo #like for rebase (uses 'pick' for cherry-pick, 'revert' for revert)
.git/CHERRY_PICK_HEAD: hash of commit we are cherry picking
.git/REVERT_HEAD: same when reverting

- other infos:
COMMIT_EDITMSG: a temporary file that git creates it when you git commit, then opens your EDITOR program to edit that file. MERGE_MSG has precedence (used for a merge or when cherry picking)
MERGE_RR: probably for `git rerere`

* code
- git-am.sh:
  skip ->
	head_tree=$(git rev-parse --verify -q HEAD || echo $empty_tree) &&
	git read-tree --reset -u $head_tree $head_tree &&
	index_tree=$(git write-tree) &&
	git read-tree -m -u $index_tree $head_tree
	git read-tree $head_tree
  abort -> git rebase--abort if rebasing
           sinon check that head did not move since last am failure (this
           is stored in abort-safety)
	head_tree=$(git rev-parse --verify -q HEAD || echo $empty_tree) &&
	git read-tree --reset -u $head_tree $head_tree &&
	index_tree=$(git write-tree) &&
	orig_head=$(git rev-parse --verify -q ORIG_HEAD || echo $empty_tree) &&
	git read-tree -m -u $index_tree $orig_head
	git reset ORIG_HEAD

- git-legacy-rebase.sh:
  merge_dir="$GIT_DIR"/rebase-merge
    (is it an interactive rebase?)
  apply_dir="$GIT_DIR"/rebase-apply
    (is it an interactive rebase?)

state: $apply_dir/applying -> git am in progress
                  rebasing -> git am --rebasing
       $apply_dir -> type=am
       $merge_dir -> type=interactive
       $merge_dir/rewritten -> type=preserve-merges, interactive_rebase=explicit
       $merge_dir/interactive -> interactive_rebase=explicit
       test -n "$type" && in_progress=t

abort: git reset --hard $orig_head; rm -rf$state_dir

move_to_original_branch: change the rev of the original branch to the rev
of HEAD, and move HEAD to the original branch name.

- git-rebase--interactive.sh from commit v2.12.0-rc0
  Essentially call git cherry-pick on each commit until the todo is
  resolved.

- git-rebase--am.sh:
  continue)
	git am --resolved --resolvemsg="$resolvemsg" \
		${gpg_sign_opt:+"$gpg_sign_opt"} &&
	move_to_original_branch
  skip)
	git am --skip --resolvemsg="$resolvemsg" &&
	move_to_original_branch

if test -n "$keep_empty"
then
	# we have to do this the hard way.  git format-patch completely squashes
	# empty commits and even if it didn't the format doesn't really lend
	# itself well to recording empty patches.  fortunately, cherry-pick
	# makes this easy
	git cherry-pick ${gpg_sign_opt:+"$gpg_sign_opt"} --allow-empty \
		--right-only "$revisions" \
		${restrict_revision+^$restrict_revision}
else
	git format-patch -k --stdout --full-index --cherry-pick --right-only \
	--src-prefix=a/ --dst-prefix=b/ --no-renames --no-cover-letter \
	--pretty=mboxrd --topo-order \
	$git_format_patch_opt \
	"$revisions" ${restrict_revision+^$restrict_revision} \
	>"$GIT_DIR/rebased-patches"
	
	git am $git_am_opt --rebasing --resolvemsg="$resolvemsg" \
	--patch-format=mboxrd \
	$allow_rerere_autoupdate \
	${gpg_sign_opt:+"$gpg_sign_opt"} <"$GIT_DIR/rebased-patches"

Note: mobxrd a mailbox format that don't corrupt 'From' lines, cf
      https://www.loc.gov/preservation/digital/formats/fdd/fdd000385.shtml

## git reset
git reset treeish -- paths: copy the paths from treeish to the index
git reset --option commit
--soft: change juste HEAD, ne touche pas le worktree et l'index
--mixed: change HEAD et l'index, pas le worktree (défaut)
--hard: change HEAD, l'index et le worktree
--keep: comme --mixed,
  sauf que pour tous les fichiers qui ont changé entre commit et HEAD (*et*
  qui n'ont pas changé entre HEAD _et_ le worktree _et_ l'index [sinon
  abort]), update le worktree aussi.
  L'idée est de revenir à un commit en gardant les changements courants, on
  veut donc updater le worktree des fichiers qui ont changé uniquement
  entre HEAD et commit si possible.
--merge: comme --hard,
  mais abort si le working tree n'est pas égal à l'index (l'idée étant
  qu'un merge produit toujours un fichier dans le working tree égal à
  l'index, donc si on reset un fichier qui n'a pas cette propriété, ça veut
  dire qu'on a fait des trucs après le reset). Cas particulier, si
  index=HEAD=commit, alors on garde le worktree (car on sait que ça a été
  modifié à la main, mais comme HEAD=commit on n'a pas besoin de revenir
  à la version d'avant).

## git gc

Legacy version:
    git pack-refs --prune && # pack references and tags
    git reflog expire --all && # gc.reflogExpire (90 days), gc.reflogExpireUnreachable (30 days)
    git-repack -a -d -l && # merge all packs in one and run prune-packed
    $no_prune git prune && # prune unreachable objects; gc.pruneExpire=2 weeks)
    git worktree prune --expire #for git worktree; gc.worktreePruneExpire=3.monts.ago
    git rerere gc || exit #cf gc.rerereUnresolved=15days and gc.rerereResolved=60days
(`$no_prune`: désactive le prune seulement si --no-prune passé)

--aggressive: repacke plus agressivement; add the option '-f' to repack [-f: recompute deltas]
--(no-)prune (on by defaut): call prune

L'option --prune passe les infos à git prune -> git prune --expire=...
Note: with --prune=now, the repack -a becomes repack -A (cf the source code).
(Apparently --prune=now and --prune=all are synonyms)

* Options:
git reflog expire (-> git gc calls git reflog expire --all):
  gc.reflogExpire (90 days)
  gc.reflogExpireUnreachable (30 days)
git gc:
  gc.pruneExpire (2 weeks) (-> git gc calls git prune --expire="2 weeks ago")

*Forget everything*
       ·   Remove the original refs backed up by git-filter-branch: say git
           for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git
           update-ref -d.
       ·   Expire all reflogs with git reflog expire --expire=now --all.
       ·   Garbage collect all unreferenced objects with git gc --prune=now

=> clean everything now:
git reflog expire --expire=now --all
git gc --prune=now --aggressive #--prune=now is equivalent to --prune=all

### git prune:
git prune:  enlève les unreachables
(sauf ceux qui sont dans des packs, utiliser git repack -a -d pour ça), et appelle git prune-packed pour virer les loose objects qui sont dans des packs
Attention: n'utilise pas gc.pruneexpire, c'est git gc qui appelle git prune avec l'option --expire qui va bien. Donc les objets ajoutés avec git add mais overwrités avec un autre git add seront supprimés car ils ne sont pas dans le reflog)

  This runs git fsck --unreachable using all the refs available in refs/,
  optionally with additional set of objects specified on the command
  line, and prunes all unpacked objects unreachable from any of these
  head objects from the object database. In addition, it prunes the
  unpacked objects that are also found in packs by running git
  prune-packed.

       --prune=<date>
           Prune loose objects older than date (default is 2 weeks ago,
           overridable by the config variable gc.pruneExpire). --prune=now/all
           prunes loose objects regardless of their age. --prune is on by
           default.

  ex: git prune --expire=date

### git reflog
  - show ref (par défaut), alias pour git log -g --abbrev-commit --pretty=oneline;
  - expire ref: prune reflog entries (according to gc.reflogexpire and gc.reflogexpireunreachable, can override on config line).
  (--all pour appliquer à ttes les refs, --stale-fix pour considérer unreachableseulement les commits unreachables qui font référence à un objet qui n'existe plus)

* git reflog expire:
       --expire=<time>
           Entries older than this time are pruned. Without the option it is
           taken from configuration gc.reflogExpire, which in turn defaults to
           90 days. --expire=all prunes entries regardless of their age;
           --expire=never turns off pruning of reachable entries (but see
           --expire-unreachable).
       --expire-unreachable=<time>
           Entries older than this time and not reachable from the current tip
           of the branch are pruned. Without the option it is taken from
           configuration gc.reflogExpireUnreachable, which in turn defaults to
           30 days. --expire-unreachable=all prunes unreachable entries
           regardless of their age; --expire-unreachable=never turns off early
           pruning of unreachable entries (but see --expire).

Moralité: git gc --prune=all ne va pas pruner tous les objets tout de
suite à cause du reflog, il faut d'abord faire
  git reflog expire --expire=all --all

### git repack
 git repack: compress loose objects in a pack
  -a: Instead of incrementally packing the unpacked objects, pack everything referenced into a single pack => merge all packs in one
  -A: merge packs in one but keep unreachable objects inside pack in loose object => in particular -d deletes then delete the repacked packs, but we still have the unreachable objects as loose objects (subject to git prune) => comme -a, sauf si l'option -d est ajoutée, où les objets unreachables contenus dans un vieux pack deviennent loose (alors qu'avec -a -d, un unreachable object dans un pack n'est pas ajouté dans le nouveau pack, et avec -d le pack dans lequel il est risque de se faire détruire, car pour savoir si le pack est redondant on ne check pas les unreachables)
  -d: remove redundant packs after the repack (i think using git pack-redundant to get them) + run git prune-packed to remove redundant loose files
  -l: pass --local on git pack-objects
       --local
           This flag causes an object that is borrowed from an alternate
           object store to be ignored even if it would have otherwise been
           packed.
       --incremental
           This flag causes an object already in a pack to be ignored even if
           it would have otherwise been packed.
  -f: pass no-reuse-delta, -F: pass no-reuse-object to git pack-objects
       --no-reuse-delta
           When creating a packed archive in a repository that has existing
           packs, the command reuses existing deltas. This sometimes results
           in a slightly suboptimal pack. This flag tells the command not to
           reuse existing deltas but compute them from scratch.
       --no-reuse-object
           This flag tells the command not to reuse existing object data at
           all, including non deltified object, forcing recompression of
           everything. This implies --no-reuse-delta. Useful only in the
           obscure case where wholesale enforcement of a different compression
           level on the packed data is desired.

### on git gc --aggressive
> --depth=250 means to allow chains of "To get this object, first
> inflate this object, then apply this delta" of length 250.
> That's absurdly long, and doesn't even help compression much in
> practice (many short chains referring to the same objects tends to
> work fine).  We probably shouldn't make --aggressive do that.
> Something like --depth=10 would make more sense.
I didn't know --agressive was so aggressive myself, as I personally
never use it. "git repack -a -d -f --depth=32 --window=4000" is what I
often use, but I suspect most people would not be patient enough for
that 4k window.
(gc --aggressive  uses depth=250 and window=250)
Update: now it uses depth=50, cf git-config:

       gc.aggressiveDepth
           The depth parameter used in the delta compression algorithm used by
           git gc --aggressive. This defaults to 50.

       gc.aggressiveWindow
           The window size parameter used in the delta compression algorithm
           used by git gc --aggressive. This defaults to 250.

Without --aggressive:
       pack.window
           The size of the window used by git-pack-objects(1) when no window
           size is given on the command line. Defaults to 10.
       pack.depth
           The maximum delta depth used by git-pack-objects(1) when no maximum
           depth is given on the command line. Defaults to 50.

### git pack-refs:

  pack-refs --no-prune ne pas enlever les loose refs qui ont été packed
            --all par défaut sans --all ne pack que ce qui est déjà packé, donc à utiliser au début pour packer une fois pour initialiser
       A recommended practice to deal with a repository with too many refs is
       to pack its refs with --all --prune once, and occasionally run git
       pack-refs --prune. Tags are by definition stationary and are not
       expected to change. Branch heads will be packed with the initial
       pack-refs --all, but only the currently active branch heads will become
       unpacked, and the next pack-refs (without --all) will leave them
       unpacked.

### config:
       gc.aggressiveWindow
           The window size parameter used in the delta compression algorithm
           used by git gc --aggressive. This defaults to 250.
       gc.auto
           When there are approximately more than this many loose objects, compact. The default value is 6700. Setting this to 0 disables it.
       gc.autopacklimit
           When there are more than this many packs that are not marked with
           *.keep file in the repository, git gc --auto consolidates them into
           one larger pack. The default value is 50. Setting this to 0
           disables it.
       gc.packrefs
           This variable determines whether git gc runs git pack-refs. This can
be set to notbare to enable it within all non-bare repos or it can be set to a
boolean value. The default is true.
       gc.pruneexpire
           When git gc is run, it will call prune --expire 2.weeks.ago.
           Override the grace period with this config variable. The value
           "now" may be used to disable this grace period and always prune
           unreachable objects immediately.
       gc.reflogexpire, gc.<pattern>.reflogexpire
           git reflog expire removes reflog entries older than this time;
           defaults to 90 days. With "<pattern>" (e.g. "refs/stash") in the
           middle the setting applies only to the refs that match the
           <pattern>.
       gc.reflogexpireunreachable, gc.<ref>.reflogexpireunreachable
           git reflog expire removes reflog entries older than this time and
           are not reachable from the current tip; defaults to 30 days. With
           "<pattern>" (e.g. "refs/stash") in the middle, the setting applies
           only to the refs that match the <pattern>.
       gc.rerereresolved
           Records of conflicted merge you resolved earlier are kept for this
           many days when git rerere gc is run. The default is 60 days. See
           git-rerere(1).
       gc.rerereunresolved
           Records of conflicted merge you have not resolved are kept for this
           many days when git rerere gc is run. The default is 15 days. See
           git-rerere(1).

## git svn
    svn info #get url
    git svn init url #add --stdlayout if necessary
Pb: à la fin, git svn essaye de checkouter le repo dans le répertoire
courant, et si je fais ça à l'intérieur du dossier svn et que les fichiers
existent, ça va faire des conflits.
Solution: faire git svn clone monprojet-svn, et copier le .git dans le
répertoire svn.

## git fsck
           If no objects are given, git fsck defaults to using the index
           file, all SHA1 references in refs namespace, and all reflogs
           (unless --no-reflogs is given) as heads.

       --unreachable
           Print out objects that exist but that aren’t reachable from any of
           the reference nodes.
       --dangling, --no-dangling
           Print objects that exist but that are never directly used
           (default).  --no-dangling can be used to omit this information from
           the output.
Si j'ai bien compris, --dangling donne le tip des bouts unreachables du dag, ie si on est en A-B-C-D unreachable, D est dangling, et A,B,C,D est unreachable.

       --root
           Report root nodes. (ie le root de l'arbre)
       --tags
           Report tags.
       --no-reflogs
           Do not consider commits that are referenced only by an entry in a
           reflog to be reachable. This option is meant only to search for
           commits that used to be in a ref, but now aren’t, but are still in
           that corresponding reflog.

## git rerere
Reuse recorded resolution of conflicted merges

Enabled when rerere.enabled=true

git rerere called by git merge if there are conflicts, rerere records the
conflicts.
git rerere called by commit after a merge, rerere records the manual
resolutions.
In the next conflicting merge, rerere resolve the ones that were given a
manual resolution previously.

clear:
      Reset the metadata used by rerere if a merge resolution is to be aborted.
forget <pathspec>:
           Reset the conflict resolutions which rerere has recorded
diff:
           Display diffs for the current state of the resolution.
  (rerere affects only the working dir. So git diff include the manual
  resolutions+the one rerere did automatically. Call git rerere diff to see
  the ones do manually)
status:
           Print paths with conflicts whose merge resolution rerere will
           record.
remaining:
           Print paths with conflicts that have not been autoresolved by
           rerere.
gc:
           Prune records of conflicted merges that occurred a long time ago.

## git notes

Add, removes or read notes to an object

L'implémentation est rigolote: les notes sont sauvées dans
refs/notes/commits (le commits peut etre change par --ref)
donc en fait il s'agit d'une branche. A chaque changement, ref/notes/commits est updaté (avec un commit du genre "added note to..."), et le tree sur lequel le commit pointe est composé de fichiers de la forme
- adffef14. Ce fichier contient la note de l'objet adffef14
- ad/ffe15 ce fichier contient la note de l'objet adffe15...


## git stash
-> saved in the branch refs/stash

git stash save [message] (deprecated):
  Save your local modifications to a new stash, and run git reset --hard to
  revert them.
      If the -k/--keep-index option is used, all changes already added to
      the index are left intact.
      If the -u/--include-untracked option is used, all untracked files are
      also stashed and then cleaned up with git clean, leaving the working
      directory in a very clean state. If the -a/--all option is used
      instead then the ignored files are stashed and cleaned in addition to
      the untracked files.
      --patch: interactively select things to be stashed
  push [-m message] <pathspec>
      Recommanded method of 'git stash save'; 'git stash push' can specify
      pathspecs.
  list: list the stash that you have
  show [<stash>]
      Show the changes recorded in the stash as a diff between the
      stashed state and its original parent
  pop [--index] [-q|--quiet] [<stash>]
      Remove a single stashed state from the stash list and apply it on
      top of the current working tree state, i.e., do the inverse
      operation of git stash save. The working directory must match the
      index.
      If the --index option is used, then tries to reinstate not only the
      working tree’s changes, but also the index’s ones.
      = essentially 'apply' followed by 'drop' if there were no conflicts
  apply [--index] [-q|--quiet] [<stash>]
      Like pop, but do not remove the state from the stash list.
  branch <branchname> [<stash>]
      Creates and checks out a new branch named <branchname> starting
      from the commit at which the <stash> was originally created,
      applies the changes recorded in <stash> to the new working tree and
      index. If that succeeds, and <stash> is a reference of the form
      stash@{<revision>}, it then drops the <stash>. When no <stash> is
      given, applies the latest one.
  clear
      Remove all the stashed states. Note that those states will then be
      subject to pruning, and may be impossible to recover
  drop [-q|--quiet] [<stash>]
      Remove a single stashed state from the stash list. When no <stash>
      is given, it removes the latest one. i.e.  stash@{0.
  create
      Create a stash (which is a regular commit object) and return its
      object name, without storing it anywhere in the ref namespace.
  store
      Store a given stash created via git stash create (which is a
      dangling merge commit) in the stash ref, updating the stash reflog.

* Message:
git stash push -m "message" / git stash create -m "message"
=> spécifie le message du commit crée par git stash. Sinon est de la forme:
WIP on branch: e7b1338 <first line of last commit log>

Ce message est repris dans le message du reflog (via git update-ref -m).
Note: `git stash store` ne reprend pas le message de commit crée par `git
stash create -m msg`, il met dans le reflog <Created via "git stash
store".>. Cependant on peut spécifier le message via `git stash store -m
reflog_message`.

* Remarque: stash enregistre le working dir dans un commit, avec pour parent
HEAD et pour deuxième parent l'index courant. Faire git stash apply revient
à faire un merge avec le commit stashé (en particulier, si ça concerne un
fichier dirty, aborte).

git stash apply --index restaure aussi l'index.
Si ça crée des conflits par rappot à l'index actuel, aborte:
  Valinor ~/tmp/git $ git stash apply --index
  error: patch failed: ploum:1
  error: ploum: patch does not apply
  Conflicts in index. Try without --index.

Modifier l'index actuel pour être le même que la version du stash ne marche
pas:
  Unstaged changes after reset:
  M       ploum
  error: Your local changes to the following files would be overwritten by merge:
    ploum
  Please, commit your changes or stash them before you can merge.
  Aborting
  Index was not unstashed.
(on voit que appliquer l'index stashé marche vu qu'il n'y a plus de
conflit, mais du coup le fichier est dirty et le merge au niveau du working
dir ne s'applique pas...)
Modifier l'index et le working dir pour qu'il n'y ait pas de conflit ne
marche pas non plus (même si le ploum du working dir est le même que pour
le stash, il est marqué dirty, donc le merge conflicte même si en le
faisant on verrait que rien n'a changé).

## git reflog
git reflog [show] ref -> use git log -g ref
git reflog expire/delete [--rewrite] [--updateref]
git reflog exists

## git submodule
http://git-scm.com/book/en/v2/Git-Tools-Submodules
man git-submodule(1)
man gitsubmodules(7) gitmodules(5)

How it works: for each gitlink, git looks at the .gitmodules paths to
associate it to a gitmodules. Here .git/config is not used. All the other
values in .git/config have precedence over .gitmodules. The .gitmodules
settings looked are only submodule.name.{update,branch,fetchRecurseSubmodules,ignore,shallow}.

Active submodules:
- git only looks at .git/config, not .gitmodules to check if a submodule is active
- a submodule is unregistered if .git/config does not exist for it. Of course a non registered submodule is not active
- `git sub update` only works on active submodule (likewise for all others --recurseSubmodules commands like git grep).
- A non active submodule is still shown in `git status`, `git diff` (use diff.ignoreSubmodules/submodule.name.ignore) to configure that)
- git sub foreach: iterates to each gitlink which has a .git (real or gitfile), this don't check active status or .git/config.

Relationship between .git/config and .gitmodules:
- .gitmodules is read in the worktree, but if it does not exists git try to
  read it in the index.
- submodule mapping 'path=...' is determined from .gitmodules (only);
  a path must exist to associate a gitlink (referred by the path) to a
  submodule. The path is not derived from the name.
- a submodule is considered registered if it is in .git/config
  `git sub init` will add in .git/config the submodule name (+ the update and url values and set active=true)
  Note that we can remove the url in .git/config, so it fallsback to the
  value in .gitmodules. The url is only used for the first `git sub update`
  to clone it in .git/modules.
- with absorbgitdir, the .git of the submodule is in
  .git/modules/submodulename
- moving a submodule will
  - change the path in .gitmodules
  - change the .git=gitdir: ../.../.git/modules/submodulename link (to still
    point to the absorbed git dir)
  - but not change the .git/modules/submodulename/ repository to the new path
    since the name did not change

### Commands

* absorbgitdirs
    If a git directory of a submodule is inside the submodule, move the
    git directory of the submodule into its superprojects
    $GIT_DIR/modules path and then connect the git directory and its
    working directory by setting the core.worktree and adding a .git
    file pointing to the git directory embedded in the superprojects
    git directory.

  Eg: $ cat .git => gitdir: ../../../.git/modules/NrrwRgn
      $ cat modules/NrrwRgn/config => worktree = ../../../commands/start/NrrwRgn

* Add a submodule:
git submodule add url path
This adds both to .gitmodules and .git/config

Eg for a relative submodule: g sub add ./repo/bar2 repo/bar2
Note that `g sub add ./repo/bar2` will clone `repo/bar2` into `./bar2`

* Init submodules 

- git submodule init #after a checkout or a clone
  => copy .gitmodules info into .git/config

  [note: without a path activates all submodule.active (or all submodules
  if not set). This does not change already existing .git/config entries
  (use git sync for that). This copy the submodule update and url config,
  and set active=true].

- git submodule update subname
  => checkout the submodule on the commit registered by the superproject
  At once: git submodule update --init

- sync (like init but only for already initialized submodules; used for changes in .gitmodules)

    Synchronizes submodules' remote URL configuration setting to the value
    specified in .gitmodules. It will only affect those submodules which
    already have a URL entry in .git/config (that is the case when they are
    initialized or freshly added). This is useful when submodule URLs
    change upstream and you need to update your local repositories
    accordingly.

    "git submodule sync" synchronizes all submodules while "git submodule
    sync -- A" synchronizes submodule "A" only.

* Remove submodule

- deinit
  Unregister the given submodules, i.e. remove the whole submodule.$name
  section from .git/config together with their work tree.
  Refuse to work if the .git is in the submodule.

  This mean that the gitlink and .gitmodules entries are kept, but the
  worktree and .git/config are removed.
  Can be reverted via `git submodule update --init`

  Note: calls to git submodule update, git submodule foreach and git submodule
  sync will skip any unregistered submodules until they are initialized again
  [note that if I simply remove the .git/config section but leave the
  worktree, then `git submodule status` show the submodule as unregistered,
  but `git submodule foreach` does go into this submodule. It only if I
  remove the worktree that it does not got there anymore.]

- git rm <submodule path>
  Delete the gitlink (+worktree) and .gitmodules entry. But leaves the .git/config entry.
  The submodule's .git is kept into .git/modules/<name> and needs to be
  removed manually. If the .git was in the submodule, automatically calls
  absorbgitdis.

  git rm --cached: only remove the gitlink entry

  Note: for an external submodule 'plim' added with git submodule add
  (rather than a git folder already present inside our main folder), the
  objects are available in .git/modules/plim/ of the main git project, so
  one can erase the submodule and recreate it if needed

  For an internal submodule, git submodule deinit will refuse to work
  (because git then use the internal submodule .git folder to store the
  objects of the submodule rather than the superproject .git/modules
  folder, so git can't remove the internal submodule) => use git sub
  absorbgitdirs. Doing a `git rm internal_sub` does a absorbgitdirs for
  this submodule.

* Status:
git submodule status
git submodule summary #show the log diff

Exemples:
$ git sub status
 d6e5c928821501ad2ebdf2f988558e9690973778 drain (v0.3.0-2-gd6e5c92)

  Each SHA-1 will possibly be prefixed with - if the submodule is not initialized [or not active], + if the currently checked out submodule commit does not match the SHA-1 found in the index of the containing repository and U if the submodule has merge conflicts.

$ git sub summary (=git diff --submodule)
* drain d6e5c92...234bab4 (1):
  < graph: to_s and inspect

git diff #show the commit hash diff
git diff --submodule #(default to --submodule=log): show the log diff of the submodules

Examples of submodules diff (git sub summary):
  Submodule plam 0000000...c43a6e4 (new submodule)
  Submodule script/others/republique 0000000...f4c0876 (not checked out)
   #We added a submodule to the index, but we removed it (without adding this to the index)
  Submodule script/others/republique f4c0876...0000000 (submodule deleted)
  Submodule plam c43a6e4...9215cb5 (commits not present)
   #the commit c43a6e4 is not present in the current submodule
  Submodule plam 9215cb5..4b41ae0 (rewind):
    < Adding d, new line to b
   #the submodule is lacking some commits
  Submodule plam de44db5...d6ed7c1:
    > Uhihih
    < Ohoho
   #we both have new commits [Uhihih] and lacking commits [Ohoho] in the submodule

* Update:
- git submodule update --checkout/--rebase/--merge
    checkout (default)
      the commit recorded in the superproject will be checked out in
      the submodule on a detached HEAD.
    rebase
      the current branch of the submodule will be rebased onto the
      commit recorded in the superproject.
    merge
      the commit recorded in the superproject will be merged into the
      current branch in the submodule.
Rem: On the config file submodule.<name>.update can also be a custom command or 'none'

Options: --recursive, --init [automatically calls git sub init if needed]

- git submodule update --remote [--no-fech]
Instead of using the superproject’s recorded SHA-1 to update the submodule, use the status of the submodule’s remote-tracking branch.
=> like running `git pull` inside the submodule, except that git pull uses
the branch 'branch.name.merge' from the submodule's config, while git
`submodule update --remote` uses the branch 'submodule.<name>.branch' (default to master) from the superproject config

The difference with `git submodule update` is that '--remote' will fetch the configured remote of the submodule while the other one just update the submodule with the configured SHA-1 recorded by the superproject. So git submodule update will reset the submodules to their recorded state in superproject.

To specify the branch the --remote should get, use:
$ git config -f .gitmodules submodule.<name>.branch branch_name

* Pushing:
--recurse-submodules=check|on-demand|only|no
check: check if the submodules have non pushed changes (but don't push them)
on-demand: push the submodules (which have changed)
only: only push the submodules, not the superproject

  $ git push --recurse-submodules=check #check for omited submodules change
  The following submodule paths contain changes that can
  not be found on any remote:
    DbConnector
  Please try
    git push --recurse-submodules=on-demand #do the push on the submodules
  or cd to the path and use
    git push
  to push them to a remote.

* Iterating: 'submodule foreach'
$ git submodule foreach 'git stash'

git my sub foreach: only iterate on modified submodules

### Submodule config

cf gitmodules(5): submodules config can be either on .git/config (local) or
on .gitmodules (commited, so global). git submodule init/sync synchronise the two config files
=> on peut spécifier les config submodule.<name>.* dans .gitmodules (mais .git/config a précédence)

* Individual submodule config:
submodule.<name>.update=checkout, rebase, merge or none -> git submodule update
submodule.<name>.branch The remote branch name for a submodule, used by git submodule update --remote. Special value '.' means the name of the current branch in the supermodule. If not specified, default to master.
submodule.<name>.fetchRecurseSubmodules=true/false -> recursive fetching of the submodule
submodule.<name>.ignore=all/dirty/untracked/none -> ignore setting for `git status/diff`
submodule.<name>.active=true/false -> the submodule we recurse into via
--recurse-submodules. If not specified (nor submodule.active), consider the
submodule active if it has an url. It has precedence over submodule.active.

* Global config:
submodule.active=pathspec
submodule.recurse=true/false -> pass --recurse-submodules for all the git command that support it: git fetch/push/checkout/read-tree/ls-files?/grep (of course for git clone this still needs to be specified manually) [update: git ls-files does not seem to read this setting]

fetch.recurseSubmodules: default to 'on-demand' -> value of --recurse-submodules
push.recurseSubmodules: default to 'no' -> value of --recurse-submodules (which default to on-demand when specified on the command line)
[=> so submodule.recurse=true does not change `git fetch` since it already default to 'on-demand' and pass 'ondemand' for `git push]

Note that `git foo --recurse-submodules` only recurse into active submodules
`git sub update` also only look at active submodules.

* Diff/status config: 
- diff.submodule=short(default)/diff/log => git diff --submodule.
  [Recall that by default `git diff` use `--submodule=short` and `git diff
  --submodule` use `--submodule=log` ie = git sub summary.
- diff.ignoreSubmodules=none/untracked/dirty/all => Sets the default value of --ignore-submodules.
  Also used by `git checkout` and `git switch`
  [Setting it to all disables the submodule summary normally shown by git commit and git status when status.submoduleSummary is set]
- status.submodulesummary=1 => shortlog of the submodules new commits in git status and git commit

* My config:
diff.submodule=log
status.submodulesummary=true
submodule.recurse=true

* Usefull aliases:
$ git config alias.subdiff '!'"git diff && git submodule foreach 'git diff'"
$ git config alias.subpush 'push --recurse-submodules=on-demand'
$ git config alias.subupdate 'submodule update --remote --merge'

### Misc

- To get a list of internal submodules:
  find . -name .git
- To add an internal new submodule:
  git submodule add ./relative_path relative_path
- To add an internal existing submodule: add to .gitmodules
  [submodule "plam"]
    path = plam
    url = ./plam
  Then git submodule init
[Note: if we do git submodule add ./ploum/plim,
it adds the submodule ./ploum/plim in ./plim; that's why we have to specify the relative path]

* Check .git/modules currently used:
cat **/.git(.) | sed 's/^.*modules\///' | sort > /tmp/used
cd .git/modules; /bin/ls | sort > /tmp/available
gitdiff /tmp/available /tmp/used
comm -23 /tmp/available /tmp/used
unused=(${(@f)$(comm -23 =(sort /tmp/available) =(sort /tmp/used))})

## git worktree

       git worktree add [-f] [--detach] [--checkout] [--lock] [-b <new-branch>] 
<path> [<commit-ish>]
       git worktree list [--porcelain]
       git worktree lock [--reason <string>] <worktree>
       git worktree move <worktree> <new-path>
       git worktree prune [-n] [-v] [--expire <expire>]
       git worktree remove [-f] <worktree>
       git worktree unlock <worktree>

Refs:
       Refs that are per working tree can still be accessed from another
       working tree via two special paths, main-worktree and worktrees. The
       former gives access to per-worktree refs of the main working tree,
       while the latter to all linked working trees.

       For example, main-worktree/HEAD or main-worktree/refs/bisect/good
       resolve to the same value as the main working tree’s HEAD and
       refs/bisect/good respectively. Similarly, worktrees/foo/HEAD or
       worktrees/bar/refs/bisect/bad are the same as
       GIT_COMMON_DIR/worktrees/foo/HEAD and
       GIT_COMMON_DIR/worktrees/bar/refs/bisect/bad.

DETAILS
       Each linked working tree has a private sub-directory in the
       repository’s $GIT_DIR/worktrees directory. The private sub-directory’s
       name is usually the base name of the linked working tree’s path,
       possibly appended with a number to make it unique. For example, when
       $GIT_DIR=/path/main/.git the command git worktree add
       /path/other/test-next next creates the linked working tree in
       /path/other/test-next and also creates a $GIT_DIR/worktrees/test-next
       directory (or $GIT_DIR/worktrees/test-next1 if test-next is already
       taken).

       Within a linked working tree, $GIT_DIR is set to point to this private
       directory (e.g. /path/main/.git/worktrees/test-next in the example) and
       $GIT_COMMON_DIR is set to point back to the main working tree’s
       $GIT_DIR (e.g. /path/main/.git). These settings are made in a .git file
       located at the top directory of the linked working tree.

       Path resolution via git rev-parse --git-path uses either $GIT_DIR or
       $GIT_COMMON_DIR depending on the path. For example, in the linked
       working tree git rev-parse --git-path HEAD returns
       /path/main/.git/worktrees/test-next/HEAD (not
       /path/other/test-next/.git/HEAD or /path/main/.git/HEAD) while git
       rev-parse --git-path refs/heads/master uses $GIT_COMMON_DIR and returns
       /path/main/.git/refs/heads/master, since refs are shared across all
       working trees, except refs/bisect and refs/worktree.

       See gitrepository-layout(5) for more information.

Exemple: git worktree add foo_worktree
=> crée un *fichier* 'foo_worktree/.git' qui contient:
   gitdir: /tmp/foo/.git/worktrees/foo_worktree
et .git/worktrees/foo_worktree/ contient
gitdir=/tmp/foo/foo_worktree/.git ($GIT_DIR)
commondir=../.. ($GIT_COMMON_DIR)

$ g rev-parse worktrees/ploum/HEAD
$ g rev-parse main-worktree/HEAD

## Patches

### git format-patch

-o <dir>
-s: signoff
       --cover-letter
           In addition to the patches, generate a cover letter file containing
           the shortlog and the overall diffstat. You can fill in a
           description in the file before sending it out.
       --attach[=<boundary>]
           Create multipart/mixed attachment, the first part of which is the
           commit message and the patch itself in the second part, with
           Content-Disposition: attachment.
       --no-attach
           Disable the creation of an attachment, overriding the configuration
           setting.
       --inline[=<boundary>]
           Create multipart/mixed attachment, the first part of which is the
           commit message and the patch itself in the second part, with
           Content-Disposition: inline.
git format-patch -s --cover-letter -o 00patch-upstream/tosend/ branch

### git send-email

cf: http://felipec.wordpress.com/2009/10/25/git-send-email-tricks/

Remarque: si on spécifie des révisions plutôt que des patchs, il appelle format-patch d'abord. Du coup:
    git format-patch --cover-letter master
    git send-email --annotate *.patch
devient
    git send-email --annotate --cover-letter master

       --annotate
           Review and edit each patch you’re about to send.
       --compose
           Invoke a text editor (see GIT_EDITOR in git-var(1)) to edit an
           introductory message for the patch series.
       --to/cc-cmd=<command>
           Specify a command to execute once per patch file which should
           generate patch file specific "Cc:" entries. Output of this command
           must be single email address per line. Default is the value of
           sendemail.cccmd configuration value.
       --[no-]chain-reply-to
           If this is set, each email will be sent as a reply to the previous
           email sent. If disabled with "--no-chain-reply-to", all emails
           after the first will be sent as replies to the first email sent.
           When using this, it is recommended that the first file given be an
           overview of the entire patch series. Disabled by default, but the
           sendemail.chainreplyto configuration variable can be used to enable
           it.
       --identity=<identity>
           A configuration identity. When given, causes values in the
           sendemail.<identity> subsection to take precedence over values in
           the sendemail section. The default identity is the value of
           sendemail.identity.
       --[no-]signed-off-by-cc
           If this is set, add emails found in Signed-off-by: or Cc: lines to
           the cc list. Default is the value of sendemail.signedoffbycc
           configuration value; if that is unspecified, default to
           --signed-off-by-cc. (ie les signed-off-by sont rajoutés au Cc:)

### git am

-s: signoff
-3: 3 way merge
-c: scissors
-p<n>: remove n leading slashes (default is 1, because git diff produce things like a/foo b/bar)

### git apply

L'intérêt de git apply monpatch plutôt que git am, c'est que git am fait un
commit après avoir appelé git apply. En utilisant directement git apply, on
modifie juste les fichiers (et pas l'index), et on peut ensuite commiter ce
que l'on veut.

* Scissors
  --------
Sur un patch comme ça:
    From: user.name@company.org
    Subject: [PATCH 1/1] Pass unknown options to latexdiff

    --- 8< ---
    From: Damien Robert <damien.olivier.robert+git@gmail.com>
    Date: Wed, 18 Dec 2013 12:34:02 +0100

    Log message
    ---
     git-latexdiff | 19 +++++++++++++++++--
     1 file changed, 17 insertions(+), 2 deletions(-)

    git mailinfo --scissors msg patch <0001-Pass-unknown-options-to-latexdiff.patch
me donne
    Author: Damien Robert
    Email: damien.olivier.robert+git@gmail.com
    Subject: Pass unknown options to latexdiff
    Date: Wed, 18 Dec 2013 12:34:02 +0100
ie il prend d'abord les headers après les scissors

## Sparse checkout

git sparse-checkout
  cf https://github.blog/2020-01-13-highlights-from-git-2-25/

Filter spec: cf git-rev-list#--filter

Config and environment + hooks
==============================

## Config files
    $GIT_DIR/hooks/*
    $GIT_WORK_DIR/.gitmodules

- Gitignore:
    $GIT_DIR/info/exclude, .gitignore, core.excludesfile,
    core.excludesfile, $XDG_CONFIG_HOME/git/ignore

- Gitattributes
    $GIT_DIR/info/attributes, .gitattributes
    core.attributesfile, $XDG_CONFIG_HOME/git/attributes

- Gitconfig
    $GIT_DIR/config Repository specific configuration file.
    ~/.gitconfig
        User-specific configuration file. Also called "global"
        configuration file.
    $XDG_CONFIG_HOME/git/config
        Second user-specific configuration file. If $XDG_CONFIG_HOME is not
        set or empty, $HOME/.config/git/config will be used. Any
        single-valued variable set in this file will be overwritten by
        whatever is in ~/.gitconfig. It is a good idea not to create this
        file if you sometimes use older versions of Git, as support for
        this file was added fairly recently.
    $(prefix)/etc/gitconfig
        System-wide configuration file.

Note: `$GIT_DIR/*` are not tracked

## Features

feature.experimental => pack.useSparse=true, fetch.negotiationAlgorithm=skipping, fetch.writeCommitGraph=true
feature.manyFiles => index.version=4, core.untrackedCache=true

## Alias
Pour mettre des scripts dans les alias:
    foo1 = !sh -c 'echo "$@"' -
    foo2 = !sh -c 'echo 1:$1, 2:$2' -
le - final est équivalent à --, pour dire à sh que ce qui arrive sont les
commandes.

Remarque: foo3=!echo $@ ne marche pas car git concatène les arguments à la
fin donc 'git foo3 ploum plam' va donner 'ploum plam ploum plam'.

Solutions: foo3="! echo $@ && :", ou foo3="! f() {echo $@}; f"

## Environment variables
GIT_DIR=.git / git --git-dir=...
  or a .git file containing 'gitdir: <path>'
GIT_INDEX_FILE=$GIT_DIR/index
GIT_WORK_TREE=... / git --work-tree=... / core.worktree=...
GIT_COMMON_DIR=...

man git
       GIT_INDEX_FILE
           This environment allows the specification of an alternate index
           file. If not specified, the default of $GIT_DIR/index is used.

       GIT_INDEX_VERSION

       GIT_OBJECT_DIRECTORY
           If the object storage directory is specified via this environment
           variable then the sha1 directories are created underneath -
           otherwise the default $GIT_DIR/objects directory is used.

       GIT_ALTERNATE_OBJECT_DIRECTORIES
           Due to the immutable nature of Git objects, old objects can be
           archived into shared, read-only directories. This variable
           specifies a ":" separated (on Windows ";" separated) list of Git
           object directories which can be used to search for Git objects. New
           objects will not be written to these directories.

       GIT_DIR
           If the GIT_DIR environment variable is set then it specifies a path
           to use instead of the default .git for the base of the repository.
           The --git-dir command-line option also sets this value.

       GIT_WORK_TREE
           Set the path to the root of the working tree. This can also be
           controlled by the --work-tree command line option and the
           core.worktree configuration variable.

       GIT_NAMESPACE
           Set the Git namespace; see gitnamespaces(7) for details. The
           --namespace command-line option also sets this value.

       GIT_COMMON_DIR
           If this variable is set to a path, non-worktree files that are
           normally in $GIT_DIR will be taken from this path instead.
           Worktree-specific files such as HEAD or index are taken from
           $GIT_DIR. See gitrepository-layout(5) and git-worktree(1) for
           details. This variable has lower precedence than other path
           variables such as GIT_INDEX_FILE, GIT_OBJECT_DIRECTORY...

   Git Commits
       GIT_AUTHOR_NAME, GIT_AUTHOR_EMAIL, GIT_AUTHOR_DATE, GIT_COMMITTER_NAME,
       GIT_COMMITTER_EMAIL, GIT_COMMITTER_DATE, EMAIL

   Git Diffs
       GIT_DIFF_OPTS
       GIT_EXTERNAL_DIFF

   Others
       GIT_MERGE_VERBOSITY
       GIT_PAGER
       GIT_EDITOR
       GIT_SSH GIT_SSH_COMMAND
       ...

    Debug:
      GIT_TRACE, GIT_TRACE_*

## Attributes

.gitattributes par défaut (ou .git/info/attributes si on ne veut pas de version control)
Donne des attributs sur les fichiers (ex quel merge utiliser, faire des filtres pour le commit/uncommit, comment faire des diff sur du fichier binaire, sur quel fichiers faire du whitespace check, ignorer les fichiers lors de git archive)

ex: end of line normalization
               *.txt           text
               *.vcproj        eol=crlf (implique text)
               *.sh            eol=lf   (implique text)
               *.jpg           -text
.vcproj -> crlf end of line, sh -> lf end of line in the working dir
.jpg pas de normalization, .txt: dans le repo, les lignes sont normalisées à LF, et dénormalisé au format natif


Rem: .gitconfig
       core.autocrlf
           Setting this variable to "true" is almost the same as setting the
           text attribute to "auto" on all files except that text files are
           not guaranteed to be normalized: files that contain CRLF in the
           repository will not be touched. Use this setting if you want to
           have CRLF line endings in your working directory even though the
           repository does not have normalized line endings. This variable can
           be set to input, in which case no output conversion is performed.
       core.safecrlf (when converting crlf to lf, ensure one can convertback, ie there are not a mix of crlf and lf in the file)
 #Donc en gros: text=auto: convertit tout en lf dans le repo, et en core.eol (par défaut native) pour le checkout. Mettre eol=lf ou eol=crlf dans le gitattributes pour les fichiers qui doivent rester en lf sous windows et crlf sous linux.
 #En fallback, core.autocrlf=true est équivalent à text=auto et eol=crlf (sauf que les fichiers ayant des crlf dans le repo .git ne sont pas transformées), tandis que core.autocrlf=input est équivalent à eol=lf
(cf aussi: http://adaptivepatchwork.com/2012/03/01/mind-the-end-of-your-line/)

ident: remplacer $Id$ par le sha1 du blob

filter:
               *.c     filter=indent
.git/config:
               [filter "indent"]
                       clean = indent (lors de l'ajout au repo)
                       smudge = cat   (lors d'un check out)

Rem: white space error, c'est indiqué par
git diff --check ou git log --check
git apply --whitespace warn (par défaut) dit qu'il y a des erreurs de whitespace
    (--whitespace nowarn: pas de warning, error ou error-all donne les erreurs et n'applique pas le patch)
Réglé dans core.whitespace:
           ·    blank-at-eol treats trailing whitespaces at the end of the
               line as an error (enabled by default).
           ·    space-before-tab treats a space character that appears
               immediately before a tab character in the initial indent part
               of the line as an error (enabled by default).
           ·    indent-with-non-tab treats a line that is indented with 8 or
               more space characters as an error (not enabled by default).
           ·    tab-in-indent treats a tab character in the initial indent
               part of the line as an error (not enabled by default).
           ·    blank-at-eof treats blank lines added at the end of file as an
               error (enabled by default).
           ·    trailing-space is a short-hand to cover both blank-at-eol and
               blank-at-eof.
           ·    cr-at-eol treats a carriage-return at the end of line as part
               of the line terminator, i.e. with it, trailing-space does not
               trigger if the character before such a carriage-return is not a
               whitespace (not enabled by default).

## Hooks
am:
1. applypatch-msg
    git am -> check commit log message
    (sample: use commit-msg hook if active)
2. pre-applypatch
    git am -> between patch and commit (to check the working tree)
    (sample: use precommit hook if active)
3. post-applypatch
    git am -> after commit (notification)

commit:
1. pre-commit
    git commit -> check for whitespace
    (sample: check for whitespace and if all files are in ascii)
2. prepare-commit-msg
    git commit -> template for commit log msg
    (sample: comment Conflicts: part on a merge commit, show name-status
    change, add Signed-off-by messages)
3. commit-msg
    git commit -> check commit log msg
    (sample: catches duplicates signed-off lines)
4. post-commit
    git commit -> after commit (notification)

push:
1. pre-receive (git push, happen in remote) ->
2. update (git push, happen in remote) -> just before updating the ref on
   remotes (enforce fast-forward policy)
   (sample: block unannontated tags from entering, + some config on
   branch/tag creations deletions)
3. post-receive (git push, happen in remote) ->  notifications (supersedes de
   post-update)
   (sample: git update-server-info)

- post-checkout -> repository validity checks, auto-display differences, working dir metadata properties...
- post-merge -> restore metadata after a merge,....

- post-rewrite:
      This hook is invoked by commands that rewrite commits (git commit
      --amend, git-rebase; currently git-filter-branch does not call it!).
- pre-rebase -> prevent a branch being rebased
  (sample: show how to prevent topic branches already merged to the "next" branch to be rebased)
- pre-auto-gc: by git gc --auto

## Contrib
*blameview*
  git blame de manière incrémentale (Fugitive fait déjà ça)
buildsystems
  compiler git sous windows
ciabot
  hook scripts for the CIA notification service
completion
  completion for bash/zsh (already included in zsh)
continuous
  A daemon that waits for update events sent by its companion
  post-receive-cinotify hook, checks out a new copy of source,
  compiles it, and emails the guilty parties if the compile
  (and optionally test suite) fails.
convert-objects
  git-convert-objects - Converts old-style git repository
credential
  osx-keychain
**diff-highlight**
  word diff, but in a line by line manner
**diffall**
  directory diff
emacs
  git emacs modules
examples
  old porcelain implementations using sh
*fast-import*
  examples of fast-import script:
  - git-import.perl:
    # Performs an initial import of a directory. This is the equivalent
    # of doing 'git init; git add .; git commit'. It's a little slower,
    # but is meant to be a simple fast-import example.
  - import-zips.py: zip archive
  - import-tars.perl: tar archives
  - import-directories.perl: to import "manual" version control (using cp
    dir dir-date)
*git-jump*
  Produce vim quick-fix for git diff,merge,...
  But I think the git fugitive plugin is better
**git-resurrect.sh**
  git-resurrect attempts to find traces of a branch tip called <name>, and tries to resurrect it (using the reflog)
*git-shell-commands*
  add help and list commands to git-shell (so a user can log in and use
  these commands when restricted to git-shell)
*gitview*
  gitview - A GTK based repository browser for git
*hg-to-git*
  hg to git conversion (incremental)
*hooks*
  - post-receive-email: a (post-receive) hook to mail out commit update informations
  - pre-auto-gc-battery: a (pre-auto-gc) hook to check if we are on battery
  - setgitperms.perl: a (pre-commit/post-merge post-checkout) hook to
     save/restore full permissions and ownership data within a git working tree
  - update-paranoid: set acl for git operations (probably gitolite is
    better for this)
mw-to-git
  Gateway between MediaWiki and git
p4import
  p4 import
patches
  a patch for building the documentation with docbook
persistent-https
  The git-remote-persistent-https binary speeds up SSL operations
  by running a daemon job (git-remote-persistent-https--proxy) that
  keeps a connection open to a server.
remotes2config.sh
  Use this tool to rewrite your .git/remotes/ files into the config. (for
  old git repos)
**rerere-train.sh**
  Train rerere database from existing merge commits
**stats**
  - git-common-hash:
     This script displays the distribution of longest common hash prefixes.
     This can be used to determine the minimum prefix length to use
     for object names to be unique.
  - mailmap.pl: sort the mails of the commiters (and use mailmap but
    strangely)
  - packinfo.pl: get size information on packs
        git verify-pack -v | packinfo.pl -tree -filenames
        #0 blob 03156f21... 1767 1767 Documentation/git-lost-found.txt @ tags/v1.2.0~142
        #1 blob f52a9d7f... 10   1777 Documentation/git-lost-found.txt @ tags/v1.5.0-rc1~74
    (meaning the second file in the pack is a delta of the first)
**subtree**
  des subtrees, basées non pas sur les git submodules, mais sur le subtree merge (il s'agit en gros d'un wrapper autour pour permettre de splitter/réintégrer le projet autant de fois que l'on veut, ou de faire du git subtree pull...)

  Example:
  git my subtree -- split --prefix=paper --branch=paper
  git push newrepo paper:master #push
  git clone ~/magma/avisogenies avisogenies-paper --branch=paper #clone

  cd ~/pro/gforge/chic
  #pull from mainstream:
  git my subtree -- pull --prefix=articles/niveau ~/pro/durin/niveau master
  git merge/rebase subtree-master
  #push to upstream
  git my subtree -- push --prefix=articles/niveau ~/pro/durin/niveau subtree-master

svn-fe
  convert an SVN "dumpfile" to a fast-import stream
thunderbird-patch-inline
  helper to add inline patches in thunderbird
vim
  vim files (included in vim 7.2)
*workdir*
  Have multiple workdirs with same git repo (but independant index and HEAD) by making appropriate symlinks
  Usage: workdir <repository> <new_workdir> [<branch>]

Branches and references
=======================

## References

ref: (abbr)sha1, ou v1.7.4.2-679-g3bee7fb ou heads/master

ref@{date}: ref@{yesterday}, HEAD@{5 minutes ago}
HEAD@{n} là où HEAD était il y a n changements de HEAD (utilise le reflog)
@{-n}: the nth branch checkedout prior to the current one

ref@{upstream} ref@{u} la version d'upstream

ref^: le parent
ref^n: le n-ième parent
ref~n = ref^^^^^^ (n fois)

ref^{} c'est utilisé pour déférencer un tag jusqu'à trouver un non tag
ref^{<type>}: de même, jusqu'à trouver un truc de type type
ex: ref^{commit}, dont ref^0 est un raccourci (et ~0 a l'air aussi)

:/text: find youngest commit with test in message
ref^{/text}: find youngest commit with test in message reachable from ref

ref:path the blob (or tree) corresponding to path in ref
ref:     indique ainsi le tree pointé par ref
:n:path show the path at stage number n in the index
:path is equivalent to :0:path

### Commit ranges
(for use  in git log, produces by git rev-list)

^r1 r2: commits reachable from r2 but not r1
(shortcut: r1..r2)

r1...r2 is called symmetric difference of r1 and r2 and is defined as
    r1 r2 --not $(git merge-base --all r1 r2)

r^@: all parents of r (and commits reachable from them, but not r)
r^!: r but not any of his parent

r^-n: r^n..r
r^-: r^-1

### Symbolic links

- HEAD: pointeur courrant
- `ORIG_HEAD`:
    "pull" or "merge" or "am" always leaves the original tip of the current branch in ORIG_HEAD.
En gros c'est comme HEAD@{1}, sauf que `ORIG_HEAD` n'est mis à jour que
avant des opérations dangereuses comme pull/merge/am...
cf https://stackoverflow.com/questions/964876/head-and-orig-head-in-git

- `COMMIT_EDITMSG`: the last commit msg
- `FETCH_HEAD`: The SHAs of branch/remote heads that were updated during the
  last git fetch
- `ORIG_HEAD`: When doing a merge, this is the SHA of the branch you’re
  merging into.
- `MERGE_HEAD`: When doing a merge, this is the SHA of the branch you’re
  merging from.
- `MERGE_MODE`: Used to communicate constraints that were originally given to
  git merge to git commit when a merge conflicts, and a separate git commit
  is needed to conclude it. Currently --no-ff is the only constraints
  passed this way.
- `MERGE_MSG`: Enumerates conflicts that happen during your current merge.
- `SQUASH_MSG`: same as `MERGE_MSG` for a squash

### git rev-list:

Get all parents:
git rev-list ref

Get all childs:
git rev-list --reverse --ancestry-path ref..master
git rev-list --reverse --ancestry-path HEAD~2..
  (rajoute automatiquement HEAD à la fin)

Get the direct parents:
git rev-list -n1 --parents ref
(ou git rev-list --parents ref^! ou git rev-list --parents --no-walk ref^!)

Get the direct childs
(plus compliqué car git rev-list --children list ne donne que les enfants
qui sont dans la liste). Donc
git rev-list --all --children | grep "^"$(git rev-parse --verify ref)

Rem: A..B n'output pas A, sauf si --boundary est mis
     A...B n'output pas les premiers parents communs de A et B, sauf si
     --boundary est mis

## References and branches description

Get commit hash:
git rev-parse --verify HEAD
  38fd21489744079ec32b59c1674fea8d403bc00a
git rev-parse --short HEAD
  38fd214
git rev-parse --short=4 HEAD
  38fd

* Décrire une branche
- rev-parse
git rev-parse useful options:
  --default HEAD
  --revs-only: do not output flags and parameters not meant for git rev-list
  --symbolic/--symbolic-full-name/--abbrev-ref [implies symbolic-full-name]

git rev-parse [--short] HEAD -> 2049709d9e39bc4a2b434ed4270433ae401ae928, 2049709

- name-rev
git name-rev -> HEAD bar~1
git name-rev --name-only -> bar~1
  => se comporte comme `git describe --contains --all` mais on a un
  contrôle fin sur les tags utilisés pour la description via --refs=...

Note: describe defaults to HEAD, but not rev-parse and name-rev

* Exemples:
in a detached HEAD, 
  git rev-parse --symbolic/--abbrev-ref/--symbolic-full-name HEAD -> HEAD
  git describe --contains --all / git name-rev -> master~1
  git describe --all -> heads/foo-1-g179a062

dans une branche 'conflict'
  git rev-parse --symbolic/--abbrev-ref/--symbolic-full-name @ -> @ / conflict / refs/heads/conflict
  git describe --all -> heads/conflict
  git symbolic-ref [--short] HEAD -> refs/heads/master, master

### Plus d'exemples sur git name-rev and describe
(essentially name-rev --name-only is like describe --always --all
 but there are some subtle differences)

$ git name-rev 7bf72356cac42d31a7c515088481e392e97d9e9a
7bf72356cac42d31a7c515088481e392e97d9e9a tags/hg_branch_less_memory~10^2~65

 # restrict to tags only
$ git name-rev --tags --name-only 7bf72356cac42d31a7c515088481e392e97d9e9a
hg_branch_less_memory~10^2~65

 #by default git describe use only annotated tags
$ git describe --contains 7bf72356cac42d31a7c515088481e392e97d9e9a
hg_branch_less_memory~10^2~65

$ git name-rev c598027
c598027 master~2

$ git name-rev --tags c598027
c598027 undefined

$ git describe --contains c598027
fatal: cannot describe 'c5980272dd80f8152c5953e53e10531601b4a3e5'

 #pass --all to use annotated tags + tags + branches
$ git describe --contains --all c598027
master~2

$ git describe master
v0.6-29-gdeddeb1

$ git describe --long v0.6
v0.6-0-g5e9a58d

$ git describe --debug --all master~2
searching to describe master~2
finished search at 5e9a58d30247108903b815e1901446de41793daf
 head               2 remotes/durin/master
 annotated         27 tags/v0.6
traversed 28 commits
remotes/durin/master-2-gc598027

$ git describe --match 'v*' --all master~2
v0.6-27-gc598027

$ git name-rev  master~5
master~5 remotes/durin/master~1

$ git name-rev --refs=math\* master~5
master~5 mathrice/master~1

$ git describe --contains --all --match 'math*'  master~5
remotes/durin/master~1

$ git name-rev --refs=math\* master~1   
master~1 undefined

 # --match can fallback to another description
$ git describe --contains --all --match 'math*' master~1
master~1

$ git describe --always hg_branch_less_memory~1
d3df010

## List branches
$ git branch --contains master~1
  conflict   * master       noconflict

 #branches merged into master
$ git branch --merged=master
* master       noconflict
 #branches not merged into master
$ git branch --no-merged=master
  conflict

$ git for-each-ref #can pass --format/--[no-]merged/--contains/--points-at
a58dc46a5b7bae299671d9e0a584538d581f345e commit	refs/heads/conflict
51f8b8bcbd8478d9719854ebed5d0732dc5ef4a6 commit	refs/heads/master
a9ebe832fcf7a6be39d4a8c670de95e69e5309d8 commit	refs/heads/noconflict
51f8b8bcbd8478d9719854ebed5d0732dc5ef4a6 commit	refs/tags/ploum

 #show ref is more useful to output a series of existing ref
 #but it does not accept --format

$ git show-ref
a58dc46a5b7bae299671d9e0a584538d581f345e refs/heads/conflict
51f8b8bcbd8478d9719854ebed5d0732dc5ef4a6 refs/heads/master
a9ebe832fcf7a6be39d4a8c670de95e69e5309d8 refs/heads/noconflict
51f8b8bcbd8478d9719854ebed5d0732dc5ef4a6 refs/tags/ploum

$ git show-ref --tags
51f8b8bcbd8478d9719854ebed5d0732dc5ef4a6 refs/tags/ploum

$ git show-ref master
0b9ec7b5c2ff19b52763476d5f3937cd2df8dcca refs/heads/master
b4c18fe60168743f360a1e579b770e11c1a083c1 refs/remotes/origin/master
0b9ec7b5c2ff19b52763476d5f3937cd2df8dcca refs/remotes/third/master

$ git for-each-ref refs/heads/master #here we need to specify the full branch name

### Find all local branches
    git for-each-ref  --format='%(refname)' refs/heads/

In shell can be used as:
    eval "$(git for-each-ref --shell --format='branches+=(%(refname))' refs/heads/)"
    for branch in "${branches[@]}"; do
       echo $branch
    done

### List all remote branches

    git for-each-ref --format '%(refname)' refs/remotes/

Example:
- A merge base of all published branches
    git merge-base ${1:-HEAD} $(git for-each-ref --format '%(refname)' refs/remotes/)
- Rebase from the point at which this branch diverges from anything that's been published. This mean we can then push the branch everywhere, it won't introduce extra commits.

    git rebase $(git for-each-ref --format '%(refname)' refs/remotes/ | xargs git merge-base HEAD) "$@"

-> Look at https://github.com/aanand/git-up [obsolete]

## Upstream branches:
* set an upstream branch (summary):
- git branch -t/--track my_branch upstream_branch
- git co my_branch; git branch --set-upstream-to upstream_branch
- git push -u/--set-upstream origin foo:bar
  (for all succesfull push, set a new upstream for the pushed branch)
- git co -b foo origin/upstream
  -> automatically set origin/upstream as upstream of foo
     cf branch.autoSetupMerge, default to true => done for remote branches
        can be setup to always to also work with local branches, this is done in my .gitconfig

### Setting upstreams with `git branch`
  -t, --track
      When creating a new branch, set up configuration to mark the
      start-point branch as "upstream" from the new branch. This
      configuration will tell git to show the relationship between the
      two branches in git status and git branch -v. Furthermore, it
      directs git pull without arguments to pull from the upstream when
      the new branch is checked out.

      This behavior is the default when the start point is a
      remote-tracking branch. Set the branch.autosetupmerge configuration
      variable to false if you want git checkout and git branch to always
      behave as if --no-track were given. Set it to always if you want
      this behavior when the start-point is either a local or
      remote-tracking branch.
  --no-track
      Do not set up "upstream" configuration, even if the
      branch.autosetupmerge configuration variable is true.
  --set-upstream
      If specified branch does not exist yet or if --force has been
      given, acts exactly like --track. Otherwise sets up configuration
      like --track would when creating the branch, except that where
      branch points to is not changed.
Attention, sur la branche ploum, faire git branch --set-upstream plam
(ou bien faire git branch --set-upstream plam ploum)
veut dire que ploum est l'upstrem de plam.
git 1.8 introduit git branch --set-upstream-to plam, ce qui fera de plam
l'upstream de ploum.

### Get the upstream branch

    git describe --all --contains branch@{u}
    git name-rev branch@{u}
ne marchent pas car ils parsent le SHA-1 induit par branch@{u} (ça va
seulement marcher pour les upstream locaux, d'autre part git describe --all
sans le --contains ne marche pas forcément même pour les locaux car il peut
montrer des tags).

Il faut utiliser
    git rev-parse --abbrev-ref --symbolic-full-name branch@{u}
ou
    git for-each-ref --format='%(upstream:short)' refs/heads/branch

Feanor $ git for-each-ref --format='%(upstream:short)' $(git symbolic-ref -q HEAD)
origin/master
Feanor $ git for-each-ref --format='%(upstream)' $(git symbolic-ref -q HEAD)
refs/remotes/origin/master

Feanor $ git rev-parse --abbrev-ref --symbolic-full-name @{u}
origin/master
Feanor $ git rev-parse --symbolic-full-name @{u}
refs/remotes/origin/master

* Récupérer toutes les infos sur upstream
git for-each-ref --format='u %(upstream) %(upstream:remotename) %(upstream:remoteref)' refs/heads/
u refs/remotes/origin/conflict origin refs/heads/conflict
On peut utiliser (upstream:track) pour avoir [ahead 3, behind 1]

Exemple: en résolvant les valeurs, pour imiter ce que ferait git fetch pour
la branche:
git fetch %(upstream:remotename) %(upstream:remoteref):%(upstream)

* Pareil pour le push:
git for-each-ref --format='u %(push) %(push:track) %(push:remotename) %(push:remoteref)' refs/heads/
u refs/remotes/third/conflict2 [behind 1] third 
(bizarrement je n'ai pas la push:remoteref)

Note: on doit mettre push.default=current plutôt que simple
pour les workflow triangulaires, sinon
un `git rev-parse --abbre-ref conflict2@{push}` me donne
fatal: cannot resolve 'simple' push to a single destination
cf http://lists-archives.com/git/880630-bug-in-git-rev-parse-push.html


## git remote
git remote add ploum git://ploum.plim
->
[remote "ploum"]
  url = git://ploum.plim
  fetch = +refs/heads/*:refs/remotes/ploum/*

* Options:

-f: appelle fetch
-t <branch>: only track the specified branch
-m <master>: a symbolic-ref refs/remotes/<name>/HEAD is set up to point at remote’s <master> branch.

* Modifier ça:

git remote rename/rm/set-url/show
git remote prune:  Deletes all stale remote-tracking branches
  Essentiellement comme git remote update --prune sans la partie 'fetch'
git remote update: Fetch updates for a named set of remotes in the repository
 as defined by remotes.<group> -> ie fait un 'git fetch $remote' pour
 chaque remote spécifié dans le groupe.
 Si group n'est pas spécifié, group=default, et si remotes.default n'est pas spécifié, équivalent à git fetch --all
 With --prune option, prune all the remotes that are updated, ie passe
 --prune à 'git fetch'
git remote set-head (git remote add -m):
  Use <branch> to set the symbolic-ref refs/remotes/<name>/HEAD
  explicitly. e.g., "git remote set-head origin master" will set the
  symbolic-ref refs/remotes/origin/HEAD to refs/remotes/origin/master.
-> git remote set-head -a pour avoir le même réglage que upstream
git remote set-branches
    Changes the list of branches tracked by the named remote. This can
    be used to track a subset of the available remote branches after
    the initial setup for a remote.

* Note on git remote update vs git fetch --all: they are basically equivalent.
Cf http://stackoverflow.com/questions/1856499/differences-between-git-remote-update-and-fetch
De plus skipDefaultUpdate is an alias for skipFetchAll
       remote.<name>.skipFetchAll
           If true, this remote will be skipped by default when updating using
           git-fetch(1) or the update subcommand of git-remote(1).
       remote.<name>.skipDefaultUpdate
           If true, this remote will be skipped by default when updating using
           git-fetch(1) or the update subcommand of git-remote(1).

* Example:

[branch "tmp/pending/meta"]
  remote = debian
  merge = refs/heads/tmp/pending/meta
[branch "master"]
  remote = origin
  merge = refs/heads/tmp/pending/meta
[branch "build"] #crée en utilisant --track explicitement ici!
  remote = .
  merge = refs/heads/master

Valinor ~/dist/forks/bup/.git $ git remote show origin
* remote origin
  Fetch URL: git://github.com/bup/bup.git
  Push  URL: git://github.com/bup/bup.git
  HEAD branch: master
  Remote branches:
    master           tracked
    tmp/pending/meta tracked
  Local branch configured for 'git pull':
    master merges with remote tmp/pending/meta
  Local refs configured for 'git push':
    master           pushes to master           (fast-forwardable)
    tmp/pending/meta pushes to tmp/pending/meta (up to date)

* git-remote-ext:
helper used when <URL> begins with ext::.
Examples:
- "ext::ssh -i /home/foo/.ssh/somekey user@host.example %S foo/repo"
  Like host.example:foo/repo, but use /home/foo/.ssh/somekey as keypair and
  user as user on remote side. This avoids needing to edit .ssh/config

## Pushing and pulling
* A propos des thin packs: http://stackoverflow.com/questions/1583904/what-are-gits-thin-packs

### Fetch
* Fetch options

git fetch --all
git fetch --multiple:
           Allow several <repository> and <group> arguments to be
           specified. No <refspec>s may be specified.
git fetch --tags/--no-tags: git fetch récupére les tags qui sont les
  parents des branches fetchés. Ces options récupèrent tous les tags/aucun.

* Fetch all
- git remote {update, prune, update --prune}
- git fetch --all, --prune #basically equivalent

### Push
* Push options
git push --prune: enlever les branches remotes qui n'existent plus localement
git push --mirror: tout synchroniser
git push -u, --set-upstream
    For every branch that is up to date or successfully pushed, add
    upstream (tracking) reference,

--follow-tags
   Push all the refs that would be pushed without this option, and
   also push annotated tags in refs/tags that are missing from the
   remote but are pointing at commit-ish that are reachable from the
   refs being pushed.
   [activated via push.followTags in my .gitconfig]

* Push all:
git push --all #push all branches under refs/heads/
git push --mirror #push really *all* branches
git push --tags #add tags to be pushed (ie refs/tags)

- Push to all remotes:
https://stackoverflow.com/questions/5785549/able-to-push-to-all-git-remotes-with-the-one-command
$ git remote | xargs -L1 git push --all
   -L: max-lines, -R replace-str

I have these tow aliases:
  pushall="!f() { git remote | xargs -P0 -L1 -I R -- git push R $@; }; f"
  pushask="!f() { git remote | xargs -P0 -p -L1 -I R -- git push R $@; }; f"

- Ou configurer un 'all' repo:
git remote add all origin-host:path/proj.git
git remote set-url --add --push all duostack-host:path/proj.git
(Note: one needs to do `git fetch --all` if the duostack-host repo is also
tracked)

Exemple:
  $ git remote add origin https://exampleuser@example.com/path/to/repo1
  $ git remote set-url --push --add origin https://exampleuser@example.com/path/to/repo1
  $ git remote set-url --push --add origin https://exampleuser@example.com/path/to/repo2
  $ git remote set-url --push --add origin https://exampleuser@example.com/path/to/repo3

  [remote "origin"]
    url = https://exampleuser@example.com/path/to/repo1
    pushurl = https://exampleuser@example.com/path/to/repo1
    pushurl = https://exampleuser@example.com/path/to/repo2
    pushurl = https://exampleuser@example.com/path/to/repo3
    fetch = +refs/heads/*:refs/remotes/origin/*

- If you only want to pull from repo1 but push to repo1 and repo2 for a specific branch specialBranch:

  [remote "origin"]
      url = ssh://git@aaa.xxx.com:7999/yyy/repo1.git
      fetch = +refs/heads/*:refs/remotes/origin/*
      ...
  [remote "specialRemote"]
      url = ssh://git@aaa.xxx.com:7999/yyy/repo1.git
      pushurl = ssh://git@aaa.xxx.com:7999/yyy/repo1.git
      pushurl = ssh://git@aaa.xxx.com:7999/yyy/repo2.git
      fetch = +refs/heads/*:refs/remotes/origin/*
      ...
  [branch "specialBranch"]
      remote = origin
      pushRemote = specialRemote

- I also have the following scripts:
  $ vcs pushall [-o orig] [folders...]
  	git push --prune --all $orig
  	git push --prune --tags $orig
  $ gitfolders --mirror durin mathrice
  => vcs pushall -o $name $topush

## git-config for branch/push/pull/remotes
* branch
       branch.<name>.remote
           When in branch <name>, it tells git fetch and git push which remote
           to fetch from/push to. It defaults to origin if no remote is
           configured.  origin is also used if you are not on any branch.
       branch.<name>.pushRemote
           When on branch <name>, it overrides branch.<name>.remote for
           pushing. It also overrides remote.pushDefault for pushing from
           branch <name>. When you pull from one place (e.g. your upstream)
           and push to another place (e.g. your own publishing repository),
           you would want to set remote.pushDefault to specify the remote to
           push to for all branches, and use this option to override it for a
           specific branch.
       branch.<name>.merge
           Defines, together with branch.<name>.remote, the upstream branch
           for the given branch. It tells git fetch/git pull/git rebase which
           branch to merge and can also affect git push (see push.default).
           When in branch <name>, it tells git fetch the default refspec to be
           marked for merging in FETCH_HEAD. The value is handled like the
           remote part of a refspec, and must match a ref which is fetched
           from the remote given by "branch.<name>.remote". The merge
           information is used by git pull (which at first calls git fetch) to
           lookup the default branch for merging. Without this option, git
           pull defaults to merge the first refspec fetched. Specify multiple
           values to get an octopus merge. If you wish to setup git pull so
           that it merges into <name> from another branch in the local
           repository, you can point branch.<name>.merge to the desired
           branch, and use the special setting .  (a period) for
           branch.<name>.remote.
       branch.<name>.mergeoptions
           Sets default options for merging into branch <name>. The syntax and
           supported options are the same as those of git-merge(1), but option
           values containing whitespace characters are currently not
           supported.
       branch.<name>.rebase
           When true, rebase the branch <name> on top of the fetched branch,
           instead of merging the default branch from the default remote when
           "git pull" is run. See "pull.rebase" for doing this in a non
           branch-specific manner.

* push
       push.default
           Defines the action git push should take if no refspec is given on
           the command line, no refspec is configured in the remote, and no
           refspec is implied by any of the options given on the command line.
           Possible values are:
           ·    nothing - do not push anything.
           ·    matching - push all branches having the same name in both
               ends. This is for those who prepare all the branches into a
               publishable shape and then push them out with a single command.
               It is not appropriate for pushing into a repository shared by
               multiple users, since locally stalled branches will attempt a
               non-fast forward push if other users updated the branch.
               This is currently the default, but Git 2.0 will change the
               default to simple.
           ·    upstream - push the current branch to its upstream branch.
               With this, git push will update the same remote ref as the one
               which is merged by git pull, making push and pull symmetrical.
               See "branch.<name>.merge" for how to configure the upstream
               branch.
           ·    simple - like upstream, but refuses to push if the upstream
               branch’s name is different from the local one. This is the
               safest option and is well-suited for beginners. It will become
               the default in Git 2.0.
           ·    current - push the current branch to a branch of the same
               name.
       push.followTags/recurseSubmodules

* remote
       remote.pushDefault
           The remote to push to by default. Overrides branch.<name>.remote
           for all branches, and is overridden by branch.<name>.pushRemote for
           specific branches.
       remote.<name>.url
           The URL of a remote repository. See git-fetch(1) or git-push(1).
       remote.<name>.pushurl
           The push URL of a remote repository. See git-push(1).
       remote.<name>.fetch
           The default set of "refspec" for git-fetch(1). See git-fetch(1).
       remote.<name>.push
           The default set of "refspec" for git-push(1). See git-push(1).
       remote.<name>.mirror
           If true, pushing to this remote will automatically behave as if the
           --mirror option was given on the command line.
       remote.<name>.prune
           When set to true, fetching from this remote by default will also
           remove any remote-tracking references that no longer exist on the
           remote (as if the --prune option was given on the command line).
           Overrides fetch.prune settings, if any.
       remote.<name>.skipDefaultUpdate
           If true, this remote will be skipped by default when updating using
           git-fetch(1) or the update subcommand of git-remote(1).
       remote.<name>.skipFetchAll
           If true, this remote will be skipped by default when updating using
           git-fetch(1) or the update subcommand of git-remote(1).
       remote.<name>.tagopt
           Setting this value to --no-tags disables automatic tag following
           when fetching from remote <name>. Setting it to --tags will fetch
           every tag from remote <name>, even if they are not reachable from
           remote branch heads. Passing these flags directly to git-fetch(1)
           can override this setting. See options --tags and --no-tags of git-
           fetch(1).
       remote.<name>.vcs
           Setting this to a value <vcs> will cause git to interact with the
           remote with the git-remote-<vcs> helper.
       remotes.<group>
           The list of remotes which are fetched by "git remote update
           <group>". See git-remote(1).

## Examples of push and pull configurations

  [remote "plim"]
    fetch = +refs/heads/*:refs/remotes/plum/*
    url = /tmp/git/ploum
  [branch "plam"]
    remote = plim
    merge = refs/heads/plam
    pushRemote = "bar" #fallback sur remote.pushDefault
  [remote "bar"]
    push = +toto:titi #si non défini, fallback to push.default:=simple

Résumé: Sur la branche plam
- git fetch -> git fetch plim -> git fetch plim +refs/heads/*:refs/remotes/plum/* refs/heads/plam
[toutes les branches sont aussi mises dans FETCH_HEAD, mais seule
refs/heads/plam n'est pas marquée comme not-for-merge]
- git pull ... -> git fetch ... && git merge FETCH_HEAD
- git push -> git push bar -> git push +toto:titi

git fetch --all = git remote update
  + --prune: prune local remote branches that were deleted in the remote
  + --prune --prune-tags: also prune local tags
git push --all: push all refs/heads/
git push --prune: prune branches that don't exist locally on the remote
git push --mirror: mirror all refs/

### Fetching
Sur la branche plam.
1) git fetch
- Sur la branche plam le remote associé est plim donc on fait git fetch plim
(par défaut si branch.plam.remote n'est pas configuré le remote est origin)
-> git fetch branch.plam.remote
2) git fetch plim
- Pour plim la refspec est `+refs/heads/*:refs/remotes/plum/*`, donc on
fait `git fetch plim +refs/heads/*:refs/remotes/plum/*`
- De plus comme branch.<current_branch>.remote=plim *et*
  branch.<current_branch>.merge=ref/heads/plam, il fetche le plam upstream
  qu'il met dans `.git/FETCH_HEAD`, mais il ne crée pas de branche, ie il
  fait git fetch plim ref/heads/plam:
  (en effet `git fetch origin ploum plam` met ploum et plam dans FETCH_HEAD)
- Si aucun des deux n'est spécifié, équivalent à git fetch plim HEAD:
-> git fetch plim remote.plim.fetch (+ branch.plam.merge si plim=branch.plam.remote)
3) `git fetch origin +refs/heads/*:refs/remotes/origin/*`
- récupérère toutes les refs/heads/ de origin dans refs/remotes/origin/
(et le + veut dire qu'on a le droit de faire des non fast forward).
-> git fetch origin +refs/heads/ploum:refs/remotes/origin/ploum
pour chaque ploum dans refs/heads/
4) git fetch origin ploum:plam plim plum: :plam
Fetch le ploum de origin et le met dans la branche plam
(fetch refuse de faire ça si plam est la branche actuelle)
Fetch plim et plum (dans FETCH_HEAD), mais ne les mets dans aucune branche.
Fetch le HEAD de origin et le met dans plam

### Pulling
Le cas de `FETCH_HEAD`:
(See http://git.661346.n2.nabble.com/FETCH-HEAD-question-td2339060.html)
1) git fetch mets toutes les branches qu'il a fetché dans `FETCH_HEAD`:
ae402e7192814f4d25e24ee541cbb4d441d02b7c                branch 'b1' of /tmp/git/ploum
5000aee06507f1ff98a461e3a7c43891d9fefd7b        not-for-merge   branch 'master' of /tmp/git/ploum
2) Dans le cas du fetch d'une glob refspec _dans le fichier de conf_, les
branches refspecs sont marquées 'not-for-merge' (ce n'est pas le cas quand
elles sont données en ligne de commande)
Sinon, lorsque remote.plimo.fetch est utilisée et a des refspecs non glob, la
première telle refspec est incluse dans les trucs à merger, sauf si
branch.current.remote est plimo, dans ce cas c'est branch.current.merge qui
prend précédence

Ex:
[remote "origin"]
  url = /tmp/ploum
  fetch = +refs/heads/master:refs/remotes/origin/master
[branch "master"]
  remote = origin
  merge = refs/heads/conflict
FETCH_HEAD:
1f7e8ef1872bd0ee5436e360b2cd3edc825242da                branch 'conflict' of /tmp/ploum
73d0516bdb94300023da9715d2a7b39b114cae79        not-for-merge   branch 'master' of /tmp/ploum

3) `FETCH_HEAD` se comporte comme un 'extended SHA-1' (ie comme HEAD ou une
branche), et l'utiliser comme tel donne le premier SHA-1 qu'il contient
(comme le montre git rev-parse `FETCH_HEAD`)
  Donc par exemple, on peut faire git fetch origin new-patch (qui fetche
  new-path, n'update pas de branche locale mais juste `FETCH_HEAD`), et
  faire `git log -p FETCH_HEAD` pour voir les commits introduits dans le
  patch.
4) Exception: dans git pull, il appelle sed pour construire tous les
commits de `FETCH_HEAD` qui ne sont pas en not-for-merge (dans `$merge_head`).
Il génère le merge message avec
    merge-msg=git fmt-merge-msg $log_arg <"$GIT_DIR/FETCH_HEAD"
(fmt-merge-msg est intelligent: déjà il skippe les not-for-merge, et il
skippe aussi un merge s'il est parent d'un autre merge)
et fait
    git merge "$merge-msg" $merge-heads
En particulier, git pull, c'est différent de git fetch && git merge `FETCH_HEAD`
quand il y a plusieurs branches.
[Mise à jour: en regardant le git de git je vois que ça a changé en Mai 2015
(merge bcd1ecd08a644a19adfebb31a72a4e608e077c6d) et que git merge
FETCH_HEAD a appris à gérer les octopus merge, et que git pull foo est bien
équivalent à git fetch foo et git merge foo!]

### Pushing

git push repo refspec fait le dual de fetch, par contre on ne peut pas
  pusher sur une branche qui est checkoutée actuellement dans repo.

git push repo ploum : équivalent à git push repo ploum:ploum
git push repo ':' : équivalent à pusher les 'matching' branches
git push repo '+' : pareil, sauf qu'on a le droit au non ff
git push repo :ploum : écrase la branche ploum dans repo

git push repo --mirror: pushe toute les refs, cad update les refs communes,
  crée les nouvelles réfs, et supprime celles de repo qui ne sont pas chez nous.

git push repo : équivalent à git push repo remote.repo.push si ce dernier
  est non nul, sinon applique la stratégie push.default (qui par défaut est
  'simple': ie fait git push repo branch.current.merge si
  branch.current.pushRemote=repo; et que la branche upstream a le même nom que
  la branche actuelle
  NOTE si la branche n'existe pas dans le remote, elle est crée avec le
  même nom avec la stratégie simple)

git push : équivalent à git push branch.current.pushRemote,
  si ce dernier n'est pas défini, fallback sur remote.pushDefault, puis fallback sur branch.current.remote, et sinon utilise l'option --repo, et sinon utilise origin

(Non symétrie par rapport git fetch/pull:
- `git fetch :` est un raccourci pour `git fetch HEAD` (qui met donc le
  remote HEAD  dans FETCH_HEAD) alors que `git push :` push les matching
  branches
- `git fetch :ploum` mets HEAD dans ploum alors que git push :ploum détruit ploum)
- `git push` fait `git push branch.current.remote` (en fallback de
  pushRemote) puis utilise `remote.repo.push` s'il existe.
  C'est seulement après qu'il regarde push.default, et donc éventuellement
  push la branche actuelle.
  Alors que git fetch utilise branch.current.merge en même temps
  que remote.repo.fetch si branch.current.remote est le remote actuel.)

Note: quand on fait `git push origin master:foo`, ça pushe la branche
master dans origin/foo, et en plus ça met à jour localement 'remotes/origin/foo'

Pour pusher dans plusieurs remotes: https://stackoverflow.com/questions/14290113/git-pushing-code-to-two-remotes
git remote set-url origin --push --add user1@repo1
git remote set-url origin --push --add user2@repo2

### config
* push.default
nothing/current/upstream/simple/matching
- simple: like upstream, ie push @{upstream} but only if the upstream branch has the same name
  simple est un peu compliqué: si la branche branch1 a pour remote
  foo, et que l'on fait 'push foo', alors branch1 est pushé si l'upstream a
  le même nom (et crée la branche si elle n'existe pas). Par contre 'push
  bar' va toujours pusher branch1 dans bar. Mais du coup, si
  pushRemote=bar, un 'git push' va faire un 'git push bar' qui va bien
  marcher. Moralité: autant utiliser 'current' comme stratégie.
- matching: push all branches having the same name on both ends, was the default

* refspec, +refspec, -f/--force
Dans git fetch/push/pull, git action refspec ne fait que des ff
Si on fait git action +refspec, il autorise les non fastforwards, mais il
  faut quand même que la remote ref soit un ancêtre de la ref locale
git -f override tout ça

* remote.ploum.skipDefaultUpdate

Si remote.ploum.skipDefaultUpdate = true
alors le remote ploum n'est pas fetché par
git fetch --all ou git remote update,
même si ploum est l'upstream de la branche actuelle

Par contre, git fetch ploum et git remote update ploum marchent

Enfin remote.ploum.skipFetchAll a l'air d'être un alias (une recherche sur
le patch qui l'a introduit montre que c'est le cas).

### Wrappers

https://news.ycombinator.com/item?id=14385813
-> git-town.com essentially implement these aliases
topic-start = "!f(){ branch=$1; git checkout master; git fetch; git rebase; git checkout -b "$branch" master; };f"
topic-pull = "!f(){ branch=$(git branch-name); git checkout master; git pull; git checkout "$branch"; git rebase master; };f"
topic-push = "!f(){ branch=$(git branch-name); git push --set-upstream origin "$branch"; };f"
topic-finish = "!f(){ branch=$(git branch-name); git checkout master; git branch --delete "$branch"; git push origin ":$branch"; };f"
branch-name = rev-parse --abbrev-ref HEAD 

-> je préfère faire
g my update master; g co -b branch master / g rebase...
create and publish a new branch: 
  git co -b [-t] mybranch && git push [-u] origin mybranch
delete branch: 
  git branch -d branch && git push origin :branch

-> g my grb
- create branch_to_create:
List of operations to do to create a new remote branch and track it locally:
git push origin cur_branch:refs/heads/branch_to_create
git fetch origin
git branch --track branch_to_create origin/branch_to_create
git checkout branch_to_create

- delete branch_to_delete:
List of operations to do to delete a local and a remote branch:
git push origin :refs/heads/branch_to_delete
git branch -d branch_to_delete

- publish branch_to_publish:
List of operations to do to publish an existing local branch:
git push origin branch_to_publish:refs/heads/branch_to_publish
git fetch origin
git branch -u origin/branch_to_publish branch_to_publish #-u: --set-upstream-to
git checkout branch_to_publish

- rename branch_to_rename:
List of operations to do to rename a remote branch and its local tracking branch:
git push origin cur_branch:refs/heads/branch_to_rename
git fetch origin
git branch --track branch_to_rename origin/branch_to_rename
git checkout branch_to_rename
git push origin :refs/heads/cur_branch
git branch -d cur_branch

- track
List of operations to do to track an existing remote branch:
git fetch origin
git branch --track branch_to_track origin/branch_to_track

Expert usage:
=============

## git layout

* $GIT_DIR layout
`man gitrepository-layout`

- $GIT_DIR, --git-dir: .git/, .git file: 'gitdir: <path>'
- $GIT_COMMON_DIR, .git/commondir: used for objects, refs, packed-refs, config, branches, info, remotes, logs, shallow, worktrees, and can be specified by the file 'commondir'
- $GIT_WORK_TREE, --work-tree, core.worktree: path to the root of the working tree
  Note: if GIT_COMMON_DIR is set, this is ignored because this is a setting that applies only to the main worktree
  Used eg in absorbed submodules

objects/[0-9a-f][0-9a-f]
objects/pack
objects/info/{packs,alternates,http-alternates,commit-graph,commit-graphs/}
refs/{heads,tags,remotes}/name
refs/replace/<obj-sha1>
packed-refs, HEAD
config, config.worktree
branches/, remotes/, hooks/, common/, commondir, modules/, shallow
index, sharedindex.<SHA-1>
info/{refs,grafts,exclude,attributes,sparse-checkout}
logs/refs/{heads,tages}/name
worktrees/<id>/{gitdir,locked,config.worktree}

* Worktree exemple:
foo1 is a worktree ,the .git is 'gitdir: /tmp/test/foo/.git/worktrees/foo1'
In foo/.git/worktrees/foo1, commondir='../..' and gitdir='/tmp/test/foo1/.git'

Config: When extensions.worktreeConfig is enabled, the config file .git/worktrees/<id>/config.worktree is read after .git/config is.

* Format version
core.repositoryformatversion=0 (default)
                            =1 (=> allows extensions)
extensions.preciousObjects=true # objects in the repository MUST NOT be deleted (e.g., by git-prune or git repack -d) -> usefull for alternates
extensions.partialclone=promisor_remote
extensions.worktreeConfig #read from config then config.worktree

* Branches:
HEAD: symref 'ref: refs/heads/master'
$GIT_DIR/{remotes,branches}: alternate (legacy) ways to specify remotes, cf `git-fetch#REMOTES`

* Grafts and replace:
- replace (git-replace) -> refs/replace/
- grafts (obsolete): cf https://blog.developer.atlassian.com/grafting-earlier-history-with-git/
  .git/info/grafts: <commit sha1> <parent sha1> [<parent sha1>]*

* Alternates and namespaces
$GIT_ALTERNATE_OBJECT_DIRECTORIES
objects/info/alternates

Maintenance: git repack -adl -> skip alternates objects
             git repack -ad -> pack all objects, including alternates ones
  Cf https://git-blame.blogspot.com/2012/08/bringing-bit-more-sanity-to-alternates.html

Exemple:
$ git clone --shared foo bar
$ cat bar/.git/objects/info/alternates
-> /tmp/test/foo/.git/object
$ git clone --reference foo bar baz # clone bar but use foo as an alternate
Note: adding --dissociate after --shared or --reference will then run `git repack -a -d` to recover the objects and remove the alternates file.

Namespaces: $GIT_NAMESPACE, --namespace=foo
  Git supports dividing the refs of a single repository into multiple
  namespaces, each of which has its own branches, tags, and HEAD. Git can
  expose each namespace as an independent repository to pull from and push
  to, while sharing the object store, and exposing all the refs to
  operations such as git-gc(1).
  Storing multiple repositories as namespaces of a single repository avoids
  storing duplicate copies of the same objects, such as when storing
  multiple branches of the same source. The alternates mechanism provides
  similar support for avoiding duplicates, but alternates do not prevent
  duplication between new objects added to the repositories without ongoing
  maintenance, while namespaces do.
Cf https://stackoverflow.com/questions/24564351/how-do-i-use-git-namespaces-locally

* Optimisations:
- reftable: https://github.com/google/reftable
- commit graph: core.commitGraph=true (default) => read the commit-graph file,
  fetch.writeCommitGraph=true -> also write it during a fetch
- multi pack index: https://github.com/libgit2/libgit2/issues/5399
- delta island: https://github.blog/2019-02-24-highlights-from-git-2-21/#delta-islands
- bitmap indexes: https://github.blog/2015-09-22-counting-objects/
  `git repack -b,--write-bitmap-index`, repack.writeBitmaps=true
- Index: split index (cf git-update-index): core.splitIndex=true, untracked cache: core.untrackedCache=true, index.version=4 (`git update-index --index-version 4`), file system monitor: core.fsmonitor
  Untracked cache: https://stackoverflow.com/questions/44205477/how-do-i-get-rid-of-the-warning-untracked-cache-is-disabled-on-this-system -> The untracked cache saves its current state in the UNTR index extension

Cf also in git-config: feature.experimental, feature.manyFiles
feature.experimental => pack.useSparse=true, fetch.negotiationAlgorithm=skipping, fetch.writeCommitGraph=true
feature.manyFiles => index.version=4, core.untrackedCache=true

## tree-objects
http://stackoverflow.com/questions/9594169/create-a-git-tree-from-working-tree-without-touching-the-index

write-tree: create a tree object from the index
-> use GIT_INDEX_FILE to not modify the 'true' index

mktree: create a tree object from an input similar to ls-tree


Ex: checkouting a subdir in a tree:

git checkout treeish -- subdir
  -> use --work-tree=path (or GIT_WORK_TREE) to co somewhere else
  -> use GIT_INDEX_FILE in order to not override the index entries

## Index
### Intro
The index store the stat of all files
 git add ploum
   touch ploum
   git diff-files
will show that ploum has changed (of course git diff-files -p will show
nothing)

One can use git update-index --refresh to get up to date stats in the index

Options to do that:
  git checkout-index -u: update stat information for the checked out entries
  git read-tree -m tree: when merging one tree, this is the same as reading
    the tree, but use stat informations from the index when the content is
    the same (in order to not give wrong stat info for these files)

Note: most porcelain command run git update-index --refresh before running,
for instance git diff, git status or git checkout. But gitk does not, so
sometimes one has to call git status and reload gitk. Also: zsh vcscommand
also calls git update-index --refresh.

Features: assume-unchanged, skip-worktree, refresh/really-refresh,
cacheinfo/info-only, index-info, split index, untracked cache, file system
monitor (cf man git-update-index)

### git update-index

--assume-unchanged: git suppose que le fichier n'est pas changé, et donc peut
le reverter à tout moment.
si le fichier a changé: git co va refuser de fonctionner, mais git reset va
rechanger le fichier (et enlever le flag)
si le fichier a changé upstream, git co va updater le fichier (et enlever
le flag)
Attention: en particulier, git stash va sauver le fichier stagé (car assume
unchanged) puis faire un git reset, donc le changement sera perdu!

--skip-worktree: ne prend pas en compte le fichier dans le worktree
si le fichier a changé: git co va refuser de fonctionner, et git reset ne
fait rien
si le fichier a changé upstream, git co va updater le fichier (et laisser
le flag)

--info-only: pour rajouter un fichier dans l'index, sans le mettre dans
l'object database. Par exemple si on veut juste savoir si des fichiers ont
changé, pas connaitre leurs contenu
--cacheinfo  <mode>,<object>,<path>:  pour enregistrer dans l'index un fichier qui est dans la base
mais plus dans le working dir
    ex:git update-index --cacheinfo 100755 $(perl -lne 'print unless (/^#/)' post_load | git hash-object -w --stdin) post_load
      pour changer post_load dans l'index sans changer le fichier
    #!/bin/sh (stage-part)
    start_line=$1
    end_line=$2
    path=$3
    mode=$(git ls-files -s $path | awk '{print $1}')
    blob_id=$(
        (
            head -n $(expr $start_line - 1) $path
            cat
            tail -n +$(expr $end_line + 1) $path
            ) | git hash-object -w --stdin
        )
    exec git update-index --cacheinfo $mode $blob_id $path
    for example echo "HELLO WORLD" | ./stage-part 8 10 post_load will replace the three lines from 8-10 with just "HELLO WORLD".

### git read-tree

Sparse-checkout: si core.sparseCheckout=true, alors
git regarde si .git/info/sparse-checkout existe. Ce fichier est comme
.gitignore et donne tous les fichiers à *checkouter* (mettre !unwanted pour
un fichier à ne pas checkouter). Tous les autres fichiers auront le
skip-worktree mis par git read-tree. Ca permet de spécifier les
skip-worktree bit automatiquement (attention, si on veut arrêter, les
skip-worktree qui ont déjà été ajoutés seront toujours là!)

## Checkout de l'index

git checkout ploum prend ploum dans l'index
  ajouter -f pour ignorer les unmerged entries au lieu de fail
  en cas de merge: --ours pour sélectionner le stage2
                   --theirs pour le stage3
                   --merge/-m pour remettre le conflit originel
                   --conflict=diff3 pour mettre le diff3
  (autre méthode pour récupérer le stage1:
    git checkout-index --stage=1 (-f) ploum
      ou rajouter --temp pour juste le voir
    git checkout-index --stage=all ploum
      implies --temp, show all index states
  )

Cf aussi
  git show :ploum (lire le stage 0 dans l'index de ploum)
  git show :1:ploum, :2:ploum, ....
  git show HEAD:ploum (le ploum dans HEAD)
  git show ploum (montre le diff enrengistré dans le commit actuel de
  ploum)

En résumé:
WD     -        Staging       -     History
-> git add                  git commit
<- git checkout -- files    git reset -- files
Shortcut: --> git commit -a
          <-- git checkout HEAD -- files
cf:
http://stackoverflow.com/questions/3639342/whats-the-difference-between-git-reset-and-git-checkout

## Commit
git commit: prend le stage et le commite
git commit -a: fait un git add -u avant
git commit --amend:
       It is a rough equivalent for:
                   $ git reset --soft HEAD^
                   $ ... do something else to come up with the right tree ...
                   $ git commit -c ORIG_HEAD
       but can be used to amend a merge commit.

git commit --interactive/--patch(=-p)
 fais l'équivalent de git add ploum, upstream recommande plutôt de passer par git add -p et git diff  que de faire le git commit -p

git commit -o foo bar: ne commite que foo et bar
    If this option is specified together with --amend, then no paths need to be
    specified, which can be used to amend the last commit without committing
    changes that have already been staged.
git commit -i foo bar: commit foo et bar et le stage
git commit foo bar: comme git commit -o foo bar

       -m <msg>, --message=<msg>
           Use the given <msg> as the commit message.
       -t <file>, --template=<file>
           When editing the commit message, start the editor with the contents
           in the given file. The commit.template configuration variable is
           often used to give this option implicitly to the command. This
           mechanism can be used by projects that want to guide participants
           with some hints on what to write in the message in what order. If
           the user exits the editor without editing the message, the commit
           is aborted. This has no effect when a message is given by other
           means, e.g. with the -m or -F options.
       -C <commit>, --reuse-message=<commit>
           Take an existing commit object, and reuse the log message and the
           authorship information (including the timestamp) when creating the
           commit.
       -c <commit>, --reedit-message=<commit>
           Like -C, but with -c the editor is invoked, so that the user can
           further edit the commit message.
       -F <file>, --file=<file>
           Take the commit message from the given file. Use - to read the
           message from the standard input.
       -e, --edit, --no-edit
         edit the commit mesage:
           The message taken from file with -F, command line with -m, and from
           file with -C are usually used as the commit log message unmodified.
           This option lets you further edit the message taken from these
           sources.

       --fixup=<commit>
           Construct a commit message for use with rebase --autosquash. The
           commit message will be the subject line from the specified commit
           with a prefix of "fixup! ". See git-rebase(1) for details.
       --squash=<commit>
           Construct a commit message for use with rebase --autosquash. The
           commit message subject line is taken from the specified commit with
           a prefix of "squash! ". Can be used with additional commit message
           options (-m/-c/-C/-F). See git-rebase(1) for details.
       --reset-author
           When used with -C/-c/--amend options, or when committing after a a
           conflicting cherry-pick, declare that the authorship of the
           resulting commit now belongs of the committer. This also renews the
           author timestamp.


## Merge and checkout
### Overview and plumbing behaviour: git read-tree

* Notes sur git read-tree:

git read-tree commit remplace l'index par l'index de commit.

git read-tree -m commit: conserve le stat de l'index actuel pour les
fichiers qui n'ont pas changés. Avec -u update le worktree pour chaque
fichié updaté dans l'index. *Important:* n'update l'index que si
l'index actuel est égal au worktree (-i enlève ce check, incompatible avec
-u).

git read-tree --reset commit: fait comme git read-tree -m commit, mais
remet à 0 les unmerged entries. *Important:* ne fait pas le check
sur index=work-tree (ie --reset est presque comme -mi, sauf qu'on peut
rajouter -u).
Une autre différence avec git read-tree -u c'est qu'en cas d'unmerged
entries, git read-tree -u abort alors que --reset les reset.

git read-tree -m HEAD branch fait un 3-way merge entre l'index et la
branche, avec ancetre commun HEAD (fast forward...)
S'il y a des changements non stagé, il continue sauf si il y a
un conflit avec un des ces changements dans le merge.

git read-tree -m OLD NEW1 NEW2 fait un 3-way merge entre OLD, NEW1 et NEW2.
En particulier, s'il y a des trucs dans l'index non commité, il aborte.
Par contre, comme précedememnt, s'il y a des changements non stagé, il
continue sauf si il y a un conflit avec un des ces changements dans le
merge.

Dans les deux cas, quand il y a un changement non stagé et que le merge
fait un conflit, on peut quand même continuer en rajoutant l'option -i
Cette option est incompatible avec l'option -u (update the working tree),
parce que pour le coup on perdrait le changement local...

Dans le cadre d'un three way merge (non fast forward), on a les options
suivantes:
git read-tree --trivial: dans le cas d'un three-way merge, abort s'il y a
un file level merging to do (en gros ne marche que s'il n'y a que les
merges triviaux que fait git read-tree -m à faire)
git read-tree --aggressive: rajoute les files delete dans les opérations
triviales qui sont faites


### git merge / git checkout

git merge calcule automatiquement s'il faut faire un fast forward ou un
3-way merge.

git co -m fait aussi un 3-way merge (non trivial!) lors du changement de
branche avec les modifs locales (sinon il refuse), alors qu'avec -f il
overwrite les changements locaux

git merge et git co marchent si le changement ne concerne pas des fichiers non stagés ou stagés mais pas commités.
Si le merge en concerne un, git co refuse de procéder, sauf si on passe -m.
Dans ce cas le working tree est mergé (non trivial), et l'index stagé mais
non commité est perdu (le nouveau index a le stage 1 et le stage 2 des
versions mergées)
Quand à git merge il refuse de fonctionner.

Enfin, git stash ajoute tout le working tree dans le commit, et enregistre
l'état de l'index dans un parent (l'autre parent du stash commit est le
dernier commit). L'index courant est rétabli à celui du dernier commit,
sauf si on passe --keep-index, dans ce cas le commit est toujours le
working tree, mais il ne revient pas au dernier commit, il revient à la
version stagée (et laisse le staged aread tel quel)

### Résumé

* 3 way merge

git write-tree -m ancetre tree1 tree2
si le changement affecte une dirty file (meaning un truc stagé ou changé
dans le working tree), aborte

git merge branche2
en gros fait
- calculer l'ancetre commune
- git write-tree -m ancetre brancheactuelle branche2
- git merge-index git-merge-one-file -a
- si il n'y a pas de conflits fait un commit
en particulier, si le changement affecte une dirty file, aborte
Note: s'il y a plusieurs ancetres communs possible, l'algo plus haut est ce
que fait l'algo resolve. L'algo recursive (par défaut) fait des merges des
ancêtres d'abord.

* Fast forward
  Niveau référence: git write-tree ne change pas de ref, git merge ou git
  reset --soft avance la branche pointée par HEAD (sachant que merge
  vérifie qu'il s'agit bien d'un fast forward...), git checkout change HEAD
  directement.

  git checkout: aborte si le changement affecte une dirty file
  git checkout -m: fait un vrai 3-way merge entre le HEAD, le fichier dans le workdir et la target. Attention: le stage d'un fichier mergé est remplacé par le stage1 (HEAD) et le stage 2 (target)

 git merge: si il y a un changement conflictuel, refuse de fast forward
 git read-tree -m HEAD target: pareil (mais si le conflit ne concerne que le working tree et pas l'index, rajouter -i passe outre, si on ne met pas -u qui updaterait le working tree)

## History change
### git commit --amend: change le dernier commit

### git rebase pour rejouer les patchs sur la nouvelle branche:
git rebase --onto newbase base topic
  -> checkout sur topic
  -> les commits base..HEAD sont sauvés
  -> la branche est resettée sur newbase
  -> les commits sauvés sont réappliqués sur newbase
si le --onto n'est pas spécifié, newbase=base
si topic n'est pas spécifié, prend la branche courrante
ex:
  o---o---o---o---o  master
                    \
                     o---o---o---o---o  next
                                      \
                                       o---o---o  topic

  git rebase --onto master next topic
               o---o---o---o---o  master
                   |            \
                   |             o'--o'--o'  topic
                    \
                     o---o---o---o---o  next

git rebase -p: préserver les merges

En cas de merge failure:
- resolver à la main et faire git rebase --continue
- git rebase --skip
- git rebase --abort pour s'arrêter

       -f, --force-rebase
           Force the rebase even if the current branch is a descendant of the
           commit you are rebasing onto. Normally non-interactive rebase will
           exit with the message "Current branch is up to date" in such a
           situation. Incompatible with the --interactive option.

### git rebase -i/--interactive

           pick deadbee The oneline of this commit
           pick fa1afe1 The oneline of the next commit

pick: cherry-pick
reword: edit the commit message
fixup/squash: fold the commits on top of the last picked commit
       If you want to fold two or more commits into one, replace the command
       "pick" for the second and subsequent commits with "squash" or "fixup".
       If the commits had different authors, the folded commit will be
       attributed to the author of the first commit. The suggested commit
       message for the folded commit is the concatenation of the commit
       messages of the first commit and of those with the "squash" command,
       but omits the commit messages of commits with the "fixup" command.
edit: rend la main à l'utilisateur (qui peut commiter autant qu'il veut)
  jusqu'à ce qu'il appelle git rebase --continue

       --autosquash, --no-autosquash
           When the commit log message begins with "squash! ..." (or "fixup!
           ..."), and there is a commit whose title begins with the same ...,
           automatically modify the todo list of rebase -i so that the commit
           marked for squashing comes right after the commit to be modified,
           and change the action of the moved commit from pick to squash (or
           fixup).
           This option is only valid when the --interactive option is used.
           If the --autosquash option is enabled by default using the
           configuration variable rebase.autosquash, this option can be used
           to override and disable this setting.
       --no-ff
           With --interactive, cherry-pick all rebased commits instead of
           fast-forwarding over the unchanged ones. This ensures that the
           entire history of the rebased branch is composed of new commits.
           Without --interactive, this is a synonym for --force-rebase.

### git cherry-pick
Comme git rebase mais spécifie exactement les commits à cherry-picker (git rebase est un wrapper au dessu)

git cherry-pick --continue/--quit/--abort

       -e, --edit
           With this option, git cherry-pick will let you edit the commit
           message prior to committing.
       -x
           When recording the commit, append a line that says "(cherry picked
           from commit ...)" to the original commit message in order to
           indicate which commit this change was cherry-picked from. This is
           done only for cherry picks without conflicts.
       -n, --no-commit
           Usually the command automatically creates a sequence of commits.
           This flag applies the changes necessary to cherry-pick each named
           commit to your working tree and the index, without making any
           commit. In addition, when this option is used, your index does not
           have to match the HEAD commit. The cherry-pick is done against the
           beginning state of your index.
       -s, --signoff
           Add Signed-off-by line at the end of the commit message.
       --ff
           If the current HEAD is the same as the parent of the cherry-pick’ed
           commit, then a fast forward to this commit will be performed.
       --keep-redundant-commits
           If a commit being cherry picked duplicates a commit already in the
           current history, it will become empty. By default these redundant
           commits are ignored. This option overrides that behavior and
           creates an empty commit object. Implies --allow-empty.

Note: git rebase n'applique pas les commits qui ont déjà été cherry-pickés.
Par contre, git cherry-pick si.

### grafts et git replace

Si on veut remplacer le parent d'un commit, mais garder les mêmes fichiers (pas rejouer les diff comme avec git rebase):
1) Utiliser les grafts
echo "$commit-id $graft-id" >> .git/info/grafts
2) Rendre ça permanent:
git filter-branch $graft-id..HEAD

Ou bien créer un nouveau commit avec un faux parent, et utiliser git replace
(les grafts ça fait un peu l'équivalent du script replace_first_parent)

  # …---o---A---o---o---…
  #
  # …---o---B---b---b---…
  #
  # We want to transplant B to be "on top of" A.
  # The tree of descendants from B (and A) can be arbitrarily complex.

  replace_first_parent() {
      old_parent=$(git rev-parse --verify "${1}^1") || return 1
      new_parent=$(git rev-parse --verify "${2}^0") || return 2
      new_commit=$(
        git cat-file commit "$1" |
        sed -e '1,/^$/s/^parent '"$old_parent"'$/parent '"$new_parent"'/' |
        git hash-object -t commit -w --stdin
      ) || return 3
      git replace "$1" "$new_commit"
  }
  replace_first_parent B A

  # …---o---A---o---o---…
  #          \
  #           C---b---b---…
  #
  # C is the replacement for B.

cf http://stackoverflow.com/questions/3810348/setting-git-parent-pointer-to-a-different-parent

### git filter-branch
Le plus puissant: changer les fichiers commités avec git filter-branch

-env-filter <command>
           This filter may be used if you only need to modify the environment
           in which the commit will be performed.
--tree-filter <command>
           This is the filter for rewriting the tree and its contents.
--index-filter <command>
           This is the filter for rewriting the index. It is similar to the
           tree filter but does not check out the tree, which makes it much
           faster.
-parent-filter <command>
           This is the filter for rewriting the commit’s parent list.
--msg-filter <command>
           This is the filter for rewriting the commit messages.
--commit-filter <command>
           This is the filter for performing the commit.
--tag-name-filter <command>
           This is the filter for rewriting tag names.
--subdirectory-filter <directory>
           Only look at the history which touches the given subdirectory.
--prune-empty
           Some kind of filters will generate empty commits, that left the
           tree untouched. This switch allow git-filter-branch to ignore such
           commits.

ex: enlever un fichier du repo
git filter-branch --index-filter 'git rm --cached --ignore-unmatch filename' HEAD
Puis pour vraiment rendre ça effectif:
· Clone it with git clone file:///path/to/repo. The clone will not
  have the removed objects. See git-clone(1). (Note that cloning with
  a plain path just hardlinks everything!)
Sinon (plus dangereux), enlever le reflog
- Remove the original refs backed up by git-filter-branch:
  git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
- git reflog expire --expire=now --all
- git gc --prune=now

## Modifying the worktree from a tree
git read-tree, git checkout, git reset can modify the index+the worktree.
Also git checkout modify HEAD (either with a symbolic-ref for a new branch,
or an update-ref --no-deref for a detached head), and git reset too
(directly via a git update-ref)

### Paths
git reset tree -- paths: put the index back to paths (if empty, tree=HEAD)
git checkout tree -- paths: put the index and worktree back to paths (if
empty, tree=index)

### Commits
git reset --mixed: fait un git read-tree -v --reset
git reset --hard: fait un git read-tree -v --reset -u

git checkout: fait un git read-tree -mu $old $new (ie a fast forward)
git checkout -f: fait un git read-tree --reset -u (ie comme git reset --hard)
git checkout -- :/  reset le worktree à ce qu'il y a dans l'index
git checkout -m: fait un git checkout et s'il y a conflit fait un merge-recursive $old -- $new $worktree, mais en restaurant l'index

git read-tree -mu: pour chaque fichier modifié dans l'index, mets à jour le
worktree

git cherry-pick -n commit: prend le diff introduit par 'commit' et
l'applique (update le worktree et l'index)

git diff commit1 commit2 | git-apply [--index,--cached]
Applique le diff au worktree (et à l'index avec --index, uniquement à
l'index avec --cached)

Astuce: pour faire une opération qui change le tree et l'index, mais garde
le même HEAD, on peut reseter le HEAD à sa place originale ainsi:

branch=$(git current-branch -al)
eval "$@" #for example git checkout -m ploum
echo "Switching back to $branch"
case $branch in
  refs/heads/* )
    #update the branch pointed by HEAD
    git symbolic-ref -m "Update tree: moving back to $branch" HEAD "$branch"
    ;;
  *)
    #update HEAD directly
    git update-ref --no-deref -m "Update tree (detached): moving back to $branch" HEAD "$branch"
    ;;
esac

## Merge individual files
http://stackoverflow.com/questions/9122948/run-git-merge-algorithm-on-two-individual-files

    git merge-file <current-version> <common-ancestor> <other-version>
This places the results in the current version file; if you want them elsewhere, use:
    git merge-file -p <current> <common> <other> > <dest>
If no common-ancestors:
    git merge-file -p <file1> /dev/null <file2>

http://stackoverflow.com/questions/449541/how-do-you-merge-selective-files-with-git-merge

    git checkout -p (complement git add -p)

    git diff commit1 commit2 filepattern | git-apply --index
ou
    git diff ... | git apply [-3] --include=filepattern [--exclude=...]

Divers
======
## Choses apprises sur la ML de git

### commit removed files
git ls-files --deleted -z | xargs -0 git rm

### Pour partager des objets sur les répos:
git clone -l (hard links), alternates, namespaces

### git add
  -N, --intent-to-add
    Record only the fact that the path will be added later.
    An entry for the path is placed in the index with no
    content. This is useful for, among other things, showing
    the unstaged content of such files with git diff and
    committing them with git commit -a.

### Commiting external files
http://stackoverflow.com/questions/505467/can-i-store-the-git-folder-outside-the-files-i-want-tracked
You just need to ensure that the repository knows where the work tree is and vice versa.
To let the repository know where the work tree is, set the configuration value core.worktree. To let the work tree know where it's git directory is, add a file named .git (not a folder!) and add a line like
gitdir: /path/to/repo.git
You can initialize a new "external" repository with
git --git-dir=/path/to/repo.git --work-tree=. init && echo "gitdir: /path/to/repo.git" > .git
Your current directory will be the working tree and git will use the repository at /path/to/repo.git. The init command will automatically set the core.worktree value as specified with the --git-dir parameter.
You could even add an alias for this:
[alias]
    initexternal = !"f() { git --work-tree=. --git-dir=\"$1\" init && echo \"gitdir: $1\" >> .git; }; f"

-> allow to add a file not in the workdir: git --work-tree=.. add ../a
(but git co a will checkout a in ., need to use git co --work-tree=.. a to check it in the right directory)

### See who worked on a file
git-who file = git shortlog -sn -- file: see who worked on file

### Getting number of lines modified:
http://codeimpossible.com/2011/12/16/Stupid-Git-Trick-getting-contributor-stats/
git log --author="Jared Barboza" --pretty=tformat: --numstat
(numstat c'est comme stat mais en machine friendly)

### Diff against the first version of the file that was commited
git diff $(git log --follow --pretty=%H $1| tail -n 1) $1

###  How to have local versions of tracked config files in git
https://gist.github.com/canton7/1423106
Note: the best for my usecase is simply to set the skip-worktree bit

### Use git-svn with --prefix
http://blog.tfnico.com/2013/08/always-use-git-svn-with-prefix.html

### gitlink
http://stackoverflow.com/questions/4161022/git-how-to-track-untracked-content
The answer gives a nice explanation on the difference between gitlink and
submodule (essentially submodules are a wrapper around gitlink, a gitlink
is obtained by git adding a git folder)+ how to convert it to a submodule
or use subtree merge strategy.

### git merge -theirs
This does not exist, but can be emulated via:
  git checkout deployment
  #do a trivial merge, keeping our changes
  git merge --no-commit -s ours working
  #replace our changes by their changes
  git read-tree -m -u working
  #commit
  git commit -m "Update to $(git describe working)"

Cf: http://thread.gmane.org/gmane.comp.version-control.git/76650/focus=163631
For a discussion

Or more plumbing based, without the need for the checkout:
  d="$(git rev-parse deployment)"
  w="$(git rev-parse working)"
  m="Update deployment to $(git describe working)"
  c="$(echo "$m" | git commit-tree -p $d -p $w working^{tree})
  git update-ref -m "$m" deployment $c $d
  unset c d w
Cf http://fanf.livejournal.com/128282.html

### patch based workflow:
Cf http://thread.gmane.org/gmane.comp.version-control.git/235783
with links also to
- http://fanf.livejournal.com/128282.html
- https://github.com/msysgit/msysgit/blob/master/share/msysGit/merging-rebase.sh

### swap commits
   git rebase -i HEAD~2
   swap the two commits

### git ls-files flags
gmane: 240301

You can use `git ls-files --debug` and `git ls-files --stage` to get all
the information about the files in the index.  The meaning of the flags
is the only thing that's not shown by the command, and I don't think
there is a tool yet to examine them.

The undocumented --resolve-undo flag to git ls-files shows you the
resolve undo data that is stored in the index.

If you build git yourself, the `test-dump-cache-tree` helper can be used
to show all information about the cache-tree that is stored in the
index.

The you can get the version of the index either by using
`test-index-version` when you build git yourself, or by using `file
.git/index`, which in addition will give you the number of entries that
are in the index.

### Get upstream status
gmane: 241385

git merge-base --is-ancestor
git rev-list --left-right @{upstream}...HEAD
git rev-list --left-right --count @{upstream}...HEAD

### Whitespace fix
gmane: 242016

[alias]
wsadd = "!sh -c 'git diff -- \"$@\" | git apply --cached --whitespace=fix;\
          git co -- ${1-.} \"$@\"' -"

### git stash list

One thing that would be nice is if there was built-in "git stash list"
option which only shows the stash items which match the current
branch.  The discussion on this thread inspired me to create the
following:

b=$(git symbolic-ref HEAD | sed -e 's;refs/heads/;;')
git stash list --pretty="%gd %cr on: %s" | grep "WIP on $b" | \
    sed -e "s/ WIP on $b: [0-9a-f]*//"

### merge files
http://stackoverflow.com/questions/9122948/run-git-merge-algorithm-on-two-individual-files
I wrote two times on ruby-application, commited one, and now want to merge
the current version with the one that is in the commit.
$ git show master:./ruby-applications > ruby-applications-master
$ cp ruby-applications ruby-applications-worktree

### use git log to look at the commit above the previous one that modified ruby-applications
$ git show 855c491783ee097262bb9225bef34ee52c034432:./ruby-applications > ruby-applications-ancestor
$ git merge-file -p <current> <common> <other> > <dest>
$ git merge-file -p ruby-applications-worktree ruby-applications-ancestor ruby-applications-master > ruby-applications-merge
$ gitdiff ruby-applications ruby-applications-merge

### multiple url for one remote
http://stackoverflow.com/questions/849308/pull-push-from-multiple-remote-locations
git remote set-url --add

### Get full repo size
  # count the on-disk size of all objects
  git cat-file --batch-all-objects --batch-check='%(objectsize)
%(objectsize:disk)' |
  perl -alne '
    $repo += $F[0];
    $disk += $F[1];
    END { print "$repo / $disk = ", $repo/$disk }
  '

## Sitaram:
http://sitaramc.github.com/master-toc.html#index

### Recovering a dropped stash:
    =========================

    http://sitaramc.github.com/tips/recover-dropped-stash.html#tips_recover_dropped_stash_recovering_a_dropped_stash__

* the GUI way
You dropped a stash that was created recently, and now you want to recover
it. As long as you did not do a garbage collection in between, this should
work:
    gitk $(git fsck | grep commit | cut -f3 -d' ') --since='1 week ago'
The part within the parenthesis finds all unreachable commit objects and
returns their hashes. If you never did a garbage collect there might be too
many false positives so the --since clause (which you can adjust to
whatever you want of course; mine is just an example) limits the display to
commits created recently.
A "stash" has a very recognisable, triangular, shape in the commit DAG, and
with gitk you can visually find stashes really fast. For me, this is the
kind of task that calls out for a GUI -- infrequently required, no
conceivable need to automate, and containing data that stands out visually.

* the command line way
git fsck --unreachable | grep commit | cut -d\  -f3 |
xargs git log --no-walk --merges --grep='^\(WIP on \|On \)\((no branch)\|[^
]\+\):'

* Look at the reflog with gitk
     gitk --all `git reflog | cut -c1-7`

### conflicts on pull/merge
    =======================
- try gitk --merge conflictedpath
       --merge
           After an attempt to merge stops with conflicts, show the commits on
           the history between two branches (i.e. the HEAD and the MERGE_HEAD)
           that modify the conflicted files and do not exist on all the heads
           being merged.
- `git diff MERGE_HEAD...HEAD` (note the three dots) shows you differences between the common ancestor and your HEAD.
- similarly `git diff HEAD...MERGE_HEAD` shows you differences between the common ancestor and the branch you're trying to merge
- git checkout --conflict=diff3 conflictedpath is a novel way of getting all 3 versions into the file so you can hack at it in vim
       --conflict=<style>
           The same as --merge option above, but changes the way the
           conflicting hunks are presented, overriding the merge.conflictstyle
           configuration variable. Possible values are "merge" (default) and
           "diff3" (in addition to what is shown by "merge" style, shows the
           original contents).
-  you can tell git blame to only show important changes, like so (pity it does not work with the GUI blame)
    git blame -C $(git merge-base HEAD MERGE_HEAD).. conflicted_path

### Fixup whitespace errors:
http://sitaramc.github.com/the-list-and-irc/whitespace-index-filter.html#the_list_and_irc_whitespace_index_filter_fixup_whitespace_errors_

### git show-branch
http://sitaramc.github.com/2-command-line-usage/git-tasks.html#2_command_line_usage_git_tasks_git_command_line_usage_cheatsheet_quickref_
    git show-branch -a is useful to get a bird's eye view of all your branches and their topological relationships.
    git show-branch -gN (N is some number) shows you reflog info for the current branch, including topological relationships and relative time. This is useful if you had a lot of rebases or amended commits and you think you might need one of them back :-) See reflog for more on this
    if you need serious troubleshooting with branches, use the following. It may be useful in some contexts where git lg is too complex to figure out what tip contains what commit, and you are unable to use gitk
    git show-branch $(git show-ref -h |cut -c41-)

## Divers:
### Size of files (find big files)
http://naleid.com/blog/2012/01/17/finding-and-purging-big-files-from-git-history

git verify-pack -v .git/objects/pack/pack-*.idx | egrep "^\w+ blob\W+[0-9]+ [0-9]+ [0-9]+$" | sort -k 3 -n -r > bigobjects.txt

git rev-list --objects --all | sort -k 2 > allfileshas.txt #hash and name
git rev-list --objects --all | sort -k 2 | cut -f 2 -d\  | uniq # uniq files
git gc && git verify-pack -v .git/objects/pack/pack-*.idx | egrep "^\w+ blob\W+[0-9]+ [0-9]+ [0-9]+$" | sort -k 3 -n -r > bigobjects.txt #SHA-1 type size size-in-packfile offset-in-packfile depth base-SHA-1
touch bigtosmall.txt && for SHA in `cut -f 1 -d' '  < bigobjects.txt`; do
echo $(grep $SHA bigobjects.txt) $(grep $SHA allfileshas.txt) | awk '{print $1,$3,$7}' >> bigtosmall.txt
done; #SHA, size, name

### Transform a subdirectory into a submodule:
git subtree split --prefix=@infos --branc @infos --annotate='(split) '
commit="@infos"
cd /tmp
git clone --branch $commit --single-branch ~/mine
cd ~mine
mv @infos @infos.bak
mv /tmp/mine @infos
git rm --cached @infos
git submodule add ./@infos
rm -rf @infos/*
mv @infos.bak/* @infos
rmdir @infos.bak

### git rebase -theirs strategy:
http://stackoverflow.com/questions/2945344/how-do-i-select-a-merge-strategy-for-a-git-rebase
git rebase <branch> -s recursive -X theirs / ours

### differing commits in branches
cf http://stackoverflow.com/questions/16037623/simplest-possible-way-git-can-output-the-number-of-commits-between-branch-and:
  git rev-list --count --left-right @...@{push}
=> git my topic cherry / git ch

### open all files with conflicts

git diff --name-only --diff-filter=U | uniq  | xargs $EDITOR

### Rebasing multiple branches at once

- https://stackoverflow.com/questions/5628236/when-git-rebasing-two-branches-with-some-shared-history-is-there-an-easy-way-to/5631439#5631439
-> make a fake merge commit and use `git rebase -p`

Another solution given is to use
git rebase --committer-date-is-author-date --preserve-merges --onto A* A C
git rebase --committer-date-is-author-date --preserve-merges --onto A* A B
where the commiter-date... is there to keep the common commits having the same sha1 

- https://stackoverflow.com/questions/9407234/git-maintaining-many-topic-branches-on-a-frequently-moving-base
  Perl script top automate the above merge trick (to speedup we could use
  git new-workdir)

  # Construct a placeholder commit that has all topics as parent.
  HEADS="$(git for-each-ref refs/heads/\*)" &&
  MAGIC_COMMIT=$(echo "Magic Octopus"$'\n\n'"$HEADS" |
    git commit-tree \
      $(git merge-base $(echo "$HEADS" | sed 's/ .*//' ))^{tree} \
      $(echo "$HEADS" | sed 's/ .*//;s/^/-p /')) &&
  git update-ref refs/hidden/all $MAGIC_COMMIT
  # Rebase the whole lot at once.
  git rebase --preserve-merges master refs/hidden/all
  # Resolve conflicts and all that jazz.
  # Update topic refs from the rebased placeholder.
  PARENT=
  echo "$HEADS" |
  while read HASH TYPE REF
  do
    let ++PARENT
    git update-ref -m 'Mass rebase' "$REF" refs/hidden/all^$PARENT "$HASH"
  done

  More complete version here:
  https://github.com/nornagon/git-rebase-all/blob/master/git-rebase-all
  => incorporated into git rebuild

- Other github scripts that do this:
  https://github.com/goncalopp/git-utilities
  => written in python, it reimplements manually --rebase-merge essentially
  (meaning that it rebase the first branch, calculate the new fork point,
  and so on...)

* On this topic: cousins in rebase
https://stackoverflow.com/questions/56529435/what-is-the-behavior-of-the-cousins-options-in-git-rebase-rebase-merges

...--o--*--o---o   <-- main
      \  \
       \  A--B---F--G   <-- branch
        \       /
         C--D--E

By default --rebase-merges will just move A B F G to main and merge with
the original C D E. With -rebase-merges=rebase-cousins then C D E are also
moved before the merge

## Small scripts to do small things

From: https://github.com/ConradIrwin/git-aliae

~~~ <8  git-shunt ~~~
  #!/bin/bash -e
  # moves the most recent commit to the other branch
  # (useful if you've just realised that you committed in the wrong place!)
  if git rev-parse --verify "$1" >/dev/null
  then
      git reset HEAD^ --keep
      git checkout -m "$1"
      git cherry-pick "HEAD@{2}"
  fi
~~~

~~~ <8 git-swap ~~
  #!/bin/bash
  # Switches the order of the two most recent commits.
  if [ "$1" = "--ed" ]
  then
    ed -s $2 <<EOF
  1m2
  wq
  EOF
  
  else
    EDITOR="$0 --ed" git rebase -i HEAD~2
  fi
~~~

~~~ <8 git-stash-wrap ~~~
  #!/bin/bash
  #wrap operation around stash
  STASHED="$(git stash)"
  git "$@" && [ "$STASHED" = "No local changes to save" ] || git stash pop
~~~

~~~ <8 git-switch-trees ~~~
  #!/bin/zsh -e
  #
  # Switch the two most-recent *trees*, but keep the commits otherwise the same.
  # This is useful in the case you want to split one commit into two but if you
  # hate the "e" mode of git uncommit -p.
  #
  # Instead you just edit your working tree until it represents the commit you'd
  # like to insert into the history, commit that, switch trees, and then work out
  # how to fix the commit messages :p.
  first=$(git commit-tree $(git rev-parse HEAD^{tree}) -p $(git rev-parse HEAD^^) <<(git log -1 --format=%B HEAD^))
  second=$(git commit-tree $(git rev-parse HEAD^^{tree}) -p $first <<(git log -1 --format=%B HEAD))
  git reset $second --keep
  
  # Same, but switching the two most-recent *messages*
  first=$(git commit-tree $(git rev-parse HEAD^^{tree}) -p $(git rev-parse HEAD^^) <<(git log -1 --format=%B HEAD))
  second=$(git commit-tree $(git rev-parse HEAD^{tree}) -p $first <<(git log -1 --format=%B HEAD^))
  git reset $second --keep
~~~

~~~ <8 git-remerge ~~~
  #!/bin/bash -e
  
  #git-remerge other merge
  #go back to 'merge^' and merge other against it
  #then rebase HEAD into this new merge
  head=$(git symbolic-ref HEAD)
  head_commit=$(git rev-parse HEAD)
  other=${1:?meh}
  merge=$(git rev-parse --verify "$2")
  
  echo "Remerging $other into $head at $merge"
  echo "(currently $head == $head_commit)"
  
  if [ "$(git merge-base $head $other)" = "$(git rev-parse $other)" ];
  then
      echo "Merge up-to-date"
      exit 1
  fi
  
  if [ "$(git rev-list --no-walk --parents $merge | wc -w)" != "3" ]
  then
      echo "$2 was not a merge?"
      exit 1
  fi
  
  git reset --hard $merge^
  git merge $other
  newhead=$(git rev-parse HEAD)
  git reset --hard $head_commit
  git rebase --onto $newhead $merge
  
  ## Size of commits, see thread from gmane.git:243498
  # Sort commits by number of files changed:
  for commit in $(git log --pretty=oneline | cut -d " " -f 1); do
    nbr=$(git show --pretty="format:" --name-only $commit | wc -l)
    echo "$nbr: $commit"
  done | sort
  
  # Show sizes of each commit
  git rev-list --all|while read i;do echo -n "$i "; git ls-tree -lr
  $i|awk '{a+=$4;} END {print a;}';done
  
  # Show sizes of each subdir in each commit
  git rev-list --objects --all |
  git cat-file --batch-check="%(objectsize:disk) %(rest)" |
  perl -lne '
    my ($size, $path) = split / /, $_, 2;
    next unless defined $path; # commit obj
    do {
      $sizes{$path} += $size;
    } while ($path =~ s{/[^/]+$}{});
  
    END { print "$sizes{$_} $_" for (keys %sizes) }
  ' |
~~~

Git gone https://github.com/eed3si9n/git-gone/blob/master/git-gone
Remove "gone" branches:

    gone="$BRANCH/.*: gone]"
    git branch -vv | grep "$gone" | awk '{print $1}' | xargs git branch -d

## git ls-files

git ls-tree         # files and directories, top level only
git ls-tree -l      # also show the size of the object
git ls-tree -d      # only directories
git ls-tree -r      # recurse, only files
git ls-tree -r -d   # recurse, only directories
git ls-tree -r -t   # recurse, both directories and files
git ls-files -d -m  # deleted files and modified files (deleted files are also counted as modified, so may come up twice...
git ls-files -s     # what's in the index; includes files that were "git add"ed
git ls-files -u     # conflicted files
git ls-files -o     # "other files"; includes EVERYthing not in d/m/s, I think seems to be equal to untracked + ignored
git ls-files --exclude-standard -o    # untracked files only
git ls-files --exclude-standard -o -i # ignored files only

## GIT_PAGER
       core.pager
           Text viewer for use by Git commands (e.g., less). The value is
           meant to be interpreted by the shell. The order of preference is
           the $GIT_PAGER environment variable, then core.pager configuration,
           then $PAGER, and then the default chosen at compile time (usually
           less).

           When the LESS environment variable is unset, Git sets it to FRX (if
           LESS environment variable is set, Git does not change it at all).
           If you want to selectively override Git’s default setting for LESS,
           you can set core.pager to e.g.  less -S. This will be passed to the
           shell by Git, which will translate the final command to LESS=FRX
           less -S. The environment does not set the S option but the command
           line does, instructing less to truncate long lines. Similarly,
           setting core.pager to less -+F will deactivate the F option
           specified by the environment from the command-line, deactivating
           the "quit if one screen" behavior of less. One can specifically
           activate some flags for particular commands: for example, setting
           pager.blame to less -S enables line truncation only for git blame.

           Likewise, when the LV environment variable is unset, Git sets it to
           -c. You can override this setting by exporting LV with another
           value or setting core.pager to lv +c.

## Hash function transition plan
https://public-inbox.org/git/CA+dhYEViN4-boZLN+5QJyE7RtX+q6a92p0C2O6TA53==BZfTrQ@mail.gmail.com/T/

## Performance optimisations
See also https://public-inbox.org/git/20170403211644.26814-1-avarab@gmail.com/

- git status: core.untrackedCache, core.fsmonitor
  core.commitGraph, pack.useBitmaps (default to yes)

  git-commit-graph(1)
      Write and verify Git commit-graph files.
      write -> .git/objects/info/commit-graph
  Cf https://devblogs.microsoft.com/devops/supercharging-the-git-commit-graph/

  Multi packs: git multi-pack-index
  Cf https://github.blog/2019-02-24-highlights-from-git-2-21/

## potential git alias
  interdiff = !sh -c 'git show "$1" > .git/commit1 && git show "$2" > .git/commit2 && interdiff .git/commit[12] | less -FRS' - # Calling "interdiff" between commits: if upstream applied a slightly modified patch, and we want to see the modifications, we use the program interdiff of the patchutils package.
  graphviz = !"f() { echo 'digraph git {' ; git log --pretty='format:  %h -> { %p }' \"$@\" | sed 's/[0-9a-f][0-9a-f]*/\"&\"/g' ; echo '}'; }; f" # Use graphviz for display. Eg: $ git graphviz --first-parent HEAD~100..HEAD~60 | dotty /dev/stdin

## mailing lists
- public inbox: https://public-inbox.org/public-inbox-v2-format.html
- Incorporated in lore.kernel.org: https://lore.kernel.org/git/
