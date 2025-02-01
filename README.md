# Overview
* SQL Practice for CS1011 Database Management - Foundations
* Contains a devcontainer with all PostgreSQL for practicing SQL queries
* Contains a DB init script

Store example SQL scripts from CS1011 Database Management - Foundations course for future use.
### Getting Started
1) Build and attach to devcontainer
2) `./init-sql.sh`
    - Password: postgres
3) Run your test queries

### Resetting Database
Executing the reinit-sql.sh script will drop, recreate, and reinitialize the database with data.
`./reinit-sql.sh`

### Troubleshooting
* **Scripts aren't executable**
    - Make sure you have permission to execute
    - `chmod -R 755 psql-client-scripts/`
### PostgresSQL Configuration
| Name | Value | Description |
|---|---|---|
| Host | localhost | Postgres listens on this interface and hostname |
| Port | 5432 | PSQL listens on this port and is also forwarded to the same port on the local machine |
| Username | postgres | Username for the superuser the Postgres server |
| Password | postgres | Password for the superuser on the Postgres server |

### Dev Container
* Node.js 22
* PostgreSQL 17.2
* PostgreSQL Client 13
* PostgreSQL Tools for Management in VSC

|Environment Variable Name | Default Value| Description |
|---|---|---|
| PGHOST | localhost | Used for init script and client scripts connection |
| PGPORT | 5432 | Used for init script and client scripts connection string |
| PGDATABASE | dvdrental | Used for client scripts connection string |
| PGUSER | postgres | Used for init script and client scripts connection string |
| PGPASSWORD | postgres | Used for init script and client scripts connection string |


### Sample Database
* Sample Database from [NeonTech](https://neon.tech/postgresql/postgresql-getting-started/postgresql-sample-database)
