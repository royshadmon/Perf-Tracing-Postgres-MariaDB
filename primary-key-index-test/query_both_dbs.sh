# Primary key lookup
perf stat -o psql-primary-key-lookup.txt psql -U 'root' -d 'postgres' -c 'SELECT * FROM students WHERE student_id = 10;'  
perf stat -o mariadb-primary-key-lookup.txt mysql -u root -D project -e 'SELECT * FROM students WHERE student_id = 10;' 

# Secondary index lookup
perf stat -o psql-secondary-index-lookup.txt psql -U 'root' -d 'postgres' -c 'SELECT * FROM students WHERE dept_no = 1;' 
perf stat -o mariadb-secondary-index-lookup.txt mysql -u root -D project -e 'SELECT * FROM students WHERE dept_no = 1;' 

# full scan
perf stat -o psql-full-scan.txt psql -U 'root' -d 'postgres' -c 'SELECT * FROM students;'  
perf stat -o mariadb-full-scan.txt mysql -u root -D project -e 'SELECT * FROM students;' 

