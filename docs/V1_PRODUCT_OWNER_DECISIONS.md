# Tony Version 1: The 30-Day MVP

**Date:** June 28, 2026
**Author:** Product Owner
**Constraint:** 30 days of development, mobile only, for one user (พี่คอม) only.

---

## 1. What is the ONE killer feature that makes Tony worth opening before LINE every morning?
**The VIP LINE Filter.**
Tony reads all LINE notifications overnight and shows พี่คอม *only* the messages from his top 10 most important people (VIPs). It hides the 50+ messages from dev groups, farm staff, and promotions. It gives him 100% peace of mind that he hasn't missed an emergency, without forcing him to look at the noise.

## 2. What are the first five features only?
1. **iOS Notification Interception:** Read incoming LINE messages via iOS notification access.
2. **Hardcoded VIP List:** A simple array of 10 LINE display names. If a message is from them, show it.
3. **The Morning Triage UI:** A single vertical screen showing only the VIP messages and a 2-sentence summary of the rest.
4. **Voice Dictation to Clipboard:** A microphone button that transcribes speech and copies the professional Thai text to the clipboard (to paste back into LINE).
5. **The Daily Reset:** At midnight, the UI clears itself. No archives, no history, no complex database.

## 3. Which 90% of ideas should be postponed?
Everything that requires deep integration or complex AI reasoning.
*   **Postponed:** Sending messages directly via API (too dangerous, too complex).
*   **Postponed:** Apple Health integration (fasting timers, run detection).
*   **Postponed:** Anomaly detection for farm invoices (requires a database and ledger).
*   **Postponed:** CallKit Caller ID overlays (requires OS-level hooks).
*   **Postponed:** Dynamic relationship tiering (learning who is important).
*   **Postponed:** The 7-Domain Life Model ontology.

## 4. What is the complete user journey for one day with Tony V1?
*   **06:00 AM:** พี่คอม wakes up and opens Tony. He sees 3 messages from VIPs (e.g., Mr. Chen) and one sentence: "42 other messages received."
*   **06:05 AM:** He taps a VIP message, taps the mic, and says "Tell him no discount." Tony generates the Thai text and copies it to the clipboard. พี่คอม opens LINE, pastes, and sends.
*   **09:00 AM:** He checks Tony again. The morning messages are gone. He sees 1 new VIP message.
*   **08:00 PM:** He stops checking. Tony continues reading notifications in the background.
*   **12:00 AM:** Tony wipes the screen clean for the next day.

## 5. Which integrations are required for Version 1?
*   **iOS Notification Center Access:** (The only way to read LINE without an official API).
*   **OpenAI/Anthropic API:** (For summarizing the non-VIP noise and rewriting dictated text).
*   **iOS Clipboard API:** (For the copy-paste workflow).

## 6. Which integrations should NOT be built yet?
*   Gmail / Google Workspace.
*   Apple Calendar.
*   Apple HealthKit.
*   Banking APIs.
*   LINE Messaging API (Write access).

## 7. What can be shipped within 30 days?
A standalone iOS app (SwiftUI) that asks for Notification permissions, intercepts LINE pushes, checks the sender against a hardcoded JSON list of 10 names, sends the non-VIP messages to an LLM for a 2-sentence summary, and displays the result on a pure black screen. It has one button: a microphone that transcribes speech to the clipboard.

## 8. What should the Home screen look like on Day 1?
Pure black background. White text. No tabs.
```text
Good morning. 

[VIP] Mr. Chen (04:12 AM)
"The buyer in Dubai is asking for a discount."
[ 🎤 Dictate Reply to Clipboard ]

---
42 other messages received.
Summary: Dev team discussed a server patch. Farm staff sent 2 photos.
```

## 9. Define the MVP in one page.
*(See section below)*

## 10. Rewrite the roadmap based on this MVP.
*(See section below)*

---

# The One-Page MVP Definition

**Product Name:** Tony (V1)
**Target User:** พี่คอม (Single User)
**Timeline:** 30 Days

**Core Value Proposition:**
Never open LINE in the morning again. Tony filters the noise and hands you only the VIPs.

**Technical Architecture:**
1.  **Frontend:** Native iOS App (SwiftUI).
2.  **Backend:** None. Local processing only.
3.  **Data Source:** `UNUserNotificationCenter` (iOS Notification Interception).
4.  **AI Engine:** Direct API call to `gpt-4o-mini` or `claude-3-haiku` for speed.

**The 3 Rules of V1:**
1.  **Read-Only:** Tony cannot send anything. It only copies to clipboard.
2.  **Hardcoded Truth:** The VIP list is hardcoded. The domains are ignored.
3.  **Ephemeral State:** The app has no memory. Yesterday's messages are gone forever.

**Why this works in 30 days:**
It removes the need for a database, user authentication, complex API OAuth flows, background syncs, and state management. It is a pure utility that solves the exact pain point identified in `MORNING_FLOW.md` without any of the engineering overhead of an "AI Chief of Staff."

---

# Revised Roadmap (The 30-Day Path)

This roadmap replaces all previous 3-phase strategies.

*   **Week 1: The Interceptor.** Build the iOS app and successfully intercept LINE push notifications. Prove we can read the text.
*   **Week 2: The Filter.** Implement the hardcoded VIP list. Separate the VIP stream from the noise stream.
*   **Week 3: The Synthesizer & Scribe.** Connect the LLM API. Summarize the noise stream into two sentences. Build the voice-to-clipboard dictation button.
*   **Week 4: Polish & Deploy.** Implement the pure black "Typographic Calm" UI. Deploy via TestFlight to พี่คอม's iPhone.
