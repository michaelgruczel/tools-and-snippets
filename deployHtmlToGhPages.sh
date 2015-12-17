#!/bin/bash

# put you html in an folder names website
# replace ORGA and REPONAME
# take sure branch gh-pages exists
# execute it to deploy html content to gh-pages branch

set -ex

REPO="git@github.com:ORGA/REPONAME.git"

DIR=temp-clone

# Delete any existing temporary website clone
rm -rf $DIR

# Clone the current repo into temp folder
git clone $REPO $DIR

# Move working directory into temp folder
cd $DIR

# Checkout and track the gh-pages branch
git checkout -t origin/gh-pages

# Delete everything
rm -rf *

# Copy website files from real repo
cp -R ../website/* .

# Stage all files in git and create a commit
git add .
git add -u
git commit -m "Website at $(date)"

# Push the new files up to GitHub
git push origin gh-pages

# Delete our temp folder
cd ..
rm -rf $DIR

# website is available under http://ORGA.github.io/REPONAME
