# Information Architecture and AI Behavior Design

## Overview

The Information Architecture (IA) and AI Behavior design for Tony represent a radical departure from traditional software applications. Because Tony's core philosophy dictates "Zero Manual Organization," the IA is not built around user-facing folders, tags, or manual hierarchies. Instead, the IA describes how the system internally structures and connects data, while the AI Behavior defines how Tony interacts with the user to surface that information naturally and proactively. The interface is primarily conversational and context-driven, rather than navigational.

## Internal Information Architecture (The Knowledge Graph)

Tony relies on a dynamic, multi-dimensional Knowledge Graph rather than a relational database of distinct object types. Every piece of data ingested by Tony becomes a node in this graph, and the AI continuously builds edges (relationships) between these nodes based on context, timing, and semantic meaning.

### Core Data Nodes

The Knowledge Graph consists of several primary node types that represent the fundamental elements of a user's life.

| Node Type | Description | Sources of Ingestion |
| :--- | :--- | :--- |
| **Entities (People/Orgs)** | Individuals, companies, or groups the user interacts with. | Email contacts, calendar invites, CRM integrations, messaging apps. |
| **Events (Time-bound)** | Meetings, deadlines, travel, or personal milestones. | Calendars, email parsing (flight confirmations), task due dates. |
| **Artifacts (Content)** | Documents, emails, messages, receipts, or articles. | Email inbox, cloud storage (Google Drive, Notion), messaging platforms. |
| **Actionables (Tasks)** | Specific items requiring user action or decision. | Explicit user requests, AI extraction from emails/meetings, project management tools. |
| **Metrics (Quantifiable)** | Financial balances, health data, or performance indicators. | Banking APIs, Apple Health/Google Fit, time-tracking tools. |

### Dynamic Edges (Relationships)

The true power of Tony's IA lies in the edges connecting these nodes. These relationships are established automatically by the AI. For example, if an email (Artifact) from Sarah (Entity) discusses the Q3 Budget (Artifact/Topic) and schedules a review for Friday (Event), Tony automatically links all these nodes. When the user asks about the Q3 Budget, or when Friday approaches, Tony can instantly pull the relevant email, Sarah's contact info, and the budget document without the user ever having to organize them into a "Q3 Budget" folder.

## User-Facing Architecture (The Interface)

While the internal structure is a complex graph, the user-facing architecture must be radically simple. The interface is designed to minimize cognitive load, presenting only what is immediately relevant based on the user's current context.

### The Three Core Views

The application is structured around three primary views, shifting the paradigm from "where do I find this?" to "what do I need right now?"

1.  **The Now (The Default State)**
    This is the ambient, context-aware dashboard. It is not a static home screen; it changes based on the time of day, the user's location, and upcoming events. If it is 8:00 AM, *The Now* presents the Daily Brief (schedule, urgent emails, overnight financial alerts). If the user is walking into a meeting, *The Now* shifts to display the meeting agenda, relevant recent communications with the attendees, and key action items.

2.  **The Stream (The Interaction Layer)**
    This is the conversational interface where the user interacts directly with Tony. It functions like a continuous chat thread, but it supports rich media, interactive widgets (e.g., approving a drafted email, confirming a rescheduled flight), and voice input. The Stream is where explicit commands are given and where Tony asks for necessary clarifications.

3.  **The Atlas (The Exploration Layer)**
    While manual organization is eliminated, users still need a way to explore their data when they aren't sure exactly what they are looking for. *The Atlas* provides a visual, search-driven interface into the Knowledge Graph. Users can search for a person, a topic, or a time period, and Tony will generate a dynamic, temporary dashboard synthesizing all related information.

## AI Behavior and Personality

Tony is designed to be a Chief of Staff, not a subservient chatbot. This distinction requires a specific set of behavioral guidelines that govern how the AI communicates, makes decisions, and interrupts the user.

### Behavioral Principles

The AI must adhere to the following principles to build trust and effectively reduce the user's cognitive burden.

| Principle | Behavioral Implementation |
| :--- | :--- |
| **Confident but Transparent** | Tony should make firm recommendations rather than asking open-ended questions, but always show its reasoning. (e.g., "I drafted a polite decline to this invitation because it conflicts with your deep work block. Should I send it?") |
| **Contextually Adaptive Tone** | The tone of communication must shift based on the situation. Urgent financial alerts should be concise and direct; a morning briefing can be more conversational and encouraging. |
| **Protective of Attention** | Tony acts as a gatekeeper. It must aggressively filter notifications and interruptions, only surfacing information that is immediately actionable or highly relevant to the current context. |
| **Graceful Degradation** | When Tony lacks sufficient confidence to take an autonomous action, it must fail gracefully by preparing the options for the user to decide, rather than executing a potentially incorrect action or simply stating "I don't know." |

### The Proactivity Matrix

To manage how and when Tony interrupts the user, the AI utilizes a Proactivity Matrix based on the urgency of the information and the user's current state of focus.

1.  **High Urgency / Low Focus:** (e.g., User is commuting, flight is canceled). Tony interrupts immediately via push notification or voice, presenting the problem and a proposed solution (rebooked flight options).
2.  **High Urgency / High Focus:** (e.g., User is in a deep work block, a critical client emails). Tony bypasses standard filters but delivers the interruption silently, perhaps pinning it to *The Now* view for immediate visibility when the user glances at the screen, rather than breaking their flow with an audible alert.
3.  **Low Urgency / Low Focus:** (e.g., User is browsing casually, a weekly financial summary is ready). Tony places the information in *The Stream* for the user to review at their leisure.
4.  **Low Urgency / High Focus:** (e.g., User is in a meeting, a newsletter arrives). Tony completely suppresses the information, silently categorizing it into the Knowledge Graph for later retrieval.

## Decision Support Mechanics

A key function of Tony is to alleviate decision paralysis. When the user faces a complex choice (e.g., evaluating job offers, planning a complex itinerary, or deciding on a large purchase), Tony shifts into a specific "Decision Support" behavior mode.

Instead of simply providing a list of facts, Tony synthesizes the data from the Knowledge Graph to present a structured comparison. Tony will automatically pull relevant constraints (budget limits from the financial nodes, time constraints from the calendar nodes) and present the options alongside the tradeoffs for each. The AI will highlight which option aligns best with the user's previously stated long-term goals, transforming an overwhelming research task into a clear, binary choice.

---
**Status:** Approved | **Version:** 1.0 | **Author:** Manus AI
