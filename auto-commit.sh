#!/bin/bash

# commits any new JSON files and modifications to existing JSON files.
# intended to be run automatically by the CI server
# @author Luke Skibinski <l.skibinski@elifesciences.org>

set -e
git add article-json/*.json
git commit -m "automatic commit"
git push origin master
