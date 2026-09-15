import sqlite3

conn = sqlite3.connect('database.db')
cursor = conn.cursor()

cursor.execute(""" 
    INSERT INTO user (u_name, u_email, u_password) 
    VALUES ('Maria', 'maria@gemail.com', 'Senha@123') 
""")

conn.commit()

conn.close() 