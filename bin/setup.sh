#!/bin/zsh

if [ -d "_site" ]; then
  echo "\nRemoving existing _site/ directory...\n"
  rm -rf _site
fi

echo "\nCloning blog to _site/ directory...\n"
git clone git@github.com:kenyonj/blog.git _site/

echo "\nComplete. You may now push to this repo.\n"
