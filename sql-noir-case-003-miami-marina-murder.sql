-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

Case #003: The Miami Marina Murder
A body was found floating near the docks of Coral Bay Marina in the early hours of August 14, 1986. Your job, detective, is to find the murderer and bring them to justice. This case might require the use of JOINs, wildcard searches, and logical deduction. Get to work, detective.

Objectives
1.
Find the murderer. ( Start by finding the crime scene and go from there )

SELECT *
FROM crime_scene INNER JOIN interviews
ON crime_scene.id = interviews.id
WHERE date LIKE '%19860814%' AND location LIKE '%Coral Bay Marina%';

id 43	 
date 19860814	
location Coral Bay Marina	
description The body of an unidentified man was found near the docks. Two people were seen nearby: one who lives on 300ish "Ocean Drive" and another whose first name ends with "ul" and his last name ends with "ez".

SELECT * FROM person
WHERE address LIKE '%Ocean Drive';

id 101	name Carlos Mendez	alias Los Ojos	occupation Fisherman	address 369 Ocean Drive

SELECT * FROM person
WHERE name LIKE '%ez';

id 102	name Raul Gutierrez	alias The Cobra	occupation Nightclub Owner	address 45 Sunset Ave

SELECT id, person_id, transcript FROM interviews
WHERE id = 101 OR id = 102;

id 101	person_id 101	transcript I saw someone check into a hotel on August 13. The guy looked nervous.
id 102	person_id 58	transcript NULL

SELECT * FROM interviews WHERE person_id = 101 OR person_id = 102;

id 103	person_id 102	transcript I heard someone checked into a hotel with "Sunset" in the name.

SELECT * FROM hotel_checkins INNER JOIN surveillance_records ON hotel_checkins.id = surveillance_records.hotel_checkin_id
WHERE hotel_checkins.check_in_date = 19860813 AND hotel_checkins.hotel_name LIKE '%Sunset%';

id 2	person_id 27	hotel_name Sunset Bay Hotel	check_in_date 19860813	id 8 person_id	8	hotel_check_in_id 2	suspicious_activity Left suddenly at 3 AM

SELECT * FROM confessions
WHERE id = 8 OR person_id = 8;

id 73	person_id 8	confession Alright! I did it. I was paid to make sure he never left the marina alive.

SELECT name FROM person
WHERE id = 73;

Alan Reynolds

WRONG

SELECT * FROM person INNER JOIN confessions ON person.id = confessions.person_id 
WHERE person.id = '8';

id 8	name Thomas Brown	alias The Fox	occupation Dock Worker	address 234 Port Street	id 73	person_id 8	confession Alright! I did it. I was paid to make sure he never left the marina alive.

Case Solved!
Great detective work! Thomas Brown has confessed to the crime.

Case Explanation
The investigation started with two suspects from the crime scene, one living on Ocean Drive and the other with a name ending in "ez". After interviewing them, hotel check-ins were filtered using two separate clues—first by date, then further refined using surveillance records. Only three people matched both filters. An interview with each of them revealed their role in the case, and after pressing further, Thomas Brown confessed to the crime.





