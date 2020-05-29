# populate Postgres

max_rows=$1

if [ $# -ne 1 ]
  then
    echo "Input 1 argument which represents how many rows to populate the dbs"
    exit
fi

psql -U 'postgres' -d 'postgres' -c 'DROP TABLE IF EXISTS students;'
psql -U 'postgres' -d 'postgres' -c "CREATE TABLE students (
    student_id int,
    dept_no int,
    CONSTRAINT student_pk PRIMARY KEY (student_id)
); CREATE INDEX student_dept_idx ON students (dept_no);"

for (( student_id=1; student_id<=$max_rows; student_id++ ))
do
 if [ $((student_id % 2)) -eq 0 ]
 then
 	dept="1"  
 else
  	dept="2"  
fi 
psql -U 'postgres' -d 'postgres' -c "INSERT INTO students VALUES($student_id,$dept);"
done


# populate MariaDB
mysql -u roy -D project -e 'DROP TABLE IF EXISTS students;'
mysql -u roy -D project -e "CREATE TABLE students (
    student_id int,
    dept_no int,
    CONSTRAINT student_pk PRIMARY KEY (student_id)
); CREATE INDEX student_dept_idx ON students (dept_no);"

for (( student_id=1; student_id<=$max_rows; student_id++ ))
do
 if [ $((student_id % 2)) -eq 0 ]
 then
 	dept="1"  
 else
  	dept="2"  
fi 
mysql -u roy -D project -e "INSERT INTO students VALUES($student_id,$dept);"
done



