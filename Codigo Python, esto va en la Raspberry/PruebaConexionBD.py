#import MySQLdb
import mysql.connector

# db = MySQLdb.connect(host="192.168.1.4,  # your host
host="192.168.1.4" 
user="epineda"
passwd="adminadmin"
db="rfid"

db = mysql.connector.connect(host=host, user=user, passwd=passwd, db=db)   # name of the database
#db = mysql.connector.connect(host="192.168.1.4, user="epineda", passwd="adminadmin", db="rfid")   # name of the database

# Create a Cursor object to execute queries.
cur = db.cursor()

# Select data from table using SQL query.
cur.execute("SELECT * FROM colaborador")

# print the first and second columns
for row in cur.fetchall() :
    print row[0], " ", row[1]
