import sys

def canche(Prueba):
	print("Esto es una cadena de: ",Prueba)
	content="Let's Go Baby shark "+ Prueba
	file = open("YouRock.txt", "w") 
	file.write(content) 
	file.close() 
	return content



if __name__ == "__main__":
    canche(*sys.argv[1:])
 
