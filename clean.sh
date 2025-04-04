#!/bin/bash
# Removes all existing files created from ./create_db.sh
# WARNING: This uses the .gitignore file as the source of what to delete.
cat .gitignore | xargs -n 1 -- find . -name | xargs -- rm
