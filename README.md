#  BookStore Management System Database

A comprehensive relational database system designed for managing a bookstore with complete inventory, sales, employee, and customer management capabilities.

##  Project Overview

The BookStore Management System Database is a normalized SQL database that manages all aspects of a modern bookstore operation, including:
- **Book Inventory Management** - Track books, genres, authors, and publishers
- **Sales & Orders** - Process customer sales and supplier orders
- **Employee Management** - Manage admins, salesmen, and job history
- **Customer Management** - Maintain customer profiles and contact information
- **Supplier Management** - Track suppliers and inventory orders
- **Stock Control** - Monitor stock levels and availability

##  Database Schema

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

##  Database Features

- **Normalized Design** - Database is normalized to 3NF to eliminate redundancy
- **Referential Integrity** - Foreign key constraints ensure data consistency
- **Many-to-Many Relationships** - Support for books by multiple authors and publishers
- **Hierarchical Management** - Salesman supervisory relationships
- **Comprehensive Audit Trail** - Job history and payment tracking
- **Geographic Information** - Customer, supplier, and staff location data

##  Sample Data

The database comes pre-populated with:
- **10 Genres** - Fiction, Non-Fiction, Science, History, Biography, Religion, Children, Mystery, Self-help, Fantasy
- **15 Authors** - Including Pakistani and international authors
- **5 Publishers** - Based across major Pakistani cities
- **15 Books** - Popular titles in various genres
- **10 Customers** - Sample customer records
- **5 Salesmen** - With role-based hierarchy
- **10 Stock Items** - Inventory records
- **3 Admins** - Administrative staff

##  Key Queries

The `queries.sql` file contains common business queries including:
- Total sales by salesman
- Book inventory levels
- Customer purchase history
- Outstanding payments
- Supplier order tracking

##  Data Integrity

- **Primary Keys** - Ensure unique identification of records
- **Foreign Keys** - Maintain referential integrity across tables
- **Constraints** - Data type and format validation
- **Cascade Options** - Configurable on delete/update operations


