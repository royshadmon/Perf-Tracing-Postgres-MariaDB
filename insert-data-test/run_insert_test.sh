
num_rows=1
while [ $num_rows -le 1000 ]
do
	perf stat -o psql-insert.txt -I 400 --all-cpus -e branches -e branch-misses -e cycles -e instructions -e ref-cycles -e cpu-clock -e faults -e task-clock -e L1-dcache-load-misses -e L1-icache-load-misses -e branch-load-misses -e l2_rqsts.code_rd_miss -e l2_rqsts.miss sudo nice -n -5 taskset -c 1 sudo bash populate_postgres.sh $num_rows
	perf stat -o mariaDB-insert.txt -I 400 --all-cpus -e branches -e branch-misses -e cycles -e instructions -e ref-cycles -e cpu-clock -e faults -e task-clock -e L1-dcache-load-misses -e L1-icache-load-misses -e branch-load-misses -e l2_rqsts.code_rd_miss -e l2_rqsts.miss sudo nice -n -5 taskset -c 1 sudo bash populate_mariaDB.sh $num_rows	
	mkdir $num_rows
	mv *.txt $num_rows
	num_rows=$((num_rows * 10))
done
