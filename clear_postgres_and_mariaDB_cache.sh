# clear Postgres cache
sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"

# clear MariaDB cache
mysql -u roy -D project -e "RESET QUERY CACHE;"