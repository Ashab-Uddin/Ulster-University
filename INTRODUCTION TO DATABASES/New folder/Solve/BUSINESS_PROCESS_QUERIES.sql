-- BUSINESS PROCESS QUERIES

-- -------------------------------------------------------
-- BP1: Add a new customer with lesson (no vehicle/instructor)
-- Example: New customer 'D18-999' booking a Standard lesson
-- -------------------------------------------------------
CALL AddNewCustomerWithLesson(
    'D18-999', 'Satirtha Dhar', '10 Silent Street', 'Belfast', 'BT1 1AA',
    'satirtha@test.com', '1990-04-16', '07700123456',
    'L21-999', '2021-04-01', 10, 'Home Address', 'Standard', 40.00
);

-- -------------------------------------------------------
-- BP2: Number of times each vehicle is used AND amount charged
--      for lessons booked between two given dates
-- -------------------------------------------------------
SELECT
    v.reg_number,
    CONCAT(v.make, ' ', v.model) AS vehicle,
    COUNT(l.lesson_id)           AS times_used,
    SUM(l.cost)                  AS total_charged
FROM Vehicle v
JOIN Lesson l ON v.reg_number = l.reg_number
WHERE l.lesson_date BETWEEN '2021-02-01' AND '2021-03-31'
GROUP BY v.reg_number, vehicle
ORDER BY times_used DESC;

-- -------------------------------------------------------
-- BP3: Customers who completed more than one lesson
--      with count and total cost of completed lessons
-- -------------------------------------------------------
SELECT
    c.cust_name,
    COUNT(l.lesson_id)  AS lessons_completed,
    SUM(l.cost)         AS total_cost
FROM Customer c
JOIN Lesson l ON c.customer_id = l.customer_id
WHERE l.completed = 1
GROUP BY c.customer_id, c.cust_name
HAVING COUNT(l.lesson_id) > 1
ORDER BY lessons_completed DESC;

-- -------------------------------------------------------
-- BP4: Instructors available at a given date and time,
--      with vehicle types they are qualified for.
--      Test: 11:00 on 1 April 2021
-- -------------------------------------------------------
SELECT
    i.instructor_id,
    i.instr_name,
    i.grade,
    vt.type_name        AS qualified_vehicle_type,
    vt.type_desc        AS vehicle_description
FROM Instructor i
JOIN InstructorQualification iq ON i.instructor_id = iq.instructor_id
JOIN VehicleType vt             ON iq.type_id       = vt.type_id
WHERE i.instructor_id NOT IN (
    SELECT instructor_id
    FROM Lesson
    WHERE lesson_date = '2021-04-01'
      AND start_time  = 11
      AND instructor_id IS NOT NULL
)
ORDER BY i.instr_name, vt.type_name;

-- -------------------------------------------------------
-- BP5a: Remove a vehicle temporarily (mark unavailable)
--       Example: remove 'AF56 WWJ' for servicing
-- -------------------------------------------------------
UPDATE Vehicle
SET is_available = 0
WHERE reg_number = 'AF56 WWJ';

-- BP5b: List all vehicles currently unavailable
SELECT
    v.reg_number,
    CONCAT(v.make, ' ', v.model) AS vehicle,
    vt.type_name                 AS vehicle_type,
    v.last_service
FROM Vehicle v
JOIN VehicleType vt ON v.type_id = vt.type_id
WHERE v.is_available = 0
ORDER BY v.reg_number;

-- Restore vehicle (bring back online after servicing)
UPDATE Vehicle SET is_available = 1 WHERE reg_number = 'AF56 WWJ';