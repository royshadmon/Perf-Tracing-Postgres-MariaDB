# populate Postgres

max_rows=$1

export PGPASSWORD='demo'; psql -U 'postgres' -d 'postgres' -c 'DROP TABLE IF EXISTS students;'
export PGPASSWORD='demo'; psql -U 'postgres' -d 'postgres' -c "CREATE TABLE students (
    student_id int,
    dept_no char(50),
    CONSTRAINT student_pk PRIMARY KEY (student_id)
); CREATE INDEX student_dept_idx ON students (dept_no);"

for (( student_id=1; student_id<=$max_rows; student_id++ ))
do
 if [ $((student_id % 2)) -eq 0 ]
 then
 	dept="'Math'"  
 else
  	dept="'CSE'"  
fi 
export PGPASSWORD='demo'; psql -U 'postgres' -d 'postgres' -c "INSERT INTO students VALUES($student_id,$dept);"
done

# populate MariaDB
mysql -u roy -D project -e 'DROP TABLE IF EXISTS students;'
mysql -u roy -D project -e "CREATE TABLE students (
    student_id int,
    dept_no char(50),
    CONSTRAINT student_pk PRIMARY KEY (student_id)
); CREATE INDEX student_dept_idx ON students (dept_no);"

for (( student_id=1; student_id<=$max_rows; student_id++ ))
do
 if [ $((student_id % 2)) -eq 0 ]
 then
 	dept="'Math'"  
 else
  	dept="'CSE'"  
fi 
mysql -u roy -D project -e "INSERT INTO students VALUES($student_id,$dept);"
done



