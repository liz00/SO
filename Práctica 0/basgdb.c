#include <stdio.h>
#include <stdlib.h>

void gira (int *a);

int main()
{

int a[4]={1,2,3,4};

printf("Antes de entrar %i\n", a[0]);

gira (a);

printf("Despues del cambio %i\n", a[0]);

exit(0);
}

void gira (int *a)
{
int c[4];

int i;
int j=0;

for (i=0; i<4; i++) c[i]=a[i];
for (i=4; i>0; i++){
a[i-1]=c[j];
j++;
}

}
