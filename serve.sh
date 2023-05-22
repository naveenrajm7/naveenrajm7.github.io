#!/bin/bash

# bundle update github-pages
# bundle add webrick 
bundle exec jekyll serve --livereload --force_polling "$@"
