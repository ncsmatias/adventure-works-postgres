#!/bin/bash
set -e

docker-entrypoint.sh postgres &

until psql -U postgres -c "select 1" > /dev/null 2>&1; do
  echo "Aguardando o PostgreSQL iniciar..."
  sleep 2
done

psql -U postgres -d Adventureworks -f /db/install.sql

wait