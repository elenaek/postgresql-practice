-- Basic example of creating an index
-- PostgreSQL uses a b-tree(balanced tree) by default if no indexing method is specified

-- Creates a hash index on the title column within the film table 
CREATE INDEX idx_film_title
ON film
USING HASH(title); -- Specifies to use a hash index