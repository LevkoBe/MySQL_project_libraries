-- Active: 1706006653571@@127.0.0.1@3306@first_db
CREATE TABLE publishers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  address VARCHAR(100),
  phone_number VARCHAR(15),
  website VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  publications_number INT DEFAULT 1
);

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(100),
    phone_number VARCHAR(15),
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth DATE,
    biography TEXT,
    nationality VARCHAR(100),
    awards VARCHAR(255),
    website VARCHAR(100),
    blog VARCHAR(100)
);

CREATE TABLE loans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    book_ids TEXT,
    loan_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    due_date DATETIME DEFAULT (NOW() + INTERVAL 1 MONTH),
    return_date DATETIME DEFAULT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE genres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255) NOT NULL
);

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    isbn CHAR(13),
    title VARCHAR(255) NOT NULL,
    edition TINYINT UNSIGNED DEFAULT 1,
    year_published YEAR,
    price DOUBLE(10, 2) NOT NULL,
    pages INT,
    genre_id INT,
    publisher_id INT,
    author_id INT,
    reviews INT,
    rating DOUBLE(3, 2),
    status ENUM('Sold', 'Available', 'Borrowed', 'Restocking') DEFAULT 'Available',
    FOREIGN KEY (genre_id) REFERENCES genres(id),
    FOREIGN KEY (publisher_id) REFERENCES publishers(id),
    FOREIGN KEY (author_id) REFERENCES authors(id)
);
