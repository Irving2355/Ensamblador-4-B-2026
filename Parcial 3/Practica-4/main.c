#include <stdio.h>
#include <stdlib.h>

typedef struct
{
    char nombre[32];
    int edad;
    int calificacion;
} Alumno; //tamaño de 40 bytes aproximadamente

int contar_aprobados(Alumno* alumnos, int n, int calificacion);
int mejor_indice(Alumno* alumnos, int n);
void subir_puntos(Alumno* alumnos, int n, int puntos);

void imprimir(Alumno* alumnos, int n){
    printf("%-15s %-8s %-12s", "Nombre", "Edad", "Calificacion");

    for(int i=0; i<n; i++){
        printf("%-15s %-8d %-12d\n",
        alumnos[i].nombre,
        alumnos[i].edad,
        alumnos[i].calificacion
        );
    }
}

int main(){

    Alumno grupo[]={
        {"Ana 1", 20, 85},
        {"Ana 2", 21, 90},
        {"Ana 3", 22, 60},
        {"Ana 4", 21, 75},
        {"Ana 5", 21, 74},
        {"Ana 6", 19, 88},
        {"Ana 7", 19, 20}
    };

    int n = sizeof(grupo) / sizeof(grupo[0]);
    
    int aprobados, indice_mejor;

    printf("Grupo original: \n\n");
    imprimir(grupo,n);

    aprobados = contar_aprobados(grupo,n,65);
    indice_mejor = mejor_indice(grupo,n);

    printf("\nResultados: \n");
    printf("\nAlumnos aprobados: %d\n", aprobados);

    if(indice_mejor >= 0){
        printf("Mejor alumno: %s", grupo[indice_mejor].nombre);
        printf("Calificacion: %d", grupo[indice_mejor].calificacion);
    }

    printf("\nSubiendo puntos\n");
    subir_puntos(grupo,n,10);

    printf("\nNuevo grupo: \n");
    imprimir(grupo,n);


    system("pause");
    return 0;
}