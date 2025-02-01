# Overview
* SQL Practice for CS1011 Database Management - Foundations
* Contains a devcontainer with all PostgreSQL for practicing SQL queries
* Contains a DB init script

Store example SQL scripts from CS1011 Database Management - Foundations course for future use.
### Getting Started
1) Build and attach to devcontainer
2) Initialize the DB 
    - `./init-sql.sh`
    - Password: postgres
3) Run your test queries
    - You can use [pgadmin4](#pgAdmin4)
    - You can use VSC's PostgreSQL extension included in the devcontainer
### Dev Container
* Node.js 22
* pgAdmin4 8.4
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

### pgAdmin4
* pgAdmin4 is listening on [http://localhost:5050](http://localhost:5050) by default
* Username: postgres@admin.com
* Password: postgres

### Resetting Database
Executing the reinit-sql.sh script will drop, recreate, and reinitialize the database with data.
`./reinit-sql.sh`

### Troubleshooting
* **Scripts aren't executable**
    1)  Make sure you have permission to execute
        - `sudo su` OR `chmod -R +x .*`
* **File cannot be found error when running init scripts**
    1) Ensure line endings are set to LF: `\n`
### PostgresSQL Configuration
| Name | Value | Description |
|---|---|---|
| Host | localhost | Postgres listens on this interface and hostname |
| Port | 5432 | PSQL listens on this port and is also forwarded to the same port on the local machine |
| Username | postgres | Username for the superuser the Postgres server |
| Password | postgres | Password for the superuser on the Postgres server |