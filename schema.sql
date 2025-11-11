-- IIIT Nagpur Campus Event Management System

DROP TABLE IF EXISTS registrations;
DROP TABLE IF EXISTS event_organizers;
DROP TABLE IF EXISTS event_schedule;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS clubs;
DROP TABLE IF EXISTS venues;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
  dept_code VARCHAR(4) PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

INSERT INTO departments VALUES
('CSE','Computer Science & Engineering'),
('CSH','Cybersecurity & Hacking'),
('CSA','Computer Systems & Applications'),
('ECE','Electronics & Communication'),
('ECI','Embedded & IoT'),
('CSD','Data Science');

CREATE TABLE students (
  student_id VARCHAR(12) PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  dept_code VARCHAR(4),
  year INT,
  email VARCHAR(100),
  phone VARCHAR(15),
  FOREIGN KEY (dept_code) REFERENCES departments(dept_code)
);

INSERT INTO students VALUES
('bt23cse101','Amit','Sharma','CSE',2,'amit.sharma@iiitn.edu.in','9000000101'),
('bt23cse102','Rohit','Verma','CSE',2,'rohit.verma@iiitn.edu.in','9000000102'),
('bt23csh103','Sonia','Kapoor','CSH',3,'sonia.kapoor@iiitn.edu.in','9000000103'),
('bt23csa104','Nikhil','Mehta','CSA',1,'nikhil.mehta@iiitn.edu.in','9000000104'),
('bt23ece105','Priya','Roy','ECE',2,'priya.roy@iiitn.edu.in','9000000105'),
('bt23eci106','Karan','Gupta','ECI',4,'karan.gupta@iiitn.edu.in','9000000106'),
('bt23csd107','Anita','Sharma','CSD',3,'anita.sharma@iiitn.edu.in','9000000107'),
('bt23cse108','Ramesh','Kumar','CSE',4,'ramesh.kumar@iiitn.edu.in','9000000108'),
('bt23cse109','Simran','Singh','CSE',1,'simran.singh@iiitn.edu.in','9000000109'),
('bt23csh110','Vivek','Patel','CSH',2,'vivek.patel@iiitn.edu.in','9000000110'),
('bt23csa111','Ritu','Mehta','CSA',2,'ritu.mehta@iiitn.edu.in','9000000111'),
('bt23ece112','Sunil','Desai','ECE',1,'sunil.desai@iiitn.edu.in','9000000112'),
('bt23cse113','Geeta','Rao','CSE',3,'geeta.rao@iiitn.edu.in','9000000113'),
('bt23eci114','Asha','Khan','ECI',4,'asha.khan@iiitn.edu.in','9000000114'),
('bt23cse115','Manish','Mehta','CSE',1,'manish.mehta@iiitn.edu.in','9000000115');

CREATE TABLE venues (
  venue_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  type VARCHAR(50),
  capacity INT
);

INSERT INTO venues (name, type, capacity) VALUES
('Stage Area','Open Area',800),
('In Front of Admin','Open Area',500),
('Seminar Hall','Hall',300),
('Senate Hall','Hall',250),
('Admin Hall 1','Hall',150),
('Admin Hall 2','Hall',150),
('Fountain Area','Open Area',400),
('Stalls Area (Front Admin)','Open Area',600),
('Parking','Open Area',1000),
('CR001','Classroom',60),('CR002','Classroom',60),('CR101','Classroom',60),
('CR102','Classroom',60),('CR103','Classroom',60),('CR104','Classroom',60),
('CR105','Classroom',60),('CR201','Classroom',60),('CR202','Classroom',60),
('CR203','Classroom',60),('CR204','Classroom',60),('CR205','Classroom',60),
('CR301','Classroom',60),('CR302','Classroom',60),('CR303','Classroom',60),
('CR304','Classroom',60),('CR305','Classroom',60);

CREATE TABLE clubs (
  club_id INT AUTO_INCREMENT PRIMARY KEY,
  club_name VARCHAR(100),
  description VARCHAR(255)
);

