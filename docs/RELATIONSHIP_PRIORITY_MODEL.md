# Relationship Priority Model

A core requirement for พี่คอม is: *"He does not read every message; he opens chats from important people first."*

Tony cannot treat all incoming messages equally. A message from a key vehicle export buyer must trigger a different UI response than a message from a farm staff member, even if both messages contain the word "urgent." 

Tony uses a 4-Tier Relationship Priority Model to determine how and when to interrupt พี่คอม.

## The 4-Tier Model

Tony automatically classifies every contact (LINE, Email, Phone) into one of four tiers based on historical interaction frequency, explicit user tagging, and domain context.

### Tier 1: The VIPs (Immediate Surface)
*   **Who they are:** Immediate family, top 3 vehicle export buyers, key investors/partners in VIGO4U or AI projects.
*   **Tony's Behavior:** Messages from Tier 1 bypass all synthesis. Tony presents the raw message immediately at the top of the Morning Flow or as an active push notification during the day. Tony will draft a reply, but will *never* auto-reply without explicit permission.
*   **Interruption Rule:** Can interrupt พี่คอม during "Deep Work" or "Fasting/Exercise" blocks.

### Tier 2: The Core Operators (Synthesize & Action)
*   **Who they are:** Lead developers for VIGO4U, farm managers, logistics coordinators for vehicle export.
*   **Tony's Behavior:** Tony reads these messages, extracts the core operational need (e.g., "Server is down," "Tractor needs fuel"), and presents a synthesized action item. 
*   **Interruption Rule:** Batched into the Morning/Afternoon Triage, unless the AI detects a critical system failure (e.g., VIGO4U downtime).

### Tier 3: The Noise (Auto-Handle)
*   **Who they are:** General group chats, vendor newsletters, automated system alerts, casual acquaintances.
*   **Tony's Behavior:** Tony completely hides these from the primary stream. It reads them, logs any relevant data (e.g., a receipt from a vendor), and provides a one-sentence summary at the bottom of the daily brief. 
*   **Interruption Rule:** Never interrupts. Handled entirely in the background.

### Tier 4: The Black Hole (Ignore)
*   **Who they are:** LINE Official Accounts (promotions), spam emails, cold outreach.
*   **Tony's Behavior:** Auto-archived or deleted. Never shown to the user.

## Dynamic Re-Tiering (Contextual Importance)

Tony is smart enough to temporarily elevate a contact's tier based on context.

**Example:**
*   A junior customs agent is normally **Tier 3**.
*   However, Tony knows a shipment of 5 vehicles is currently at the port (Context: Vehicle Export Domain).
*   The junior agent sends a message containing the word "Delay."
*   Tony dynamically elevates this specific message to **Tier 1**, bypassing the usual rules, and surfaces it immediately to พี่คอม.

## How the Model is Trained

พี่คอม hates complexity, so he will not manually drag-and-drop 500 contacts into tiers. Tony learns the tiers implicitly:

1.  **Response Latency:** If พี่คอม consistently replies to Mr. Chen within 5 minutes, Mr. Chen becomes Tier 1.
2.  **Explicit Overrides:** If Tony synthesizes a message and พี่คอม taps "Show me full messages from this person in the future," Tony updates the tier permanently.
3.  **Domain Anchors:** Anyone involved in the "Money & Wealth" domain (e.g., a bank manager) defaults to a higher tier than someone in the "Farm" domain.
