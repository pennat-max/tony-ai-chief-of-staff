# UI Direction Derived from Lived Reality

Because we designed the lived experience first (see `A_DAY_WITH_TONY.md`) and extracted the requirements (see `REQUIREMENTS_FROM_NARRATIVE.md`), the UI design is no longer a matter of aesthetic preference. The UI is strictly dictated by the functional requirements of พี่คอม's day.

## The Core Constraint: Tony is Not an App You Browse

In the narrative, พี่คอม never "browses" Tony. He opens it for 15 seconds in the morning, speaks to it briefly, and glances at it during a phone call. 

Therefore, **Tony cannot have a traditional app navigation structure.** 

## UI Paradigm 1: The Ephemeral Canvas

Because Tony's state changes based on the user's context (e.g., Morning Triage vs. Mid-Run vs. Evening Audit), the UI must be ephemeral. 

*   **No Fixed Layouts:** There is no "Home Screen." When พี่คอม opens the app, the screen draws itself based on the current highest-priority context.
*   **The Black Background:** The UI must use absolute black (`#000000`). This is not just for aesthetics; it allows the screen elements to appear as if they are floating on the physical glass of the iPhone, reducing the feeling of "being inside an app."
*   **Disappearing Elements:** Once an action is taken (e.g., tapping "Send" on the Mr. Chen draft), that entire block of text dissolves. It does not move to a "Completed" tab. It simply vanishes, leaving a cleaner canvas.

## UI Paradigm 2: Voice-First, Text-Second

The narrative shows พี่คอม speaking to Tony ("Tell him we can't discount shipping"). Typing is too slow for a Chief of Staff interaction.

*   **The Persistent Mic:** The only fixed element on the screen is a microphone icon at the bottom right. It is always available, regardless of what context is currently displayed.
*   **The Audio Waveform:** When พี่คอม speaks, the bottom of the screen should render a subtle, fluid waveform. This provides immediate visual feedback that Tony is listening, which is critical for trust.
*   **Text as Confirmation:** Tony uses text primarily to confirm what it heard and what it plans to do (e.g., showing the drafted Thai response before sending).

## UI Paradigm 3: The "Context Flash" (System Integration)

The narrative requires Tony to appear outside of its own app (e.g., during an incoming phone call or while driving).

*   **Live Activities & Dynamic Island:** Tony must heavily utilize iOS Live Activities. When Tony detects a financial anomaly while พี่คอม is driving, it shouldn't require opening the app. The prompt ("Invoice is 80% higher. Hold transfer?") must appear in the Dynamic Island with two simple buttons: [Hold] and [Allow].
*   **CallKit Overlays:** The UI must include designs for native OS call screen overlays, displaying the 2-bullet-point context summary without obscuring the native "Answer/Decline" buttons.

## UI Paradigm 4: The Audit Log as the Only "Settings" Menu

The narrative shows พี่คอม fixing a mistake by swiping an item in the evening log. He does not open a settings menu to adjust priority weights.

*   **The Muted Footer:** The bottom of the primary canvas (above the mic) should always display a subtle, grayed-out list of recent autonomous actions.
*   **The Swipe Gesture:** This list must support a high-friction swipe-left gesture (requiring a full, deliberate swipe) to trigger an "Undo." The visual feedback must be instantaneous, turning the gray text red momentarily before it disappears and the action is reverted.

## Summary of UI Elements Needed

We do not need to design 20 screens. We only need to design 4 states of the Ephemeral Canvas:

1.  **The Synthesis State:** (Morning Anchor) High-contrast text summarizing overnight activity.
2.  **The Decision State:** (VIP Messages) A raw message, Tony's proposed draft, and a primary action button.
3.  **The Listening State:** (Voice Input) The waveform and real-time transcription.
4.  **The System Overlay:** (CallKit/Dynamic Island) Tiny, hyper-dense context widgets outside the app.
