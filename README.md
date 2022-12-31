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