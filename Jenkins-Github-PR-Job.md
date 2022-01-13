To configure triggering of Jenkins job when PR/MR is created in SCM.
--------------------------------------------------------------------

1. Make sure that GitHub Pull Request Builder Jenkins plugin is installed.
2. Once the plugin is installed goto "Manage Jenkins -> configire system -> GitHub Pull Request Builder -> Create Github secrets (Username/password or PAT) and test the connectivity of Jenkins and GitHub is successful.
3. Next configure a new job and check mark GitHub project options under General settings and under the Project url -> input the repo url.
4. Under the Build Triggers -> check mark -> GitHub Pull Request Builder
5. Under Admin list -> input the GitHub Admin user.
6. Check mark -> Use github hooks for build triggering
7. Click on -> Advanced options -> White list -> mention the GitHub Admin user from step 5.
8. Under Whitelist Target Branches: -> mention the branch name to which the PR needs to be merged.
9. Under Trigger Setup -> Give the status message for all the 3 options which will be updated to GitHub after the build is completed.
10. Under Pipeline -> click on Advanced -> Name -> input "origin" and Refspec -> input " +refs/heads/*:refs/remotes/origin/*"
11. Under Branches to build -> Branch Specifier (blank for 'any') -> input the PR branch.
12. Now need to do configure in GitHub.
13. Goto GitHub repo -> settings -> webhooks -> create a new webhooks -> input "<JENKINS_HOST>:<JENKINS_PORT>/ghprbhook/