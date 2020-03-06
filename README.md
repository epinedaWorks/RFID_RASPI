# RFID_RASPI
Proyecto para leer tarjetas RFID por medio de Raspberry Pi 3

Para la instalación, seguir los pasos descritos en:
https://pimylifeup.com/raspberry-pi-rfid-rc522/

Practicamente son los siguientes:
From the: https://pimylifeup.com/raspberry-pi-rfid-rc522/


sudo raspi-config
Enable SPI and GPIO remote:
On here use the arrow keys to select “5 Interfacing Options“. Once you have this option selected, press Enter.
Now on this next screen, you want to use your arrow keys to select “P4 SPI“, again press Enter to select the option once it is highlighted.
Reboot

lsmod | grep spi


sudo apt-get update
sudo apt-get upgrade

sudo apt-get install python3-dev python3-pip


sudo pip3 install spidev

sudo pip3 install mfrc522

Ejecutar archivos con:

sudo python3 Write.py

-----------------------------------------------------
#!/usr/bin/env python

import RPi.GPIO as GPIO
from mfrc522 import SimpleMFRC522

reader = SimpleMFRC522()

try:
        text = input('New data:')
        print("Now place your tag to write")
        reader.write(text)
        print("Written")
finally:
        GPIO.cleanup()
-----------------------------------------------------
Read:
-----------------------------------------------------
#!/usr/bin/env python

import RPi.GPIO as GPIO
from mfrc522 import SimpleMFRC522

reader = SimpleMFRC522()

try:
        id, text = reader.read()
        print(id)
        print(text)
finally:
        GPIO.cleanup()
--------------------------------------------------------

El código utilizado, que tiene diferentes nombres, es el que se ha mejorado.

Ver video.
Explicación:
1. Conectar modulo RFID
2. Instalar XAMPP
3. Crear BD Rfid
4. Instalar libreria de Modulo RFID
5. Java enviará comandos a RASPI por medio de SSH.
6. Agregar llaves SSH entre Windows y Raspi para que no pida contraseña cuando envíe datos
7. Asegurarse que hay coneción entre BD, Raspi y PC local.
8. Ejecutar scripts de python utilizando "python3"
9. Para entenderlo mejor, ver clases de Java.
10. La comunicación fluye asi:
Java es la interfaz grafica, se comunica a Python por medio de ssh y envía por medio de parámetros el UID para que se almacene en la 
tarjeta RFID. 

