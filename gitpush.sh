git checkout master
git remote add upstream https://github.com/ReefVision/ReefVision.git
git fetch upstream
git rebase upstream/dev
git remote remove upstream
git add *
echo Commit message?
read commitmessage
git commit -m"$commitmessage"
git push