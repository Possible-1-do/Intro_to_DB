-- Create the database
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Use the newly created database
USE alx_book_store;


CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);


CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);


CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE,
    address TEXT
);


CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


CREATE TABLE Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);



-- Insert Authors
INSERT INTO Authors (author_name) VALUES
('Chinua Achebe'),
('J.K. Rowling'),
('George Orwell');

-- Insert Books
INSERT INTO Books (title, author_id, price, publication_date) VALUES
('Things Fall Apart', 1, 19.99, '1958-06-17'),
('Harry Potter and the Philosopher\'s Stone', 2, 25.50, '1997-06-26'),
('1984', 3, 18.75, '1949-06-08');

-- Insert Customers
INSERT INTO Customers (customer_name, email, address) VALUES
('John Doe', 'john@example.com', '123 Elm Street'),
('Mary Smith', 'mary@example.com', '45 Oak Avenue');

-- Insert Orders
INSERT INTO Orders (customer_id, order_date) VALUES
(1, '2025-10-12'),
(2, '2025-10-13');

-- Insert Order Details
INSERT INTO Order_Details (order_id, book_id, quantity) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 3);

-- =========================================
-- END OF SCRIPT
-- =========================================
