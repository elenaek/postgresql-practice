-- Creates a login role which has superuser permissions (basically able to do anything) that expires at some date
-- and a group role which has superuser permissions
-- Probably want to delete 

CREATE ROLE superman
WITH
LOGIN -- Attribute that allows the user to login, and is what separates a LOGIN role from a GROUP role
PASSWORD 'notSoSuperSecretPass!'
CREATEDB -- Attribute that allows the user to create databases (redundant with superuser)
SUPERUSER -- Attribute that gives the user superuser privs
VALID UNTIL '2025-03-02'; -- Attribute that expires the password on specified date

CREATE ROLE supermen -- Creates a group role as this statement does not have the LOGIN attribute
WITH
CREATEDB 
SUPERUSER;
