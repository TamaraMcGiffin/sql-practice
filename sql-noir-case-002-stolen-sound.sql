-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

In the neon glow of 1980s Los Angeles, the West Hollywood Records store was rocked by a daring theft. A prized vinyl record, worth over $10,000, vanished during a busy evening, leaving the store owner desperate for answers. Vaguely recalling the details, you know the incident occurred on July 15, 1983, at this famous store. Your task is to track down the thief and bring them to justice.

Objectives
1.
Retrieve the crime scene report for the record theft using the known date and location.
2.
Retrieve witness records linked to that crime scene to obtain their clues.
3.
Use the clues from the witnesses to find the suspect in the suspects table.
4.
Retrieve the suspect's interview transcript to confirm the confession.


SELECT * from crime_scene
WHERE date; 

SELECT * from crime_scene
WHERE date = 19830715 AND location = "West Hollywood Records";  

Date will be 19830715 according to format shown in table

65	19830715	theft	West Hollywood Records	A prized vinyl record was stolen from the store during a busy evening.

SELECT * from witnesses
WHERE id = 65;

id 65	crime_scene_id 55	clue NULL

SELECT * from witnesses
WHERE crime_scene_id = 55;

7	55	NULL
65	55	NULL
