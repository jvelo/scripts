USER=jerome
SERVER=$1
LOCAL_DB=$2

rsync -chavzP $USER@$SERVER:/usr/local/data/{tenants,themes} .
ssh $USER@$SERVER 'sudo -u postgres pg_dump shop > update_local.dump.sql'
scp $USER@$SERVER:/home/$USER/update_local.dump.sql .
ssh $USER@$SERVER 'rm update_local.dump.sql'
psql -U postgres -c "DROP DATABASE $LOCAL_DB";
psql -U postgres -c "CREATE DATABASE $LOCAL_DB";
psql -d $LOCAL_DB -U postgres -f update_local.dump.sql
psql -d $LOCAL_DB -U postgres -c "update tenant set default_host = NULL;"
rm update_local.dump.sql
