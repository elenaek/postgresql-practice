-- Example of how to drop multiple roles

-- First revoke all privileges on all tables from public schema from the group roles in order to get rid of dependencies
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM actor_managers, justice_league;

-- DROP all roles if they exist
DROP ROLE IF EXISTS superman, batman, supermen, justice_league, actor_managers, johnny_cage;