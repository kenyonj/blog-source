#!/bin/zsh

echo $fg[red] "Building jekyll pages..."
jekyll build

echo $fg[red] "Committing changes to github..."
cd _site && git add -A && git commit -m "Update site"

echo $fg[red] "Pushing updates to github..."
git push && cd ..

echo $fg[red] "Finished. Site will show updated content in the next 10 minutes."
