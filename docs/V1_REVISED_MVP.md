# Tony V1 Revised MVP: The Manual AI Inbox

**Date:** June 28, 2026
**Author:** Manus AI — Product Owner
**Status:** Defined (Post-Pivot)

---

## 1. The Pivot Rationale

The previous MVP relied on silent iOS 27 notification interception to automatically ingest LINE messages. This created a hard blocker requiring physical hardware validation on a beta OS. 

**The Pivot:** We are removing the automatic interception requirement. Tony V1 will rely on **Manual / Shortcut-first Capture**. This removes the iOS 27 dependency and allows immediate development of the core intelligence: the AI Inbox, the Decision Queue, and the Morning Brief.

---

## 2. The Core User Journey (V1 Revised)

**1. The Capture (Anytime)**
พี่คอม receives an important message, an invoice, or has a random thought. Instead of relying on Tony to intercept it, พี่คอม actively gives it to Tony via:
- Highlighting text in LINE and tapping "Share to Tony" (iOS Share Extension).
- Pasting text directly into the app.
- Tapping a single button and speaking: "เตือนให้โอนเงินค่าปุ๋ย 25,000 พรุ่งนี้เช้า" (Voice-to-Action).

**2. The AI Inbox (Background)**
Tony receives the raw input. The LLM Router instantly classifies it into one of the 7 domains (VIGO4U, Export, AI, Farm, Money, Health, Personal). Tony extracts entities (dates, amounts, people) and decides if it requires an immediate decision or should be queued for the Morning Brief.

**3. The Morning Brief (06:00 AM)**
พี่คอม opens Tony in the morning. Instead of a raw list of everything captured yesterday, Tony presents a synthesized narrative:
- *Anchor:* "You have 3 decisions pending today."
- *Synthesis:* "Farm expenses need approval (25,000 THB). Mr. Chen sent a revised export quote."
- *Action:* Buttons to approve, decline, or draft replies.

---

## 3. The 5 Core Features

### 3.1 AI Inbox (The Funnel)
- **Input Methods:** Text field, iOS Share Extension (accepts text/URLs), and native Voice Dictation.
- **Processing:** Raw input is sent to an LLM (e.g., Claude 3.5 Haiku) with a strict system prompt to output a structured JSON object containing: Domain, Summary, Urgency, and Required Action.

### 3.2 Decision Queue (The Filter)
- Items classified as `Urgency: High` or `Requires_Action: True` bypass the general memory and land in the Decision Queue.
- UI: A swipeable card interface (Tinder-style for tasks). Swipe right to approve/do, swipe left to archive.

### 3.3 Morning Brief (The Synthesis)
- A daily generated view that reads all unarchived items from the AI Inbox and generates a 3-paragraph summary.
- Resets every day at midnight.

### 3.4 Voice-to-Action Draft
- Native iOS Speech-to-Text (`SFSpeechRecognizer`).
- The transcript is sent to the LLM to format. (e.g., "Tell Chen no" → Drafts a polite, professional English email declining the offer).

### 3.5 Mobile-Only Calm UI
- **Color Palette:** Pure black background (`#000000`), white text (`#FFFFFF`), one accent color for primary actions.
- **Typography:** Large, legible, editorial serif for reading; clean sans-serif for UI elements.
- **Navigation:** No tab bars. A single vertical scroll.

---

## 4. Technical Architecture (Revised)

| Component | Technology Choice |
| :--- | :--- |
| **Frontend** | SwiftUI (iOS 17+) |
| **Local Storage** | SwiftData (On-device only) |
| **Ingestion** | iOS Share Extension + App Intents (Manual trigger) |
| **Intelligence** | OpenAI API / Anthropic API (Direct call from device) |
| **Voice** | `SFSpeechRecognizer` (Native iOS) |

---

## 5. What is Explicitly Out of Scope for V1

- ❌ Automatic LINE/WhatsApp interception.
- ❌ VIP Contact Filtering (no longer needed if input is manual).
- ❌ Calendar sync (EventKit).
- ❌ Push notifications from Tony to the user.
- ❌ Multi-device sync (CloudKit).
- ❌ Image/Receipt OCR (Text and Voice only).

---

## 6. Next Steps for Engineering

The project is unblocked. Engineering can begin immediately on a standard iOS 17+ SwiftUI application.

**Phase 1:** Build the UI shell (Black canvas, text input, voice button).
**Phase 2:** Build the LLM connection (Send raw text to API, receive JSON).
**Phase 3:** Build the iOS Share Extension.
**Phase 4:** Build the Morning Brief synthesis logic.
