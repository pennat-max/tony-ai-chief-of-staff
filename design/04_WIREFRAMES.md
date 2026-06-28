# Wireframes: Low-Fidelity Layouts for Tony

This document contains low-fidelity wireframes for the core screens of Tony. These wireframes prioritize information hierarchy and interaction flow over visual polish, establishing the foundational layout structure that will be refined in high-fidelity mockups.

## Screen 1: The Now (Morning Briefing)

This is the default view when the user opens Tony in the morning. It synthesizes the day's critical information into a single, scannable interface.

```
┌─────────────────────────────────────────────────────────────┐
│ ← Tony                                        [⊙] [☰]       │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  Good Morning, Sarah                                          │
│  Friday, June 28                                              │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│ TODAY'S FOCUS                                                 │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ [!] Your 10 AM meeting was canceled                     │ │
│ │ → I've blocked this for deep work (2 hours)             │ │
│ │ [Approve] [Reschedule]                                  │ │
│ └─────────────────────────────────────────────────────────┘ │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│ URGENT ITEMS (3)                                              │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ [✉] Sarah Jenkins - Q3 Budget Review                    │ │
│ │     Arrived 11:23 PM | [View Draft Reply]               │ │
│ └─────────────────────────────────────────────────────────┘ │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ [$] Unusual spending: $487 at "Luxury Hotels Inc"       │ │
│ │     Yesterday | [Review] [Approve]                      │ │
│ └─────────────────────────────────────────────────────────┘ │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ [📅] Design Team Meeting in 2 hours                     │ │
│ │     Prep ready | [View Brief]                           │ │
│ └─────────────────────────────────────────────────────────┘ │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│ TODAY'S SCHEDULE                                              │
│ 10:00 AM - Deep Work Block (2h)                              │
│ 12:00 PM - Lunch                                              │
│ 2:00 PM  - Design Team Meeting                               │
│ 4:30 PM  - 1:1 with Marcus                                   │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│ [🎤 Tap to speak] [⌨ Type a request]                         │
│                                                               │
└─────────────────────────────────────────────────────────────┘
```

### Key Elements:
- **Header:** Greeting with current date and status indicator
- **Focus Section:** Proactive recommendations (canceled meetings, schedule optimization)
- **Urgent Items:** Prioritized cards showing critical information
- **Schedule:** Compact daily timeline
- **Input:** Conversational interface at the bottom

---

## Screen 2: The Stream (Conversational Interface)

This is the primary interaction layer where users engage with Tony through natural language. The interface displays a continuous conversation thread with rich interactive elements.

```
┌─────────────────────────────────────────────────────────────┐
│ ← Back                                    [⊙] [☰]           │
├─────────────────────────────────────────────────────────────┤
│ THE STREAM                                                    │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│ [You] 9:15 AM                                                │
│ "Plan a vacation to Japan for two weeks in July.             │
│  Budget is $8,000."                                           │
│                                                               │
│ [Tony] 9:15 AM                                               │
│ I found three options that fit your criteria. All include    │
│ flights, accommodation, and activities.                      │
│                                                               │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ OPTION A: Tokyo + Kyoto                                 │ │
│ │ Flights: $1,200 | Hotel: $3,600 | Activities: $2,400    │ │
│ │ Total: $7,200 | [Expand] [Select]                       │ │
│ └─────────────────────────────────────────────────────────┘ │
│                                                               │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ OPTION B: Tokyo + Osaka + Hiroshima                     │ │
│ │ Flights: $1,400 | Hotel: $3,800 | Activities: $2,600    │ │
│ │ Total: $7,800 | [Expand] [Select]                       │ │
│ └─────────────────────────────────────────────────────────┘ │
│                                                               │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ OPTION C: Tokyo + Yokohama + Mt. Fuji                   │ │
│ │ Flights: $1,100 | Hotel: $3,400 | Activities: $2,200    │ │
│ │ Total: $6,700 | [Expand] [Select]                       │ │
│ └─────────────────────────────────────────────────────────┘ │
│                                                               │
│ [You] 9:18 AM                                                │
│ "Can you adjust Option B to include Nara?"                   │
│                                                               │
│ [Tony] 9:18 AM                                               │
│ Updated Option B with Nara (adds $300 for accommodation      │
│ and activities). New total: $8,100.                          │
│                                                               │
│ This exceeds your budget by $100. Would you like me to:     │
│ [Reduce activities] [Adjust dates] [Increase budget]        │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│ [🎤 Tap to speak] [Type your message...]                     │
│                                                               │
└─────────────────────────────────────────────────────────────┘
```

