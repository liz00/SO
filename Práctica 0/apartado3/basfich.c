#include <stdio.h>
#include <stdlib.h>

main()
{
char str1[20], str2[30];
/*declaracion de variables locales*/
FILE *archivo1, *archivo2;/*variables para asignar la direccion de memoria donde se abriran los ficheros*/
char c;/*caracter que se copiara al fichero2 mas adelante*/

printf("FIchero de lectura: ");
scanf("%s", str1);

printf("FIchero de copia: ");
scanf("%s", str2);

archivo1=fopen(str1,"r");/*apertura de fichero prueba.txt con permiso de lectura. si no existe el fichero lo crea.*/
archivo2=fopen(str2,"w");/*apertura de fichero copia.txt con permiso de escritura. si no existe el fichero lo crea.*/

if ((archivo1==NULL)||(archivo2==NULL))

printf("Error al abrir ficheros");

else/*Una vez los ficheros abiertos copiamos el archivo1 en archivo2*/
{
/*obtenemos un caracter con GETC mientras que no hayamos llegado al final del archivo1.*/
	while((c=getc(archivo1))!=EOF)
	{
/*con PUTC añadimos ese caracter al archivo2*/
		putc(c,archivo2);  
	}

/*Cerramos los ficheros. Si no se ha podido recibimos el error*/
if (fclose(archivo1)!=0)

printf("Error al cerrar fichero prueba");

if (fclose(archivo2)!=0)

printf("Error al cerrar fichero copia");

} 
exit(0);

}
