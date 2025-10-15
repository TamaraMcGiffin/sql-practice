-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

Joining both tables with id

SELECT *
FROM crime_scene INNER JOIN suspects
ON crime_scene.id = suspects.id;

Noted that there is an attire column and specified trench coat as clue in case brief

Result:

3	20010702	murder	Corner Café	A body was found behind the café. No witnesses reported anything, but there was a knife wound in the back.	3	Frankie Lombardi	trench coat	left cheek

Answer didn't work when submitted...

Attempt #2:

SELECT *
FROM crime_scene INNER JOIN suspects
ON crime_scene.id = suspects.id
WHERE attire = 'trench coat';

SELECT *
FROM interviews INNER JOIN suspects
ON interviews.id = suspects.id
WHERE transcript LIKE '%briefcase%';

SELECT *
FROM crime_scene INNER JOIN suspects
ON crime_scene.id = suspects.id
WHERE type = 'theft';

SELECT *
FROM crime_scene INNER JOIN suspects
ON crime_scene.id = suspects.id
WHERE location = 'Blue Note Lounge';

76	19851120	theft	Blue Note Lounge	A briefcase containing sensitive documents vanished. A witness reported a man in a trench coat with a scar on his left cheek fleeing the scene.	76	Emma Hall	jacket	none

SELECT * FROM interviews;

SELECT * FROM suspects
WHERE scar= 'left cheek';

Vincent Malone 

CORRECT ANSWER! 🎉
