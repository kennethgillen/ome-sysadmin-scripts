#service account
sudo useradd $service_username
sudo -u postgres createuser -P -D -R -S $db_user
sudo -u postgres createdb -O $db_user $omero_database
