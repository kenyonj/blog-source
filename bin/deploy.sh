#!/bin/zsh

echo "\nBuilding jekyll pages...\n"
jekyll build

echo "\nCommitting changes to github...\n"
cd _site && git add -A && git commit -m "Update site"

echo "\nPushing updates to github...\n"
git push && cd ..

echo "\nFinished. Site will show updated content in the next 10 minutes.\n"
