# Tony: AI Chief of Staff

**Building the world's most intelligent personal operating system.**

> **v2 focuses on Tony for พี่คอม as the first real user.**

Tony is an AI Chief of Staff designed to manage life, business, health, relationships, money, projects, and decisions through one unified AI companion. Unlike generic AI assistants, Tony understands context automatically and requires zero manual organization.

## What Tony Is

Tony is **not** an ERP. Tony is **not** a chatbot. Tony is **not** another AI assistant.

Tony is an ambient intelligence — a proactive, context-aware Chief of Staff that operates continuously in the background, anticipating needs, managing information flow, and facilitating better decisions.

## The First Real User: พี่คอม

Version 2 of Tony is no longer designed for a generic "VP of Product." It is designed around the real life of **พี่คอม**, a portfolio operator managing VIGO4U, vehicle export, AI software projects, a farm/homestay, personal wealth, health, and relationships — primarily from an iPhone, primarily through LINE.

All v2 product decisions, UX rules, and AI behavior are grounded in his specific reality. The `docs/` directory contains the complete real-user product model.

## Repository Structure

| Directory | Contents |
| :--- | :--- |
| `docs/` | **[NEW — v2]** Real-user product model for พี่คอม |
| `research/` | User research, competitive analysis, market insights |
| `strategy/` | Product vision, philosophy, core principles, strategy, V2 critique |
| `design/` | Information architecture, AI behavior, UX design, design system, wireframes, mockups |
| `design/mockups/` | High-fidelity PNG mockups (v1 and v2) |
| `prototype/` | Fully interactive HTML/CSS prototype |
| `engineering/` | Developer handoff: design tokens, component specs, API contracts |

## The `docs/` Directory: Tony for พี่คอม (v2)

These 7 documents define the real product. Any AI agent or engineer continuing this work **must read these first**.

| Document | Purpose |
| :--- | :--- |
| `docs/TONY_FOR_PEEKOM.md` | The master brief: who พี่คอม is and what Tony must become for him |
| `docs/LIFE_MODEL.md` | The 7 domains of พี่คอม's life and how Tony maps context to each |
| `docs/MORNING_FLOW.md` | The morning routine design: LINE interception, VIP surfacing, health anchor |
| `docs/RELATIONSHIP_PRIORITY_MODEL.md` | The 4-tier model for ranking contacts and filtering noise |
| `docs/AI_ACTION_RULES.md` | The "CEO Decision" threshold: when Tony acts silently vs. asks |
| `docs/MOBILE_ONLY_UX_RULES.md` | iPhone-first UX constraints: 4 components, no settings menus, voice-first |
| `docs/V2_PRODUCT_DECISIONS.md` | The MVP scope (V2.1) and 3-phase roadmap |

## Product Philosophy: Typographic Calm

The v2 design language is **Typographic Calm** — pure black canvas, no cards or borders, editorial serif typography, color reserved exclusively for actionable elements. The interface must feel like a beautifully typeset document that happens to be intelligent.

## Core Principles (v2)

| Principle | Implementation |
| :--- | :--- |
| **Radical Reduction** | No tabs, no dashboards. One vertical stream. |
| **Explainable AI** | Every action Tony takes includes a one-line "why." |
| **Protect the Flow** | Tony defends the morning run and fasting window as aggressively as a CEO meeting. |
| **Single-Domain Mastery** | V2.1 masters LINE interception before touching email, calendar, or finance. |

## Three Core Views (Adapted for v2)

| View | V1 Purpose | V2 Adaptation for พี่คอม |
| :--- | :--- | :--- |
| **The Now** | Ambient daily brief | The Morning Triage: LINE filter + Health Anchor |
| **The Stream** | Conversational input | Voice dictation for replies and commands |
| **The Atlas** | Knowledge Graph explorer | **Removed from MVP.** Replaced by inline Context Peek overlays. |

## For Future AI Agents

If you are an AI agent continuing this work, read these documents in order:

1. `docs/TONY_FOR_PEEKOM.md` — Understand the real user before touching anything else.
2. `docs/LIFE_MODEL.md` — Understand the 7 domains Tony must navigate.
3. `docs/MORNING_FLOW.md` — Understand the MVP interaction flow.
4. `docs/AI_ACTION_RULES.md` — Understand the autonomy boundaries.
5. `docs/V2_PRODUCT_DECISIONS.md` — Understand the MVP scope and what is cut.
6. `strategy/02_PRODUCT_VISION_STRATEGY.md` — The broader vision and 3-phase strategy.
7. `design/03_DESIGN_SYSTEM.md` — Design tokens before modifying any UI.

The next engineering priority is the **LINE API integration (read-only)** and the **Morning Triage UI** as defined in `docs/MORNING_FLOW.md` and `docs/V2_PRODUCT_DECISIONS.md`.

---

**Status:** v2.1 Product Definition Complete | **Last Updated:** June 28, 2026 | **Author:** Manus AI (Founding Product Team)
