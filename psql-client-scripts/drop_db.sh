#!/bin/bash

# Drop DB
dropdb $PGDATABASE && echo "Database: $PGDATABASE dropped.";