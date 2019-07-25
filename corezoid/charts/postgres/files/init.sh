#!/bin/bash
set -e
#check for internal db usage
if [ "$DB_FLAG" == "true" ]; then export POSTGRES_HOST="localhost"; fi
echo $POSTGRES_HOST;

#set login/password for work with db
echo  "$POSTGRES_HOST:*:*:$POSTGRES_USER:$POSTGRES_PASSWORD" > ~/.pgpass; chmod 0600 ~/.pgpass

PSQL_FULL="psql -h $POSTGRES_HOST -U $POSTGRES_USER"

CHECK_USER_FLAG=`$PSQL_FULL -d postgres -Atc "SELECT 1 FROM pg_roles WHERE rolname = '$PGLOCAL_USER'"`

echo "Check if $PGLOCAL_USER exist"
if [ "x${CHECK_USER_FLAG}" == "x" ];
then
   echo "not found user $PGLOCAL_USER , creating"
    ${PSQL_FULL} -d postgres -Atc "CREATE ROLE $PGLOCAL_USER WITH PASSWORD "\'$PGLOCAL_USER_PWD\'";"
    ${PSQL_FULL} -d postgres -Atc "ALTER ROLE $PGLOCAL_USER WITH INHERIT NOCREATEROLE NOCREATEDB LOGIN NOBYPASSRLS;"
fi

#create databases if not exist
${PSQL_FULL} -tc "SELECT 1 FROM pg_database WHERE datname = 'conveyor'" | grep -q 1 || ${PSQL_FULL} -c "CREATE DATABASE conveyor;"
${PSQL_FULL} -tc "SELECT 1 FROM pg_database WHERE datname = 'cce'" | grep -q 1 || ${PSQL_FULL} -c "CREATE DATABASE cce;"
${PSQL_FULL} -tc "SELECT 1 FROM pg_database WHERE datname = 'conveyor_statistics'" | grep -q 1 || ${PSQL_FULL} -c "CREATE DATABASE conveyor_statistics;"
${PSQL_FULL} -tc "SELECT 1 FROM pg_database WHERE datname = 'git_call'" | grep -q 1 || ${PSQL_FULL} -c "CREATE DATABASE git_call;"
${PSQL_FULL} -tc "SELECT 1 FROM pg_database WHERE datname = 'health_check'" | grep -q 1 || ${PSQL_FULL} -c "CREATE DATABASE health_check;"



#create extention if not exist
echo "create extention"
${PSQL_FULL} -d conveyor -Atc 'CREATE EXTENSION IF NOT EXISTS dblink;'
${PSQL_FULL} -d conveyor -Atc 'CREATE EXTENSION IF NOT EXISTS plpgsql;'

#create shemas
${PSQL_FULL} -d conveyor < /tmp/sql/conveyor.sql
${PSQL_FULL} -d conveyor -Atc "GRANT SELECT,INSERT,UPDATE,DELETE ON ALL TABLES IN SCHEMA public TO $PGLOCAL_USER;"
${PSQL_FULL} -d conveyor -Atc "GRANT SELECT,UPDATE ON ALL SEQUENCES IN SCHEMA public TO $PGLOCAL_USER;"

${PSQL_FULL} -d cce < /tmp/sql/cce.sql
${PSQL_FULL} -d cce -Atc "GRANT SELECT,INSERT,UPDATE,DELETE ON ALL TABLES IN SCHEMA public TO $PGLOCAL_USER;"
${PSQL_FULL} -d cce -Atc "GRANT SELECT,UPDATE ON ALL SEQUENCES IN SCHEMA public TO $PGLOCAL_USER;"

${PSQL_FULL} -d conveyor_statistics < /tmp/sql/conveyor_statistics.sql
${PSQL_FULL} -d conveyor_statistics < /tmp/sql/grants.sql      && echo conveyor_statistics - done;
${PSQL_FULL} -d conveyor_statistics -Atc "GRANT SELECT,INSERT,UPDATE,DELETE ON ALL TABLES IN SCHEMA public TO $PGLOCAL_USER;"
${PSQL_FULL} -d conveyor_statistics -Atc "GRANT SELECT,UPDATE ON ALL SEQUENCES IN SCHEMA public TO $PGLOCAL_USER;"

${PSQL_FULL} -d git_call < /tmp/sql/git_call.sql
${PSQL_FULL} -d git_call < /tmp/sql/grants.sql                 && echo git_call  - done;
${PSQL_FULL} -d git_call -Atc "GRANT SELECT,INSERT,UPDATE,DELETE ON ALL TABLES IN SCHEMA public TO $PGLOCAL_USER;"
${PSQL_FULL} -d git_call -Atc "GRANT SELECT,UPDATE ON ALL SEQUENCES IN SCHEMA public TO $PGLOCAL_USER;"

${PSQL_FULL} -d health_check < /tmp/sql/health_check.sql
${PSQL_FULL} -d health_check < /tmp/sql/grants.sql             && echo health_check grants - done;
${PSQL_FULL} -d health_check -Atc "GRANT SELECT,INSERT,UPDATE,DELETE ON ALL TABLES IN SCHEMA public TO $PGLOCAL_USER;"
${PSQL_FULL} -d health_check -Atc "GRANT SELECT,UPDATE ON ALL SEQUENCES IN SCHEMA public TO $PGLOCAL_USER;"

${PSQL_FULL} -d conveyor < /tmp/sql/add_trial.sql              && echo add_trial - done;

count=$(($SHARD_COUNT-1))
for i in $(seq 0 $count);
    do
        echo "init cp${i}"
        ${PSQL_FULL} -d conveyor -Atc "CREATE DATABASE cp${i}" && echo CREATE DATABASE cp${i} for internal_user - done
        ${PSQL_FULL} -d cp${i} < /tmp/sql/cp.sql               && echo cp internal_user for cp${i} - done
        ${PSQL_FULL} -d cp${i} -Atc "GRANT SELECT,INSERT,UPDATE,DELETE ON ALL TABLES IN SCHEMA public TO $PGLOCAL_USER;"
        ${PSQL_FULL} -d cp${i} -Atc "GRANT SELECT,UPDATE ON ALL SEQUENCES IN SCHEMA public TO $PGLOCAL_USER;"
        #${PSQL_FULL} -d cp${i} < /tmp/sql/grants.sql           && echo grants internal_user for cp${i} - done
    done;


${PSQL_FULL} -d conveyor < /tmp/sql/add_admin.sql && echo  admin template added;
HASH="$(echo -n "$CORE_LOGIN$CORE_AUTH_HASH$CORE_PASSWD" | sha1sum | awk '{ print $1 }')"
${PSQL_FULL} conveyor -Atc "UPDATE logins SET hash1 = '$HASH' WHERE login = '$CORE_LOGIN'"
