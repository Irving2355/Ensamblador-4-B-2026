#include <stdio.h>
#include <stdlib.h>

long long sumar(const int* arr, int n);
int contar_pares(const int* arr, int n);
int obtener_max(const int* arr, int n);

void imprimir(const int* arr, int n){
    int i;

    printf("Arreglo = ");
    for(i=0; i<n; i++){
        printf("%d", arr[i]);
        if(i < n-1){
            printf(", ");
        }
    }
    printf("\n");
}

int main(){
    system("pause");
    return 0;
}