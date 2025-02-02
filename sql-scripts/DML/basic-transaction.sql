-- Example of how to perform a transaction
-- All of the SQL statements between BEGIN and COMMIT must succeed or else the transaction will fail
-- If the transaction fails you can issue a ROLLBACK command in order to undo the transaction
-- This allows you to group many SQL statements as one unit of work and make the entire transaction ATOMIC to comply with ACID

BEGIN; -- Begins a transaction

    UPDATE customer
    SET first_name = 'Body',
    last_name = 'Snatcher',
    email = 'glorpglorp@gmail.com'
    WHERE customer_id = 1;

SAVEPOINT updated_customer_1; -- Creates a savepoint that you can rollback to if any further SQL statements fail ahead

    INSERT INTO customer (first_name, last_name, email, store_id, address_id)
    VALUES ('Some', 'Guy', 'SomeGuy@gmail.com', 1, 1);

SAVEPOINT inserted_some_guy; -- Creates a savepoint that you can rollback to if any further SQL statements fail ahead

    INSERT INTO representative (first_name, last_name)
    VALUES ('Some', 'Representative');

COMMIT; -- Completes the transaction and commit all changes made, if any of the SQL statements fail, it will not COMMIT and you must ROLLBACK

/*
    You can ROLLBACK TO a savepoint if any of the SQL statements fail instead of rolling back the entire transaction
*/
-- ROLLBACK TO updated_customer_1;
-- ROLLBACK TO inserted_some_guy;
-- ROLLBACK;