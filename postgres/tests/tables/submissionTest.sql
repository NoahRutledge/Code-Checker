-- Plan count should match the number of tests. If it does
-- not then pg_prove will fail the test
SELECT plan(9);

-- Run the tests.

-- Columns
SELECT columns_are('submission', ARRAY[ 'submissionid', 'problemid', 'userid', 'code', 'filename', 'grade', 'classid']);
SELECT col_type_is('submission', 'problemid', 'integer', 'problemid column type is -- integer' );
SELECT col_type_is('submission', 'userid', 'integer', 'userid column type is -- integer' );
SELECT col_type_is('submission', 'code', 'bytea', 'code column type is -- bytea' );
SELECT col_type_is('submission', 'filename', 'text', 'filename column type is -- text' );
SELECT col_type_is('submission', 'grade', 'integer', 'grade column type is -- integer' );
SELECT col_type_is('submission', 'classid', 'integer', 'classid column type is -- integer' );

-- Keys
SELECT has_pk('submission', 'Has a Primary Key' );
SELECT col_is_pk( 'submission', 'submissionid', 'Column is Primary Key -- id' );


-- Finish the tests and clean up.
SELECT * FROM finish();
ROLLBACK; -- don't commit the transaction
