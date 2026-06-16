CREATE DATABASE BookStoreManagementSystem;
USE BookStoreManagementSystem;

CREATE TABLE Genre (
    genre_id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT
);

CREATE TABLE Author (
    author_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    date_of_birth DATE
);

CREATE TABLE Publisher (
    publisher_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    contact_number VARCHAR(50),
    house_no VARCHAR(50),
    street_no VARCHAR(50),
    city VARCHAR(100)
);

CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    name VARCHAR(200),
    price DECIMAL(10, 2),
    genre_id INT,
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
);

CREATE TABLE AuthorBook (
    author_id INT,
    book_id INT,
    PRIMARY KEY (author_id, book_id),
    FOREIGN KEY (author_id) REFERENCES Author(author_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

CREATE TABLE PublisherBook (
    publisher_id INT,
    book_id INT,
    PRIMARY KEY (publisher_id, book_id),
    FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

CREATE TABLE Supplier (
    supplier_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    contact_no VARCHAR(50),
    house_no VARCHAR(50),
    street_no VARCHAR(50),
    city VARCHAR(100)
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    contact_no VARCHAR(50),
    email VARCHAR(100),
    house_no VARCHAR(50),
    street_no VARCHAR(50),
    city VARCHAR(100)
);

CREATE TABLE Admin (
    admin_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    contact_no VARCHAR(50),
    house_no VARCHAR(50),
    street_no VARCHAR(50),
    city VARCHAR(100)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    quantity INT,
    amount DECIMAL(10, 2),
    order_date DATE,
    admin_id INT,
    FOREIGN KEY (admin_id) REFERENCES Admin(admin_id)
);

CREATE TABLE OrderBookSupplier (
    order_id INT,
    book_id INT,
    supplier_id INT,
    quantity_ordered INT,
    price_at_order_time DECIMAL(10, 2),
    PRIMARY KEY (order_id, book_id, supplier_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

CREATE TABLE Stock (
    stock_id INT PRIMARY KEY,
    stock_quantity INT
);

CREATE TABLE BookStock (
    book_id INT,
    stock_id INT,
    quantity INT,
    PRIMARY KEY (book_id, stock_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (stock_id) REFERENCES Stock(stock_id)
);

CREATE TABLE Salesman (
    salesman_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    role VARCHAR(50),
    salary DECIMAL(10, 2),
    contact_no VARCHAR(50),
    supervisor_id INT,
    admin_id INT,
    house_no VARCHAR(50),
    street_no VARCHAR(50),
    city VARCHAR(100),
    FOREIGN KEY (Supervisor_id) REFERENCES Salesman(Salesman_id),
    FOREIGN KEY (admin_id) REFERENCES Admin(admin_id)
);

CREATE TABLE CheckStock (
    stock_id INT,
    salesman_id INT,
    stock_quantity INT,
    PRIMARY KEY (stock_id, salesman_id),
    FOREIGN KEY (stock_id) REFERENCES Stock(stock_id),
    FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id)
);

CREATE TABLE Sale (
    sales_id INT PRIMARY KEY,
    customer_id INT,
    salesman_id INT,
    sale_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id)
);

CREATE TABLE BookSale (
    book_id INT,
    sales_id INT,
    PRIMARY KEY (book_id, sales_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (sales_id) REFERENCES Sale(sales_id)
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    sales_id INT,
    amount_paid DECIMAL(10, 2),
    status VARCHAR(50),
    payment_date DATE,
    FOREIGN KEY (sales_id) REFERENCES Sale(sales_id)
);

CREATE TABLE JobHistory (
    job_history_id INT PRIMARY KEY,
    salesman_id INT,
    stock_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id),
    FOREIGN KEY (stock_id) REFERENCES Stock(stock_id)
);



INSERT INTO Genre VALUES
(1, 'Fiction', 'Narrative literature created from imagination'),
(2, 'Non-Fiction', 'Informative and factual books'),
(3, 'Science', 'Books based on scientific concepts'),
(4, 'History', 'Books discussing historical events'),
(5, 'Biography', 'Books about a person’s life'),
(6, 'Religion', 'Books on religious topics'),
(7, 'Children', 'Books for kids'),
(8, 'Mystery', 'Suspense and crime novels'),
(9, 'Self-help', 'Motivational and development books'),
(10, 'Fantasy', 'Magical and mythical stories');

INSERT INTO Author VALUES
(1, 'Mohsin', 'Hamid', '1971-07-23'),
(2, 'Bano', 'Qudsia', '1928-11-28'),
(3, 'Ashfaq', 'Ahmed', '1925-08-22'),
(4, 'Umera', 'Ahmed', '1976-12-10'),
(5, 'Elif', 'Shafak', '1971-10-25'),
(6, 'Khaled', 'Hosseini', '1965-03-04'),
(7, 'Malala', 'Yousafzai', '1997-07-12'),
(8, 'William', 'Dalrymple', '1965-03-20'),
(9, 'J.K.', 'Rowling', '1965-07-31'),
(10, 'Paulo', 'Coelho', '1947-08-24'),
(11, 'Stephen', 'Hawking', '1942-01-08'),
(12, 'Ishtiaq', 'Ahmed', '1944-11-15'),
(13, 'Nadeem', 'Aslam', '1966-05-11'),
(14, 'Mohammad', 'Hanif', '1964-11-22'),
(15, 'Tariq', 'Rahman', '1949-01-04');


INSERT INTO Publisher VALUES
(1, 'Ali', 'Raza', '03001234567', '12', '5', 'Lahore'),
(2, 'Sara', 'Khan', '03331234567', '45', '2', 'Karachi'),
(3, 'Imran', 'Siddiqui', '03451234567', '88', '9', 'Islamabad'),
(4, 'Nasir', 'Malik', '03031234567', '20', '4', 'Multan'),
(5, 'Zara', 'Hussain', '03111234567', '77', '1', 'Faisalabad');


INSERT INTO Book VALUES
(1, 'The Reluctant Fundamentalist', 950.00, 1),
(2, 'Pir-e-Kamil', 700.00, 1),
(3, 'A Brief History of Time', 1200.00, 3),
(4, 'I Am Malala', 850.00, 5),
(5, 'Forty Rules of Love', 999.00, 10),
(6, 'Harry Potter and the Sorcerer''s Stone', 1500.00, 10),
(7, 'Zavia', 600.00, 2),
(8, 'In Other Rooms, Other Wonders', 899.00, 1),
(9, 'Moth Smoke', 780.00, 1),
(10, 'The Wandering Falcon', 850.00, 1),
(11, 'The Alchemist', 950.00, 9),
(12, 'Harry Potter and the Prisoner of Azkaban', 1600.00, 10),
(13, 'Pakistan: A Hard Country', 1150.00, 4),
(14, 'The Case of Exploding Mangoes', 1050.00, 1),
(15, 'Culture and Identity', 900.00, 2);

INSERT INTO Supplier VALUES
(1, 'Ali', 'Khan', '03001234567', 'H1', 'S1', 'Lahore'),
(2, 'Sara', 'Malik', '03211234567', 'H2', 'S2', 'Islamabad'),
(3, 'Zain', 'Ahmed', '03111234567', 'H3', 'S3', 'Karachi'),
(4, 'Nida', 'Qureshi', '03011234567', 'H4', 'S4', 'Faisalabad'),
(5, 'Umer', 'Farooq', '03331234567', 'H5', 'S5', 'Multan'),
(6, 'Ayesha', 'Iqbal', '03451234567', 'H6', 'S6', 'Peshawar'),
(7, 'Bilal', 'Hussain', '03021234567', 'H7', 'S7', 'Rawalpindi'),
(8, 'Tariq', 'Jameel', '03561234567', 'H8', 'S8', 'Quetta'),
(9, 'Faiza', 'Younis', '03151234567', 'H9', 'S9', 'Hyderabad'),
(10, 'Rehan', 'Shahid', '03081234567', 'H10', 'S10', 'Sialkot'),
(11, 'Hina', 'Rashid', '03091234567', 'H11', 'S11', 'Bahawalpur'),
(12, 'Kashif', 'Ali', '03121234567', 'H12', 'S12', 'Sargodha'),
(13, 'Mehwish', 'Khan', '03231234567', 'H13', 'S13', 'Gujranwala'),
(14, 'Yasir', 'Zafar', '03341234567', 'H14', 'S14', 'Okara'),
(15, 'Noman', 'Shah', '03461234567', 'H15', 'S15', 'Abbottabad');


INSERT INTO Customer VALUES
(1, 'Ahmed', 'Raza', '03121234567', 'ahmed@gmail.com', '10', '1', 'Lahore'),
(2, 'Fatima', 'Zahid', '03461234567', 'fatima@yahoo.com', '25', '5', 'Karachi'),
(3, 'Bilal', 'Malik', '03001234567', 'bilal@hotmail.com', '7', '3', 'Islamabad'),
(4, 'Zainab', 'Ali', '03211234567', 'zainab@outlook.com', '15', '6', 'Multan'),
(5, 'Hassan', 'Shah', '03131234567', 'hassan@gmail.com', '9', '4', 'Faisalabad'),
(6, 'Maryam', 'Yousaf', '03331234567', 'maryam@live.com', '12', '2', 'Peshawar'),
(7, 'Tariq', 'Javed', '03411234567', 'tariq@gmail.com', '5', '7', 'Quetta'),
(8, 'Ayesha', 'Kamal', '03011234567', 'ayesha@yahoo.com', '17', '9', 'Rawalpindi'),
(9, 'Sana', 'Butt', '03231234567', 'sana@hotmail.com', '30', '8', 'Gujranwala'),
(10, 'Usman', 'Bashir', '03321234567', 'usman@gmail.com', '4', '11', 'Sialkot');

INSERT INTO Admin VALUES
(1, 'Saad', 'Ahmed', '03211235678', '100', '20', 'Lahore'),
(2, 'Usman', 'Jamil', '03111231234', '101', '21', 'Karachi'),
(3, 'Ayesha', 'Saeed', '03331234567', '102', '22', 'Islamabad');



INSERT INTO Stock VALUES
(1, 100),
(2, 150),
(3, 200),
(4, 250),
(5, 300),
(6, 180),
(7, 120),
(8, 210),
(9, 190),
(10, 160);

INSERT INTO Salesman VALUES
(1, 'Zeeshan', 'Ali', 'zeeshan@store.com', 'Senior', 35000, '03011230000', NULL, 1, '22', '2', 'Lahore'),
(2, 'Hira', 'Nawaz', 'hira@store.com', 'Junior', 25000, '03451230000', 1, 1, '34', '3', 'Lahore'),
(3, 'Rizwan', 'Sheikh', 'rizwan@store.com', 'Senior', 38000, '03011230111', NULL, 2, '9', '7', 'Karachi'),
(4, 'Fahad', 'Iqbal', 'fahad@store.com', 'Junior', 24000, '03311230111', 3, 2, '16', '4', 'Karachi'),
(5, 'Amina', 'Khalid', 'amina@store.com', 'Senior', 36000, '03111230111', NULL, 3, '11', '6', 'Islamabad');

INSERT INTO Sale VALUES
(1, 201, 101, '2025-05-01', 1500.00),
(2, 202, 102, '2025-05-02', 2300.00),
(3, 203, 103, '2025-05-03', 3100.00),
(4, 204, 104, '2025-05-04', 2500.00),
(5, 205, 105, '2025-05-05', 1800.00),
(6, 206, 106, '2025-05-06', 1950.00),
(7, 207, 107, '2025-05-07', 2100.00),
(8, 208, 108, '2025-05-08', 2250.00),
(9, 209, 109, '2025-05-09', 2600.00),
(10, 210, 110, '2025-05-10', 2750.00),
(11, 211, 101, '2025-05-11', 2900.00),
(12, 212, 102, '2025-05-12', 3050.00),
(13, 213, 103, '2025-05-13', 3200.00),
(14, 214, 104, '2025-05-14', 3350.00),
(15, 215, 105, '2025-05-15', 3500.00);

INSERT INTO Payment  VALUES
(1, 1, 1500.00, 'Completed', '2025-05-01'),
(2, 2, 2300.00, 'Completed', '2025-05-02'),
(3, 3, 3100.00, 'Completed', '2025-05-03'),
(4, 4, 2500.00, 'Completed', '2025-05-04'),
(5, 5, 1800.00, 'Completed', '2025-05-05'),
(6, 6, 1000.00, 'Partial', '2025-05-06'),
(7, 7, 2100.00, 'Completed', '2025-05-07'),
(8, 8, 2000.00, 'Partial', '2025-05-08'),
(9, 9, 2600.00, 'Completed', '2025-05-09'),
(10, 10, 2750.00, 'Completed', '2025-05-10'),
(11, 11, 1500.00, 'Partial', '2025-05-11'),
(12, 12, 3050.00, 'Completed', '2025-05-12'),
(13, 13, 3200.00, 'Completed', '2025-05-13'),
(14, 14, 3350.00, 'Completed', '2025-05-14'),
(15, 15, 3500.00, 'Completed', '2025-05-15');

INSERT INTO JobHistory VALUES
(1, 101, 1, '2024-01-01', '2024-06-01'),
(2, 102, 2, '2024-02-01', '2024-07-01'),
(3, 103, 3, '2024-03-01', '2024-08-01'),
(4, 104, 1, '2024-04-01', '2024-09-01'),
(5, 105, 2, '2024-05-01', '2024-10-01'),
(6, 106, 3, '2024-06-01', '2024-11-01'),
(7, 107, 1, '2024-07-01', '2024-12-01'),
(8, 108, 2, '2024-08-01', '2025-01-01'),
(9, 109, 3, '2024-09-01', '2025-02-01'),
(10, 110, 1, '2024-10-01', '2025-03-01'),
(11, 101, 2, '2024-11-01', '2025-04-01'),
(12, 102, 3, '2024-12-01', '2025-05-01'),
(13, 103, 1, '2025-01-01', '2025-06-01'),
(14, 104, 2, '2025-02-01', '2025-07-01'),
(15, 105, 3, '2025-03-01', '2025-08-01');






SELECT * FROM Book;

