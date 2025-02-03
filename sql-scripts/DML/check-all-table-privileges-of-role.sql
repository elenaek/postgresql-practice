-- Examples of how to check table privileges of a role, including inherited permissions
-- CREDIT: https://richyen.com/postgres/2021/08/16/permissions-inheritance.html


-- Lists all of the table privs of a role (superman)

SELECT r.rolname AS user_name,
       c.oid::regclass AS table_name,
       p.perm AS privilege_type
  FROM pg_class c CROSS JOIN
       pg_roles r CROSS JOIN
       unnest(ARRAY['SELECT','INSERT','UPDATE','DELETE','TRUNCATE','REFERENCES','TRIGGER']) p(perm)
 WHERE relkind = 'r' AND
       rolname = 'superman';


-- Lists the table privs of a role (justice_league) as it pertains specifically to tables that are not system tables

-- SELECT r.rolname AS user_name,
--        c.oid::regclass AS table_name,
--        p.perm AS privilege_type
--   FROM pg_class c CROSS JOIN
--        pg_roles r CROSS JOIN
--        unnest(ARRAY['SELECT','INSERT','UPDATE','DELETE','TRUNCATE','REFERENCES','TRIGGER']) p(perm)
--  WHERE relkind = 'r' AND
--        relnamespace NOT IN (SELECT oid FROM pg_namespace WHERE nspname in ('pg_catalog','information_schema')) AND
--        has_table_privilege(rolname, c.oid, p.perm) AND
--        rolname = 'justice_league';


-- Listst the table privs of a role (justice_league) as it pertains specifically to the 'actor' table

-- SELECT r.rolname AS user_name,
--        c.oid::regclass AS table_name,
--        p.perm AS privilege_type
--   FROM pg_class c CROSS JOIN
--        pg_roles r CROSS JOIN
--        unnest(ARRAY['SELECT','INSERT','UPDATE','DELETE','TRUNCATE','REFERENCES','TRIGGER']) p(perm)
--  WHERE relkind = 'r' AND
--        relnamespace NOT IN (SELECT oid FROM pg_namespace WHERE nspname in ('pg_catalog','information_schema')) AND
--        has_table_privilege(rolname, c.oid, p.perm) AND
--        c.oid = 'actor'::regclass AND
--        rolname = 'justice_league';
