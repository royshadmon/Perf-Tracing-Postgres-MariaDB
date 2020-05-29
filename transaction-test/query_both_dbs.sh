# Transaction commit
perf stat -o psql-transaction-commit.txt --all-cpus -r 10 -e branches -e branch-misses -e cycles -e instructions -e ref-cycles -e cpu-clock -e faults -e task-clock -e L1-dcache-load-misses -e L1-icache-load-misses -e branch-load-misses -e l2_rqsts.code_rd_miss -e l2_rqsts.miss sudo nice -n -5 taskset -c 1 sudo psql -U 'root' -d 'postgres' -f psql_transaction_commit.sql
perf stat -o mariadb-transaction-commit.txt --all-cpus -r 10 -e branches -e branch-misses -e cycles -e instructions -e ref-cycles -e cpu-clock -e faults -e task-clock -e L1-dcache-load-misses -e L1-icache-load-misses -e branch-load-misses -e l2_rqsts.code_rd_miss -e l2_rqsts.miss sudo nice -n -5 taskset -c 1 sudo mysql -u root -D project < mariaDB_transaction_commit.sql

# Transaction rollback 
perf stat -o psql-transaction-rollback.txt --all-cpus -r 10 -e branches -e branch-misses -e cycles -e instructions -e ref-cycles -e cpu-clock -e faults -e task-clock -e L1-dcache-load-misses -e L1-icache-load-misses -e branch-load-misses -e l2_rqsts.code_rd_miss -e l2_rqsts.miss sudo nice -n -5 taskset -c 1 sudo psql -U 'root' -d 'postgres' -f psql_transaction_rollback.sql
perf stat -o mariadb-transaction-rollback.txt --all-cpus -r 10 -e branches -e branch-misses -e cycles -e instructions -e ref-cycles -e cpu-clock -e faults -e task-clock -e L1-dcache-load-misses -e L1-icache-load-misses -e branch-load-misses -e l2_rqsts.code_rd_miss -e l2_rqsts.miss sudo nice -n -5 taskset -c 1 sudo mysql -u root -D project < mariaDB_transaction_rollback.sql
