# ROLLBACK 
#--all-cpus -r 10 -e branches -e branch-misses -e cycles -e instructions -e ref-cycles -e cpu-clock -e faults -e task-clock -e L1-dcache-load-misses -e L1-icache-load-misses -e branch-load-misses -e l2_rqsts.code_rd_miss -e l2_rqsts.miss 

# Primary key lookup
perf stat -o psql-query.txt --all-cpus -e branches -e branch-misses -e cycles -e instructions -e ref-cycles -e cpu-clock -e faults -e task-clock -e L1-dcache-load-misses -e L1-icache-load-misses -e branch-load-misses -e l2_rqsts.code_rd_miss -e l2_rqsts.miss sudo nice -n -5 taskset -c 1 sudo psql -U 'roy' -d 'postgres' -c "SELECT COUNT(*) FROM members WHERE gender =  'F'"  
perf stat -o mariadb-partition_query.txt --all-cpus -e branches -e branch-misses -e cycles -e instructions -e ref-cycles -e cpu-clock -e faults -e task-clock -e L1-dcache-load-misses -e L1-icache-load-misses -e branch-load-misses -e l2_rqsts.code_rd_miss -e l2_rqsts.miss sudo nice -n -5 taskset -c 1 sudo mysql -u root -D project -e "SELECT COUNT(*) FROM members PARTITION(f);" 
