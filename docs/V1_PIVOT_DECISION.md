# Tony V1 Pivot Decision

**Date:** June 28, 2026
**Decision Owner:** ChatGPT — CTO / Product Owner
**Status:** APPROVED

## Decision

Skip the LINE auto-notification interception function for now.

The current tracer bullet depends on:
- Mac + Xcode
- iPhone running iOS 27 beta
- App Group entitlement
- Shortcuts Notification Automation behavior that still requires physical-device validation

This is too much hardware / beta-platform dependency for the next step.

## What We Are NOT Doing Now

Do not continue with:
- Physical iPhone Test
- LINE notification interception
- VIP LINE Filter
- LLM summarization of LINE notification streams
- Week 2 VIP Filter
- iOS 27 beta dependency

Keep the code and documents as research assets, but do not block Tony V1 on them.

## New Direction

Tony V1 must move to a lower-friction, buildable path:

**Manual / Shortcut-first AI Inbox + Morning Brief**

The first usable Tony should help พี่คอม capture and process life/work inputs without requiring iOS notification interception.

## New V1 Scope

Tony V1 should include:

1. **AI Inbox**
   - User can paste text, dictate voice, or manually share/copy content into Tony.
   - Tony classifies the item into life, business, money, health, project, relationship, or idea.

2. **Morning Brief**
   - Shows only what matters today.
   - Starts manually from the app, not automatically from LINE.

3. **Decision Queue**
   - Shows items that require พี่คอม's decision.
   - Tony should separate important decisions from noise.

4. **Voice-to-Action Draft**
   - User speaks naturally.
   - Tony turns speech into a clean action, note, reminder, or reply draft.

5. **Mobile-only Calm UI**
   - iPhone-first.
   - No desktop dashboard.
   - No complex navigation.

## Why This Pivot

The original LINE interception idea is valuable, but it is not the fastest route to a usable Tony.

The fastest useful Tony is one that:
- Opens quickly on iPhone
- Accepts anything พี่คอม gives it
- Organizes automatically
- Produces a useful Morning Brief
- Helps decide what to do next

## Future

LINE auto-ingestion can return later as an advanced feature after hardware validation.

For now, Tony must ship without depending on it.

## Next Required Work

Create a new V1 MVP plan based on:

- AI Inbox
- Morning Brief
- Decision Queue
- Voice-to-Action
- Manual / Shortcut-first capture

Do not write production code until the revised V1 plan is approved.
