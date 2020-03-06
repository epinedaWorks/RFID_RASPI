#!/usr/bin/env python

import RPi.GPIO as GPIO
import sys 

from mfrc522 import SimpleMFRC522


def escribir(uid):
  reader = SimpleMFRC522()

  try:
        #text = input('New data:')
        print("Escribiendo datos en tarjeta")
        reader.write(uid)
        print("Fin del proceso, revisar estado en BD : ", uid)
  finally:
        GPIO.cleanup()
if __name__ == "__main__":
  escribir(*sys.argv[1:])
