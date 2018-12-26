-- Plan count should match the number of tests. If it does
-- not then pg_prove will fail the test
SELECT plan(7);

-- Run the tests.

-- Columns
SELECT columns_are('problem', ARRAY[ 'problemid', 'input', 'output', 'name', 'description']);
SELECT col_type_is('problem', 'input', 'text', 'input column type is -- text' );
SELECT col_type_is('problem', 'output', 'text', 'output column type is -- text' );
SELECT col_type_is('problem', 'name', 'text', 'name column type is -- text' );
SELECT col_type_is('problem', 'description', 'text', 'description column type is -- text' );

-- Keys
SELECT has_pk('problem', 'Has a Primary Key' );
SELECT col_is_pk( 'problem', 'problemid', 'Column is Primary Key -- id' );


-- Finish the tests and clean up.
SELECT * FROM finish();
ROLLBACK; -- don't commit the transaction
