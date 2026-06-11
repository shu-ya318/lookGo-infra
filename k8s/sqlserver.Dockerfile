FROM mcr.microsoft.com/mssql/server:2025-latest

USER root

COPY ./sql-scripts/init-db.sh /opt/mssql-tools18/bin/init-db.sh

RUN mkdir -p /sql-scripts
COPY ./sql-scripts/init.sql /sql-scripts/init.sql