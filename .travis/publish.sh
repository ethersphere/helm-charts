#!/bin/sh -xe

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

push() {
  cd artifacts
  git add -A
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
  git push origin master
}

setup_git
push
