# Primary key lookup
perf stat psql -U 'postgres' -d 'postgres' -c 'SELECT * FROM students WHERE student_id = 10;' > psql-primary-key-lookup.txt
perf stat mysql -u roy -D project -e 'SELECT * FROM students WHERE student_id = 10;' > mariadb-primary-key-lookup.txt

# Secondary index lookup
perf stat psql -U 'postgres' -d 'postgres' -c 'SELECT * FROM students WHERE dept_no = 1;' > psql-secondary-index-lookup.txt
perf stat mysql -u roy -D project -e 'SELECT * FROM students WHERE dept_no = 1;' > mariadb-secondary-index-lookup.txt

# full scan
perf stat psql -U 'postgres' -d 'postgres' -c 'SELECT * FROM students;' > psql-full-scan.txt
perf stat mysql -u roy -D project -e 'SELECT * FROM students;' > mariadb-full-scan.txt


#student_id int,
    # dept_no char(50),