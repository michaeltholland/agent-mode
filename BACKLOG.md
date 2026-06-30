# Lacrosse Shootout — Backlog / Future Ideas

Running list of ideas to revisit. Nothing here is live yet.

## SAVED CONTENT — Global Lacrosse / Lacrosse IQ infographics (info screens + trivia)

### "WHY THE BEST PLAYERS LOOK SLOW" (IMG_1417) — 7 points
Tagline: "It's not about speed. It's about game." Key lesson: the best players look
slow because they think faster, anticipate earlier, and make smarter decisions.
Good as a Pyramid-style info screen and/or teach-then-quiz facts.
1. PLAY BEFORE THE BALL ARRIVES — scan, anticipate, get to the right spot early; rarely react late.
2. MOVE WITH PURPOSE — every cut, dodge, and step has a reason; no wasted motion.
3. STAY CALM UNDER PRESSURE — keep composure, make clear decisions, control the pace.
4. GREAT FIELD VISION — see plays develop, read defenses, find open teammates first.
5. MASTER FUNDAMENTALS — clean skills, efficient footwork, strong stick protection.
6. LET THE GAME COME TO THEM — trust preparation, take what the defense gives.
7. THINK FASTER THAN THEY RUN — process quickly, solve problems, create advantages without extra speed.

### "BEFORE YOU BUY — BEGINNER EQUIPMENT GUIDE" (IMG_1397) — 12 points
Best as a standalone info screen (gear checklist for new players). Credit: Global Lacrosse / Lacrosse IQ.
1.  STICK COMES FIRST — most important piece; control, durability, a legal pocket.
2.  GEAR FOR YOUR POSITION — attack/mid lighter; D longer shafts; goalies specialized.
3.  HELMET FIT > PRICE — sits level, secure, clear vision, meets safety standards.
4.  NEVER SKIMP ON GLOVES — protect hands/wrists while keeping control; full protection + flex.
5.  SHOULDER PADS THAT MOVE — protect chest/shoulders/sternum without restricting motion.
6.  ARM PROTECTION BY POSITION — attack more; mids balance mobility; some prefer lighter.
7.  MOUTHGUARDS ARE MANDATORY — protect teeth; required by most leagues.
8.  CLEATS IMPROVE PERFORMANCE — traction/stability for sprinting, cutting, quick changes.
9.  GOALIES NEED EXTRA — goalie stick, throat guard, chest protector, goalie gloves, padding.
10. CHECK LEAGUE RULES FIRST — helmet cert, chest protectors, stick dimensions, etc.
11. COMFORT HELPS DEVELOPMENT — well-fitted gear lets you focus on learning.
12. START WITH ESSENTIALS, UPGRADE LATER — reliable, well-fitted basics first.

Note: confirm exact source credit for IMG_1417 (style matches the Global Lacrosse series).

## NEXT UPDATE — "VISION vs STICK SKILLS" trivia (content credit: Global Lacrosse)
Owner uploaded the infographic (IMG_1266) for the teach-then-quiz pool. Drop these
into TEACH_POOL alongside COACH_Q / PYRAMID_Q (keys 'v'+i and 'k'+i, topic
"VISION & STICK SKILLS - GLOBAL LACROSSE"). Ready-to-paste drafts:

```js
const VISION_Q=[
  {q:'FIELD VISION STARTS WITH...',opts:['READING THE FIELD EARLY','RUNNING FASTER','YELLING LOUDER'],ans:0,fact:'VISION - READ THE FIELD BEFORE YOU GET THE BALL.'},
  {q:'A PLAYER WITH VISION SPOTS...',opts:['OPEN TEAMMATES EARLY','ONLY THE GOAL','NOTHING'],ans:0,fact:'VISION - IDENTIFY OPEN TEAMMATES EARLY.'},
  {q:'GOOD VISION ANTICIPATES...',opts:['DEFENSIVE ROTATIONS','THE WEATHER','THE CROWD'],ans:0,fact:'VISION - ANTICIPATE DEFENSIVE ROTATIONS.'},
  {q:'VISION HELPS YOU RECOGNIZE...',opts:['SCORING CHANCES','EXCUSES','NOTHING'],ans:0,fact:'VISION - RECOGNIZE SCORING OPPORTUNITIES.'},
  {q:'STRONG VISION LEADS TO...',opts:['FASTER DECISIONS','SLOWER PLAY','MORE TURNOVERS'],ans:0,fact:'VISION - MAKE FASTER GAME DECISIONS.'},
  {q:'VISION HELPS YOU FIND...',opts:['SPACE AND TIMING','THE BENCH','TROUBLE'],ans:0,fact:'VISION - FIND SPACE AND TIME PLAYS EFFECTIVELY.'},
  {q:'OVERALL, VISION BUILDS YOUR...',opts:['LACROSSE IQ','SHOE SIZE','HIGHLIGHT REEL'],ans:0,fact:'VISION - IT IMPROVES YOUR OVERALL LACROSSE IQ.'}
];
const STICKS_Q=[
  {q:'ELITE STICK SKILLS CONTROL THE BALL...',opts:['CLEANLY UNDER PRESSURE','ONLY WHEN ALONE','NEVER'],ans:0,fact:'STICK SKILLS - CONTROL THE BALL CLEANLY UNDER PRESSURE.'},
  {q:'GOOD STICK SKILLS DELIVER...',opts:['ACCURATE PASSES','WILD THROWS','EXCUSES'],ans:0,fact:'STICK SKILLS - DELIVER ACCURATE PASSES CONSISTENTLY.'},
  {q:'STICK SKILLS LET YOU CATCH...',opts:['DIFFICULT PASSES','ONLY EASY ONES','NOTHING'],ans:0,fact:'STICK SKILLS - CATCH DIFFICULT PASSES EFFECTIVELY.'},
  {q:'STRONG STICK SKILLS SHOOT WITH...',opts:['POWER AND ACCURACY','EYES CLOSED','NO AIM'],ans:0,fact:'STICK SKILLS - SHOOT WITH POWER AND ACCURACY.'},
  {q:'STICK SKILLS PROTECT POSSESSION...',opts:['DURING CONTACT','ONLY AT HOME','NEVER'],ans:0,fact:'STICK SKILLS - PROTECT POSSESSION DURING CONTACT.'},
  {q:'STICK SKILLS EXECUTE...',opts:['DODGES AND FEEDS','TIME-OUTS','COMPLAINTS'],ans:0,fact:'STICK SKILLS - EXECUTE DODGES AND FEEDS EFFECTIVELY.'},
  {q:'TRUE STICK SKILLS HOLD UP...',opts:['AT GAME SPEED','ONLY IN WARMUPS','NEVER'],ans:0,fact:'STICK SKILLS - PERFORM CONSISTENTLY AT GAME SPEED.'}
];
// then: .concat(VISION_Q.map((it,i)=>({...it,key:'v'+i,topic:'VISION - GLOBAL LACROSSE'})))
//       .concat(STICKS_Q.map((it,i)=>({...it,key:'k'+i,topic:'STICK SKILLS - GLOBAL LACROSSE'})))
```

