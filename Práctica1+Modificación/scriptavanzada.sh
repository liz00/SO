 #!bin/bash
 #La primera línea o #! /bin/bash asegura que se interpreta como
 #un script de bash, aunque se ejecute desde otro shell.
 #3SO: Grupo A-P1
 #Autora: Estibaliz Busto Perez de Mendiguren
 #Grupo: S0 Masters


 #Compruebo si existen los archivos

 if [ -e $1 ] && [ -e $2 ] && [ -e $3 ]; then

du -b $1 >  avanzada.mtar
du -b $2 >> avanzada.mtar
du -b $3 >> avanzada.mtar

cat $1 >> avanzada.mtar
cat $2 >> avanzada.mtar
cat $3 >> avanzada.mtar

exit 0

else
 	echo "No existen los ficheros .txt "
	exit 1
fi
