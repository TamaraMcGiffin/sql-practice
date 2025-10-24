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

SELECT clue FROM witnesses
WHERE crime_scene_id = 65;

I saw a man wearing a red bandana rushing out of the store.
The main thing I remember is that he had a distinctive gold watch on his wrist.

SELECT name, bandana_color, accessory
FROM suspects
WHERE bandana_color = 'red' AND accessory = 'gold watch';
  
Tony Ramirez	red	gold watch
Mickey Rivera	red	gold watch
Rico Delgado	red	gold watch

SELECT id, name, bandana_color, accessory
FROM suspects
WHERE bandana_color = 'red' AND accessory = 'gold watch';
  
35	Tony Ramirez	red	gold watch
44	Mickey Rivera	red	gold watch
97	Rico Delgado	red	gold watch


SELECT suspect_id, transcript
FROM interviews
WHERE suspect_id = 35 OR suspect_id = 44 OR suspect_id = 97;

35	I wasn't anywhere near West Hollywood Records that night.
44	I was busy with my music career; I have nothing to do with this theft.
97	I couldn't help it. I snapped and took the record.


ANSWER: Rico Delgado  

Case Solved!
Excellent work, detective! Rico Delgado has confessed to stealing the prized vinyl record.

Case Explanation
You began by querying the 'crime_scene' table with the date (19830715) and location (West Hollywood Records) to find the incident report. Then, you retrieved the two witness records from the 'witnesses' table, which revealed that: • The suspect wore a red bandana. • The suspect had a distinctive gold watch. Next, you queried the 'suspects' table, and there were 3 suspects matching the clues. Finally, you found the confession from Rico Delgado in the 'interviews' table.
  
