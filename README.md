# role-authorization-action
a github action for finding out the roles for a user, who triggered the flow

https://docs.github.com/en/rest/overview/permissions-required-for-github-apps?apiVersion=2022-11-28


curl \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_API_TOKEN"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
https://api.github.com/repos/ownerOrOrg/CIS4-eCommerce-Portal/collaborators

curl \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_API_TOKEN"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
https://api.github.com/repos/ownerOrOrg/CIS4-eCommerce-Portal


curl \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_API_TOKEN"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
https://api.github.com/repos/ownerOrOrg/CIS4-eCommerce-Portal/collaborators/andreasvh-conceto/permission


curl \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_API_TOKEN"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
https://api.github.com/repos/CONCETO/CIS-4-Financial-Monitoring/collaborators/andreasvh-conceto/permission | jq '.user.role_nameuser'



```
name: Check user role

on: [push]

jobs:
  check_user_role:
    runs-on: ubuntu-latest
    steps:
    - name: Check user role
      id: check_role
      uses: your_repo/your_action_repo
    - name: Print user role
      run: |
        echo "User is a maintainer: ${{steps.check_role.outputs.is_maintainer}}"
        echo "User is an admin: ${{steps.check_role.outputs.is_admin}}"
        echo "User is the owner: ${{steps.check_role.outputs.is_owner}}"
```