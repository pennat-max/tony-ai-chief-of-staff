# Tony Project Status

**Status: V1_PIVOT_APPROVED**

**Last Updated:** June 28, 2026  
**Last Agent:** ChatGPT — CTO / Product Owner  
**Current Phase:** Pivot from LINE Interception to Buildable Tony V1

---

## Decision

The LINE auto-notification interception function is skipped for now.

Reason: It depends on physical-device validation with Mac + Xcode + iPhone running iOS 27 beta. This is too much platform/hardware dependency for the next step.

The previous tracer bullet remains valuable research, but it is no longer blocking Tony V1.

See:
- `docs/V1_PIVOT_DECISION.md`
- `docs/REALITY_VALIDATION.md`
- `ios/TonyTracerBullet/`

---

## What is Done

- Product vision is complete.
- Tony v1 LINE VIP Filter research is complete.
- Reality Validation is complete.
- Tracer Bullet Swift source is committed.
- CTO has approved pivoting away from LINE auto-interception for now.

---

## What is NOT Being Built Now

Do not build:

- Physical iPhone Test
- LINE notification interception
- VIP LINE Filter
- LLM summarization of LINE notification streams
- iOS 27 beta dependency
- Week 2 VIP Filter

---

## New Tony V1 Direction

Tony V1 becomes:

**Manual / Shortcut-first AI Inbox + Morning Brief**

The first usable Tony should help พี่คอม capture, classify, summarize, and decide what matters without requiring system-level notification interception.

---

## New V1 Core

1. AI Inbox
2. Morning Brief
3. Decision Queue
4. Voice-to-Action Draft
5. Mobile-only Calm UI

---

## Next Step

Create the revised Tony V1 MVP definition based on the pivot.

Read:
- `docs/V1_PIVOT_DECISION.md`

Then create:
- `docs/V1_REVISED_MVP.md`
- update `docs/NEXT_ACTION.md`
- update `docs/CEO_SUMMARY.md`

Do not write production code yet.

---

## Confidence Level

High. The project is no longer blocked by iOS 27 hardware validation and can proceed toward a buildable mobile-first MVP.