### Key Elements:
- **Conversation Thread:** Alternating user and Tony messages
- **Action Cards:** Structured recommendations with interactive options
- **Progressive Disclosure:** Tap to expand for detailed information
- **Contextual Suggestions:** Chips for quick actions
- **Input Area:** Always accessible at the bottom

---

## Screen 3: The Atlas (Knowledge Graph Explorer)

When the user wants to explore their data or search for specific information, *The Atlas* provides a visual, search-driven interface into the Knowledge Graph.

```
┌─────────────────────────────────────────────────────────────┐
│ ← Back                                    [⊙] [☰]           │
├─────────────────────────────────────────────────────────────┤
│ THE ATLAS                                                     │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│ [🔍 Search people, projects, topics...]                      │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│ RECENT SEARCHES                                               │
│ [Sarah Jenkins] [Q3 Budget] [Japan Trip] [Design Team]      │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│ SEARCH RESULTS FOR "Q3 BUDGET"                               │
│                                                               │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ [📄] Q3 Budget Proposal                                 │ │
│ │      Document | Last modified: 3 days ago               │ │
│ │      Related: [Sarah Jenkins] [Finance Team]            │ │
│ └─────────────────────────────────────────────────────────┘ │
│                                                               │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ [✉] Email thread: "Q3 Budget Review"                    │ │
│ │      5 messages | Last: 11:23 PM                        │ │
│ │      From: [Sarah Jenkins]                              │ │
│ └─────────────────────────────────────────────────────────┘ │
│                                                               │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ [📅] Meeting: "Q3 Budget Finalization"                  │ │
│ │      Friday, June 28 at 2:00 PM                         │ │
│ │      Attendees: [Sarah] [Marcus] [Finance Team]         │ │
│ └─────────────────────────────────────────────────────────┘ │
│                                                               │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ [💬] Slack messages (3)                                 │ │
│ │      Last: "Do we have approval from the board?"        │ │
│ │      From: [Marcus Chen]                                │ │
│ └─────────────────────────────────────────────────────────┘ │
│                                                               │
└─────────────────────────────────────────────────────────────┘
```

### Key Elements:
- **Search Bar:** Primary input for exploring the Knowledge Graph
- **Recent Searches:** Quick access to frequently searched items
- **Unified Results:** All related artifacts (documents, emails, meetings, messages) in one view
- **Context Pills:** Linked entities for quick navigation
- **Metadata:** Timestamps and relationship indicators

---

## Screen 4: Meeting Prep (Context-Adaptive View)

When the user is about to enter a meeting, *The Now* view shifts to a focused "Meeting Mode" that displays all relevant context.

```
┌─────────────────────────────────────────────────────────────┐
│ ← Back                                    [⊙] [☰]           │
├─────────────────────────────────────────────────────────────┤
│ DESIGN TEAM MEETING                                           │
│ Friday, June 28 at 2:00 PM | In 5 minutes                    │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│ MEETING LINK                                                  │
│ [🔗 Join Zoom] (https://zoom.us/...)                         │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│ AGENDA                                                        │
│ 1. Q3 Launch Timeline Review                                  │
│ 2. Wireframe Feedback                                         │
│ 3. Resource Allocation                                        │
│ 4. Next Steps                                                 │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│ ATTENDEES & CONTEXT                                           │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ [👤] Sarah Jenkins (Organizer)                          │ │
│ │      Last interaction: 11:23 PM (Email)                 │ │
│ │      [View history]                                     │ │
│ └─────────────────────────────────────────────────────────┘ │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ [👤] Marcus Chen                                        │ │
│ │      Last interaction: Yesterday (Slack)                │ │
│ │      [View history]                                     │ │
│ └─────────────────────────────────────────────────────────┘ │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│ RELEVANT ASSETS                                               │
│ [📄 Wireframes v3] [📊 Timeline] [📋 Budget] [📝 Notes]      │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│ QUICK ACTIONS                                                 │
│ [📞 Call instead] [⏱ Reschedule] [✋ Decline]               │
│                                                               │
└─────────────────────────────────────────────────────────────┘
```

### Key Elements:
- **Meeting Header:** Time, duration, and status
- **Meeting Link:** One-tap join
- **Agenda:** Clear structure of discussion topics
- **Attendee Context:** Relationship history and recent interactions
- **Relevant Assets:** Quick access to documents and resources
- **Quick Actions:** Options to modify or decline

