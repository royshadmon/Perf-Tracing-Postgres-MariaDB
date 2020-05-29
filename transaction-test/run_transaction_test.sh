num_rows=1

while [ $num_rows -le 10000 ]
do
	bash populate_both_dbs.sh $num_rows
	bash query_both_dbs.sh
	mkdir $num_rows
	mv *.txt $num_rows
	num_rows=$((num_rows * 10))
done