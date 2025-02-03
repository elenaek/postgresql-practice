#!/bin/bash


echo "List roles with login (user roles)"
echo "-----------------------------------"
psql -c "\du+"
