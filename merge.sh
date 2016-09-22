#!/bin/bash

# Find git repos and loop over them:
for repo in `find . -type d -name ".git"`
do
    # cd to the dir that contains .git/:
    dir=`echo ${repo} | sed -e 's/\/.git/\//'`
    cd ${dir}
    echo ${dir}
    git checkout master
    git pull origin master
    git merge uat-branch
    git push origin master
    cd - &> /dev/null
done

#http://stackoverflow.com/questions/5601931/best-and-safest-way-to-merge-a-git-branch-into-master
