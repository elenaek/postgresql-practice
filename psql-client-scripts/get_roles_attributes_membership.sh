#!/bin/bash

# List all roles
echo "List roles"
echo "-----------------------------------"
psql -c "\du+"
