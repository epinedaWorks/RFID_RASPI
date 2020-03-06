import mysql.connector
from mysql.connector import Error
from mysql.connector import errorcode



## Parametros
host="192.168.1.4" 
user="epineda"
passwd="adminadmin"
db="rfid"


try:

     db = mysql.connector.connect(host=host, user=user, passwd=passwd, db=db)   # name of the database

# Create a Cursor object to execute queries.
     cur = db.cursor()

     sqlComando="INSERT INTO `colaborador` (`Nombres`, `Apellidos`, `Acceso`, `UID`) VALUES ('Jose P. ', 'Contreras Z.', 'Laboratorio 1', '11111')"

     cur.execute(sqlComando)
     db.commit()

     print(cur.rowcount, "Record inserted successfully into Laptop table")
     cur.close()

except mysql.connector.Error as error:
    print("Failed to insert record into Laptop table {}".format(error))

finally:
    if (db.is_connected()):
        db.close()
        print("MySQL connection is closed")

