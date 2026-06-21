#!/bin/bash
set -e

/opt/mssql/bin/sqlservr &

until /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$MSSQL_SA_PASSWORD" -C -Q "SELECT 1" > /dev/null 2>&1; do
    sleep 2
done

/opt/mssql-tools18/bin/sqlcmd \
    -S localhost \
    -U sa \
    -P "$MSSQL_SA_PASSWORD" \
    -C \
    -v DB_NAME="$DB_NAME" \
    -v DB_USERNAME="$DB_USERNAME" \
    -v DB_PASSWORD="$DB_PASSWORD" \
    -i /sql-scripts/init.sql

wait