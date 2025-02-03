-- Example of how to use GRANT to assign privileges to group roles and group roles to login roles/users

-- Create a group roles and a few login roles/users
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
-- In other words add superman and batman to the justice_league group
GRANT justice_league TO superman, batman;