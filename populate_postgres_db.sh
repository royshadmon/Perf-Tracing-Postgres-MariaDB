
export PGPASSWORD='demo'; psql -U 'postgres' -d 'postgres' -c 'DROP TABLE IF EXISTS numbers'
export PGPASSWORD='demo'; psql -U 'postgres' -d 'postgres' -c 'CREATE TABLE numbers (number int,sensor char(50));'

for i in {1..100}
do
 if [ $((i % 2)) -eq 0 ]
 then
 	sensor="'sensor1'"  
 else
  	sensor="'sensor2'"  
fi 
export PGPASSWORD='demo'; psql -U 'postgres' -d 'postgres' -c "insert into numbers values($i,$sensor);"
done


