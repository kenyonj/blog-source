#!/bin/zsh

echo "Building jekyll pages..."
jekyll build

echo "Committing changes to github..."
cd _site && git add -A && git commit -m "Update site"

echo "Pushing updates to github..."
git push && cd ..

echo "Finished. Site will show updated content in the next 10 minutes."
