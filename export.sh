#!/bin/bash
# Exports active hams from fcc.db into active_hams.db

function printCol() {
  echo -e "\033[47;30m$1\033[00m"
}

printCol "Exporting active hams."
sqlite3 fcc.db < export_active.sql
printCol "Done!"
