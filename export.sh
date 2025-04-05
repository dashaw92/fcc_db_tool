#!/bin/bash
# Exports active hams from fcc.db into active_hams.db

. ./_prelude.sh

printCol "Exporting active hams."
sqlite3 fcc.db < export_active.sql
printCol "Done!"
