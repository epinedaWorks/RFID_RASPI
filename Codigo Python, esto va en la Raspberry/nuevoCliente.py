#!/usr/bin/env python

import RPi.GPIO as GPIO
import mysql.connector
import sys

from mfrc522 import SimpleMFRC522
from mysql.connector import Error
from mysql.connector import errorcode




## Parametros
host="192.168.1.4"
user="epineda"
passwd="adminadmin"
db="rfid"



def buscarID(strUID):
	try:

		 dbConection = mysql.connector.connect(host=host, user=user, passwd=passwd, db=db)   # name of the database

	# Create a Cursor object to execute queries.
		 cur = dbConection.cursor()

		 sqlComando="SELECT * FROM colaborador where UID="+strUID

		 cur.execute(sqlComando)
			 
		 # print the first and second columns
		 for row in cur.fetchall() :
		    
		    nombre= str(row[0])
		    apellido= str(row[1])
		    acceso= str(row[2])
		    txtUid= str(row[3])
			
		    #contenido=txtUid,";", nombre, apellido, ";",acceso
		    contenido=txtUid+";"+nombre +" "+ apellido+";"+acceso
		    print("En el for:", contenido)
		    

		 
		 cur.close()

	except mysql.connector.Error as error:
		print("Failed Connect. {}".format(error))

	finally:
		if (dbConection.is_connected()):
			dbConection.close()
			print("MySQL connection is closed")

	#contenido="UID: ",txtUid," Nombre: ", nombre, " Apellido: ", apellido, " Accesos: ",acceso, ""
	
	return contenido
	




def escribir(uid):
  reader = SimpleMFRC522()

  try:
        print("Escribiendo datos en tarjeta")
        a=buscarID(uid)
        print("Antes de escribir:", a)
        reader.write(a)
		
        print("Fin del proceso, revisar estado en BD : ", uid)
  finally:
        GPIO.cleanup()
if __name__ == "__main__":
  escribir(*sys.argv[1:])

