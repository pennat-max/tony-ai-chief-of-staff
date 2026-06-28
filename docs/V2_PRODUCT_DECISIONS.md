# V2 Product Decisions & MVP Roadmap

This document outlines the specific product decisions made to adapt Tony for พี่คอม, defining the exact scope of the Minimum Viable Product (MVP) and the updated roadmap.

## The Core Decision: Shrink to Expand

The original V1/V2 roadmap attempted to build an "Everything App" for a generic executive. 
For พี่คอม, we are doing the opposite: we are building a hyper-narrow, highly specific tool that solves his single biggest pain point flawlessly. If we win the morning, we win the user.

## The MVP Scope (Version 2.1)

The MVP is restricted entirely to **The Morning Flow** and **LINE Interception**.

### What is IN the MVP:
1.  **LINE API Integration (Read-Only initially):** Tony must be able to read incoming LINE messages across all chats and groups.
2.  **The 4-Tier Relationship Filter:** Tony must successfully identify Tier 1 (VIPs) vs. Tier 4 (Noise).
3.  **The Morning Triage UI:** A single, vertical iPhone screen presenting the synthesized morning brief (Health Anchor, VIP Messages, Operations Summary).
4.  **Basic Context Mapping:** Tony must be able to categorize messages into the 7 domains (VIGO4U, Farm, Export, etc.) with 80% accuracy.
5.  **Drafting (No Auto-Send):** Tony will draft replies to VIPs, but the MVP will *not* have write-access to send them directly via LINE. พี่คอม will copy-paste or use a share sheet to send. This guarantees safety in V2.1.

### What is OUT of the MVP (Cut from previous roadmaps):
1.  **Email Integration:** Cut. LINE is the primary OS. Email can wait for V2.2.
2.  **Calendar Auto-Scheduling:** Cut. Tony will read the calendar for context (e.g., knowing when a run is scheduled), but will not auto-book or decline meetings yet.
3.  **Financial Auto-Transfers:** Cut. Tony will log receipts, but will not interface with banking APIs to execute transfers.
4.  **The Atlas / Search UI:** Cut. If it's not in the stream, it doesn't exist.
5.  **Voice Input:** Cut for V2.1 to speed up development. The MVP will rely on simple button taps for CEO Decisions.

## The Updated Roadmap

### Phase 1: The LINE Interceptor (MVP - V2.1)
*   **Goal:** Save พี่คอม 30 minutes every morning.
*   **Focus:** LINE read access, Relationship filtering, Morning Triage UI.
*   **Success Metric:** พี่คอม opens Tony instead of LINE as his first action of the day for 7 consecutive days.

### Phase 2: The Autonomous Executor (V2.2)
*   **Goal:** Move from read-only to write-access.
*   **Focus:** Tony gains the ability to send LINE messages directly (after CEO Decision approval). Integration of Voice Input for frictionless dictation.
*   **Success Metric:** 50% of VIP replies are drafted by Tony and sent with a single tap.

### Phase 3: The Portfolio Integrator (V2.3)
*   **Goal:** Connect the 7 domains deeply.
*   **Focus:** Email integration, Calendar read/write access, and automated data entry (e.g., logging Farm expenses to a Google Sheet automatically).
*   **Success Metric:** Zero manual data entry required for routine operational tasks across all businesses.
