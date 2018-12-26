-- Plan count should match the number of tests. If it does
-- not then pg_prove will fail the test
SELECT plan(5);

-- Run the tests.

-- Columns
SELECT columns_are('assignment', ARRAY[ 'classid', 'problemid', 'due_date', 'date_assigned']);
SELECT col_type_is('assignment', 'classid', 'integer', 'classid column type is -- integer' );
SELECT col_type_is('assignment', 'problemid', 'integer', 'problemid column type is -- integer' );
SELECT col_type_is('assignment', 'due_date', 'date', 'date_date column type is -- date' );
SELECT col_type_is('assignment', 'date_assigned', 'date', 'date_assigned column type is -- date' );

-- Finish the tests and clean up.
SELECT * FROM finish();
ROLLBACK; -- don't commit the transaction
