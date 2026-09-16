import sqlite3 

conn = sqlite3.connect('database.db') 
cursor = conn.cursor() 

cursor.execute(""" 
    SELECT u_id, u_name, u_email
    FROM user
""") 

clients = cursor.fetchall() 

for client in clients: 
    print(client) 

conn.close() 