

num_rows=1

while [ $num_rows -le 10000 ]
do
	bash populate_both_dbs $num_rows
	bash query_both_dbs.sh
	num_rows=$((num_rows * 10))
done