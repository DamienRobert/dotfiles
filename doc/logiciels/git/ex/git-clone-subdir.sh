#!/bin/bash
#
# git-subdir.sh
# clone only a subdirectory using filter-branch --subdirectory-filter

git clone --no-hardlinks $1 $2

cd $2

git filter-branch --subdirectory-filter $2 --prune-empty --tag-name-filter cat HEAD -- --all

## cleaning up unwanted history

git reset --hard

git remote rm origin

refbak=$(git for-each-ref --format="%(refname)" refs/original/)

if [ -n "$refbak" ];then
    echo -n $refbak | xargs -n 1 git update-ref -d
fi

git reflog expire --expire=now --all

git repack -ad

git gc --aggressive --prune=now

##############################################
# lighter solution using sparse checkout and not deleting the full history
#######################

## You still need to clone the whole repository, which will have all the
## files. You could use the --depth flag to only retrieve a limited amount of
## history.
##
## Once the repository is cloned, the read-tree trick limits your "view" of
## the repository to only those files or directories that are in the
## .git/info/sparse-checkout file.
##
## I wrote a quick script to help manage the sparseness, since at the moment
## it is a bit unfriendly:
##
## #!/bin/sh
## echo > .git/info/sparse-checkout
## for i in "$@"
## do
##       echo "$i" >> .git/info/sparse-checkout
## done
## git read-tree -m -u HEAD
##
## So you can run git sparse foo/ bar/ to only "checkout" the foo and bar
## directories, or git sparse '*' to get everything back again.
