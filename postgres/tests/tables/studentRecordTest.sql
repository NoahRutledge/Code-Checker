-- Plan count should match the number of tests. If it does
-- not then pg_prove will fail the test
SELECT plan(3);

-- Run the tests.

-- Columns
SELECT columns_are('student_record', ARRAY[ 'classid', 'userid']);
SELECT col_type_is('student_record', 'classid', 'integer', 'classid column type is -- integer' );
SELECT col_type_is('student_record', 'userid', 'integer', 'userid column type is -- integer' );

-- Finish the tests and clean up.
SELECT * FROM finish();
ROLLBACK; -- don't commit the transaction
