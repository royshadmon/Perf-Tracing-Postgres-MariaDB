
# Update Ubuntu packages
sudo apt update
# Install Postgres
sudo apt install postgresql postgresql-contrib
# Create Postgres user
psql -U 'postgres' -d 'postgres' -c 'ÇREATE USER roy;'
# Grant user privileges (gives full access to user roy)
psql -U 'postgres' -d 'postgres' -c 'GRANT ALL ON ALL TABLES IN SCHEMA public TO roy;'
psql -U 'postgres' -d 'postgres' -c 'GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO mygrp;'



