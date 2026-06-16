# 📚 BookStore Management System Database

A comprehensive relational database system designed for managing a bookstore with complete inventory, sales, employee, and customer management capabilities.

## 📋 Project Overview

The BookStore Management System Database is a normalized SQL database that manages all aspects of a modern bookstore operation, including:
- **Book Inventory Management** - Track books, genres, authors, and publishers
- **Sales & Orders** - Process customer sales and supplier orders
- **Employee Management** - Manage admins, salesmen, and job history
- **Customer Management** - Maintain customer profiles and contact information
- **Supplier Management** - Track suppliers and inventory orders
- **Stock Control** - Monitor stock levels and availability

## 🗄️ Database Schema

### Core Tables

#### Master Data
- **Genre** - Book categories and classifications
- **Author** - Author information and biographical data
- **Publisher** - Publisher details and contact information
- **Supplier** - Supplier information and contact details

#### Product Management
- **Book** - Book details, pricing, and genre associations
- **AuthorBook** - Many-to-many relationship between authors and books
- **PublisherBook** - Many-to-many relationship between publishers and books

#### Personnel Management
- **Admin** - Administrative staff information
- **Salesman** - Sales staff with roles, salary, and supervisory relationships
- **Customer** - Customer profiles with contact information

#### Business Operations
- **Orders** - Supplier orders tracked by admin
- **OrderBookSupplier** - Junction table linking orders, books, and suppliers
- **Sale** - Customer sales records
- **BookSale** - Books included in each sale
- **Payment** - Payment records and status tracking
- **Stock** - Stock inventory levels
- **BookStock** - Stock allocation for specific books
- **CheckStock** - Stock verification by salesman
- **JobHistory** - Employment history for salesmen

## 📊 Database Features

- **Normalized Design** - Database is normalized to 3NF to eliminate redundancy
- **Referential Integrity** - Foreign key constraints ensure data consistency
- **Many-to-Many Relationships** - Support for books by multiple authors and publishers
- **Hierarchical Management** - Salesman supervisory relationships
- **Comprehensive Audit Trail** - Job history and payment tracking
- **Geographic Information** - Customer, supplier, and staff location data

## 🗂️ File Structure

```
BookStore-System-DB/
├── README.md                 # This file
├── project.sql              # Main database schema and initial data
├── assignment.sql           # Assignment-related queries
├── bookstore.sql            # Additional bookstore queries
├── queries.sql              # Common business queries
├── Normalized ERD.pdf       # Normalized Entity-Relationship Diagram
├── Normalized.png           # Normalized ERD visualization
├── Abnormal ERD.png         # Unnormalized ERD reference
├── ERD (2).pdf             # Additional ERD documentation
└── Database Systems.pdf     # Database design documentation
```

## 🚀 Getting Started

### Prerequisites
- MySQL 5.7 or higher
- SQL client (MySQL Workbench, phpMyAdmin, or command line)

### Installation

1. **Create the Database:**
   ```sql
   mysql -u root -p < project.sql
   ```

2. **Or manually execute** the SQL script in your MySQL client:
   - Open your SQL editor
   - Copy contents of `project.sql`
   - Execute the script

3. **Verify Installation:**
   ```sql
   USE BookStoreManagementSystem;
   SELECT COUNT(*) as Total_Books FROM Book;
   ```

## 📈 Sample Data

The database comes pre-populated with:
- **10 Genres** - Fiction, Non-Fiction, Science, History, Biography, Religion, Children, Mystery, Self-help, Fantasy
- **15 Authors** - Including Pakistani and international authors
- **5 Publishers** - Based across major Pakistani cities
- **15 Books** - Popular titles in various genres
- **10 Customers** - Sample customer records
- **5 Salesmen** - With role-based hierarchy
- **10 Stock Items** - Inventory records
- **3 Admins** - Administrative staff

## 🔍 Key Queries

The `queries.sql` file contains common business queries including:
- Total sales by salesman
- Book inventory levels
- Customer purchase history
- Outstanding payments
- Supplier order tracking

### Example Query - Total Sales by Salesman:
```sql
SELECT s.first_name, s.last_name, COUNT(DISTINCT sa.sales_id) as Total_Sales,
       SUM(sa.total_amount) as Total_Revenue
FROM Salesman s
LEFT JOIN Sale sa ON s.salesman_id = sa.salesman_id
GROUP BY s.salesman_id, s.first_name, s.last_name;
```

## 🔐 Data Integrity

- **Primary Keys** - Ensure unique identification of records
- **Foreign Keys** - Maintain referential integrity across tables
- **Constraints** - Data type and format validation
- **Cascade Options** - Configurable on delete/update operations

## 📝 Database Operations

### Common Tasks

**Add a New Book:**
```sql
INSERT INTO Book VALUES (16, 'New Book Title', 1299.00, 1);
```

**Record a Sale:**
```sql
INSERT INTO Sale VALUES (1, 1, 1, CURDATE(), 1500.00);
```

**Update Stock Quantity:**
```sql
UPDATE Stock SET stock_quantity = stock_quantity - 5 WHERE stock_id = 1;
```

**Generate Sales Report:**
```sql
SELECT b.name, COUNT(*) as Sales_Count, SUM(sa.total_amount) as Revenue
FROM BookSale bs
JOIN Book b ON bs.book_id = b.book_id
JOIN Sale sa ON bs.sales_id = sa.sales_id
GROUP BY b.book_id, b.name;
```

## 📚 Documentation

- **Normalized ERD.pdf** - Complete entity-relationship diagram in PDF format
- **Normalized.png** - Visual representation of normalized schema
- **Abnormal ERD.png** - Reference for unnormalized structure
- **Database Systems.pdf** - Detailed database design documentation

## 🛠️ Technologies Used

- **Database Management System:** MySQL
- **Design:** Entity-Relationship Model (ERM)
- **Normalization:** Third Normal Form (3NF)
- **Documentation:** ERD diagrams and SQL scripts

## 👤 Author

**Hassan Zaheer** - hassanzaheer88

## 📄 License

This project is open source and available under the MIT License.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome. Feel free to fork the repository and create a pull request.

## 📞 Support

For questions or issues regarding this database system, please open an issue on the GitHub repository.
