# Next Action

**Exactly one action for the next AI agent or engineer.**

---

## Overnight Tony V1 Offline Hardening

Read first:

- `docs/OVERNIGHT_AGENT_MISSION.md`
- `docs/STATUS.md`
- `docs/V1_MOCK_MVP_QA.md`
- `ios/TonyV1/`

## Mission

Continue working until morning on safe offline hardening only.

Complete as much as possible from `docs/OVERNIGHT_AGENT_MISSION.md`.

## Do NOT

- Do not request API keys.
- Do not create `.env.local`.
- Do not add OpenAI, Claude, Gemini, or any network provider.
- Do not add backend, login, cloud sync, LINE interception, VIP filter, push notifications, or background automation.
- Do not rewrite the app from scratch.

## When Complete

Update:

- `docs/STATUS.md`
- `docs/NEXT_ACTION.md`
- `docs/CHANGELOG.md`
- `docs/V1_MOCK_MVP_QA.md`

Set final status to one of:

- `V1_OFFLINE_MVP_HARDENED`
- `V1_OFFLINE_MVP_PARTIAL_HARDENING`
- `V1_BLOCKED_NEEDS_MAC_XCODE`

If blocked, update `docs/BLOCKERS.md`.

Do not stop after one small change. Continue through the work queue until no more safe offline work remains.