# The Morning Flow: Intercepting the LINE Chaos

The most critical moment of พี่คอม's day is the moment he wakes up and opens his phone. Currently, this means opening LINE and facing a wall of unread messages across multiple businesses, group chats, and personal contacts. 

Tony's primary MVP feature is intercepting this chaos. The Morning Flow is designed to replace the act of "checking LINE" with "checking Tony."

## The Core Problem: The LINE Wall

When พี่คอม wakes up, his LINE app likely looks like this:
*   3 messages from family (High Priority).
*   14 messages in the VIGO4U dev group (Low Priority noise, mostly status updates).
*   2 messages from a key vehicle export buyer (High Priority, time-sensitive).
*   8 messages in the Farm staff group (Medium Priority, daily operations).
*   45 promotional messages from official accounts (Zero Priority).

Opening LINE forces พี่คอม to manually parse this list, draining cognitive energy before the day has even begun.

## The Tony Solution: The Morning Briefing

Tony acts as a proxy. While พี่คอม is sleeping, Tony reads every incoming LINE message, categorizes them according to the `LIFE_MODEL`, and filters them through the `RELATIONSHIP_PRIORITY_MODEL`.

When พี่คอม opens his iPhone in the morning, he opens Tony first. He sees a beautifully typeset, perfectly organized briefing.

### Step 1: The Health & Context Anchor

The very top of the screen grounds the user in their physical reality, not just digital tasks.

> **Good morning, พี่คอม.**
> You are 12 hours into your fast. Your eating window opens at 11:00 AM. 
> The weather is clear for your run. 
> 
> *You have 3 critical items from important people today.*

### Step 2: The VIP Surface (The "Important People" Filter)

Tony immediately surfaces messages from Tier 1 contacts (see `RELATIONSHIP_PRIORITY_MODEL`). It does not summarize them; it presents the actual message and a proposed action.

> **1. Vehicle Export (Urgent)**
> **Mr. Chen (Buyer):** "The container is delayed at customs. We need the updated manifest."
> *Tony's Action:* I have located the updated manifest in your email. 
> `[Button: Send Manifest to Mr. Chen]` `[Button: Draft Custom Reply]`

> **2. Personal**
> **Family Member:** "Don't forget dinner tonight at 7."
> *Tony's Action:* Added to your calendar. 
> `[Button: Acknowledge]`

### Step 3: The Synthesized Operations (The Noise Reduction)

For lower-priority group chats (like the VIGO4U dev group or the Farm staff group), Tony *does not* show individual messages. It synthesizes the overnight activity into single, readable sentences.

> **Operations Summary:**
> *   **VIGO4U:** The dev team deployed the new API patch at 2 AM. No errors reported. (14 messages synthesized).
> *   **Farm:** Staff reported the tractor is fixed. They sent a receipt for 4,500 THB. 
>     *Tony's Action:* I have logged the 4,500 THB expense. `[Button: View Receipt]`

### Step 4: The "Safe" Autonomous Log

At the bottom of the brief, Tony transparently lists the actions it took automatically overnight, requiring zero input from พี่คอม.

> **Tony acted automatically:**
> *   Archived 45 promotional LINE messages.
> *   Moved 3 spam emails to trash.
> *   Declined a calendar invite for 8 AM (protected workout time).

## Why This Flow Works for พี่คอม

This flow respects the Reality Matrix:
1.  **Mobile-Only:** It is a single, vertical scroll. No tabs, no deep menus.
2.  **LINE First:** It directly solves the pain of the morning LINE inbox.
3.  **Important People First:** It prioritizes Mr. Chen over the dev team chatter.
4.  **Automatic when Safe:** It handles the tractor receipt and the spam automatically, only asking for a "CEO Decision" on the customs manifest. 

By the time พี่คอม finishes this 60-second scroll, his inbox is triaged, his team is unblocked, and his mind is clear to focus on his morning run.
