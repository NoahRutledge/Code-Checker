------------------------------------------
--Fetches a table of all the users
------------------------------------------
CREATE OR REPLACE FUNCTION get_all_users()
RETURNS setof "users" AS
$BODY$
BEGIN
RETURN QUERY
SELECT * FROM "users";
END;
$BODY$
LANGUAGE plpgsql;
------------------------------------------
--Creates new user
------------------------------------------
CREATE OR REPLACE FUNCTION public.create_new_user(
	name character varying,
	username character varying,
	password character varying,
	email character varying)
    RETURNS void
    LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
INSERT INTO "users" ("userid","username", "password", "email", "name") VALUES(nextval('user_userid_seq'),username, password, email, name);
END;

$BODY$;

ALTER FUNCTION public.create_new_user(character varying, character varying, character varying, character varying)
    OWNER TO "towell_sensei";


------------------------------------------
--Shows all problems
------------------------------------------

CREATE OR REPLACE FUNCTION public.get_problems()
    RETURNS SETOF "problem" 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
BEGIN
RETURN QUERY
SELECT * FROM "problem";
END;

$BODY$;

ALTER FUNCTION public.get_problems()
    OWNER TO "towell_sensei";
	
------------------------------------------
--add submission
------------------------------------------

CREATE OR REPLACE FUNCTION add_submission(
	pid integer, 
	uid integer, 
	c bytea, 
	f character varying, 
	g integer, 
	cid integer)
RETURNS integer AS
$BODY$
BEGIN
INSERT INTO "submission"("problemid","userid","code","filename","grade","classid") VALUES(pid, uid, c, f, g, cid);
RETURN (SELECT MAX(submisisonid) FROM submission WHERE problemid = pid AND userid = uid AND code = c AND filename = f AND classid = cid);
END;
$BODY$
LANGUAGE plpgsql;

------------------------------------------
--create problem
------------------------------------------
CREATE OR REPLACE FUNCTION create_problem( 
	name character varying,
	description character varying,
	input character varying,
	output character varying)
RETURNS void AS
$BODY$
BEGIN
INSERT INTO "problem"("problemid","name","description","input","output") 
VALUES(nextval('problem_problemid_seq'),name, description, input, output);
END;
$BODY$
LANGUAGE plpgsql;

------------------------------------------
-- Gets input column using problemid
------------------------------------------
CREATE OR REPLACE FUNCTION getInput(pid integer)
RETURNS text AS
$BODY$
BEGIN
RETURN (SELECT input FROM problem WHERE problemid = pid);
END;
$BODY$
LANGUAGE plpgsql;

------------------------------------------
-- Gets output column using problemid
------------------------------------------
CREATE OR REPLACE FUNCTION getOutput(pid integer)
RETURNS text AS
$BODY$
BEGIN
RETURN (SELECT output FROM problem WHERE problemid = pid);
END;
$BODY$
LANGUAGE plpgsql;

------------------------------------------
-- Delete problem in a class
------------------------------------------
CREATE OR REPLACE FUNCTION delete_problem(pid integer)
RETURNS void AS
$BODY$
BEGIN
DELETE FROM problem WHERE problemid = pid;
END;
$BODY$
LANGUAGE plpgsql;

------------------------------------------
-- Update problem data
------------------------------------------
CREATE OR REPLACE FUNCTION update_problem(id integer, n character varying, d character varying, i character varying, o character varying)
RETURNS void AS
$BODY$
BEGIN
UPDATE problem SET name = n, description = d, input = i, output = o WHERE problemid = id;
END;
$BODY$
LANGUAGE plpgsql;

------------------------------------------
-- Update grade after compilation
------------------------------------------
CREATE OR REPLACE FUNCTION update_grade(id integer, g integer)
RETURNS void AS
$BODY$
BEGIN
UPDATE submission SET grade = g WHERE submissionid = id;
END;
$BODY$
LANGUAGE plpgsql;

------------------------------------------
-- Get file data and name from uploaded submission
------------------------------------------
CREATE OR REPLACE FUNCTION get_submission(sid integer)
RETURNS SETOF submission AS
$BODY$
BEGIN
RETURN QUERY (SELECT * FROM submission WHERE submissionid = sid);
END;
$BODY$
LANGUAGE plpgsql;
