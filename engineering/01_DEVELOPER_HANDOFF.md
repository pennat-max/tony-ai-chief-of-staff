# Developer Handoff: Tony (v1.0)

This document provides the necessary specifications, design tokens, and API contracts for the engineering team to begin building the v1.0 MVP of Tony.

## 1. System Architecture Overview

Tony is not a traditional CRUD application. It is built around a dynamic Knowledge Graph and an ambient intelligence engine.

### Core Components
*   **Client (iOS/Android):** Built with React Native or Swift/Kotlin. The client is relatively "dumb"—it primarily renders UI based on state pushed from the server and handles local device permissions (calendar, health data, notifications).
*   **The Intelligence Engine (Backend):** The core of Tony. It handles natural language processing, context inference, and proactive task generation.
*   **The Knowledge Graph (Database):** A graph database (e.g., Neo4j) that stores Entities, Events, Artifacts, Actionables, and Metrics, constantly updating the edges (relationships) between them.
*   **Integration Layer:** A secure, scalable service for handling third-party API connections (Google Workspace, Apple Health, Plaid/Plaid-equivalents for banking).

## 2. Design Tokens (CSS/React Native)

These tokens map directly to the high-fidelity mockups and interactive prototype.

```css
/* Color Palette - Dark Mode (Default) */
--color-bg-primary: #121214;
--color-bg-secondary: #1c1c1e;
--color-bg-tertiary: #252528;

--color-text-primary: #ededed;
--color-text-secondary: #a0a0a0;
--color-text-muted: #666666;

--color-accent-blue: #2563eb;
--color-accent-blue-light: #3b82f6;
--color-accent-red: #dc2626;
--color-accent-green: #059669;
--color-accent-orange: #d97706;

/* Typography */
--font-family: 'Inter', system-ui, -apple-system, sans-serif;
--type-display-1: 32px; /* Bold */
--type-heading-1: 24px; /* Semi-Bold */
--type-heading-2: 18px; /* Medium */
--type-body-large: 16px; /* Regular */
--type-body-base: 14px; /* Regular */
--type-caption: 12px; /* Medium */

/* Spacing & Radii */
--space-xs: 4px;
--space-sm: 8px;
--space-md: 16px;
--space-lg: 24px;
--space-xl: 32px;

--radius-sm: 8px;
--radius-md: 12px;
--radius-lg: 16px;
--radius-xl: 24px;
--radius-pill: 9999px;
```

## 3. Core Component Specs

### 3.1 The Action Card
The fundamental unit of UI in *The Now* and *The Stream*.

**Props:**
*   `type` (enum: 'urgent', 'warning', 'info', 'success') - Determines the icon color and styling.
*   `title` (string) - Max 40 chars.
*   `subtitle` (string) - Max 60 chars.
*   `timestamp` (string, optional) - e.g., "11:23 PM".
*   `actions` (array of objects) - Each object contains `label`, `style` (primary, ghost, danger), and `onPress` callback.

**Behavior:**
*   Must support swipe-to-dismiss.
*   Must support `onPress` on the card body to trigger progressive disclosure (expanding the card or opening a new view).

### 3.2 The Context Pill
Used to denote a linked entity within text or lists.

**Props:**
*   `entityId` (string) - The UUID of the node in the Knowledge Graph.
*   `type` (enum: 'person', 'document', 'event', 'topic') - Determines the icon.
*   `label` (string) - The display name.

**Behavior:**
*   `onPress` must trigger a bottom-sheet modal fetching the `/api/v1/context/{entityId}` endpoint.

## 4. Initial API Contracts

These contracts define the communication between the client and the Intelligence Engine.

### 4.1 Fetching "The Now" State
Retrieves the synthesized daily brief and active Action Cards.

**Endpoint:** `GET /api/v1/state/now`
**Response:**
```json
{
  "greeting": "Good Morning, Sarah",
  "dateString": "Friday, June 28",
  "activeItemCount": 7,
  "focusItems": [
    {
      "id": "act_123",
      "type": "warning",
      "title": "Meeting Canceled — 10 AM",
      "subtitle": "I've blocked this for deep work. 2 hours freed.",
      "actions": [
        { "id": "approve", "label": "Approve", "style": "primary" },
        { "id": "reschedule", "label": "Reschedule", "style": "ghost" }
      ]
    }
  ],
  "schedule": [
    {
      "id": "evt_456",
      "timeString": "9:00 AM",
      "title": "Focus Time",
      "isActive": true
    }
  ]
}
```

### 4.2 Conversational Input
Sends a user message or voice transcript to the Intelligence Engine.

**Endpoint:** `POST /api/v1/stream/message`
**Payload:**
```json
{
  "type": "text", // or 'audio'
  "content": "Plan a vacation to Japan for two weeks in July. Budget is $8,000.",
  "contextId": null // Used if replying to a specific thread or card
}
```
**Response:**
*The response is not just a string; it returns structured UI components.*
```json
{
  "messageId": "msg_789",
  "text": "I found three options that fit your criteria. All include flights, accommodation, and activities.",
  "components": [
    {
      "type": "OptionCardList",
      "data": {
        "options": [
          {
            "id": "opt_a",
            "badge": "A",
            "title": "Tokyo + Kyoto",
            "totalCost": 7500,
            "lineItems": [
              { "label": "Flights", "amount": 1900 },
              { "label": "Hotel (14 nights)", "amount": 3200 }
            ]
          }
        ]
      }
    }
  ],
  "suggestionChips": []
}
```

### 4.3 Action Execution
Triggered when a user taps a button on an Action Card or Option Card.

**Endpoint:** `POST /api/v1/action/execute`
**Payload:**
```json
{
  "actionId": "approve_draft_email",
  "contextData": {
    "draftId": "drf_999"
  }
}
```
**Response:**
```json
{
  "status": "success",
  "uiUpdate": {
    "action": "remove_card",
    "targetId": "act_123"
  },
  "silentNotification": "Email sent to Sarah Jenkins."
}
```

## 5. Security & Privacy Requirements

*   **Zero-Knowledge Architecture:** Where possible, the backend should not have plaintext access to sensitive data (e.g., banking credentials). Integrations should use tokenized access (OAuth) that can be revoked by the user at any time.
*   **Local Processing:** The client app should handle biometric data (Apple Health) locally, only sending anonymized, aggregated metrics to the server for context inference, unless explicit permission is granted for server-side processing.
*   **Data Deletion:** The API must include a `/api/v1/user/delete-all` endpoint that permanently purges the user's entire Knowledge Graph and revokes all integration tokens within 24 hours.

---
**Status:** Approved | **Version:** 1.0 | **Author:** Manus AI
