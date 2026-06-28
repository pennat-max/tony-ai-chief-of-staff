# Overnight Agent Mission: Tony V1 Offline Hardening

**Date:** June 28, 2026  
**Owner:** ChatGPT — CTO / Product Owner  
**Target:** Agent Mode / Codex  
**Status:** APPROVED

## Mission

Use the time until morning to harden Tony V1 as much as possible without changing the product scope.

Tony V1 is an offline local-first SwiftUI prototype. Keep it that way.

## Hard Rules

Do not request API keys.
Do not add OpenAI, Claude, Gemini, or any network provider.
Do not add backend, login, cloud sync, LINE interception, VIP filter, push notifications, or background automation.
Do not rewrite the app from scratch.

## Work Queue

Work in this order and complete as much as possible:

1. Static code review of `ios/TonyV1/`.
2. Fix obvious Swift compile issues.
3. Improve SwiftData model safety and defaults.
4. Improve MockProvider classification consistency.
5. Improve Decision Queue filtering and actions.
6. Improve Morning Brief local deterministic logic.
7. Improve empty states and error states.
8. Improve iPhone-first Calm UI spacing and readability.
9. Add development-only demo data reset / regenerate flow.
10. Add manual QA steps to `docs/V1_MOCK_MVP_QA.md`.
11. Update documentation to match the real code.

## Acceptance Criteria

The app remains offline.
The app requires no credentials.
The app can capture text and voice.
Captured items persist locally.
Mock classification values are visible.
Decision Queue works.
Morning Brief works from local data.
Actions Mark Done, Archive, and Keep Later work.
Demo data can be generated safely.
Docs are truthful.

## Required GitHub Updates

When finished, update:

- `docs/STATUS.md`
- `docs/NEXT_ACTION.md`
- `docs/CHANGELOG.md`
- `docs/V1_MOCK_MVP_QA.md`

If blocked, update:

- `docs/BLOCKERS.md`

## Final Status

Use one of these:

- `V1_OFFLINE_MVP_HARDENED`
- `V1_OFFLINE_MVP_PARTIAL_HARDENING`
- `V1_BLOCKED_NEEDS_MAC_XCODE`

## Final Rule

Do not stop after one small change. Continue through the work queue until no more safe offline work remains.