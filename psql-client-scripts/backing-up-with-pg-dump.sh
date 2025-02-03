#!/bin/bash

# Set script to exit on error
set -e

# Get available atabases in csv format
available_databases=$(tail -n +2 <(psql -l --csv))

# Seed RANDOM using the script's PID
RANDOM=$$

# Instantiate and declare variables to store database choices and a unique suffix
tmp_random_pgpass_path="$HOME/.pgpass.bak.$RANDOM"
did_mod_pgpass=0
default_dump_path="my_dump.sql"
database_choices=("all")
database_choices_counter=1


# Declare function that triggers on script exit (whether gracefully or because of error)
function onExit {
    exitcode=$?
    # Check if we modified pgpass
    [[ $did_mod_pgpass -eq 0 ]] || rm ~/.pgpass
    # Check if there was an existing pgpass and set it back as the .pgpass
    if test -f $tmp_random_pgpass_path; then
        mv $tmp_random_pgpass_path ~/.pgpass
    fi
    if [ $exitcode -eq 0 ]; then
        echo "Dump exported successfully"
        exit 0
    fi
    echo -e "Failed to dump. Exit code: $exitcode"
    exit 1
}
trap onExit EXIT


# Loop through the available databases and add them as database choices
while IFS= read -r line;
do
    IFS=',' read -r name owner encoding collate ctype access <<< "$line"
    database_choices[database_choices_counter]=$name
    ((database_choices_counter++))
done <<< $available_databases;

# Prompt user to choose a database to dump from the array of database choices
echo -e "Choose a database to dump: "
select choice in "${database_choices[@]}"
do
    if [[ -n $choice ]]; then
        # Prompt users to specify a path to save the backup .tar file
        read -p "Specify a path to save the dump ($default_dump_path): " dump_path
        dump_path=${dump_path:-$default_dump_path}
        read -s -p "Input password for user '$PGUSER': " password
        if test -f ~/.pgpass; then
            mv ~/.pgpass $tmp_random_pgpass_path
        fi
        echo "$PGHOST:$PGPORT:$PGDATABASE:$PGUSER:$password" > ~/.pgpass
        did_mod_pgpass=1
        # If the user choses to dump all then use pg_dumpall instead
        if [[ $choice = "all" ]]; then
                # Use pg_dump to back up the chosen database as a sql script
                pg_dumpall -U $PGUSER -w > $dump_path
        else
            # Use pg_dump to back up the chosen database as a sql script
            pg_dump -U $PGUSER -w -F p $choice > $dump_path
        fi
        break
    else
        echo "Invalid choice"
    fi
done


