# Design Language and Design System for Tony

## Design Philosophy: "Ambient Clarity"

The design language for Tony is termed "Ambient Clarity." Because Tony acts as a Chief of Staff managing complex, high-stakes information across all areas of a user's life, the visual design must evoke trust, competence, and calm. It must never feel overwhelming, chaotic, or overly playful. The interface should recede into the background, allowing the synthesized information and AI recommendations to be the sole focus.

### Core Visual Principles

1.  **Quiet Competence:** The UI uses a restrained color palette and generous whitespace. It does not use loud colors to demand attention unless absolutely necessary for a critical alert.
2.  **Typographic Hierarchy:** Because Tony relies heavily on synthesized text (briefings, summaries, recommendations), typography is the primary structural element. Size, weight, and contrast are used to establish clear reading paths.
3.  **Soft Elevation:** Depth is used to indicate interactivity and hierarchy. Background layers are flat, while interactive elements (like Action Cards) are slightly elevated using soft, diffused shadows.
4.  **Fluid Motion:** Transitions between states (e.g., from *The Now* to *The Stream*) must be fluid and physically grounded, reinforcing the idea that Tony is a continuous entity, not a collection of disconnected screens.

## Design Tokens

The foundational elements of the design system ensure consistency across all touchpoints.

### 1. Color Palette

The palette is designed to reduce eye strain during prolonged use, favoring deep, muted tones over stark contrasts.

| Token Name | Hex Value | Usage |
| :--- | :--- | :--- |
| `color-bg-primary` | `#F9F9FB` (Light) / `#121214` (Dark) | The main canvas background. |
| `color-bg-secondary` | `#FFFFFF` (Light) / `#1C1C1E` (Dark) | Elevated surfaces, cards, and sheets. |
| `color-text-primary` | `#111111` (Light) / `#EDEDED` (Dark) | Primary reading text and critical headings. |
| `color-text-secondary` | `#666666` (Light) / `#A0A0A0` (Dark) | Metadata, timestamps, and secondary information. |
| `color-accent-brand` | `#2563EB` | Primary actions, active states, and AI highlights. |
| `color-status-urgent` | `#DC2626` | Critical alerts (e.g., missed flight, unusual financial activity). |
| `color-status-success` | `#059669` | Confirmations of completed background tasks. |

### 2. Typography

The typographic system relies on a highly legible, modern sans-serif typeface that performs well at both large heading sizes and dense interface scales.

*   **Primary Typeface:** Inter (or a similar geometric sans-serif like SF Pro or Roboto).
*   **Scale:**
    *   `type-display-1`: 32px, Bold (For major state changes, e.g., "Good Morning, Sarah")
    *   `type-heading-1`: 24px, Semi-Bold (For primary section titles)
    *   `type-heading-2`: 18px, Medium (For card titles and major groupings)
    *   `type-body-large`: 16px, Regular (For conversational text in *The Stream*)
    *   `type-body-base`: 14px, Regular (For standard interface text and summaries)
    *   `type-caption`: 12px, Medium (For metadata, tags, and timestamps)

### 3. Spacing and Layout

A strict 4px/8px grid system is used to maintain rhythm and predictability.

*   `space-xs`: 4px (Between tightly coupled elements, e.g., icon and label)
*   `space-sm`: 8px (Standard padding within small components)
*   `space-md`: 16px (Standard padding for cards and list items)
*   `space-lg`: 24px (Spacing between distinct sections or components)
*   `space-xl`: 32px (Major structural margins)

### 4. Elevation (Shadows)

Elevation is used sparingly to define the Z-axis, separating the ambient background from actionable foreground elements.

*   `elevation-0`: Flat (Backgrounds)
*   `elevation-1`: Y: 2px, Blur: 4px, Opacity: 5% (Subtle lift for interactive buttons)
*   `elevation-2`: Y: 4px, Blur: 12px, Opacity: 8% (Standard Action Cards)
*   `elevation-3`: Y: 12px, Blur: 24px, Opacity: 12% (Overlays, Context Sheets, Modals)

## Component Library

These reusable components form the building blocks of the Tony interface.

### The Action Card
The fundamental unit of proactive intelligence. It encapsulates a piece of context and a proposed action.

*   **Structure:**
    *   Header: Context Icon + Timestamp (e.g., [Email Icon] 10m ago)
    *   Title: Synthesized summary (e.g., "Drafted reply to Sarah regarding Q3 Budget")
    *   Body: The content or reasoning (e.g., "I confirmed your availability for Friday at 2 PM as requested.")
    *   Footer: Primary Action Button ("Approve & Send") + Secondary Action ("Edit")
*   **Behavior:** Swiping the card dismisses it; tapping the body expands it via progressive disclosure.

### The Context Pill
Small, interactive markers used within text or summaries to denote a linked node in the Knowledge Graph.

*   **Structure:** A rounded rectangle with a subtle background color (`color-bg-secondary`), containing an icon and a label (e.g., [Person Icon] Sarah Jenkins).
*   **Behavior:** Tapping a Context Pill invokes a *Context Sheet*, pulling up all relevant data regarding that entity without navigating away from the current view.

### The Stream Input
The primary method for conversational interaction, located at the bottom of *The Stream* view.

*   **Structure:** A pill-shaped input field spanning the width of the screen, featuring a prominent microphone icon for voice input and a subtle keyboard icon for text entry.
*   **Behavior:** When focused, it expands slightly and dims the background. It supports natural language parsing and real-time suggestion chips based on the user's current context.

### The Status Indicator
A minimalist component used to convey Tony's background activity without demanding attention.

*   **Structure:** A small, pulsing dot or a minimal icon located in the top navigation area.
*   **Behavior:** A slow, blue pulse indicates Tony is processing complex information or synthesizing a request. A solid green dot indicates all background tasks are complete and the system is up-to-date.

---
**Status:** Approved | **Version:** 1.0 | **Author:** Manus AI
