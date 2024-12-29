# Online Store SQL Project
## Project Description
This project demonstrates the use of SQL and Python to analyze and manage data from an online store. 
The dataset contains information about transactions, customers, items, and discounts.
The project includes SQL queries to calculate total revenue, sales by state, net revenue after discounts, and other key business metrics.

### The following files and scripts are included in this project:

1_creating_table.sql: SQL script to create the transactions table and define its constraints.
2_insert_data.py: Python script to insert data from the CSV file into a PostgreSQL database.
3_queries.sql: A collection of SQL queries with descriptions, designed to analyze the sales data.
online_data.csv: The dataset containing all transaction details.


### Getting Started
Ensure the following software and tools are installed on your system:

Python 3.x
PostgreSQL
psycopg2 Python package (for PostgreSQL integration)
Install it using:

```bash
pip install psycopg2
```

Launch PostgreSQL and create a database named online_store.

```sql
CREATE DATABASE online_store;
```

Use the 1_creating_table.sql script to create the transactions table. Run the following command in your PostgreSQL client:
Place the online_data.csv file in the same directory as the project.
Run the Python script 2_insert_data.py to insert data from the CSV file into the transactions table:
It's important to check directories in the script !

Query the Data:
Use the queries in 3_queries.sql to analyze the dataset. These queries include calculations of total revenue, net revenue after discounts, sales by state, and more.
