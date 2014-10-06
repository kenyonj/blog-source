#!/bin/zsh

if [ -d "_site" ]; then
  echo "Removing existing _site/ directory..."
  rm -rf _site
fi

echo "Cloning blog to _site/ directory..."
git clone git@github.com:kenyonj/blog.git _site/

echo "Complete, you may now push to this repo."
