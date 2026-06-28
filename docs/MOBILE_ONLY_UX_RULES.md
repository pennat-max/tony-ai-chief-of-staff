# Mobile-Only UX Rules

A core requirement for Tony is: *"User works almost entirely from iPhone. User hates complexity and does not want to manage AI tools manually."*

Desktop paradigms—such as dense tables, multi-column dashboards, hover states, and complex navigation menus—are explicitly banned from Tony's design. Tony must feel native, fluid, and effortless on an iPhone screen.

## The 5 Rules of iPhone-First Design

### 1. The Single Vertical Stream
There are no tabs. There is no hamburger menu. There is no "Dashboard" view vs. "Settings" view. 
Tony is a single, continuous vertical scroll. The most urgent items are at the top (The Anchor), followed by actionable proposals, followed by synthesized summaries, and ending with the background log.

### 2. The "Thumb Zone" Action Placement
All primary actions (e.g., "Send Reply", "Approve Transfer") must be placed within the natural thumb-reach zone of a right-handed user holding an iPhone. Buttons should be large, pill-shaped, and clearly separated by generous whitespace to prevent accidental taps.

### 3. Voice as Primary Input
Typing long prompts on an iPhone is high-friction. The primary input method for Tony is voice. 
The bottom of the screen features a persistent, borderless input area with a prominent microphone icon. พี่คอม should be able to hold the phone, tap the mic, and say: *"Tell Mr. Chen the container is delayed until tomorrow,"* and Tony will draft the professional LINE message.

### 4. Zero Configuration (No Settings Menus)
พี่คอม hates managing AI tools. Therefore, Tony has no complex settings menu.
*   **No manual tagging:** Tony infers the domain (VIGO4U, Farm, etc.) automatically.
*   **No manual tiering:** Tony learns who is a VIP based on response time.
*   **Correction via Interaction:** If Tony makes a mistake, พี่คอม corrects it inline (e.g., swiping to undo, or typing "No, that's for the Farm"). Tony learns from this correction permanently.

### 5. High-Contrast Typography (Typographic Calm)
Following the V2 Design System, the UI uses pure black (`#000000`) to blend into the iPhone bezel. Information hierarchy is established entirely through font size and weight, not borders or cards. This reduces visual clutter and makes the screen instantly readable, even outdoors or while walking.

## The UI Components (Restricted Set)

To maintain simplicity, Tony is built using only four UI components:

1.  **The Editorial Header:** Large serif text for context (e.g., "Morning Triage", "Design Review").
2.  **The Proposal Block:** A short paragraph of text explaining what Tony did or wants to do.
3.  **The Action Pill:** A single, high-contrast button to execute a CEO Decision.
4.  **The Muted Log:** Small, gray text at the bottom showing background actions.

If a feature cannot be built using only these four components, the feature is too complex and must be redesigned or cut.
