#!/bin/bash
VERSION=1.2.2-qa
BRANCH=qa-branch
AUTH=ZG9yaW52aTo1MjhjY2ZjYzY0OTNhMTVlNWIyNjMzNDdlNTg2MWIyYTJjNTYxNDQ5

###########
API_JSON=$(printf '{"tag_name": "v%s","target_commitish": "%s","name": "v%s","body": "Release of version %s","draft": false,"prerelease": false}' $VERSION $BRANCH $VERSION $VERSION)
AUTH_HEAD=$(printf 'Authorization: Basic %s' $AUTH)

for repo in `gh re --list --type private`
do
  if [[ ! $repo =~ "cookbook" && ! $repo =~ "toolkit" && ! $repo =~ "chef" ]]
  then
    echo Tagging repository $repo  branch $BRANCH with version v$VERSION. 
#    curl --header "${AUTH_HEAD}" --data "${API_JSON}" https://api.github.com/repos/${repo}/releases
  fi
done
