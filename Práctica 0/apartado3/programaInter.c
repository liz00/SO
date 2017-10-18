int main()
{
int a = 5;
int b = 0;
printf("Antes del cambio %d\n", a);
intercambia (&a, &b);
printf("Despues del cambio %d\n", a);
exit(0);
}

