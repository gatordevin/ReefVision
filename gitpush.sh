git remote add upstream https://github.com/ReefVision/ReefVision.git
git fetch upstream
git checkout dev
git rebase upstream/dev
git add *
echo Commit message?
read commitmessage
git commit -m"$commitmessage"
git push