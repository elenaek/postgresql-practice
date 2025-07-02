# Overview
* Meant to be a sandbox for playing with PostgreSQL locally on your machine
* PostgreSQL Practice for CS1011 Database Management - Foundations
* Contains a devcontainer with PostgreSQL, and tools for interacting with PostgreSQL dbs and servers for practicing SQL queries and administration tasks
* Contains sample DB data from _Neontech_ to practice with

### Requirements
* Git
* Docker or Docker Desktop
* Visual Studio Code for best integration

### Getting Started
1) `git clone https://github.com/elenaek/postgresql-practice.git`
2) `code ./postgresql-practice`
3) Build and attach to devcontainer in VSC
4) Initialize the DB 
    - `./init-sql.sh`
    - Password: postgres
5) Run your test queries, explore pgAdmin4, do your thing
    - You can use [pgadmin4](#pgAdmin4)
    - You can use VSC's PostgreSQL extension included in the devcontainer
    
### Dev Container Versions
* Node.js 22
* pgAdmin4 8.4
* PostgreSQL 17.2
* PostgreSQL Client 17
* PostgreSQL Tools for Management in VSC

|Environment Variable Name | Default Value| Description |
|---|---|---|
| PGHOST | localhost | Used for init script and client scripts connection |
| PGPORT | 5432 | Used for init script and client scripts connection string |
| PGDATABASE | dvdrental | Used for client scripts connection string |
| PGUSER | postgres | Used for init script and client scripts connection string |
| PGPASSWORD | postgres | Used for init script and client scripts connection string |

### Usage
* pgAdmin4 is packaged with the devcontainer and you can access it by default at `http://localhost:5050`
    * You can use this to play with Database Administration, test SQL queries and just learn the overall structure of a PostgreSQL database
* Peruse, test, learn or refer to the postgresql-client scripts from the `psql-client-scripts` directory
* Peruse, test, learn or refer to the SQL scripts from the `sql-scripts` directory
    * _DCL_ is Data Control Language scripts, like creating, revoking or granting roles and privileges
    * _DDL_ is Data Definition Lanaguage scripts, like creating, dropping, updating tables or views
    * _DML_ is Data Manipulation Language scripts, like selecting attributes, records or tables
    * _TCL_ is Transaction Control Language scripts, like starting, savepoints, rollingback or ending transactions

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