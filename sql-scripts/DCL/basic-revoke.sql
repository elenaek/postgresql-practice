-- Example of how to revoke a role from a target role and privs

-- Create a group roles and a few login roles/users for example
CREATE ROLE justice_league
WITH
SUPERUSER;

CREATE ROLE superman
WITH
LOGIN
PASSWORD 'notClarkKent!';

CREATE ROLE batman
WITH
LOGIN
PASSWORD 'notBruceWayne!';

-- GRANTS the group role justice_league to login roles(users) superman and batman
GRANT justice_league TO superman, batman;

-- REVOKES the group role justice_league from login roles(users) superman and batman
REVOKE justice_league FROM superman, batman;

-- REVOKES all privileges on all tables in schema public from justice_league role
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM justice_league;