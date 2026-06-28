# The Life Model: Context Architecture for พี่คอม

Tony cannot be a generic assistant. It must possess a hardcoded, structural understanding of พี่คอม's specific portfolio of responsibilities. When a piece of information enters Tony (via LINE, email, or voice), Tony must instantly map it to one of these defined domains.

This is the internal ontology—the "Life Model"—that allows Tony to understand context without being told.

## The 7 Domains of พี่คอม's Life

Tony's backend Knowledge Graph is partitioned into these 7 primary domains. 

### 1. VIGO4U (Dashboard & Core Software)
*   **Context:** The primary software platform/dashboard business.
*   **Keywords/Triggers:** "Dashboard", "API", "Server", "Bugs", "Deployment", "VIGO4U".
*   **Tony's Role:** Monitor system alerts, track developer progress, and summarize technical blockers into plain language.

### 2. Vehicle Export Business
*   **Context:** The physical logistics, sales, and shipping of vehicles.
*   **Keywords/Triggers:** "Container", "Customs", "Port", "Shipment", "Buyer", "Invoice", specific vehicle models.
*   **Tony's Role:** Track logistics timelines, flag delayed shipments, and manage international communication/timezones.

### 3. AI Software Projects
*   **Context:** Ongoing development of new AI tools (including Tony itself) and other experimental tech.
*   **Keywords/Triggers:** "Model", "Prompt", "Agent", "Testing", "Integration", "Manus".
*   **Tony's Role:** Track feature ideas, summarize research, and manage project roadmaps.

### 4. Farm & Homestay
*   **Context:** Physical property management, agriculture, and hospitality.
*   **Keywords/Triggers:** "Tractor", "Weather", "Harvest", "Guests", "Booking", "Maintenance", "Staff".
*   **Tony's Role:** Log physical expenses automatically, monitor weather alerts relevant to the farm, and manage homestay booking conflicts.

### 5. Money & Wealth
*   **Context:** Personal and cross-business financial health.
*   **Keywords/Triggers:** "Transfer", "Bank", "Exchange rate", "Profit", "Tax".
*   **Tony's Role:** Act as an automated bookkeeper. Extract transaction slips from LINE, log them to the correct business domain (e.g., Farm vs. Export), and provide a unified weekly cash-flow summary.

### 6. Health & Body
*   **Context:** Intermittent Fasting (IF), morning exercise, and general wellness.
*   **Keywords/Triggers:** "Fasting", "Eating window", "Run", "Workout", "Sleep".
*   **Tony's Role:** Protect the routine. Tony knows the fasting window and the morning run schedule. It will proactively suggest moving early meetings to protect this time, treating health with the same priority as a CEO meeting.

### 7. Personal Life & Relationships
*   **Context:** Family, close friends, and non-business obligations.
*   **Keywords/Triggers:** Names of family members, "Dinner", "Weekend", "Birthday".
*   **Tony's Role:** Ensure business does not consume personal life. Surface messages from VIP family members instantly, regardless of what business fires are burning.

## Cross-Domain Synthesis (How Tony Thinks)

Tony's true power is understanding when these domains intersect.

**Example Scenario:**
A LINE message arrives: *"The tractor repair cost 15,000 THB. Transfer to this account."*

**Generic AI:** "You have a message about a tractor and a request for 15,000 THB."
**Tony (using the Life Model):**
1.  Identifies "Tractor" -> Maps to **Domain 4 (Farm)**.
2.  Identifies "15,000 THB" -> Maps to **Domain 5 (Money)**.
3.  **Action:** Tony drafts the transfer slip (or prepares the banking app link), logs the 15,000 THB as a Farm Expense, and presents a single "Approve Transfer" button to พี่คอม.

## The "Context Switch" UI

Because พี่คอม uses an iPhone, he cannot have 7 dashboards open. Tony uses the Life Model to dynamically change the UI based on the time of day and the most urgent domain.

*   **6:00 AM:** Tony is in **Health Mode**. The interface shows the fasting timer and the weather for the morning run. Business alerts are hidden unless critical.
*   **9:00 AM:** Tony switches to **Triage Mode**. It pulls the most urgent items from VIGO4U, Export, and AI Projects into a single, unified stream.
*   **Weekend:** Tony suppresses VIGO4U and Export updates, elevating Farm and Personal Life to the top of the stream.
