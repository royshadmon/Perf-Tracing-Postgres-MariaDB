max_rows=$1

if [ $# -ne 1 ]
  then
    echo "Input 1 argument which represents how many rows to populate the dbs"
    exit
fi

# populate MariaDB
mysql -u roy -D project -e 'DROP TABLE IF EXISTS students;'
mysql -u roy -D project -e "CREATE TABLE students (
  12345  student_id int,
    dept_no int
);"

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