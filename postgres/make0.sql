------------------------------------------
--Creates User
------------------------------------------
CREATE USER towell_sensei WITH PASSWORD 'pass' CREATEDB CREATEROLE;
GRANT towell_sensei TO ragsdaletc;
SET ROLE TO towell_sensei;
------------------------------------------
--Creates Database and Connect
------------------------------------------
CREATE DATABASE trigger_test;
\c trigger_test;
------------------------------------------
--Creates the users Table
------------------------------------------
CREATE SEQUENCE public."user_userid_seq"
INCREMENT 1
START 1
MINVALUE 1
MAXVALUE 9223372036854775807
CACHE 1;

ALTER SEQUENCE public."user_userid_seq"
	OWNER TO "towell_sensei";


-- Table: public."users"

-- DROP TABLE public."users";

CREATE TABLE public."users"
(
    "userid" integer NOT NULL DEFAULT nextval('"user_userid_seq"'::regclass),
    "username" "text" NOT NULL,
    "password" "text" NOT NULL,
    "email" "text" NOT NULL,
    "name" "text" NOT NULL,
    CONSTRAINT "user_pkey" PRIMARY KEY ("userid")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."users"
    OWNER to "towell_sensei";
-------------------------------------------
--Creates the class Table
-------------------------------------------
CREATE SEQUENCE public."class_classid_seq"
INCREMENT 1
START 1
MINVALUE 1
MAXVALUE 9223372036854775807
CACHE 1;

ALTER SEQUENCE public."class_classid_seq"
	OWNER TO "towell_sensei";
	
-- Table: public."class"

-- DROP TABLE public."class";

CREATE TABLE public."class"
(
    "classid" integer NOT NULL DEFAULT nextval('"class_classid_seq"'::regclass),
    "name" "text" NOT NULL,
    "teacherid" integer NOT NULL,
    CONSTRAINT "class_pkey" PRIMARY KEY ("classid"),
    CONSTRAINT "teacherid" FOREIGN KEY ("teacherid")
        REFERENCES public."users" ("userid") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."class"
    OWNER to "towell_sensei";
----------------------------------------
--Creates the student_record TABLE
----------------------------------------
CREATE SEQUENCE public."student_record_classid_seq"
INCREMENT 1
START 1
MINVALUE 1
MAXVALUE 9223372036854775807
CACHE 1;

ALTER SEQUENCE public."student_record_classid_seq"
	OWNER TO "towell_sensei";
	
CREATE SEQUENCE public."student_record_userid_seq"
INCREMENT 1
START 1
MINVALUE 1
MAXVALUE 9223372036854775807
CACHE 1;

ALTER SEQUENCE public."student_record_userid_seq"
	OWNER TO "towell_sensei";
	

-- Table: public."student_record"

-- DROP TABLE public."student_record";

CREATE TABLE public."student_record"
(
    "classid" integer NOT NULL DEFAULT nextval('"student_record_classid_seq"'::regclass),
    "userid" integer NOT NULL DEFAULT nextval('"student_record_userid_seq"'::regclass),
    CONSTRAINT "student_record_pkey" PRIMARY KEY ("classid", "userid"),
    CONSTRAINT "classid" FOREIGN KEY ("classid")
        REFERENCES public."class" ("classid") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "userid" FOREIGN KEY ("userid")
        REFERENCES public."users" ("userid") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."student_record"
    OWNER to "towell_sensei";
------------------------------------
--Creates the problem Table
------------------------------------

CREATE SEQUENCE public."problem_problemid_seq"
INCREMENT 1
START 1
MINVALUE 1
MAXVALUE 9223372036854775807
CACHE 1;

ALTER SEQUENCE public."problem_problemid_seq"
	OWNER TO "towell_sensei";

CREATE TABLE public."problem"
(
    "problemid" integer NOT NULL DEFAULT nextval('"problem_problemid_seq"'::regclass),
	"input" "text" NOT NULL,
	"output" "text" NOT NULL,
    "name" "text" NOT NULL,
    "description" "text" COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "problem_pkey" PRIMARY KEY ("problemid")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."problem"
    OWNER to "towell_sensei";
-----------------------------------
--Creates submission table
-----------------------------------

CREATE SEQUENCE public."submission_submissionid_seq"
INCREMENT 1
START 1
MINVALUE 1
MAXVALUE 9223372036854775807
CACHE 1;

ALTER SEQUENCE public."submission_submissionid_seq"
	OWNER TO "towell_sensei";
	
CREATE SEQUENCE public."submission_problemid_seq"
INCREMENT 1
START 1
MINVALUE 1
MAXVALUE 9223372036854775807
CACHE 1;

ALTER SEQUENCE public."submission_problemid_seq"
	OWNER TO "towell_sensei";
	
CREATE SEQUENCE public."submission_userid_seq"
INCREMENT 1
START 1
MINVALUE 1
MAXVALUE 9223372036854775807
CACHE 1;

ALTER SEQUENCE public."submission_userid_seq"
	OWNER TO "towell_sensei";
	
CREATE SEQUENCE public."submission_classid_seq"
INCREMENT 1
START 1
MINVALUE 1
MAXVALUE 9223372036854775807
CACHE 1;

ALTER SEQUENCE public."submission_classid_seq"
	OWNER TO "towell_sensei";
	
-- Table: public."submission"

-- DROP TABLE public."submission";

CREATE TABLE public."submission"
(
    "submissionid" integer NOT NULL DEFAULT nextval('"submission_submissionid_seq"'::regclass),
    "problemid" integer NOT NULL DEFAULT nextval('"submission_problemid_seq"'::regclass),
    "userid" integer NOT NULL DEFAULT nextval('"submission_userid_seq"'::regclass),
    "code" "bytea" NOT NULL,
	"filename" "text" NOT NULL,
    "grade" integer NOT NULL,
    "classid" integer NOT NULL DEFAULT nextval('"submission_classid_seq"'::regclass),
    CONSTRAINT "submission_pkey" PRIMARY KEY ("submissionid"),
    CONSTRAINT "problemid" FOREIGN KEY ("problemid")
        REFERENCES public."problem" ("problemid") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "classid" FOREIGN KEY ("classid")
        REFERENCES public."class" ("classid") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "userid" FOREIGN KEY ("userid")
        REFERENCES public."users" ("userid") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."submission"
    OWNER to "towell_sensei";

-------------------------------------
--Creates assignment Table
-------------------------------------

CREATE SEQUENCE public."assignment_problemid_seq"
INCREMENT 1
START 1
MINVALUE 1
MAXVALUE 9223372036854775807
CACHE 1;

ALTER SEQUENCE public."assignment_problemid_seq"
	OWNER TO "towell_sensei";

CREATE SEQUENCE public."assignment_classid_seq"
INCREMENT 1
START 1
MINVALUE 1
MAXVALUE 9223372036854775807
CACHE 1;

ALTER SEQUENCE public."assignment_classid_seq"
	OWNER TO "towell_sensei";

-- Table: public."assignment"

-- DROP TABLE public."assignment";

CREATE TABLE public."assignment"
(
    "classid" integer NOT NULL DEFAULT nextval('"assignment_classid_seq"'::regclass),
    "problemid" integer NOT NULL DEFAULT nextval('"assignment_problemid_seq"'::regclass),
    "due_date" date NOT NULL,
    "date_assigned" date NOT NULL,
    CONSTRAINT "assignment_pkey" PRIMARY KEY ("classid", "problemid"),
    CONSTRAINT "problemid" FOREIGN KEY ("problemid")
        REFERENCES public."problem" ("problemid") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "classid" FOREIGN KEY ("classid")
        REFERENCES public."class" ("classid") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."assignment"
    OWNER to "towell_sensei";
