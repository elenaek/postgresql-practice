-- Basic example of dropping an index if it exists


DROP INDEX IF EXISTS idx_film_title;

-- DROPs the index and any object that depends on it
-- DROP INDEX IF EXISTS idx_film_title CASCADE;