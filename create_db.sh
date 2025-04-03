#!/bin/bash
# https://groups.io/g/nodered-hamradio/topic/fcc_database_download_csv/84399611
# Expanded on by dashaw92

function printCol() {
  echo -e "\033[32m$1\033[00m"
}

printCol "Downloading FCC's latest 'l_amat.zip'."
# rm l_amat.zip
# wget ftp://wirelessftp.fcc.gov/pub/uls/complete/l_amat.zip
printCol "Extracting data files fro l_amat.zip."
rm EN.dat EN.csv
rm AM.dat AM.csv
unzip l_amat.zip EN.dat
unzip l_amat.zip AM.dat
printCol "Converting to CSV."
sed -e 's/\r//g' -e 's/"/""/g' -e 's/|/","/g' -e 's/^/"/g' -e 's/$/"/'  < EN.dat > EN.csv
sed -e 's/\r//g' -e 's/"/""/g' -e 's/|/","/g' -e 's/^/"/g' -e 's/$/"/'  < AM.dat > AM.csv
rm EN.dat AM.dat
rm header_AM.csv
echo "RecordType,USI,ULSFileNumber,EBFNumber,Call,Class,GroupCode,RegionCode,TrusteeCall,TrusteeIndicator,PhysicianCertification,VESig,SystCallChange,HVCallChange,VanityRel,PrevCall,PrevClass,TrusteeName" > header_AM.csv
cat AM.csv >> header_AM.csv
rm AM.csv
rm header_EN.csv
echo "RecordType,USI,ULSFileNumber,EBFNumber,Call,EntityType,LicID,EntityName,FirstName,MI,LastName,Suffix,Phone,Fax,Email,StreetAddress,City,State,ZipCode,POBox,Attn,SGIN,FRN,ApplicantTypeCode,ApplicantTypeCodeOther,StatusCode,StatusDate,Microwave37GHzLicType,LinkedUSI,LinkedCall" > header_EN.csv
cat EN.csv >> header_EN.csv
printCol "Importing CSVs and joining into table in 'fcc.db'."
sqlite3 fcc.db < import.sql
printCol "Done!"