INSERT INTO clubs VALUES
(1,'E-Cell','Entrepreneurship Cell'),
(2,'Estoria','Dramatics Club'),
(3,'D Taraxia','Dance Club'),
(4,'CRISPR','Bio/Genetics Club'),
(5,'Elevate','Programming & Tech Club'),
(6,'IOTics','IoT Club');

CREATE TABLE events (
  event_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(150),
  event_type ENUM('Cultural','Sports','Technical','Summit','Workshop','Club'),
  description TEXT,
  open_for_all BOOLEAN DEFAULT TRUE,
  estimated_attendance INT DEFAULT 0
);

INSERT INTO events (title,event_type,description,open_for_all,estimated_attendance) VALUES
('Abhivyakti - Cultural Fest','Cultural','Annual cultural fest',TRUE,2000),
('Kshitij - Sports Fest','Sports','Annual sports meet',TRUE,1500),
('Tantra Fiesta','Technical','Tech fest with workshops',TRUE,1200),
('E-Summit','Summit','Entrepreneurship summit',TRUE,800),
('Estoria: One Act Play','Club','Drama performance',TRUE,300),
('D Taraxia: Dance Night','Club','Dance show',TRUE,400),
('Elevate: Algo Marathon','Club','24-hour coding event',TRUE,200),
('IOTics Workshop','Workshop','IoT hands-on workshop',FALSE,80),
('Guest Lecture on ML Ops','Workshop','Talk on MLOps',TRUE,150),
('Inter-Dept Football Match','Sports','Friendly football match',FALSE,400);

CREATE TABLE event_organizers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  event_id INT,
  club_id INT,
  dept_code VARCHAR(4),
  contact_person VARCHAR(100),
  contact_email VARCHAR(100),
  FOREIGN KEY (event_id) REFERENCES events(event_id),
  FOREIGN KEY (club_id) REFERENCES clubs(club_id),
  FOREIGN KEY (dept_code) REFERENCES departments(dept_code)
);

INSERT INTO event_organizers VALUES
(1,1,NULL,'CSE','Abhivyakti Committee','abhivyakti@iiitn.edu.in'),
(2,2,NULL,'CSE','Sports Committee','sports@iiitn.edu.in'),
(3,3,NULL,'CSE','Tech Committee','tech@iiitn.edu.in'),
(4,4,NULL,NULL,'Incubation Cell','esummit@iiitn.edu.in'),
(5,5,2,NULL,'Estoria Lead','estoria@iiitn.edu.in'),
(6,6,3,NULL,'D Taraxia Lead','dtaraxia@iiitn.edu.in'),
(7,7,5,NULL,'Elevate Lead','elevate@iiitn.edu.in'),
(8,8,6,NULL,'IOTics Lead','iotics@iiitn.edu.in'),
(9,9,NULL,NULL,'ML Club','mlspeaker@iiitn.edu.in'),
(10,10,NULL,NULL,'Sports Committee','sports@iiitn.edu.in');

CREATE TABLE event_schedule (
  schedule_id INT AUTO_INCREMENT PRIMARY KEY,
  event_id INT,
  venue_id INT,
  event_date DATE,
  start_time TIME,
  duration_minutes INT,
  capacity INT,
  FOREIGN KEY (event_id) REFERENCES events(event_id),
  FOREIGN KEY (venue_id) REFERENCES venues(venue_id)
);

INSERT INTO event_schedule VALUES
(1,1,1,'2025-02-15','18:00:00',240,800),
(2,2,9,'2025-03-10','09:00:00',480,1000),
(3,3,3,'2025-04-05','10:00:00',600,300),
(4,4,7,'2025-05-12','09:30:00',480,600),
(5,5,3,'2025-02-16','19:00:00',120,300),
(6,6,1,'2025-02-16','21:00:00',120,400),
(7,7,18,'2025-04-06','10:00:00',1440,200),
(8,8,23,'2025-04-07','09:00:00',300,80),
(9,9,3,'2025-06-01','15:00:00',120,150),
(10,10,9,'2025-03-11','16:00:00',120,400);

