#!/bin/bash
export GIT_REMOTE_URL=$(git config --get remote.origin.url | sed -e 's/https:\/\///g; s/.git$//g')
export GIT_BRANCH="data"

git config user.email "pli01@github.com"
git config user.name "pli01"

git checkout -B ${GIT_BRANCH}
git stash
git pull --rebase origin master
git stash apply

git status -s
git add .
git commit -m "Deploy via Makefile" -a
git push -f -q https://${GITHUB_TOKEN}@${GIT_REMOTE_URL} ${GIT_BRANCH}
exit 0