---

## Screen 5: Action Card (Detailed View)

When the user taps to expand an Action Card, it reveals the full context and reasoning behind Tony's recommendation.

```
┌─────────────────────────────────────────────────────────────┐
│ ← Back                                    [⊙] [☰]           │
├─────────────────────────────────────────────────────────────┤
│ DRAFTED EMAIL REPLY                                           │
│ From: Sarah Jenkins | Received: 11:23 PM                     │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│ ORIGINAL EMAIL                                                │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ Subject: Q3 Budget Review                               │ │
│ │                                                          │ │
│ │ Hi, can we schedule a meeting to review the Q3 budget?  │ │
│ │ I'm available Friday at 2 PM or Monday at 10 AM.        │ │
│ │                                                          │ │
│ │ Thanks,                                                  │ │
│ │ Sarah                                                    │ │
│ └─────────────────────────────────────────────────────────┘ │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│ TONY'S DRAFT REPLY                                            │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ Hi Sarah,                                               │ │
│ │                                                          │ │
│ │ Friday at 2 PM works perfectly for me. I've blocked     │ │
│ │ the time on my calendar. Looking forward to discussing  │ │
│ │ the Q3 budget with you.                                 │ │
│ │                                                          │ │
│ │ Best,                                                   │ │
│ │ You                                                     │ │
│ └─────────────────────────────────────────────────────────┘ │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│ WHY THIS DRAFT?                                               │
│ • Matches your communication style (professional, warm)      │ │
│ • Confirms Friday 2 PM (aligns with your calendar)           │ │
│ • Tone matches previous emails with Sarah                    │ │
│                                                               │ │
├─────────────────────────────────────────────────────────────┤
│ ACTIONS                                                       │
│ [✓ Send] [✏ Edit] [🗑 Discard]                              │
│                                                               │
└─────────────────────────────────────────────────────────────┘
```

### Key Elements:
- **Original Context:** The email that triggered the draft
- **Tony's Draft:** The proposed response
- **Reasoning:** Why Tony made this specific recommendation
- **Edit Option:** User can modify before sending
- **Clear Actions:** Send, edit, or discard

---

## Screen 6: Settings and Integrations

A simplified settings interface focused on integrations and privacy controls.

```
┌─────────────────────────────────────────────────────────────┐
│ ← Back                                    [⊙] [☰]           │
├─────────────────────────────────────────────────────────────┤
│ SETTINGS                                                      │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│ INTEGRATIONS                                                  │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ [✓] Gmail                                               │ │
│ │     Connected as: sarah@company.com                     │ │
│ │     [Disconnect] [Refresh]                              │ │
│ └─────────────────────────────────────────────────────────┘ │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ [✓] Google Calendar                                     │ │
│ │     Connected | Last sync: 2 minutes ago                │ │
│ │     [Disconnect] [Refresh]                              │ │
│ └─────────────────────────────────────────────────────────┘ │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ [✓] Apple Health                                        │ │
│ │     Connected | Syncing sleep, activity, heart rate     │ │
│ │     [Disconnect] [Refresh]                              │ │
│ └─────────────────────────────────────────────────────────┘ │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ [ ] Slack                                               │ │
│ │     Not connected | [Connect]                           │ │
│ └─────────────────────────────────────────────────────────┘ │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│ PRIVACY & DATA                                                │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ End-to-End Encryption: [ON]                             │ │
│ │ Data Retention: 90 days                                 │ │
│ │ [View Privacy Policy] [Download My Data] [Delete All]   │ │
│ └─────────────────────────────────────────────────────────┘ │
│                                                               │
├─────────────────────────────────────────────────────────────┤
│ PREFERENCES                                                   │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ Notification Level: [Medium]                            │ │
│ │ Time Zone: Pacific Time (PT)                            │ │
│ │ Theme: [Light] [Dark]                                   │ │
│ └─────────────────────────────────────────────────────────┘ │
│                                                               │
└─────────────────────────────────────────────────────────────┘
```

### Key Elements:
- **Integration Status:** Clear visibility of connected services
- **Privacy Controls:** Encryption and data retention options
- **User Preferences:** Theme, notifications, time zone
- **Data Management:** Download and delete options

---

**Status:** Approved | **Version:** 1.0 | **Author:** Manus AI
