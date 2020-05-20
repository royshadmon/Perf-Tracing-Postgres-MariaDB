
export PGPASSWORD='demo'; psql -U 'postgres' -d 'postgres' -c 'DROP TABLE IF EXISTS numbers'
export PGPASSWORD='demo'; psql -U 'postgres' -d 'postgres' -c 'CREATE TABLE numbers (number int,sensor char(50));'

max_rows=100
for (( i=1; i<=$max_rows; i++ ))
do
 if [ $((i % 2)) -eq 0 ]
 then
 	sensor="'sensor1'"  
 else
  	sensor="'sensor2'"  
fi 
export PGPASSWORD='demo'; psql -U 'postgres' -d 'postgres' -c "INSERT INTO numbers VALUES($i,$sensor);"
done


