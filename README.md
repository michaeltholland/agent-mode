# agent-mode
used to keep agent tabs open to run chatgpt

## LAX TAPPER — 8-bit Lacrosse Tapper Game

A single-player, one-button ("tapper") lacrosse arcade game. Open
`index.html` in any browser. No build step, no dependencies. Works with
**tap / click / spacebar**.

Built mobile-first: the canvas scales up to fill a phone screen, with a
16-bit style (shaded sprites, gradients). There's a built-in **HOW TO
PLAY** guide plus a first-time tutorial overlay.

### The game — Goalie Shootout

Score on a **live goalie** who patrols the net and blocks it with his body
(shown as a dark coverage zone, like a real shooting screen). Beat him by
shooting into the open space — go **high (top shelf)** or **wide (far
side)**, because he lunges at your shot. You get **10 shots**.

### Controls
- **Drag anywhere on the net to aim** — the reticle follows your finger and
  turns **green when the net is open, red when the keeper has it covered**.
- Or use the on-screen **◀ ▶ / ▲ ▼** pads to nudge your aim.
- Tap the big **SHOOT** bar (or **spacebar**) to fire.
- Desktop: **arrow keys** aim, **Space/Enter** shoots.

### Scoring
- **Top corner = 5 pts**, edges = 3, close to the keeper = 1. Save = 0.

The high score is saved in your browser (localStorage). The render loop is
crash-safe: any unexpected error shows a message and a tap returns to the
menu instead of freezing.

> The skee-ball mode was removed for now and may return later.
