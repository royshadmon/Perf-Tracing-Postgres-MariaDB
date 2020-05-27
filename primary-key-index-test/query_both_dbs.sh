# Primary key lookup
perf stat -o psql-primary-key-lookup.txt sudo nice -n -5 taskset -c 1 psql -U 'root' -d 'postgres' -c 'SELECT * FROM students WHERE student_id = 10;'  
perf stat -o mariadb-primary-key-lookup.txt sudo nice -n -5 taskset -c 1 mysql -u root -D project -e 'SELECT * FROM students WHERE student_id = 10;' 

# Secondary index lookup
perf stat -o psql-secondary-index-lookup.txt sudo nice -n -5 taskset -c 1 psql -U 'root' -d 'postgres' -c 'SELECT * FROM students WHERE dept_no = 1;' 
perf stat -o mariadb-secondary-index-lookup.txt sudo nice -n -5 taskset -c 1 mysql -u root -D project -e 'SELECT * FROM students WHERE dept_no = 1;' 

# full scan
perf stat -o psql-full-scan.txt sudo nice -n -5 taskset -c 1 psql -U 'root' -d 'postgres' -c 'SELECT * FROM students;'  
perf stat -o mariadb-full-scan.txt sudo nice -n -5 taskset -c 1 mysql -u root -D project -e 'SELECT * FROM students;' 

