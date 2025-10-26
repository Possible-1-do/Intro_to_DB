import mysql.connector

try:
    # Connect to MySQL server
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",          # change to your MySQL username
        password="your_password"  # change to your MySQL password
    )

    if mydb.is_connected():
        mycursor = mydb.cursor()

        # Create database if not exists
        mycursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

        print("Database 'alx_book_store' created successfully!")

except mysql.connector.Error as err:
    print(f"Error while connecting to MySQL: {err}")

finally:
    # Close connection safely
    if 'mydb' in locals() and mydb.is_connected():
        mycursor.close()
        mydb.close()
        print("My
