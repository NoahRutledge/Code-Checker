-------------------------------
--users table mock data inserts
-------------------------------
INSERT INTO "users" (
"userid",
"username",
"password",
"email",
"name"
)
 VALUES 
(
 nextval('user_userid_seq'),
 'JBaby22',
 'sdfgh6',
 'jbaby22@email.com',
 'Jerry Hallman'
),
 
(
 nextval('user_userid_seq'),
 'JokerMan',
 'wefgh6',
 'jokerman@email.com',
 'Mark Hagar'
),
 
(
 nextval('user_userid_seq'),
 'TeehowSinty',
 'lkjhgf7',
 'teehowsinty@email.com',
 'Tina Fey'
),
  
(
 nextval('user_userid_seq'),
 'Myab65',
 'mnbvc5',
 'myab65@email.com',
 'Mary Marks'
),
 
(
 nextval('user_userid_seq'),
 'JustKidding11',
 'jhgfdlkjhgf5',
 'justkidding11@email.com',
 'Jese May'
),

(
 nextval('user_userid_seq'),
 'Pr0grammes',
 'mnbvcxsdfghj6',
 'pr0grammes@email.com',
 'Josh McAlister'
),
 
(
 nextval('user_userid_seq'),
 'SudoFunDo2',
 'nbvcxzxcvbn6',
 'sudofundo2@email.com',
 'Evan Webb'
),

(
 nextval('user_userid_seq'),
 'HereSoIdntGitFind',
 'nbdsdfgh8',
 'heresoidntgitfind@email.com',
 'Derrick Henry'
),

(
 nextval('user_userid_seq'),
 'JustaName5',
 'gdsfghj7',
 'justaname5@email.com',
 'Hallie Creame'
),

(
 nextval('user_userid_seq'),
 'Usernamez4me',
 'fdsasdfghj9',
 'usernamez4me@email.com',
 'Tyson Rogers'
);

------------------------------------
--assignment table mock data inserts
------------------------------------
INSERT INTO "assignment" (
"assignmentid",
"name",
"testfile",
"description"
)
 VALUES 
(
nextval('assignment_assignmentid_seq'),
'Hanoi',
'Hanoi.php',
'this is a description of hanoi'
),

(
nextval('assignment_assignmentid_seq'),
'Marriage',
'Marriage.php',
'this is a description of marriage'
),

(
nextval('assignment_assignmentid_seq'),
'p=np',
'p=np.php',
'this is a description of p=np'
),

(
nextval('assignment_assignmentid_seq'),
'connect dots',
'connectdots.php',
'this is a description of connect dots'
),

(
nextval('assignment_assignmentid_seq'),
'purple america',
'purpleAmerica.php',
'this is a description of purple america'
),

(
nextval('assignment_assignmentid_seq'),
'recursion',
'recursion.php',
'this is a description of recursion'
),

(
nextval('assignment_assignmentid_seq'),
'prime numbers',
'primenumbers.php',
'this is a description of prime numbers'
),

(
nextval('assignment_assignmentid_seq'),
'bridges',
'bridges.php',
'this is a description of bridges'
),

(
nextval('assignment_assignmentid_seq'),
'gcd',
'gcd.php',
'this is a description of gcd'
),

(
nextval('assignment_assignmentid_seq'),
'test',
'test.php',
'this is a description of test'
);

------------------------------------
--class table mock data inserts
------------------------------------

INSERT INTO "class" (
"classid",
"name",
"teacherid"
)
 VALUES 
(
nextval('class_classid_seq'),
'Class 111',
1
),
(
nextval('class_classid_seq'),
'Class 123',
4
),
(
nextval('class_classid_seq'),
'Class 122',
6
),
(
nextval('class_classid_seq'),
'Class 654',
8
),
(
nextval('class_classid_seq'),
'Class 950',
5
),
(
nextval('class_classid_seq'),
'Class 689',
6
),
(
nextval('class_classid_seq'),
'Class 577',
4
),
(
nextval('class_classid_seq'),
'Class 396',
2
),
(
nextval('class_classid_seq'),
'Class 109',
9
);

----------------------------------------
--student_record table mock data inserts
----------------------------------------
INSERT INTO "student_record" (
"classid",
"userid"
)
 VALUES 
(
1,
1
),
(
1,
2
),
(
1,
3
),
(
1,
4
),
(
4,
5
),
(
4,
9
),
(
4,
7
),
(
4,
8
),
(
4,
10
);
----------------------------------------
--submission table mock data inserts
----------------------------------------
INSERT INTO "submission" (
"submissionid",
"assignmentid",
"userid",
"code",
"filename",
"grade",
"attempt_number",
"classid"
)
 VALUES 
(
nextval('submission_submissionid_seq'),
1,
7,
'bogga.java',
'bogga name',
100,
2,
7
),
(
nextval('submission_submissionid_seq'),
1,
8,
'nfsdf.java',
'nfsdf name',
55,
1,
7
),
(
nextval('submission_submissionid_seq'),
3,
7,
'pqql.java',
'pqql name',
28,
1,
5
),
(
nextval('submission_submissionid_seq'),
3,
7,
'sponge.java',
'sponge name',
55,
2,
9
),
(
nextval('submission_submissionid_seq'),
4,
6,
'opps.java',
'opps name',
77,
2,
8
);
----------------------------------------
--due_table mock data inserts
----------------------------------------
