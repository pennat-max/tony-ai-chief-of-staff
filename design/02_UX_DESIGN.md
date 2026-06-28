# User Experience Design for Tony

## UX Principles

The User Experience (UX) of Tony is designed to minimize friction and cognitive load. Because Tony is an ambient intelligence rather than a destination app, the UX principles focus on delivering the right information at the right time, requiring minimal user input to achieve maximum output.

### 1. Invisible UI is the Best UI
The most successful interactions with Tony are those where the user doesn't have to open an app at all. Tony should handle background tasks (like categorizing emails or updating the budget) silently. The UI should only demand attention when user input is strictly necessary or when delivering high-value insights.

### 2. Context Dictates the Interface
The interface must adapt dynamically to the user's current situation. A user checking Tony during a chaotic morning commute needs a different interface than a user sitting down for a focused session of deep work. The UI must fluidly shift its layout, typography, and density based on inferred context (time, location, upcoming calendar events).

### 3. Progressive Disclosure of Complexity
Tony manages vast amounts of complex data across the Knowledge Graph. However, the user should only ever see the synthesized, actionable top layer. If Tony recommends declining a meeting, the initial UI shows the recommendation and a one-click action button. The complex reasoning (schedule conflicts, priority misalignment) is hidden but accessible via progressive disclosure if the user wishes to drill down.

### 4. Conversation as the Universal Input
While graphical interfaces (buttons, sliders) are used for quick actions, natural language conversation is the universal input method. Users should not have to navigate menus to find a specific setting; they should simply tell Tony what they want (e.g., "Remind me to call Sarah tomorrow, but only if the budget gets approved").

## Interaction Patterns

Tony utilizes specific interaction patterns to ensure consistency and speed across the experience.

| Pattern | Description | Use Case |
| :--- | :--- | :--- |
| **The Action Card** | A self-contained, interactive widget summarizing an AI proposal. It contains context, a primary action, and an option to modify. | Tony drafts an email reply. The card shows the draft, a "Send" button, and an "Edit" button. |
| **The Context Sheet** | A bottom-up overlay that appears when a user asks for more details about a specific entity or event, providing a temporary view into the Knowledge Graph. | User taps on a person's name in a meeting brief; the sheet shows recent emails, shared projects, and relationship history. |
| **The Silent Update** | A subtle, non-intrusive notification (e.g., a small badge or ambient glow) indicating Tony has completed a background task without requiring user validation. | Tony successfully categorizes a receipt and updates the monthly budget. |
| **The Clarification Prompt** | When Tony lacks confidence, it asks a highly constrained, multiple-choice question rather than an open-ended one. | "I found two flights to NYC that fit your schedule. Do you prefer the 8 AM direct or the 10 AM with a layover?" |

## Core User Journeys

The following journeys illustrate how Tony's UX principles and interaction patterns manifest in daily use, highlighting the shift from manual management to proactive assistance.

### Journey 1: The Morning Briefing (Start of Day)
This journey demonstrates how Tony establishes context for the day, shifting the user from a reactive state to a proactive one.

1.  **Trigger:** The user wakes up and picks up their device (or speaks to a smart speaker).
2.  **The Now View:** Tony presents the Daily Brief. This is not a static list. It is a synthesized narrative.
3.  **Content Delivery:** Tony highlights that the 10 AM meeting was canceled, suggests moving a focused work block into that slot, and notes that an urgent email from a key client arrived overnight.
4.  **Interaction:** The user reviews the Action Card for the client email. Tony has already drafted a response based on previous correspondence.
5.  **Resolution:** The user taps "Approve and Send" on the draft and accepts the schedule change. In less than 30 seconds, the user has triaged the morning's critical items without opening an email client or a calendar app.

### Journey 2: The Meeting Transition (Mid-Day Context Shift)
This journey highlights Tony's ability to adapt the interface based on immediate, real-time context.

1.  **Trigger:** It is 1:55 PM. The user has a 2:00 PM meeting with the design team regarding the Q3 launch.
2.  **Contextual Shift:** *The Now* view automatically transitions from the general daily overview to a focused "Meeting Mode."
3.  **Content Delivery:** The interface displays the meeting link, the agreed-upon agenda (extracted from previous emails), and a Context Sheet summarizing the last three decisions made with this specific team.
4.  **Interaction:** During the meeting, the user can use *The Stream* to quickly ask Tony to pull up specific assets (e.g., "Show me the wireframes from last week"). Tony instantly retrieves the Artifacts from the Knowledge Graph.
5.  **Resolution:** As the meeting ends, Tony automatically extracts action items discussed during the call (if granted audio access) or prompts the user to dictate quick notes, immediately turning them into Actionables linked to the attendees.

### Journey 3: The Complex Decision (Strategic Support)
This journey illustrates how Tony handles high-cognitive-load tasks by synthesizing information from multiple disparate sources.

1.  **Trigger:** The user tells Tony via *The Stream*: "I need to plan a family vacation to Europe for two weeks in July, but we need to keep it under $10,000."
2.  **Information Gathering:** Tony silently queries the Knowledge Graph, checking the family's shared calendar for exact dates, reviewing the financial nodes for current budget status, and searching external APIs for flight and hotel costs.
3.  **Synthesis:** Instead of providing a list of links to travel sites, Tony presents a structured Action Card containing three distinct, fully costed itinerary options.
4.  **Interaction:** The user expands one option using progressive disclosure to see the breakdown of flights vs. accommodation. They ask Tony to adjust Option B to include a specific city.
5.  **Resolution:** Tony updates the itinerary. Once the user approves, Tony executes the bookings, updates the financial ledger, and blocks the dates on the calendar, completing a multi-hour task in a few minutes of conversational interaction.

---
**Status:** Approved | **Version:** 1.0 | **Author:** Manus AI
