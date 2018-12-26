-- Plan count should match the number of tests. If it does
-- not then pg_prove will fail the test
SELECT plan(5);

-- Run the tests.

-- Columns
SELECT columns_are('class', ARRAY[ 'classid', 'name', 'teacherid']);
SELECT col_type_is('class', 'name', 'text', 'name column type is -- text' );
SELECT col_type_is('class', 'teacherid', 'integer', 'teacherid column type is -- integer' );

-- Keys
SELECT has_pk('class', 'Has a Primary Key' );
SELECT col_is_pk( 'class', 'classid', 'Column is Primary Key -- id' );


-- Finish the tests and clean up.
SELECT * FROM finish();
ROLLBACK; -- don't commit the transaction
