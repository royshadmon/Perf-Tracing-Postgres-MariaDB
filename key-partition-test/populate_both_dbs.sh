


# populate Postgres

max_rows=$1

if [ $# -ne 1 ]
  then
    echo "Input 1 argument which represents how many rows to populate the dbs"
    exit
fi

psql -U 'postgres' -d 'postgres' -c 'DROP TABLE IF EXISTS members;'
psql -U 'postgres' -d 'postgres' -c "CREATE TABLE members (
    member_id int,
    joined DATE NOT NULL
);"

d="2014-06-29"
for (( member_id=1; member_id<=$max_rows; member_id++ ))
do
	d=$(date -I -d "$d + 1 day")
psql -U 'postgres' -d 'postgres' -c "INSERT INTO members VALUES($member_id,'$d');"
done

# populate MariaDB
mysql -u roy -D project -e 'DROP TABLE IF EXISTS members;'
mysql -u roy -D project -e "CREATE TABLE members (
    member_id int,
    joined DATE NOT NULL
)
PARTITION BY KEY(joined)
PARTITIONS 6;"
d="2014-06-29"
for (( member_id=1; member_id<=$max_rows; member_id++ ))
do
 d=$(date -I -d "$d + 1 day")
mysql -u roy -D project -e "INSERT INTO members VALUES($member_id,'$d');"
done



