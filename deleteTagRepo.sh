#!/bin/bash
VERSION=1.2.2-qa
AUTH=ZG9yaW52aTo1MjhjY2ZjYzY0OTNhMTVlNWIyNjMzNDdlNTg2MWIyYTJjNTYxNDQ5

###########
AUTH_HEAD=$(printf 'Authorization: Basic %s' $AUTH)

for repo in `gh re --list --type private`
do
  if [[ ! $repo =~ "cookbook" && ! $repo =~ "toolkit" && ! $repo =~ "chef" ]]
  then
    echo Deleting tag v$VERSION from  repository $repo. 
    curl -X "DELETE" --header "${AUTH_HEAD}"  https://api.github.com/repos/${repo}/git/refs/tags/v$VERSION
  fi
done
