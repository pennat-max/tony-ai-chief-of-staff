# CEO Summary: Tony V1 (The 30-Day MVP)

**Date:** June 28, 2026
**Prepared by:** Manus AI — Product Owner
**Status:** Scoped and Ready for iOS Engineering.

---

## The Pivot: From Vision to Reality

We have paused the grand vision of the "AI Chief of Staff." Building a complex system with databases, multi-domain ontologies, and API write-access is a multi-month endeavor with high failure risk. 

Instead, we are building exactly one thing, for one user, in 30 days.

## The 30-Day Product: The LINE VIP Filter

พี่คอม's biggest pain point is opening LINE in the morning and facing 100+ unread messages. 

**Tony V1 is a standalone iOS app that does only this:**
1. It intercepts incoming LINE notifications overnight.
2. It checks the sender against a hardcoded list of 10 VIPs.
3. In the morning, it displays a pure black screen showing *only* the VIP messages, plus a 2-sentence AI summary of the rest.
4. It provides a microphone button to dictate a reply, which Tony translates to professional Thai and copies to the clipboard.
5. At midnight, it deletes everything and starts over.

No databases. No accounts. No settings menus. No complex AI reasoning. Just peace of mind every morning.

## The Technical Reality

To hit the 30-day deadline, we are making brutal engineering trade-offs:
*   **No backend:** All logic runs locally on the iPhone, making direct API calls to OpenAI/Anthropic.
*   **Read-Only:** Tony cannot send messages. It only copies text to the clipboard for พี่คอม to paste into LINE. This guarantees zero catastrophic errors in V1.
*   **The iOS Sandbox Hack:** Because Apple prevents apps from reading other apps' notifications, the engineering team's first task is to build an iOS Shortcut Automation that silently passes LINE messages to the Tony app.

## Next Steps

We need an iOS engineer immediately. Week 1 is entirely dedicated to proving we can intercept LINE messages via iOS Shortcuts and pass them to a blank SwiftUI app. If we win Week 1, we ship in 30 days.
