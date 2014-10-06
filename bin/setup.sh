#!/bin/zsh

if [ -d "_site" ]; then
  echo $fg[red] "Removing existing _site/ directory..."
  rm -rf _site
fi

echo $fg[red] "Cloning blog to _site/ directory..."
git clone git@github.com:kenyonj/blog.git _site/

echo $fg[red] "Complete. You may now push to this repo."
