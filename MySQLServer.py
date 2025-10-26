import mysql.connector
from mysql.connector import Error

try:
    # Connect to MySQL server
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",        # change to your MySQL username
        password="your_password"  # change to your MySQL password
    )

    if mydb.is_connected():
        mycursor = mydb.cursor()

        # Create database if it doesn't already exist
        mycursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

        print("Database 'alx_book_store' created successfully!")

except Error as e:
    print(f"Error while connecting to MySQL: {e}")

finally:
    # Close the connection properly
    if mydb.is_connected():
        mycursor.close()
        mydb.close()
        print("MySQL connection is closed.")
