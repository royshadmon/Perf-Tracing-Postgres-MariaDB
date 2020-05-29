# ROLLBACK 
#--all-cpus -r 10 -e branches -e branch-misses -e cycles -e instructions -e ref-cycles -e cpu-clock -e faults -e task-clock -e L1-dcache-load-misses -e L1-icache-load-misses -e branch-load-misses -e l2_rqsts.code_rd_miss -e l2_rqsts.miss 

# Primary key lookup
perf stat -o psql-primary-key-lookup.txt --all-cpus -r 10 -e branches -e branch-misses -e cycles -e instructions -e ref-cycles -e cpu-clock -e faults -e task-clock -e L1-dcache-load-misses -e L1-icache-load-misses -e branch-load-misses -e l2_rqsts.code_rd_miss -e l2_rqsts.miss sudo nice -n -5 taskset -c 1 sudo psql -U 'roy' -d 'postgres' -c 'SELECT * FROM students WHERE student_id = 10;'  
perf stat -o mariadb-primary-key-lookup.txt sudo nice -n -5 taskset -c 1 sudo mysql -u root -D project -e 'SELECT * FROM students WHERE student_id = 10;' 

# Secondary index lookup
perf stat -o psql-secondary-index-lookup.txt --all-cpus -r 10 -e branches -e branch-misses -e cycles -e instructions -e ref-cycles -e cpu-clock -e faults -e task-clock -e L1-dcache-load-misses -e L1-icache-load-misses -e branch-load-misses -e l2_rqsts.code_rd_miss -e l2_rqsts.miss sudo nice -n -5 taskset -c 1 sudo psql -U 'roy' -d 'postgres' -c 'SELECT * FROM students WHERE dept_no = 1;' 
perf stat -o mariadb-secondary-index-lookup.txt --all-cpus -r 10 -e branches -e branch-misses -e cycles -e instructions -e ref-cycles -e cpu-clock -e faults -e task-clock -e L1-dcache-load-misses -e L1-icache-load-misses -e branch-load-misses -e l2_rqsts.code_rd_miss -e l2_rqsts.miss sudo nice -n -5 taskset -c 1 sudo mysql -u root -D project -e 'SELECT * FROM students WHERE dept_no = 1;' 

# full scan
perf stat -o psql-full-scan.txt --all-cpus -r 10 -e branches -e branch-misses -e cycles -e instructions -e ref-cycles -e cpu-clock -e faults -e task-clock -e L1-dcache-load-misses -e L1-icache-load-misses -e branch-load-misses -e l2_rqsts.code_rd_miss -e l2_rqsts.miss sudo nice -n -5 taskset -c 1 sudo psql -U 'roy' -d 'postgres' -c 'SELECT * FROM students;'  
perf stat -o mariadb-full-scan.txt --all-cpus -r 10 -e branches -e branch-misses -e cycles -e instructions -e ref-cycles -e cpu-clock -e faults -e task-clock -e L1-dcache-load-misses -e L1-icache-load-misses -e branch-load-misses -e l2_rqsts.code_rd_miss -e l2_rqsts.miss sudo nice -n -5 taskset -c 1 sudo mysql -u root -D project -e 'SELECT * FROM students;' 
