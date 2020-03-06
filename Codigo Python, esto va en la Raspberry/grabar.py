#!/usr/bin/env python

import mysql.connector
import RPi.GPIO as GPIO
from mysql.connector import Error
from mysql.connector import errorcode
from mfrc522 import SimpleMFRC522





## Parametros
host="192.168.1.4"
user="epineda"
passwd="adminadmin"
db="rfid"


def insertarRegistroEnBD(uid):

	try:

		 dbConnector = mysql.connector.connect(host=host, user=user, passwd=passwd, db=db)   # name of the database

	# Create a Cursor object to execute queries.
		 cur = dbConnector.cursor()
		 stringLector="Lector: Nivel 3, Puerta DataCenter" 
		 stringInsert="INSERT INTO `ingresos` (`UID`, `Fecha`, `Hora`, `Acceso`)" 
		 stringValues="VALUES ('"+str(uid)+"', current_timestamp(), current_timestamp(), '"+stringLector+"');"


		 sqlComando= stringInsert + " " +stringValues
		
		 cur.execute(sqlComando)
		 dbConnector.commit()

		 print(cur.rowcount, "Registro agregado a la base de datos: ",cur.lastrowid)
		 cur.close()

	except mysql.connector.Error as error:
		print("Failed to insert record into BD {}".format(error))

	finally:
		if (dbConnector.is_connected()):
			dbConnector.close()
			print("MySQL connection is closed")





def leerTAG():
	try:
		reader = SimpleMFRC522()
		id, text = reader.read()
		print(id)
		print(text)
	finally:
			GPIO.cleanup()
	return text


print(":::: Presentar tarjeta RFID ::::")
first_word = leerTAG().split()[0]
insertarRegistroEnBD(first_word)
