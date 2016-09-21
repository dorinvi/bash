#!/bin/bash

# Find git repos and loop over them:
for repo in `find . -type d -name ".git"`
do
    # cd to the dir that contains .git/:
    dir=`echo ${repo} | sed -e 's/\/.git/\//'`
    cd ${dir}
    echo ${dir}
    git checkout -b uatd-1.2.2
    git push -u origin uatd-1.2.2
    cd - &> /dev/null
done