## NEXT UP — Target Challenge (anti-camping level progression)
Goal: to clear a level you must hit all FIVE required targets:
top-left, top-right, bottom-left, bottom-right corners, AND the five hole
(between the goalie's legs). This stops players from parking on one side,
dragging the keeper over, and spamming the same corner.

How it should work:
- A single TARGET marker appears in ONE required zone at a time, chosen at
  RANDOM from the zones not yet completed.
- Player must SCORE in that zone (beat the keeper there). On success the zone
  lights up / checks off and the target jumps to another random uncompleted
  zone.
- Clear all 5 -> level up (advance), with a celebration. Show progress (e.g.,
  5 little goal markers that fill in, or "3/5 TARGETS").
- Because the target hops across all 4 corners + the middle, the player has to
  move and re-aim around the whole cage (no camping).

Decisions to confirm when we build:
1. Replace the current 10-shots-for-points format, or layer on top (still earn
   points/coins, but must clear the 5 targets to advance the level)?
2. Shots per level: fixed number (e.g., 10) or unlimited until cleared (shot
   clock still ticks each shot)?
3. If the keeper SAVES a target shot, does it just not count (try again), or
   cost something?
4. Tie "level" to clearing targets (instead of / in addition to games played),
   and keep difficulty ramping per level.
Note: corners + five-hole zones already exist in code (g1FiveHoleHit, the
corner labels TOP/LOW CORNER), so detecting "which zone a goal hit" is easy.

## Trivia
- **"DID YOU KNOW?" fact on CORRECT answers too** — right now correct answers
  stay snappy (just "CORRECT! +coins"); wrong answers show the fact. Consider
  showing a quick fact on correct answers as well in a future pass.
- Trivia **frequency toggle** — now once per session. Option for every Nth game.
- **Expand the question bank** (more history/rules/shooter-IQ questions).

### Trivia to add next update — "ELITE TEAM vs AVERAGE TEAM" (Lacrosse IQ)
Turn each into a question (elite habit = correct answer):
1. Elite teams communicate... CONSTANTLY (avg: occasionally)
2. Off the ball, elite players move with... PURPOSE (avg: watch the ball)
3. Elite offenses... CREATE OPPORTUNITIES (avg: wait for them)
4. Elite teams play... FAST BUT NOT RUSHED (avg: in a hurry)
5. Elite teams trust... TEAM SYSTEMS (avg: rely on individual plays)
6. After a mistake, elite players... RECOVER QUICKLY (avg: dwell on errors)
7. Elite teams win... GROUND BALLS CONSISTENTLY (avg: give away possessions)
8. Under pressure, elite players... MAKE SMART DECISIONS (avg: force risky plays)
(Also still have the earlier "GOOD vs GREAT SHOOTER" tips already partly used.)


## Balance / tuning (easy one-liners when we want them)
- Bounce-shot strength and how far you push the stick to enter the bounce zone.
- Shot looseness (rookie scatter amount) and how fast it tightens.
- Difficulty ramp speed (currently caps ~level 36).
- Make the goalie more aggressive when the attacker charges the crease.

## Features considered
- **Changelog**: an in-game "what's new" history screen and/or CHANGELOG.md.
- **itch.io packaging**: zip + game description + how-to-play blurb for a free
  itch.io page (good for sharing/discovery).
- **Feedback note field**: free-text note in the survey (needs an on-screen
  keyboard).
- Rank **title names** reorder/customize (currently Six Nations clan animals).
- Lacrosse **age-division names** (Peewee/Junior/etc.) — raised then set aside.

## Done (for reference)
Global leaderboard (top 30% + clan-animal rank titles), coins + 3 upgrade tracks
(69 levels), player customization + initials editor, badges, combos, medals,
shot clock, free aim, bounce shots, crease foul (ref + flag + sad trombone),
share buttons, first-play welcome, bigger UI text, in-game exit, locker
save/back, version + update prompt with "what's new", and lacrosse trivia.
