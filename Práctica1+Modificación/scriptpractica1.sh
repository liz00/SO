 #!bin/bash
 #Las líneas que empiezan por "#" son comentarios
 #La primera línea o #! /bin/bash asegura que se interpreta como
 #un script de bash, aunque se ejecute desde otro shell.

#Comandos: -x mira si el archivo tiene permisos de ejecucion, -e mira si existe el archivo y -f mira si este contiene datos. -d indica si existe el directorio (tmp). -rf realiza un borrado forzado.

#1. Comprueba que el programa mytar esta en el directorio actual y que es ejecutable. Si no, muestra un mensaje (al final)
  
#3) Generar un script que haga los mismo que Mytar pero aprovachandose de las funcionalidades de cat (concatena archivos) 
#de du para escribir el nombre y el tamaño del archivo, y del operador > para escribir los resultados en un fichero.
if [ -e mytar ] && [ -f mytar ] && [ -x mytar ]; then
	#2. Comprueba que existe el tmp dentro del directorio actual. Si existe lo borra incluyendo todo lo que haya dentro de él.
	if [ -d tmp ]; then
	rm -r tmp
	fi
	
	# 3. Crea un nuevo directorio tmp dentro del actual y cambiara a este directorio. 
	mkdir tmp
	# 4. Creo tres ficheros dentro del directorio (para ello tengo que acceder a él).
	cd tmp
	# 4.1 "file1.txt" -> "Hello world!" utilizando la orden echo y redirigiendo la salida al fichero.
	echo "Hello World!" > file1.txt
	# 4.2 "file2.txt" -> con una copia de las 10 primeras lineas del fichero /etc/passwd. Se hace facil utilizando el programa head y redirigiendo la salida al fichero.
	head -n 10 /etc/passwd > file2.txt
	#4.3 "file3.dat"-> con un contenido binario aleatorio de 1024 bytes, tomado del dispositivo /dev/urandom. De nuevo conviene utilizar head con la opcion -c. < -> Para saber de dónde va a leer estos bytes. # < 
	head -c 1024 < /dev/urandom > file3.dat
	#5. Invoca el programa mytar que hemos desarrollado, para crear un fichero "filetar.mtar" con el contenido de los tres ficheros anteriores. Ejecuto el programa mytar
	../mytar -cf filetar.mtar file1.txt file2.txt file3.dat
	# rf
	#6. Crea un directorio out (dentro del actual que debe ser tmp, y copia (cp) el fichero filetar.mtar al nuevo directorio.
	mkdir out
	cp filetar.mtar out/
	#7. Cambia al directorio out y ejecuta el programa mytar para extraer el contenido del tarball.
	cd out	
	#vf
	../../mytar -xf filetar.mtar
	#Avanzada
	#../../mytar -rf filetar.mtar
	#8. Usa el programa diff para comparar los ficheros extraidos con los originales, que estan en el directorio anterior
	if diff file1.txt ../file1.txt && diff file2.txt ../file2.txt &&  diff file3.dat ../file3.dat; 
	then
		cd ../..	
		echo "Correct"
		exit 0
	else
		cd ../..
		echo "Ficheros distintos"
		exit 1
	fi
	
else
	echo "Mytar no es un programa ejecutable"
	exit 1
fi

	
	
