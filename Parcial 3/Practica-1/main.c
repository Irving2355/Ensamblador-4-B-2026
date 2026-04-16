#include <stdio.h>
#include <stdlib.h>

int suma_arreglo(const int* arr, int n);

int main(){
    int datos[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};

    int n = sizeof(datos) / sizeof(int);

    int resultado = suma_arreglo(datos, n);

    printf("Elementos del vector: ");
    for(int i=0; i<n; i++){
        printf("%d  ", datos[i]);
    }

    printf("\nSuma total = %d\n", resultado);
    system("pause");
    return 0;
}