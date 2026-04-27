CREATE DATABASE library;
USE library;

CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    birth_year INT,
    nationality VARCHAR(100)
);

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    author_id INT,
    price DECIMAL(15, 2) NOT NULL DEFAULT 0,
    publish_year INT,
    CONSTRAINT fk_book_author FOREIGN KEY (author_id) REFERENCES authors(id),
    CONSTRAINT chk_price CHECK (price >= 0)
);

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    registration_date DATE DEFAULT (CURRENT_DATE)
);

INSERT INTO authors (full_name, birth_year, nationality) VALUES 
('Conan Doyle', 1859, 'Anh'),
('Nguyễn Nhật Ánh', 1955, 'Việt Nam'),
('Dale Carnegie', 1888, 'Mỹ');

INSERT INTO books (book_name, category, author_id, price, publish_year) VALUES 
('Sherlock Holmes: Chiếc nhẫn tình cờ', 'Trinh thám', 1, 85000, 1887),
('Sherlock Holmes: Dấu bộ tứ', 'Trinh thám', 1, 120000, 1890),
('Mắt biếc', 'Văn học', 2, 95000, 1990),
('Cho tôi xin một vé đi tuổi thơ', 'Văn học', 2, 80000, 2008),
('Đắc Nhân Tâm', 'Kỹ năng', 3, 110000, 1936),
('Quẳng gánh lo đi và vui sống', 'Kỹ năng', 3, 90000, 1948),
('Ngôi trường mọi khi', 'Văn học', 2, 65000, 2019),
('Vụ án mạng trên tàu cao tốc', 'Trinh thám', 1, 150000, 2021);

INSERT INTO customers (full_name, email, phone) VALUES 
('Lê Đức Anh', 'ducanh@gmail.com', '0901234567'),
('Trần Văn A', 'vana@yahoo.com', '0907654321'),
('Nguyễn Thị B', 'thib@gmail.com', '0912333444'),
('Phạm Minh C', 'minhc@outlook.com', '0988777666'),
('Hoàng Lan', 'lanhoang@gmail.com', '0944555666');

SELECT * FROM books 
WHERE category = 'Trinh thám' AND price < 100000;

SELECT * FROM customers 
WHERE email LIKE '%@gmail.com';

SELECT * FROM books 
ORDER BY price DESC 
LIMIT 3;

UPDATE books 
SET price = price * 0.9 
WHERE publish_year < 2020;

SELECT * FROM books;