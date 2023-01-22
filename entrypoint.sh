#!/bin/sh

set -e

# Get the repository owner and name
OWNER=$(jq -r .repository.owner.login < "$GITHUB_CONTEXT")
REPO=$(jq -r .repository.name < "$GITHUB_CONTEXT")

# Get the user's permissions for the repository
PERMISSIONS=$(curl -s -H "Authorization: token $GITHUB_TOKEN" -H "Accept: application/vnd.github+json" https://api.github.com/repos/$OWNER/$REPO/collaborators/$GITHUB_ACTOR/permission)

echo "User permissions: $PERMISSIONS $GITHUB_ACTOR "

# check if the user is a maintainer
if [ "$PERMISSIONS" = "admin" ] || [ "$PERMISSIONS" = "write" ]; then
    echo "true" > $GITHUB_ENV/is_maintainer
else
    echo "false" > $GITHUB_ENV/is_maintainer
fi

# check if the user is an admin
if [ "$PERMISSIONS" = "admin" ]; then
    echo "true" > $GITHUB_ENV/is_admin
else
    echo "false" > $GITHUB_ENV/is_admin
fi

# check if the user is an owner
if [ "$OWNER" = "$GITHUB_ACTOR" ]; then
    echo "true" > $GITHUB_ENV/is_owner
else
    echo "false" > $GITHUB_ENV/is_owner
fi