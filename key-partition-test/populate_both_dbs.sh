


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
    gender char(1),
    joined DATE NOT NULL
);"

d="2014-06-29"
for (( member_id=1; member_id<=$max_rows; member_id++ ))
do
	if [ $((member_id % 2)) -eq 0 ]
	then
		gender='M'
	else
		gender='F'
	fi
	d=$(date -I -d "$d + 1 day")
	psql -U 'postgres' -d 'postgres' -c "INSERT INTO members VALUES($member_id, '$gender', '$d');"
done

# populate MariaDB
mysql -u roy -D project -e 'DROP TABLE IF EXISTS members;'
mysql -u roy -D project -e "CREATE TABLE members (
    member_id int,
    gender char(1),
    joined DATE NOT NULL
)
PARTITION BY LIST COLUMNS (gender) (
	PARTITION m VALUES IN ('M'),
	PARTITION f VALUES IN ('F')
);"

d="2014-06-29"
for (( member_id=1; member_id<=$max_rows; member_id++ ))
do
	if [ $((member_id % 2)) -eq 0 ]
	then
		gender='M'
	else
		gender='F'
	fi
 	d=$(date -I -d "$d + 1 day")
	mysql -u roy -D project -e "INSERT INTO members VALUES($member_id, '$gender', '$d');"
done