CREATE TABLE registrations (
  reg_id INT AUTO_INCREMENT PRIMARY KEY,
  schedule_id INT,
  student_id VARCHAR(12),
  status ENUM('Registered','Cancelled') DEFAULT 'Registered',
  FOREIGN KEY (schedule_id) REFERENCES event_schedule(schedule_id),
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  UNIQUE KEY (schedule_id, student_id)
);

INSERT INTO registrations (schedule_id, student_id) VALUES
(1,'bt23cse101'),(1,'bt23cse102'),(1,'bt23csh103'),(1,'bt23csa104'),
(1,'bt23cse108'),(2,'bt23cse101'),(2,'bt23cse113'),(2,'bt23cse115'),
(3,'bt23cse101'),(3,'bt23csh103'),(3,'bt23csa111'),(3,'bt23cse113'),
(4,'bt23csh110'),(4,'bt23cse101'),(4,'bt23cse109'),(5,'bt23csh103'),
(5,'bt23cse113'),(6,'bt23cse102'),(6,'bt23cse101'),(7,'bt23cse101'),
(7,'bt23cse102'),(7,'bt23cse109'),(8,'bt23eci114'),(9,'bt23cse113'),
(10,'bt23cse108'),(10,'bt23cse115');

-- Trigger to update event attendance count on registration
DELIMITER $$
CREATE TRIGGER trg_after_registration_insert
AFTER INSERT ON registrations
FOR EACH ROW
BEGIN
  UPDATE events e
  JOIN event_schedule s ON e.event_id = s.event_id
  SET e.estimated_attendance = e.estimated_attendance + 1
  WHERE s.schedule_id = NEW.schedule_id;
END$$
DELIMITER ;

-- Trigger to adjust count if registration is cancelled or reactivated
DELIMITER $$
CREATE TRIGGER trg_after_registration_update
AFTER UPDATE ON registrations
FOR EACH ROW
BEGIN
  IF OLD.status <> NEW.status THEN
    IF NEW.status = 'Cancelled' THEN
      UPDATE events e
      JOIN event_schedule s ON e.event_id = s.event_id
      SET e.estimated_attendance = GREATEST(0, e.estimated_attendance - 1)
      WHERE s.schedule_id = NEW.schedule_id;
    ELSEIF OLD.status = 'Cancelled' AND NEW.status = 'Registered' THEN
      UPDATE events e
      JOIN event_schedule s ON e.event_id = s.event_id
      SET e.estimated_attendance = e.estimated_attendance + 1
      WHERE s.schedule_id = NEW.schedule_id;
    END IF;
  END IF;
END$$
DELIMITER ;

-- Stored procedure to register a student for an event schedule
DELIMITER $$
CREATE PROCEDURE sp_register_student(IN p_schedule_id INT, IN p_student_id VARCHAR(12), OUT p_status VARCHAR(50))
BEGIN
  DECLARE v_capacity INT DEFAULT 0;
  DECLARE v_count INT DEFAULT 0;
  DECLARE v_exists INT DEFAULT 0;

  SELECT capacity INTO v_capacity FROM event_schedule WHERE schedule_id = p_schedule_id;
  SELECT COUNT(*) INTO v_count FROM registrations WHERE schedule_id = p_schedule_id AND status='Registered';
  SELECT COUNT(*) INTO v_exists FROM registrations WHERE schedule_id = p_schedule_id AND student_id=p_student_id AND status='Registered';

  IF v_exists > 0 THEN
    SET p_status = 'ALREADY_REGISTERED';
  ELSEIF v_count >= v_capacity THEN
    SET p_status = 'FULL';
  ELSE
    INSERT INTO registrations (schedule_id, student_id) VALUES (p_schedule_id, p_student_id);
    SET p_status = 'REGISTERED';
  END IF;
END$$
DELIMITER ;

-- View: Top 5 most popular events
CREATE OR REPLACE VIEW vw_popular_events AS
SELECT e.event_id, e.title, COUNT(r.reg_id) AS registrations
FROM events e
LEFT JOIN event_schedule s ON e.event_id = s.event_id
LEFT JOIN registrations r ON s.schedule_id = r.schedule_id AND r.status='Registered'
GROUP BY e.event_id
ORDER BY registrations DESC;

