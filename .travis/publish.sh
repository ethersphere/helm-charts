#!/bin/sh -xe

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

push() {
  cd artifacts
  if ! git diff --quiet; then
    git add -A .
    git commit --message "Travis build: $TRAVIS_BUILD_NUMBER - $TRAVIS_COMMIT"
    git push origin master
  fi
}

setup_git
push
