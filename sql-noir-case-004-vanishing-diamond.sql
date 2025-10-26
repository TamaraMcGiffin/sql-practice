-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

Case #006: The Vanishing Diamond
At Miami’s prestigious Fontainebleau Hotel charity gala, the famous “Heart of Atlantis” diamond necklace suddenly disappeared from its display.

Objectives
1.
Find who stole the diamond.

SELECT * FROM crime_scene
WHERE location LIKE '%Fontainebleau%';

id	date	location	description
48	19870520	Fontainebleau Hotel	The Heart of Atlantis necklace disappeared. Many guests were questioned but only two of them gave valuable clues. One of them is a really famous actor. The other one is a woman who works as a consultant for a big company and her first name ends with "an".

SELECT * FROM witness_statements
WHERE id = 48;

id	guest_id	clue
48	78	From the parking lot, I saw someone copying down the security patrol schedule.

SELECT id, name, occupation, invitation_code FROM guest WHERE occupation LIKE '%consultant';

116	Vivian Nair	Consultant	VIP-R
  
SELECT id, name, occupation, invitation_code FROM guest WHERE occupation LIKE '%actor';

129	Clint Eastwood	Actor	VIP-G

SELECT * FROM guest INNER JOIN final_interviews
ON guest.id = final_interviews.id
WHERE name = "Clint Eastwood" OR name = "Vivian Nair";

id	name	occupation	invitation_code	id	guest_id	confession
116	Vivian Nair	Consultant	VIP-R	116	116	Check my work computer logs. I would never commit such a horrible act.
129	Clint Eastwood	Actor	VIP-G	129	129	I was taking care of my sick mother. I would never commit murder.

SELECT id, guest_id, clue FROM witness_statements
WHERE guest_id = 116 OR guest_id = 129;

id	guest_id	clue
16	116	I saw someone holding an invitation ending with "-R". He was wearing a navy suit and a white tie.
50	129	I overheard someone say, "Meet me at the marina, dock 3."

SELECT * FROM guest INNER JOIN attire_registry
ON guest.id = attire_registry.guest_id
WHERE note LIKE '%navy suit%' AND note LIKE '%white tie%' AND invitation_code LIKE '%R';

id	name	occupation	invitation_code	id	guest_id	note
105	Mike Manning	Wealth Reallocation Expert	VIP-R	48	105	navy suit, white tie

Case Solved!
Outstanding detective work! The evidence conclusively shows that Mike Manning is the thief.

Case Explanation
You began by retrieving the crime scene record and examining witness statements, which mentioned a dock rental, part of a VIP-R invitation and a navy suit. Filtering marina rentals by these clues returned multiple entries. A multiple JOIN with the guest table and attire registry returned one candidate. A final interview with that candidate resulted in a confession. Thus, the true thief is Mike Manning.
