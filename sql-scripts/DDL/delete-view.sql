-- Example of the several ways you can delete a view
-- Creates a view and then deletes it

CREATE OR REPLACE VIEW some_test_view
AS
SELECT * 
FROM actor;

/*
    This drops the some_test_view view, unless it has dependencies
*/
DROP VIEW some_test_view;

/*
    This drops the some_test_view, unless it has dependencies view and doesn't throw an error if it doesn't exist
*/
DROP VIEW IF EXISTS some_test_view;

/*
    This drops the some_test_view view AND all of its dependencies and doesn't throw an error if it doesn't exist
*/
DROP VIEW IF EXISTS some_test_view CASCADE;
