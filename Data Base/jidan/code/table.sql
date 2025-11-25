DROP DATABASE IF EXISTS LibraryMS; 
CREATE DATABASE LibraryMS; 
USE LibraryMS; 
CREATE TABLE Members ( 
member_id INT PRIMARY KEY, 
name VARCHAR(100) NOT NULL, 
email VARCHAR(150) NOT NULL UNIQUE, 
phone VARCHAR(30), 
address VARCHAR(255) 
); 
CREATE TABLE Books ( 
isbn VARCHAR(20) PRIMARY KEY, 
title VARCHAR(200) NOT NULL, 
publication_year YEAR NOT NULL, 
copies_available INT NOT NULL DEFAULT 0, 
status ENUM('Available','Repair','Lost') NOT NULL DEFAULT 'Available', 
CONSTRAINT chk_copies_nonneg CHECK (copies_available >= 0) 
); 
CREATE TABLE Genres ( 
genre_id INT PRIMARY KEY, 
genre_name VARCHAR(60) NOT NULL UNIQUE 
); 
CREATE TABLE Authors ( 
author_id INT PRIMARY KEY, 
name VARCHAR(120) NOT NULL, 
nationality VARCHAR(80), 
biography TEXT 
); 
CREATE TABLE BookGenres ( 
isbn VARCHAR(20) NOT NULL, 
genre_id INT NOT NULL, 
PRIMARY KEY (isbn, genre_id), 
FOREIGN KEY (isbn) REFERENCES Books(isbn) 
ON DELETE CASCADE ON UPDATE CASCADE, 
FOREIGN KEY (genre_id) REFERENCES Genres(genre_id) 
ON DELETE RESTRICT ON UPDATE CASCADE 
); 
CREATE TABLE BookAuthors ( 
isbn VARCHAR(20) NOT NULL, 
author_id INT NOT NULL, 
PRIMARY KEY (isbn, author_id), 
FOREIGN KEY (isbn) REFERENCES Books(isbn) 
ON DELETE CASCADE ON UPDATE CASCADE, 
FOREIGN KEY (author_id) REFERENCES Authors(author_id) 
ON DELETE RESTRICT ON UPDATE CASCADE 
); 
CREATE TABLE Borrowings ( 
borrow_id INT PRIMARY KEY, 
member_id INT NOT NULL, 
isbn VARCHAR(20) NULL, 
borrow_date DATE NOT NULL, 
due_date DATE NOT NULL, 
return_date DATE NULL, 
CONSTRAINT chk_due_after_borrow CHECK (due_date >= borrow_date), 
CONSTRAINT chk_return_after_borrow 
CHECK (return_date IS NULL OR return_date >= borrow_date), 
FOREIGN KEY (member_id) REFERENCES Members(member_id) 
ON DELETE RESTRICT ON UPDATE CASCADE, 
FOREIGN KEY (isbn) REFERENCES Books(isbn) 
ON DELETE SET NULL ON UPDATE CASCADE 
); 