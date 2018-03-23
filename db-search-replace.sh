#! /bin/bash

# DB Dump File Search Example
#############################
# sed -i 's/www\.we\.org/stagingaz\.we\.org/g' db-weorg-live-search-replaced-01.sql
#############################

sed -i 's/www\.we\.org/stagingaz\.we\.org/g' $1
sed -i 's/www\.metowe\.com/stagingaz\.metowe\.com/g' $1
sed -i 's/www\.wecharity\.org/stagingaz\.wecharity\.org/g' $1
sed -i 's/www\.we\.ca/stagingaz\.we\.ca/g' $1
sed -i 's/staging\.we\.ca/stagingaz\.we\.ca/g' $1
sed -i 's/www\.mouvementunis\.org/stagingaz\.mouvementunis\.org/g' $1
