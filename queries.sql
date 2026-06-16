SELECT * FROM Customer WHERE city = 'Lahore';

SELECT * FROM Book WHERE name LIKE '%Harry Potter%';

SELECT Book.name, Genre.name AS genre_name 
FROM Book 
INNER JOIN Genre ON Book.genre_id = Genre.genre_id;

SELECT Author.first_name, Author.last_name, Book.name 
FROM AuthorBook 
INNER JOIN Author ON AuthorBook.author_id = Author.author_id
INNER JOIN Book ON AuthorBook.book_id = Book.book_id;

SELECT Genre.name, COUNT(Book.book_id) AS total_books 
FROM Book 
INNER JOIN Genre ON Book.genre_id = Genre.genre_id 
GROUP BY Genre.name;

SELECT Genre.name, AVG(Book.price) AS avg_price 
FROM Book 
JOIN Genre ON Book.genre_id = Genre.genre_id 
GROUP BY Genre.name;

SELECT Customer.first_name, Customer.last_name, SUM(Sale.total_amount) AS total_spent 
FROM Sale 
JOIN Customer ON Sale.customer_id = Customer.customer_id 
GROUP BY Customer.customer_id;

SELECT Book.name, price FROM Book ORDER BY price DESC LIMIT 5;

SELECT Publisher.first_name, Publisher.last_name, Book.name 
FROM PublisherBook 
JOIN Publisher ON PublisherBook.publisher_id = Publisher.publisher_id 
JOIN Book ON PublisherBook.book_id = Book.book_id;

UPDATE Book SET price = price + 100 WHERE genre_id = 10;

DELETE FROM Customer WHERE customer_id = 10;

SELECT COUNT(*) AS total_customers FROM Customer;

ALTER TABLE Book RENAME COLUMN name TO book_title;
ALTER TABLE Book RENAME COLUMN book_title TO name;

ALTER TABLE Salesman ADD COLUMN joining_date DATE;

ALTER TABLE Salesman DROP COLUMN role;

SELECT name, ROUND(price) AS rounded_price FROM Book;

SELECT UPPER(book_title) AS uppercase_title FROM Book;

SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM Author;

SELECT book_title, LENGTH(book_title) AS title_length FROM Book;