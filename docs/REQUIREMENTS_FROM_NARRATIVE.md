# Product Requirements Extracted from Lived Reality

Based on the 24-hour narrative of พี่คอม's life with Tony, we can extract concrete, engineering-ready product requirements. These requirements bypass generic features and focus entirely on the behaviors demonstrated in the story.

## 1. The Interception Engine (Background Processing)

**Narrative Trigger:** *Between midnight and 5:30 AM, 114 LINE messages, 42 emails, and 6 system alerts hit the phone. Tony intercepted all of them.*

**Requirements:**
*   **REQ-1.1:** Tony must have a persistent background service capable of reading notifications from LINE, Email, and System Alerts without waking the device screen.
*   **REQ-1.2:** Tony must maintain a local or edge-cached queue of intercepted messages to process without requiring constant cloud API calls (for speed and battery life).
*   **REQ-1.3:** Tony must suppress native OS notifications for all intercepted messages unless they meet the Tier 1 / Emergency threshold.

## 2. The Contextual Synthesis (The Morning Anchor)

**Narrative Trigger:** *Tony presents a single, synthesized sentence about the overnight noise: "VIGO4U servers had a minor latency spike... farm staff logged two receipts."*

**Requirements:**
*   **REQ-2.1:** Tony must group intercepted messages by the 7 Life Domains (VIGO4U, Farm, etc.).
*   **REQ-2.2:** Tony must use an LLM to generate a maximum two-sentence summary of Tier 2 and Tier 3 activity per domain.
*   **REQ-2.3:** The synthesis engine must identify and extract specific data points (e.g., "latency spike", "two receipts") rather than just saying "people talked about the farm."

## 3. The VIP Bypass and Voice Execution

**Narrative Trigger:** *Tony knows Mr. Chen is a Tier 1 contact. Tony does not summarize... พี่คอม taps the microphone icon... Tony rewrites the draft instantly in Thai-business context.*

**Requirements:**
*   **REQ-3.1:** Tier 1 messages must bypass the synthesis engine and be displayed in full.
*   **REQ-3.2:** Tony must auto-generate a draft reply based on historical context before the user even opens the app.
*   **REQ-3.3:** The voice input must support "instructional dictation" (e.g., "Tell him X") rather than just literal transcription, requiring an LLM step to translate the instruction into a professional Thai response.

## 4. State-Aware Gatekeeping (The Run)

**Narrative Trigger:** *Tony knows พี่คอม is running and fasting. Tony decides this does not cross the "Interrupt the Run" threshold. Tony stays silent.*

**Requirements:**
*   **REQ-4.1:** Tony must integrate with Apple HealthKit (or equivalent) to read current physiological state (Workout Active) and custom timers (Fasting Window).
*   **REQ-4.2:** The Interruption Logic must include a "State Multiplier." A Tier 2 message that would normally trigger a notification is suppressed if `State == Workout`.

## 5. Anomaly Detection (The Farm Invoice)

**Narrative Trigger:** *Tony's historical model knows irrigation pumps usually cost 25,000 THB... This is 80% higher... Tony interrupts the drive with a gentle audio chime.*

**Requirements:**
*   **REQ-5.1:** Tony must maintain a running ledger of extracted numerical data (expenses) tagged by Domain and Entity (Supplier).
*   **REQ-5.2:** Tony must calculate a rolling average for recurring expense types.
*   **REQ-5.3:** If a newly extracted value exceeds the historical average by a configurable threshold (e.g., > 50%), Tony must elevate the message to an immediate "CEO Decision" audio prompt.

## 6. The "Caller ID" Context Flash

**Narrative Trigger:** *As the phone rings, Tony displays a full-screen flash card: "Calling: Sarah... Last deal fell through due to shipping timelines."*

**Requirements:**
*   **REQ-6.1:** Tony must hook into the OS CallKit (or Android equivalent) to intercept incoming calls.
*   **REQ-6.2:** Tony must execute a sub-1-second Knowledge Graph query for the incoming phone number.
*   **REQ-6.3:** Tony must render a native OS overlay (Live Activity or Call Screen extension) displaying the 2 most recent relevant facts about the caller.

## 7. The Trust Audit (The Swipe-to-Undo)

**Narrative Trigger:** *He sees Tony archived an email... He swipes left on that log entry. Tony instantly restores the email and updates its internal priority model.*

**Requirements:**
*   **REQ-7.1:** Every autonomous action (archive, log, decline) must be recorded in a chronological local database.
*   **REQ-7.2:** The UI must support a swipe gesture on log items that triggers a "Revert" API call specific to the action type (e.g., move email from Archive to Inbox).
*   **REQ-7.3:** A revert action must automatically append a negative weight to the model's confidence score for that specific pattern in the future.
