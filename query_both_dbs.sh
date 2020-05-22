# Primary key lookup
psql -U 'postgres' -d 'postgres' -c 'SELECT * FROM students WHERE emp_id = 10;' > psql-primary-key-lookup.txt
mysql -u roy -D project -e 'SELECT * FROM students WHERE emp_id = 10;' > mariadb-primary-key-lookup.txt

# Secondary index lookup
psql -U 'postgres' -d 'postgres' -c 'SELECT * FROM students WHERE dept_no = 10;' > psql-secondary-index-lookup.txt
mysql -u roy -D project -e 'SELECT * FROM students WHERE dept_no = 10;' > mariadb-secondary-index-lookup.txt

# full scan
psql -U 'postgres' -d 'postgres' -c 'SELECT * FROM students;' > psql-full-scan.txt
mysql -u roy -D project -e 'SELECT * FROM students;' > mariadb-full-scan.txt
