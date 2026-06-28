# Tony for พี่คอม: The Real-World AI Chief of Staff

## The Shift: From Generic Persona to Real User

Tony v1.0 and v2.0 (Strategy phase) were designed for a generic "Silicon Valley VP of Product." They assumed a life lived in Slack, Jira, and Google Workspace. 

This document redefines Tony around its first actual user: **พี่คอม**. 

Tony is no longer a theoretical product. It is a highly specific, custom-tailored AI companion designed to manage the exact complexities of พี่คอม's life, businesses, and habits.

## Who is พี่คอม? (The Reality Matrix)

To build Tony correctly, we must build it around these absolute truths about the user:

1.  **Mobile-First & Only:** พี่คอม works almost entirely from an iPhone. Desktop paradigms (dashboards, complex tables, multi-window views) are useless.
2.  **LINE is the Operating System:** The day does not start in an email client or Slack. The day starts in LINE. LINE is where business happens, where relationships live, and where emergencies break.
3.  **The "Important People" Filter:** พี่คอม does not read every message. He reads messages from *important people* first. Tony's primary job is not to summarize everything, but to know *who* matters right now.
4.  **The Portfolio Life:** พี่คอม does not have one job. He manages:
    *   VIGO4U (Dashboard/Software)
    *   Vehicle Export Business
    *   AI Software Projects
    *   Farm / Homestay
    *   Personal Wealth / Money
    *   Health (Intermittent Fasting, Morning Exercise)
    *   Personal Life & Relationships
5.  **The "CEO Decision" Threshold:** พี่คอม wants Tony to act automatically when it's safe (e.g., categorizing a receipt, logging a workout). Tony should only interrupt and ask for input when a true "CEO-level" decision is required.
6.  **Tone & Personality:** Tony must be a friend, a secretary, and a Chief of Staff. It cannot be a cold, robotic chatbot. It must have warmth, respect, and proactive care.
7.  **Zero Tolerance for Complexity:** พี่คอม hates complexity. He will not manually tag things, manage AI settings, or learn a complex new UI. Tony must just work.

## What Tony Must Become for พี่คอม

Based on the Reality Matrix, Tony's architecture shifts dramatically:

### 1. The LINE Interceptor
Tony must act as a layer above LINE. Instead of พี่คอม opening LINE and seeing 40 unread chats, he opens Tony. Tony has already read the LINE messages, identified the 3 that are from VIPs or contain urgent business (e.g., a vehicle export delay), and presents *only those*. 

### 2. The Portfolio Context Engine
Tony must understand that a message about "the tractor" belongs to the Farm context, while a message about "the dashboard API" belongs to VIGO4U. Tony maintains separate mental models for each of the 6 life domains but presents a unified daily brief.

### 3. The Autonomous Executor
If an invoice comes in via LINE for the farm, Tony doesn't ask what to do. Tony extracts the amount, logs it to the Farm expense sheet, and simply notifies: "Logged 5,000 THB for tractor repair." It only asks for permission if the amount is unusually high.

### 4. The Health & Fasting Buddy
Tony knows พี่คอม's intermittent fasting schedule. If a morning meeting is proposed that conflicts with his morning run, Tony suggests a different time. Tony doesn't need a complex health dashboard; it just needs to factor health constraints into daily scheduling.

## The V2.1 MVP Definition

The first version built for พี่คอม will not include every feature. It will focus entirely on **The Morning Triage and The LINE Filter**.

If Tony can save พี่คอม 30 minutes every morning by reading LINE, filtering out the noise, surfacing the VIPs, and presenting a clean, mobile-perfect brief while he is fasting or exercising, the product is a success.

---
*This document supersedes all previous User Research and Persona documents.*
