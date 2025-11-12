# IIIT Nagpur Campus Event Management System

DBMS project made using **MySQL** to manage college events, clubs, venues, and student registrations at **IIIT Nagpur**.  
Includes main fests like *Abhivyakti*, *Kshitij*, *Tantra Fiesta*, and *E-Summit*, plus club events from Estoria, D Taraxia, Elevate, IOTics, and more.

Screenshots of the outputs of the queries - https://docs.google.com/document/d/1BEgBoQUql-V5gzRRGlF9_hjWHhEzzf3i7lbaD9t_GBc/edit?usp=sharing

---

## 📁 Database Overview
**Tables:**  
`departments`, `students`, `venues`, `clubs`, `events`, `event_organizers`, `event_schedule`, `registrations`

**Extras:**  
- **Trigger:** Updates estimated attendance when a student registers or cancels.  
- **Procedure:** Handles student registration with capacity check.  
- **View:** Shows top 5 most popular events.

---

## ⚙️ How to Run
1. Open **MySQL Workbench**.  
2. Run the `schema.sql` file.  
3. Execute the queries at the bottom to view results.

---

## 🧠 Sample Queries
- Upcoming events with dates and venues  
- Students registered for Abhivyakti  
- Venues with maximum events  
- Top 5 popular events  
- Students not registered for any event  

---

**Author:** Anupam Gavhane  
*B.Tech, IIIT Nagpur — DBMS Lab Project (2025)*
# iiitn-event-management
