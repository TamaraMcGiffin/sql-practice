-- Record your SQL detective process here!  Write down: 
--   1. The SQL queries you ran
--   2. Any notes or insights as SQL comments
--   3. Your final conclusion: who did it?

-- Using these SQL clauses will help you solve the mystery: 
--    SELECT, FROM, WHERE, AND, OR, ORDER BY, LIMIT, LIKE, DISTINCT, BETWEEN, AS

-- First SQL run

SELECT sql 
  FROM sqlite_master
 where name = 'crime_scene_report'

--Outcome 

CREATE TABLE crime_scene_report ( date integer, type text, description text, city text )

-- #2

SELECT sql 
  FROM sqlite_master
 where name = 'drivers_license'

--Outcome

CREATE TABLE drivers_license ( id integer PRIMARY KEY, age integer, height integer, eye_color text, hair_color text, gender text, plate_number text, car_make text, car_model text )

-- #3

SELECT sql 
  FROM sqlite_master
 where name = 'facebook_event_checkin'

--Outcome

CREATE TABLE facebook_event_checkin ( person_id integer, event_id integer, event_name text, date integer, FOREIGN KEY (person_id) REFERENCES person(id) )

-- #4

SELECT sql 
  FROM sqlite_master
 where name = 'interview'

--Outcome

CREATE TABLE interview ( person_id integer, transcript text, FOREIGN KEY (person_id) REFERENCES person(id) )

-- #5

SELECT sql 
  FROM sqlite_master
 where name = 'get_fit_now_member'

--Outcome

CREATE TABLE get_fit_now_member ( id text PRIMARY KEY, person_id integer, name text, membership_start_date integer, membership_status text, FOREIGN KEY (person_id) REFERENCES person(id) )

-- #6

SELECT sql 
  FROM sqlite_master
 where name = 'get_fit_now_check_in'

--Outcome

CREATE TABLE get_fit_now_check_in ( membership_id text, check_in_date integer, check_in_time integer, check_out_time integer, FOREIGN KEY (membership_id) REFERENCES get_fit_now_member(id) )

-- #7
  
SELECT sql 
  FROM sqlite_master
 where name = 'solution'

--Outcome
  
CREATE TABLE solution ( user integer, value text )

-- #8 
  
SELECT sql 
  FROM sqlite_master
 where name = 'income'

--Outcome

CREATE TABLE income (ssn CHAR PRIMARY KEY, annual_income integer)


-- #9

SELECT sql 
  FROM sqlite_master
 where name = 'person'

--Outcome


CREATE TABLE person (id integer PRIMARY KEY, name text, license_id integer, address_number integer, address_street_name text, ssn CHAR REFERENCES income (ssn), FOREIGN KEY (license_id) REFERENCES drivers_license (id))

Queries:
  
SELECT count(*)
FROM person; 

(Result 10,011 people)

SELECT * FROM person LIMIT 10;

(Result: table with rows/columns displayed)

SELECT DISTINCT type FROM crime_scene_report;

(Result: Types of crime listed) 

SELECT * FROM crime_scene_report 
WHERE type = 'murder' 
AND city = 'SQL City';

Result: 
20180215	murder	REDACTED REDACTED REDACTED	SQL City
20180215	murder	Someone killed the guard! He took an arrow to the knee!	SQL City
20180115	murder	Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".	SQL City

SELECT * FROM person
WHERE address_street_name='Northwestern Dr';

Last house on Street - highest number?   14887	Morty Schapiro	118009	4919	Northwestern Dr	111564949

Correct demonstrated code for finding Morty: 

SELECT * FROM person 
WHERE address_street_name = 'Northwestern Dr' 
ORDER BY address_number DESC LIMIT 1;

SELECT * FROM person 
WHERE name like '%Annabel%'
AND address_street_name = 'Franklin Ave';

Result:
16371	Annabel Miller	490173	103	Franklin Ave	318771143

SELECT person.name, interview.transcript
FROM person JOIN interview
ON person.id = interview.person_id
WHERE person.id = 14887 OR person.id = 16371;

Result:

Morty Schapiro	I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".
Annabel Miller	I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

  SELECT * FROM get_fit_now_member;
SELECT * FROM get_fit_now_member
WHERE membership_status= 'gold'; (long list)

SELECT * FROM drivers_license
WHERE plate_number= 'H42W'; (No data returned)

SELECT * FROM get_fit_now_member
WHERE membership_status= 'gold'
AND id LIKE '48Z%';

Two results returned:

Joe Germuska
Jeremy Bowers

INSERT INTO solution VALUES (1, 'Jeremy Bowers');
        
        SELECT value FROM solution;

FINAL RESULT:

Congrats, you found the murderer! But wait, there's more... If you think you're up for a challenge, try querying the interview transcript of the murderer to find the real villain behind this crime. If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries. Use this same INSERT statement with your new suspect to check your answer.




