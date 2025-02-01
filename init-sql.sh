#!/bin/bash

createdb $PGDATABASE && echo "Database: $PGDATABASE created." && pg_restore -U $PGUSER -d $PGDATABASE sql-init/dvdrental.tar && echo "Sample data restored into $PGDATABASE.";