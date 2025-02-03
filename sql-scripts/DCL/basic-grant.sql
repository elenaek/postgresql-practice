-- Example of how to use GRANT to assign login roles(users) to group roles and group roles to login roles(users)
-- Also demonstrates how to assign privileges to roles

-- Create a group roles and a few login roles/users
CREATE ROLE justice_league
WITH
SUPERUSER;

CREATE ROLE actor_managers;


CREATE ROLE superman
WITH
LOGIN
PASSWORD 'notClarkKent!';

CREATE ROLE batman
WITH
LOGIN
PASSWORD 'notBruceWayne!';

CREATE ROLE johnny_cage
WITH
LOGIN
PASSWORD 'hollyw00d';



-- GRANTS the group role justice_league to login roles(users) superman and batman
-- In other words add superman and batman to the justice_league group
GRANT justice_league TO superman, batman;


-- Make user johnny_cage a part of the actor_managers group
GRANT actor_managers TO johnny_cage;
-- GRANT select, insert, update and delete privs on the tables actor to the group actor_managers
GRANT SELECT, INSERT, UPDATE, DELETE ON actor TO actor_managers; 