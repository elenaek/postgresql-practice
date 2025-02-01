#!/bin/bash

psql -h localhost -p 5432 --username=postgres --password --file=sql-init/restore.sql