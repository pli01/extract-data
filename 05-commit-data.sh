#!/bin/bash
git config user.email "pli01@github.com"
git config user.name "pli01"

git checkout -B data
git pull --rebase origin master

git status -s
git add data
git commit -m "Deploy via Makefile"
git push -f -q https://${GITHUB_TOKEN}@github.com/pli01/extract-data data
exit 0
