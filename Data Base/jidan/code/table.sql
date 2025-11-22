-- Use or create database
CREATE DATABASE IF NOT EXISTS library_mgmt;
USE library_mgmt;

-- Members
CREATE TABLE Member (
  member_id INT AUTO_INCREMENT PRIMARY KEY,
  membership_id VARCHAR(20) NOT NULL UNIQUE,
  name VARCHAR(150) NOT NULL,
  address TEXT,
  email VARCHAR(255) UNIQUE,
  phone VARCHAR(30),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Authors
CREATE TABLE Author (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  nationality VARCHAR(100),
  biography TEXT
) ENGINE=InnoDB;

-- Genres
CREATE TABLE Genre (
  genre_id INT AUTO_INCREMENT PRIMARY KEY,
  genre_name VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- Books
CREATE TABLE Book (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  isbn VARCHAR(20) UNIQUE,
  publication_year YEAR,
  total_copies INT NOT NULL DEFAULT 1,
  available_copies INT NOT NULL DEFAULT 1,
  status ENUM('in_circulation','unavailable') NOT NULL DEFAULT 'in_circulation',
  notes TEXT
) ENGINE=InnoDB;

-- Junction BookAuthor
CREATE TABLE BookAuthor (
  book_id INT NOT NULL,
  author_id INT NOT NULL,
  PRIMARY KEY (book_id, author_id),
  CONSTRAINT fk_ba_book FOREIGN KEY (book_id) REFERENCES Book(book_id) ON DELETE CASCADE,
  CONSTRAINT fk_ba_author FOREIGN KEY (author_id) REFERENCES Author(author_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Junction BookGenre
CREATE TABLE BookGenre (
  book_id INT NOT NULL,
  genre_id INT NOT NULL,
  PRIMARY KEY (book_id, genre_id),
  CONSTRAINT fk_bg_book FOREIGN KEY (book_id) REFERENCES Book(book_id) ON DELETE CASCADE,
  CONSTRAINT fk_bg_genre FOREIGN KEY (genre_id) REFERENCES Genre(genre_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Borrowing
CREATE TABLE Borrowing (
  borrowing_id INT AUTO_INCREMENT PRIMARY KEY,
  member_id INT NOT NULL,
  book_id INT NOT NULL,
  borrow_date DATE NOT NULL,
  due_date DATE NOT NULL,
  return_date DATE DEFAULT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_b_member FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE RESTRICT,
  CONSTRAINT fk_b_book FOREIGN KEY (book_id) REFERENCES Book(book_id) ON DELETE RESTRICT
) ENGINE=InnoDB;

-- Indexes to speed queries
CREATE INDEX idx_borrow_member_date ON Borrowing(member_id, borrow_date);
CREATE INDEX idx_book_status ON Book(status);