-- Queries

-- 1. List all upcoming events with date and venue
SELECT e.title, s.event_date, v.name AS venue
FROM events e
JOIN event_schedule s ON e.event_id = s.event_id
JOIN venues v ON s.venue_id = v.venue_id
ORDER BY s.event_date;

-- 2. List students registered for Abhivyakti
SELECT st.student_id, st.first_name, st.last_name, e.title
FROM students st
JOIN registrations r ON st.student_id = r.student_id
JOIN event_schedule s ON r.schedule_id = s.schedule_id
JOIN events e ON s.event_id = e.event_id
WHERE e.title LIKE 'Abhivyakti%';

-- 3. Venues with highest number of events
SELECT v.name, COUNT(s.schedule_id) AS total_events
FROM venues v
LEFT JOIN event_schedule s ON v.venue_id = s.venue_id
GROUP BY v.venue_id
ORDER BY total_events DESC;

-- 4. Students who registered for more than 3 events
SELECT st.student_id, st.first_name, COUNT(r.reg_id) AS total
FROM students st
JOIN registrations r ON st.student_id = r.student_id
GROUP BY st.student_id
HAVING COUNT(r.reg_id) > 3;

-- 5. Clubs with most events organized
SELECT c.club_name, COUNT(eo.event_id) AS total
FROM clubs c
JOIN event_organizers eo ON c.club_id = eo.club_id
GROUP BY c.club_id
ORDER BY total DESC;

-- 6. Events scheduled at Stage Area or Fountain Area
SELECT e.title, s.event_date, v.name
FROM events e
JOIN event_schedule s ON e.event_id = s.event_id
JOIN venues v ON s.venue_id = v.venue_id
WHERE v.name IN ('Stage Area','Fountain Area');

-- 7. Show event capacity vs registrations
SELECT e.title, s.event_date, COUNT(r.reg_id) AS registrations, s.capacity
FROM event_schedule s
JOIN events e ON s.event_id = e.event_id
LEFT JOIN registrations r ON s.schedule_id = r.schedule_id
GROUP BY s.schedule_id;

-- 8. Students who registered for Elevate events
SELECT DISTINCT st.student_id, st.first_name
FROM students st
JOIN registrations r ON st.student_id = r.student_id
JOIN event_schedule s ON r.schedule_id = s.schedule_id
JOIN events e ON s.event_id = e.event_id
JOIN event_organizers eo ON e.event_id = eo.event_id
JOIN clubs c ON eo.club_id = c.club_id
WHERE c.club_name='Elevate';

-- 9. Events that are internal only
SELECT title, event_type FROM events WHERE open_for_all = FALSE;

-- 10. Top 5 most popular events
SELECT * FROM vw_popular_events LIMIT 5;

-- 11. Capacity utilization percentage for each schedule
SELECT e.title, s.event_date,
ROUND(100*COUNT(r.reg_id)/s.capacity,2) AS utilization
FROM event_schedule s
JOIN events e ON s.event_id = e.event_id
LEFT JOIN registrations r ON s.schedule_id = r.schedule_id
GROUP BY s.schedule_id
ORDER BY utilization DESC;

-- 12. Students not registered for any event
SELECT st.student_id, st.first_name, st.last_name
FROM students st
LEFT JOIN registrations r ON st.student_id = r.student_id
WHERE r.reg_id IS NULL;

-- 13. Events held between Feb-May 2025
SELECT e.title, v.name, s.event_date
FROM events e
JOIN event_schedule s ON e.event_id = s.event_id
JOIN venues v ON s.venue_id = v.venue_id
WHERE s.event_date BETWEEN '2025-02-01' AND '2025-05-30';

-- 14. Organizer contact list
SELECT eo.contact_person, eo.contact_email, e.title
FROM event_organizers eo
JOIN events e ON eo.event_id = e.event_id;

-- 15. Event count by type
SELECT event_type, COUNT(*) AS count FROM events GROUP BY event_type;
