import psycopg2
import csv

# Database connection parameters
DB_CONFIG = {
    'host': 'localhost',          # Replace with your PostgreSQL server host
    'port': 5432,                 # PostgreSQL port
    'database': 'online_store',   # Database name
    'user': 'postgres',          # PostgreSQL username
    'password': 'password'   # PostgreSQL password
}

# CSV file path
CSV_FILE_PATH = '/home/chris/Desktop/online_store/online_store_data.csv'  # Replace with the path to your CSV file

# Table name
TABLE_NAME = 'transactions'

def load_csv_to_postgres(file_path, table_name, db_config):
    try:
        # Connect to PostgreSQL
        conn = psycopg2.connect(**db_config)
        cursor = conn.cursor()

        # Open the CSV file
        with open(file_path, 'r') as csv_file:
            reader = csv.reader(csv_file)
            headers = next(reader)  # Read the header row
            
            # Validate headers against table structure (optional)
            print(f"Headers in CSV: {headers}")
            
            # Generate INSERT query
            columns = ', '.join(headers)
            placeholders = ', '.join(['%s'] * len(headers))
            insert_query = f"INSERT INTO {table_name} ({columns}) VALUES ({placeholders})"
            
            # Insert each row into the table
            for row in reader:
                cursor.execute(insert_query, row)
        
        # Commit the transaction
        conn.commit()
        print(f"Data from {file_path} successfully imported into {table_name}.")
    
    except Exception as e:
        print(f"Error: {e}")
    
    finally:
        # Close the database connection
        if cursor:
            cursor.close()
        if conn:
            conn.close()

# Run the function
load_csv_to_postgres(CSV_FILE_PATH, TABLE_NAME, DB_CONFIG)
