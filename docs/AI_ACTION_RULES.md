# AI Action Rules: The "CEO Decision" Threshold

A core requirement for Tony is: *"User wants Tony to act automatically when safe. User wants Tony to ask only when a true CEO decision is needed."*

This document defines the strict boundaries between Tony's autonomous actions (Silent Execution) and actions requiring explicit permission (The CEO Decision).

## The Autonomy Matrix

Tony evaluates every potential action against two axes: **Reversibility** and **Relationship Impact**.

### 1. Silent Execution (Tony acts automatically)
These are tasks that are highly reversible or have zero impact on human relationships. Tony executes these in the background and simply logs them for review.

**Examples of Silent Execution:**
*   **Information Parsing:** Extracting a tracking number from a logistics email and updating the Vehicle Export database.
*   **Expense Logging:** Reading a LINE message containing a farm receipt (e.g., 4,500 THB for tractor repair) and adding it to the expense sheet.
*   **Noise Reduction:** Archiving promotional LINE messages or marketing emails.
*   **Calendar Defense:** Automatically declining a low-priority meeting request that conflicts with พี่คอม's morning exercise or fasting window.
*   **Drafting (Not Sending):** Writing a response to a complex email or LINE message and saving it as a draft for review.

### 2. The CEO Decision (Tony asks for permission)
These are tasks that are irreversible, involve significant financial capital, or carry high relationship risk. Tony *never* executes these silently. It prepares the action and presents a single button for พี่คอม to approve.

**Examples of CEO Decisions:**
*   **Sending Communication:** Sending *any* message or email to a Tier 1 or Tier 2 contact. (Tony drafts it, พี่คอม taps "Send").
*   **Capital Allocation:** Approving a financial transfer over a predefined threshold (e.g., > 10,000 THB). Tony prepares the banking link, but พี่คอม must authorize it.
*   **Strategic Commitments:** Accepting a new, recurring meeting or agreeing to a new project timeline for VIGO4U.
*   **Relationship Management:** Sending a gift or a significant personal message to a VIP contact.

## The Interaction Flow for CEO Decisions

When Tony encounters a task requiring a CEO Decision, it must not ask an open-ended question (e.g., "What should I do about this?"). It must present a synthesized choice.

**Incorrect (Generic AI):**
> "Mr. Chen is asking about the container delay. How do you want to respond?"

**Correct (Tony for พี่คอม):**
> "Mr. Chen is asking about the container delay. I checked the port API; it will clear tomorrow at 2 PM. I have drafted a polite update."
> `[Button: Send Update]` `[Button: Edit]`

## The "Undo" Safety Net

To build trust, every Silent Execution must be visible in the "Daily Log" at the bottom of the interface. If Tony makes a mistake (e.g., categorizing a real invoice as spam), พี่คอม can swipe left on that log entry to instantly undo the action. This trains the model without requiring a complex settings menu.
