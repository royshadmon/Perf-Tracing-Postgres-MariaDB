# https://dba.stackexchange.com/questions/149193/which-queries-are-faster-with-postgres-than-with-mysql-innodb
# primary key and index queries

# Postgres 
# student_pk index is stored as a B-tree index. Each element has a pointer to the students's heap. 
# student_depto_index is stored in a B-tree with pointers to the heap, however, there is no uniqueness enforced. 
perf stat psql -U postgres -d postgres -c "CREATE TABLE students (
    student_id int,
    dept_no int,
    CONSTRAINT student_pk PRIMARY KEY (student_id)
); CREATE INDEX student_dept_idx ON students (dept_no);"

# MariaDB
perf stat mysql -u roy -D project -e "CREATE TABLE students (
    student_id int,
    dept_no int,
    CONSTRAINT student_pk PRIMARY KEY (student_id)
); CREATE INDEX student_dept_idx ON students (dept_no);"



## Primary key lookup

# Postgres 
perf stat psql -U postgres -d postgres -c "SELECT * FROM students WHERE student_id = 10;"

# MariaDB
perf stat mysql -u roy -D project -e "SELECT * FROM students WHERE student_id = 10;"


-- On PostgreSQL it can navigate through emp_pk index (one scan on the B-tree index) and then get the page/offset to get referencing row from employees heap table (one direct page/row fetch, not really a scan). So, one scan on the index, and one direct fetch on the heap.
-- On MySQL it will just navigate through primary key index (one scan on the B-tree index), as all the information is already there, no other lookup is required. So, just one scan on the index.
-- So, while PostgreSQL needs to do one scan and one fetch, MySQL just do one scan.

# Index lookup
-- Why lookup through two indexes (InnoDB, lookup through non-PK index) is much slower? Does it requires two times more I/O or CPU? Can it compensate that huge benefit of PK lookup boost?

SELECT * FROM employees WHERE dept_no = 14;
-- On PostgreSQL, it won't be much different from the other. It will scan emp_depto_idx and then, for each row returned, fetch the value directly from the heap. So, one scan on the index, and a direct fetch on the heap for each row matched.
-- On MySQL it will scan the emp_depto_idx (one scan on the index), then, for each row returned it will get the referencing emp_id and scan the primary key index. So, one scan on a secondary index, and one scan on the primary index for each row matched.
-- See the difference? While PostgreSQL will do a scan and then fetch each matching row with a direct pointer, InnoDB will do a similar scan first, then another scan for each matching row. Now, it may be fast enough if department 14 has few employees, but really slow as it gets more employees (of course it will get slower on both RDBMS, but the curve is probably higher with InnoDB).

# Full scan
-- Why InnoDB sequential scans are slower?
-- Simple answer, because it is not really "sequential"...
-- Well, let's see the simplest (and certainly slow for all) query:
SELECT * FROM employees;
-- On PostgreSQL, it may can simple scan the whole employees heap, row by row, in its physical sequential order (no matter the insertion order here, what matters is how the tuples and pages are physically arranged now).
-- On InnoDB, it needs to traverse the index, which means more random scans (as index pages are not necessarily ordered physically and logically the same way).
-- If you think about magnetic disks, the difference is quite obvious, it is know that sequential access is way faster than random access. For SSDs it is not necessarily true, although there is still advantages on sequential access, like read-ahead. So in most scenarios, PostgreSQL's full scan will probably faster than InnoDB's, at least for considerable large tables (notice I didn't define what is "large", you must try it out and see where that difference really matters, it may just not matter in many cases). The best, for both RDBMS, is to design your model and your queries to avoid full scans, if possible.
