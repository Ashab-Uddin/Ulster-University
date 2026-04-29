-- Drop and recreate the database
DROP DATABASE IF EXISTS DrivingSchool;
CREATE DATABASE DrivingSchool;
USE DrivingSchool;

-- TABLE: VehicleType
-- Stores vehicle type categories (Car-manual, HGV, etc.)

CREATE TABLE VehicleType (
    type_id       VARCHAR(10)   NOT NULL,
    type_name     VARCHAR(50)   NOT NULL,
    type_desc     VARCHAR(200)  NOT NULL,
    CONSTRAINT pk_VehicleType PRIMARY KEY (type_id)
);

-- TABLE: Vehicle
-- Each vehicle has one vehicle type (FK → VehicleType)
CREATE TABLE Vehicle (
    reg_number    VARCHAR(15)   NOT NULL,
    make          VARCHAR(50)   NOT NULL,
    model         VARCHAR(50)   NOT NULL,
    year_of_manuf INT           NOT NULL,
    last_service  DATE          DEFAULT NULL,
    type_id       VARCHAR(10)   NOT NULL,
    is_available  TINYINT(1)    NOT NULL DEFAULT 1,  -- 1=available, 0=temporarily removed
    CONSTRAINT pk_Vehicle PRIMARY KEY (reg_number),
    CONSTRAINT fk_Vehicle_Type FOREIGN KEY (type_id)
        REFERENCES VehicleType(type_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- TABLE: Instructor
-- Each instructor has an id, name, grade, email, phone
CREATE TABLE Instructor (
    instructor_id VARCHAR(10)   NOT NULL,
    instr_name    VARCHAR(100)  NOT NULL,
    grade         VARCHAR(20)   NOT NULL,
    email         VARCHAR(100)  NOT NULL,
    phone         VARCHAR(30)   NOT NULL,
    CONSTRAINT pk_Instructor PRIMARY KEY (instructor_id)
);

-- TABLE: InstructorQualification
-- Junction table: an instructor can be qualified for many vehicle types
CREATE TABLE InstructorQualification (
    instructor_id VARCHAR(10)   NOT NULL,
    type_id       VARCHAR(10)   NOT NULL,
    CONSTRAINT pk_InstrQual PRIMARY KEY (instructor_id, type_id),
    CONSTRAINT fk_IQ_Instructor FOREIGN KEY (instructor_id)
        REFERENCES Instructor(instructor_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_IQ_VehicleType FOREIGN KEY (type_id)
        REFERENCES VehicleType(type_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- TABLE: Customer
-- Stores customer personal details
CREATE TABLE Customer (
    customer_id   VARCHAR(10)   NOT NULL,
    cust_name     VARCHAR(100)  NOT NULL,
    address1      VARCHAR(100)  NOT NULL,
    town          VARCHAR(50)   NOT NULL,
    postcode      VARCHAR(10)   NOT NULL,
    email         VARCHAR(100)  NOT NULL,
    dob           DATE          NOT NULL,
    phone         VARCHAR(30)   NOT NULL,
    CONSTRAINT pk_Customer PRIMARY KEY (customer_id)
);

-- TABLE: LessonType
-- Four lesson types: Standard, Advanced, Refresher, Specialised
CREATE TABLE LessonType (
    lesson_type_name VARCHAR(20) NOT NULL,
    CONSTRAINT pk_LessonType PRIMARY KEY (lesson_type_name)
);

-- TABLE: Lesson
-- Each lesson booked by one customer, taken by one instructor,
-- using one vehicle; lesson type and vehicle type recorded.
-- Duration fixed at 2 hours.
CREATE TABLE Lesson (
    lesson_id       VARCHAR(15)   NOT NULL,
    lesson_date     DATE          NOT NULL,
    start_time      INT           NOT NULL,   -- hour of day (e.g. 9, 11, 14)
    pickup_point    VARCHAR(150)  NOT NULL,
    lesson_type     VARCHAR(20)   NOT NULL    DEFAULT 'Standard',
    completed       TINYINT(1)    NOT NULL    DEFAULT 0,  -- 0=No, 1=Yes
    cost            DECIMAL(8,2)  NOT NULL,
    customer_id     VARCHAR(10)   NOT NULL,
    instructor_id   VARCHAR(10)   DEFAULT NULL,
    reg_number      VARCHAR(15)   DEFAULT NULL,
    CONSTRAINT pk_Lesson PRIMARY KEY (lesson_id),
    CONSTRAINT fk_Lesson_Customer FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_Lesson_Instructor FOREIGN KEY (instructor_id)
        REFERENCES Instructor(instructor_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    CONSTRAINT fk_Lesson_Vehicle FOREIGN KEY (reg_number)
        REFERENCES Vehicle(reg_number)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    CONSTRAINT fk_Lesson_Type FOREIGN KEY (lesson_type)
        REFERENCES LessonType(lesson_type_name)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- POPULATE: VehicleType
INSERT INTO VehicleType VALUES
    ('C001', 'Car - manual',     'Small car, 2 litres or less. Manual transmission. Petrol or diesel.'),
    ('C002', 'Car - automatic',  'Small car, 2 litres or less. Automatic transmission. Petrol or diesel.'),
    ('M001', 'Motorbike - 125plus', 'Motorbike, over 125 cc, no more than 600 cc. All protective gear supplied'),
    ('M002', 'Motorbike - 125',  'Motorbike, 125 cc. All protective gear supplied'),
    ('L001', 'HGV',              'Heavy good vehicle, with 40 foot articulated trailer.'),
    ('L002', 'Small Lorry',      'Box Body Rigid Truck. Manual Transmission. Diesel.'),
    ('V001', 'Van',              'Transit Van - Luton body. 2 litre. Manual transmission. Diesel');

-- POPULATE: Vehicle
INSERT INTO Vehicle VALUES
    ('AF56 WWJ', 'Volkswagen',    'Golf',        2019, '2021-03-05', 'C001', 1),
    ('LV59 OTP', 'Volkswagen',    'Polo',        2017, '2021-03-17', 'C002', 1),
    ('BJI 111',  'Vauxhall',      'Astra',       2020, NULL,         'C002', 1),
    ('CJ16 WED', 'Aprilia',       'RS4',         2019, '2020-10-19', 'M001', 1),
    ('D268 YCF', 'Suzuki',        'V-STROM 250', 2018, '2020-12-24', 'M002', 1),
    ('SEZ 5629', 'Kawasaki',      'Ninja',       2018, '2020-08-26', 'M002', 1),
    ('MEZ 8086', 'Subaru',        'Impreza',     2017, '2020-01-28', 'C001', 1),
    ('LLZ 9362', 'Volkswagen',    'Golf',        2019, '2020-05-09', 'C001', 1),
    ('OEZ 1872', 'Alfa Romeo',    'Alfasud',     2021, NULL,         'C001', 1),
    ('DCZ 1844', 'MAN',           'TGX',         2017, '2020-06-01', 'L001', 1),
    ('GRZ 6511', 'Mercedes-Benz', 'Actros',      2021, NULL,         'L002', 1),
    ('W85 TTF',  'Mercedes-Benz', 'Actros',      2017, '2021-01-20', 'L002', 1),
    ('BL67 YPE', 'Ford',          'Transit',     2017, '2020-10-03', 'V001', 1);

-- POPULATE: Instructor
INSERT INTO Instructor VALUES
    ('E0392', 'Edsger Dijkstra',  'Senior',    'edijetra@hotmail.co.uk',    '00442890365869'),
    ('E4470', 'Ada Lovelace',     'Chief',     'adal@gmail.com',            '07881583361'),
    ('E2443', 'Donald Knuth',     'Junior',    'donknuth67@hotmail.com',    '+44771895322'),
    ('E2045', 'Grace Hopper',     'Junior',    'grace45@gmail.com',         '07890411843'),
    ('E9274', 'Tim Berners-Lee',  'Probation', 'tblee@outlook.com',         '02891895426');

-- POPULATE: InstructorQualification
-- (Derived from which vehicle types each instructor used in data)
INSERT INTO InstructorQualification VALUES
    ('E0392', 'C001'), ('E0392', 'C002'), ('E0392', 'L001'),  -- Dijkstra: car manual, car auto, HGV
    ('E4470', 'C002'), ('E4470', 'L001'), ('E4470', 'L002'), ('E4470', 'V001'),  -- Lovelace
    ('E2443', 'M001'), ('E2443', 'M002'), ('E2443', 'C001'), ('E2443', 'C002'),  -- Knuth
    ('E2045', 'C001'), ('E2045', 'C002'), ('E2045', 'L002'),  -- Hopper
    ('E9274', 'C001'), ('E9274', 'C002');                      -- Berners-Lee

-- POPULATE: Customer
-- Excel serial date: day count from 1899-12-30
INSERT INTO Customer VALUES
    ('D13-101', 'Bette Davis',      '23 Carwood Avenue',       'Belfast',      'BT7 1CD',  'bette.davis@ulster.ac.uk', '2000-09-01', '41728003'),
    ('D13-203', 'Cary Grant',       '193a Glencroft Rd',       'Carryduff',    'BT8 5BG',  'bigcary@yahoo.com',        '2002-10-28', '+44417654321'),
    ('D13-51',  'Ingrid Bergman',   '87 Wynnland Park',        'Belfast',      'BT13 2FC', 'IngridB@hotmail.com',      '2000-01-12', '02890123456'),
    ('D13-306', 'William Holden',   '12 Ferndale Drive',       'Jordanstown',  'BT36 1FF', 'billyho66@yahoo.com',      '1993-10-31', '+38198322843'),
    ('D13-42',  'Humphrey Bogart',  '18b Glebe Road',          'Glengormley',  'BT36 6ED', 'bogieh@gmail.com',         '1962-11-18', '07782751839'),
    ('D17-022', 'Marilyn Monroe',   '138 Rathmore Drive',      'Glengormley',  'BT36 5RT', 'marilyn@hotmail.com',      '1972-11-02', '+4487618356732'),
    ('D14-38',  'Katharine Hepburn','38 Hightown Road',        'Belfast',      'BT11 7ER', 'kath_hep29@hotmail.com',   '1999-09-12', '+447880708090'),
    ('D13-R45', 'James Stewart',    '197c Dorchester Street',  'Carryduff',    'BT8 7RE',  'jimmy_stew@qub.ac.uk',     '2002-05-15', '08770987654'),
    ('D13-R93', 'John Wayne',       '92 Coole Park',           'Jordanstown',  'BT36 4WR', 'john.wayne@ulster.ac.uk',  '2003-10-10', '02890112233'),
    ('D17-080', 'Orson Welles',     '193a Glencroft Rd',       'Carryduff',    'BT8 5BG',  'welles.orson@ulster.ac.uk','2001-06-06', '08998736126'),
    ('D13-153', 'Henry Fonda',      '18 Beechill Park',        'Belfast',      'BT9 8RE',  'henryfo@outlook.com',      '2001-07-18', '07881783832'),
    ('D13-54',  'Audrey Hepburn',   '38 Hightown Road',        'Belfast',      'BT11 7ER', 'audhep78@yahoo.com',       '1978-03-18', '02890563922'),
    ('D13-551', 'Jack Lemon',       '132 Burnside Av',         'Glengormley',  'BT36 6YR', 'lemonlad44@gmail.com',     '1994-02-02', '+442891877622'),
    ('D14-53',  'Elizabeth Taylor', '153 Coolpark Av',         'Belfast',      'BT13 2RD', 'lizziet@hotmail.co.uk',    '1998-12-24', '07991556633'),
    ('D13-R41', 'Doris Day',        '18 Orchard Rise',         'Carryduff',    'BT8 9UU',  'dday99@gmail.com',         '1999-11-25', '+447991446819'),
    ('D13-245', 'Deborah Kerr',     '36b Finsbury Cres',       'Jordanstown',  'BT36 1SU', 'debbiek88@hotmail.com',    '1988-09-08', '00442890778233'),
    ('D13-R20', 'Jean Harlow',      '101 Ballyhenry Av',       'Belfast',      'BT11 8HG', 'jeanh99@gmail.com',        '2003-04-10', '+5866419887654'),
    ('D13-19',  'Tony Curtis',      '121b Baker Street',       'Carryduff',    'BT8 5TE',  't.curtis@aib.co.uk',       '2000-04-24', '08990554662');

-- POPULATE: LessonType
INSERT INTO LessonType VALUES ('Standard'), ('Advanced'), ('Refresher'), ('Specialised');

-- POPULATE: Lesson
-- Excel serial dates converted: base is 1899-12-30
-- 44292 = 2021-03-04, 44288 = 2021-02-28, 44287 = 2021-02-27 ...
INSERT INTO Lesson VALUES
    ('L21-052', '2021-03-04', 11, 'Ulster University, Jordanstown Campus, Shore Road Entrance', 'Standard',    0, 40.00,  'D13-101', 'E0392', 'AF56 WWJ'),
    ('L21-053', '2021-02-28', 9,  'Home Address',                                               'Standard',    0, 40.00,  'D13-203', 'E0392', 'LV59 OTP'),
    ('L21-121', '2021-02-27', 9,  'Home Address',                                               'Standard',    0, 40.00,  'D13-51',  'E4470', 'BJI 111'),
    ('L21-336', '2021-02-20', 16, 'Depot',                                                      'Advanced',    1, 50.00,  'D13-306', 'E2443', 'CJ16 WED'),
    ('L21-340', '2021-02-27', 9,  'Depot',                                                      'Advanced',    0, 60.00,  'D13-306', 'E2443', 'CJ16 WED'),
    ('L21-357', '2021-02-25', 12, 'Depot',                                                      'Refresher',   0, 75.50,  'D13-42',  'E4470', 'DCZ 1844'),
    ('L21-360', '2021-02-18', 15, 'Ulster University, Jordanstown Campus, Shore Road Entrance', 'Standard',    1, 50.00,  'D13-101', 'E0392', 'AF56 WWJ'),
    ('L21-362', '2021-03-02', 9,  'Home Address',                                               'Standard',    0, 40.00,  'D13-203', 'E0392', 'LV59 OTP'),
    ('L21-426', '2021-03-05', 16, 'Depot',                                                      'Advanced',    0, 50.00,  'D13-306', 'E2443', 'CJ16 WED'),
    ('L21-446', '2021-02-27', 11, 'Depot',                                                      'Specialised', 0, 75.50,  'D17-022', 'E0392', 'DCZ 1844'),
    ('L21-458', '2021-02-11', 10, 'Depot',                                                      'Refresher',   1, 75.50,  'D13-42',  'E4470', 'DCZ 1844'),
    ('L21-508', '2021-02-27', 15, 'Home Address',                                               'Standard',    0, 40.00,  'D14-38',  'E9274', 'BJI 111'),
    ('L21-559', '2021-02-27', 10, 'Home Address',                                               'Standard',    0, 40.00,  'D13-R45', 'E2045', 'OEZ 1872'),
    ('L21-563', '2021-03-01', 9,  'Home Address',                                               'Standard',    0, 40.00,  'D13-203', 'E0392', 'LV59 OTP'),
    ('L21-582', '2021-02-27', 14, 'Depot',                                                      'Specialised', 0, 60.00,  'D13-R93', 'E4470', 'BL67 YPE'),
    ('L21-610', '2021-02-27', 11, 'Depot',                                                      'Standard',    0, 50.00,  'D17-080', 'E2443', 'D268 YCF'),
    ('L21-651', '2021-02-27', 9,  'Home Address',                                               'Standard',    0, 40.00,  'D13-203', 'E0392', 'LV59 OTP'),
    ('L21-657', '2021-02-27', 14, 'Outside Ulster Bank, 89 University Rd, Belfast',             'Advanced',    0, 55.50,  'D13-54',  'E2443', 'MEZ 8086'),
    ('L21-664', '2021-02-27', 16, 'Depot',                                                      'Refresher',   0, 60.00,  'D13-551', 'E2443', 'SEZ 5629'),
    ('L21-683', '2021-02-15', 10, 'Depot',                                                      'Advanced',    1, 70.75,  'D13-306', 'E2443', 'CJ16 WED'),
    ('L21-689', '2021-02-27', 16, 'Depot',                                                      'Standard',    0, 60.00,  'D13-153', 'E4470', 'GRZ 6511'),
    ('L21-701', '2021-03-08', 10, 'Depot',                                                      'Advanced',    0, 70.50,  'D13-306', 'E2443', 'CJ16 WED'),
    ('L21-715', '2021-02-27', 15, 'Depot',                                                      'Specialised', 0, 85.50,  'D13-19',  'E2045', 'W85 TTF'),
    ('L21-724', '2021-02-27', 17, 'Tesco Extra, Saintfield Rd, Belfast',                        'Standard',    0, 40.00,  'D14-53',  'E2045', 'BJI 111'),
    ('L21-743', '2021-02-25', 17, 'Ulster University, Jordanstown Campus, Shore Road Entrance', 'Standard',    1, 50.00,  'D13-101', 'E0392', 'AF56 WWJ'),
    ('L21-801', '2021-02-26', 9,  'Home Address',                                               'Standard',    1, 40.00,  'D13-203', 'E0392', 'LV59 OTP'),
    ('L21-820', '2021-02-11', 15, 'Ulster University, Jordanstown Campus, Shore Road Entrance', 'Standard',    1, 50.00,  'D13-101', 'E0392', 'AF56 WWJ'),
    ('L21-835', '2021-02-27', 18, 'Home Address',                                               'Standard',    0, 40.00,  'D13-R41', 'E2443', 'LV59 OTP'),
    ('L21-930', '2021-03-11', 11, 'Ulster University, Jordanstown Campus, Shore Road Entrance', 'Standard',    0, 40.00,  'D13-101', 'E0392', 'AF56 WWJ'),
    ('L21-961', '2021-02-27', 12, 'Depot',                                                      'Standard',    0, 50.00,  'D13-245', 'E2045', 'BL67 YPE'),
    ('L21-977', '2021-02-27', 11, 'Home Address',                                               'Standard',    0, 40.00,  'D13-R20', 'E9274', 'LLZ 9362');

-- STORED PROCEDURE: AddNewCustomerWithLesson
-- Business Process 1: Add a new customer with lesson details
-- (vehicle and instructor can be NULL at booking time)
DELIMITER $$

CREATE PROCEDURE AddNewCustomerWithLesson(
    IN p_cust_id     VARCHAR(10),
    IN p_name        VARCHAR(100),
    IN p_address1    VARCHAR(100),
    IN p_town        VARCHAR(50),
    IN p_postcode    VARCHAR(10),
    IN p_email       VARCHAR(100),
    IN p_dob         DATE,
    IN p_phone       VARCHAR(30),
    IN p_lesson_id   VARCHAR(15),
    IN p_date        DATE,
    IN p_time        INT,
    IN p_pickup      VARCHAR(150),
    IN p_type        VARCHAR(20),
    IN p_cost        DECIMAL(8,2)
)
BEGIN
    -- Insert the customer
    INSERT INTO Customer (customer_id, cust_name, address1, town, postcode, email, dob, phone)
    VALUES (p_cust_id, p_name, p_address1, p_town, p_postcode, p_email, p_dob, p_phone);

    -- Insert the lesson without vehicle or instructor (NULL allowed by design)
    INSERT INTO Lesson (lesson_id, lesson_date, start_time, pickup_point, lesson_type, completed, cost, customer_id, instructor_id, reg_number)
    VALUES (p_lesson_id, p_date, p_time, p_pickup, p_type, 0, p_cost, p_cust_id, NULL, NULL);

    SELECT CONCAT('Customer ', p_name, ' and lesson ', p_lesson_id, ' added successfully.') AS result;
END$$

-- TRIGGER: trg_PreventDoubleBooking
-- Prevents booking an instructor who is already booked at the
-- same date and start time (data integrity guard).
CREATE TRIGGER trg_PreventDoubleBooking
BEFORE INSERT ON Lesson
FOR EACH ROW
BEGIN
    DECLARE conflict_count INT;

    IF NEW.instructor_id IS NOT NULL THEN
        SELECT COUNT(*) INTO conflict_count
        FROM Lesson
        WHERE instructor_id = NEW.instructor_id
          AND lesson_date   = NEW.lesson_date
          AND start_time    = NEW.start_time;

        IF conflict_count > 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Instructor already booked at this date and time.';
        END IF;
    END IF;
END$$

DELIMITER ;



-- SHOW TABLE CONTENTS 
SELECT * FROM VehicleType;
SELECT * FROM Vehicle;
SELECT * FROM Instructor;
SELECT * FROM InstructorQualification;
SELECT * FROM Customer;
SELECT * FROM LessonType;
SELECT * FROM Lesson;
