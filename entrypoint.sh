#!/bin/sh

REPO_NAME=$(jq -r '.repository.name' ${{toJson(github.event)}})
USERNAME=$(jq -r '.actor.login' ${{toJson(github.event)}})

# Get user permissions
PERMISSIONS=$(curl -H "Authorization: token ${{secrets.GITHUB_TOKEN}}" -s https://api.github.com/repos/${{REPO_NAME}}/collaborators/${{USERNAME}} | jq -r 'to_entries|map("\(.key)=\(.value)")|.[]')

# Set output variables
echo "Permissions are $PERMISSIONS"
echo "::set-output name=permissions::$PERMISSIONS"
echo "::set-output name=is_maintainer::$(echo $PERMISSIONS | grep -q maintain=true && echo true || echo false)"
echo "::set-output name=is_admin::$(echo $PERMISSIONS | grep -q admin=true && echo true || echo false)"

# Check if user is the owner
OWNER=$(curl -H "Authorization: token ${{secrets.GITHUB_TOKEN}}" -s https://api.github.com/repos/${{REPO_NAME}} | jq -r '.owner.login')
echo "::set-output name=is_owner::$OWNER"