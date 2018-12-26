-- Plan count should match the number of tests. If it does
-- not then pg_prove will fail the test
SELECT plan(4);

-- Run the tests.

-- Columns
SELECT columns_are('users', ARRAY[ 'userid', 'username', 'password', 'email', 'name']);
SELECT col_type_is('users', 'username', 'text', 'name column type is -- text' );

-- Keys
SELECT has_pk('users', 'Has a Primary Key' );
SELECT col_is_pk( 'users', 'userid', 'Column is Primary Key -- id' );


-- Finish the tests and clean up.
SELECT * FROM finish();
ROLLBACK; -- don't commit the transaction
