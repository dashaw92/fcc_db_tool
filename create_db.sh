#!/bin/bash
# https://groups.io/g/nodered-hamradio/topic/fcc_database_download_csv/84399611
# Expanded on by dashaw92

function printCol() {
  echo -e "\033[47;30m$1\033[00m"
}

function stripCRCRNL() {
  for file in "$@"; do
    echo -e "\t- Stripping $file"
    sed -i -ze 's/\r\r\n//g' "$file"
  done
}

if [ "$1" == "fetch" ]; then
  printCol "Downloading FCC's latest 'l_amat.zip'."
  wget -O l_amat.zip ftp://wirelessftp.fcc.gov/pub/uls/complete/l_amat.zip
fi
printCol "Extracting data files from l_amat.zip."
unzip l_amat.zip
printCol 'Stripping excess \\r\\r\\n.'
stripCRCRNL *.dat
printCol "Importing data into 'fcc.db'."
sqlite3 fcc.db < import.sql
printCol "Cleaning up intermediate files."
rm -v *.dat counts
printCol "Done!"
