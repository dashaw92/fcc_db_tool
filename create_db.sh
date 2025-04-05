#!/bin/bash
# https://groups.io/g/nodered-hamradio/topic/fcc_database_download_csv/84399611
# Expanded on by dashaw92

. ./_prelude.sh

function stripCRCRNL() {
  for file in "$@"; do
    echo -e "\t- Stripping $file"
    sed -i -ze 's/\r\r\n//g' "$file"
  done
}

if [ "$1" == "fetch" ] || [ ! -f "l_amat.zip" ]; then
  printCol "Downloading FCC's latest 'l_amat.zip'."
  wget -O l_amat.zip ftp://wirelessftp.fcc.gov/pub/uls/complete/l_amat.zip
fi

printCol "Extracting data files from l_amat.zip."
unzip l_amat.zip
printCol "Removing quotes from EN.dat."
sed -i -ze 's/"//g' EN.dat
echo "Quotes removed from EN.dat."
printCol 'Stripping excess \\r\\r\\n.'
stripCRCRNL *.dat
printCol "Importing data into 'fcc.db'."
sqlite3 fcc.db < import.sql
printCol "Cleaning up intermediate files."
rm -v *.dat counts
printCol "Done!"
