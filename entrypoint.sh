#!/bin/sh

# Get the repository name and owner
repository="${repository%\"}"
repository="${repository#\"}"


OWNER=$(echo $repository | awk -F/ '{print $1}')
REPO=$(echo $repository | awk -F/ '{print $2}')

echo $repository
echo $OWNER
echo $REPO
# echo "REPO: $REPO
# echo "GITHUB_ACTOR: $GITHUB_ACTOR"

# Check if the user is a maintainer
# IS_MAINTAINER=$(curl -s -H "Authorization: token $github_token" https://api.github.com/repos/$OWNER/$REPO/collaborators/$GITHUB_ACTOR/permission | jq -r .permission)
# if [ "$IS_MAINTAINER" = "admin" ] || [ "$IS_MAINTAINER" = "write" ]; then
#     echo "User is a maintainer"
#     echo "is_maintainer=true" >> $GITHUB_OUTPUT
# else
#     echo "User is not a maintainer"
#     echo "is_maintainer=false" >> $GITHUB_OUTPUT
# fi

echo "make call"
# curl -w "%{http_code}\n" -s -H "Authorization: token $github_token" https://api.github.com/repos/$OWNER/$REPO/collaborators/$GITHUB_ACTOR/permission | jq '.permissions'

IS_MAINTAINER2=$(curl -s -H "Authorization: token $github_token" https://api.github.com/repos/$OWNER/$REPO/collaborators/$GITHUB_ACTOR/permission | jq -r '.permissions.maintain')
echo $IS_MAINTAINER2

echo "check roles..."

IS_MAINTAINER=$(curl -s -H "Authorization: token $github_token" https://api.github.com/repos/$OWNER/$REPO/collaborators/$GITHUB_ACTOR | jq '.permissions.maintain')
if [ "$IS_MAINTAINER" = "true" ]; then
    echo "User is a maintainer"
    echo "is_maintainer=true" >> $GITHUB_OUTPUT
else
    echo "User is not a maintainer"
    echo "is_maintainer=false" >> $GITHUB_OUTPUT
fi

# Check if the user is an admin
IS_ADMIN=$(curl -s -H "Authorization: token $github_token" https://api.github.com/repos/$OWNER/$REPO/collaborators/$GITHUB_ACTOR/permission | jq -r .permission)
if [ "$IS_ADMIN" = "admin" ]; then
    echo "User is an admin"
    echo "is_admin=true" >> $GITHUB_OUTPUT
else
    echo "User is not an admin"
    echo "is_admin=false" >> $GITHUB_OUTPUT
fi

# Check if the user is the owner
if [ "$OWNER" = "$GITHUB_ACTOR" ]; then
    echo "User is the owner"
    echo "is_owner=true" >> $GITHUB_OUTPUT
else
    echo "User is not the owner"
    echo "is_owner=false" >> $GITHUB_OUTPUT
fi
