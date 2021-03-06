#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "sources" ] && exit 0


MESSAGE="$(git log -1 --pretty=%B)"

git config --global user.email "s.e.abbott12@gmail.com"
git config --global user.name "Sam Abbott"

git clone -b master https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git blog-output
cd blog-output
cp -r ../public/* ./
git add --all *
git commit -m "${MESSAGE}" || true
git push -q origin master
