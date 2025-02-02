#!/bin/bash

# dropdb --force attempts to terminate all connections to the db before dropping it
dropdb --force $PGDATABASE && echo "Database: $PGDATABASE deleted." && 
createdb $PGDATABASE && 
echo "Database: $PGDATABASE created." && 
pg_restore -U $PGUSER -d $PGDATABASE sql-init/dvdrental.tar &&
echo "Sample data restored into $PGDATABASE.";