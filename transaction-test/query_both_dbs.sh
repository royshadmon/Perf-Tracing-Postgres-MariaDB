# ROLLBACK 
perf stat -o psql-rollback.txt -r 10 -e branches -e branch-misses -e cycles -e instructions -e ref-cycles -e cpu-clock -e faults -e task-clock -e L1-dcache-load-misses -e L1-icache-load-misses -e branch-load-misses -e l2_rqsts.code_rd_miss sudo nice -n -5 taskset -c 1 psql -U 'root' -d 'postgres' -f psql_transaction.sql
perf stat -o mariadb-rollback.txt sudo nice -n -5 taskset -c 1 mysql -u root -D project < mariaDB_transaction.sql

