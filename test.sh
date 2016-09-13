#!/bin/bash
TOKEN="ZG9yaW52aTo1MjhjY2ZjYzY0OTNhMTVlNWIyNjMzNDdlNTg2MWIyYTJjNTYxNDQ5"
OWNER="connectedhometeam"
AUTH=$(printf 'Authorization: Basic %s' $TOKEN)

RESPONSE=$(curl --verbose --silent  --header "${AUTH}" https://api.github.com/orgs/$OWNER/repos?page=1 2>&1)

HEADER=`grep '< Link' <<< "$RESPONSE"`
if [[ $HEADER == *"first"* ]]
then
  echo "Last page!";
fi

RESPONSE=`grep svn_url <<< "$RESPONSE"`
RESPONSE=${RESPONSE//'"svn_url":'}

for repo in $RESPONSE
do
  repo=${repo//'"'}
  repo=${repo//','}
  echo "$repo"
done
