mysql -u roy -D project -e 'DROP TABLE IF EXISTS numbers'
mysql -u roy -D project -e 'CREATE TABLE numbers (number int, sensor char(50));'

max_rows=100
for (( i=1; i<=$max_rows; i++ ))
do
 if [ $((i % 2)) -eq 0 ]
 then
 	sensor="'sensor1'"  
 else
  	sensor="'sensor2'"  
fi 
mysql -u roy -D project -e "INSERT INTO numbers VALUES($i,$sensor);"
done


