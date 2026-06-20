# Lacrosse Shootout — Backlog / Future Ideas

Running list of ideas to revisit. Nothing here is live yet.

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
