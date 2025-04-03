This script will download the latest version of the FCC's Amateur Radio dataset from their FTP site, extract interesting data from the dataset, and merge the records into a single table in an SQLite db file for analysis.
$ ./create_db.sh
...
$ sqlite3 fcc.db
sqlite> .headers ON
sqlite> .tables
FCC
sqlite> SELECT COUNT(*) FROM FCC;
....
