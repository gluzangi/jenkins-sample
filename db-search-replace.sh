#! /bin/bash

# DB Dump File Search Example
#############################
# sed -i 's/www\.we\.org/stg\.we\.org/g' db-wesites-stg.sql
#############################

sed -i 's/db\_wesites\_stg/db\_wesites/g' $1

sed -i 's/www\.we\.org/stg\.we\.org/g' $1
sed -i 's/www\.metowe\.com/stg\.metowe\.com/g' $1
sed -i 's/www\.wecharity\.org/stg\.wecharity\.org/g' $1
sed -i 's/www\.we\.ca/stg\.we\.ca/g' $1
sed -i 's/staging\.we\.ca/stg\.we\.ca/g' $1
sed -i 's/www\.mouvementunis\.org/stg\.mouvementunis\.org/g' $1
