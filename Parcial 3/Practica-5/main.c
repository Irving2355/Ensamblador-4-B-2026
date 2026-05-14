#include <stdio.h>
#include <stdlib.h>

#define FILAS 12
#define COLUMNAS 12

#define TAM_SALIDA (FILAS * (COLUMNAS * 2 + 1) + 1)

void generar_pixel_art(int *matriz, char *salida, int filas, int columnas);


int main(){

    int imagen[FILAS][COLUMNAS] = {
        {0,0,1,3,4,4,4,4,3,1,0,0},
        {0,2,4,4,4,4,4,4,4,4,2,0},
        {2,4,4,4,4,4,4,4,4,4,4,2},
        {4,4,4,4,4,4,4,4,4,4,4,4},
        {4,4,4,4,4,4,4,4,4,4,4,4},
        {2,4,4,4,4,4,4,4,4,4,4,2},
        {0,2,4,4,4,4,4,4,4,4,2,0},
        {0,0,2,4,4,4,4,4,4,2,0,0},
        {0,0,0,2,4,4,4,4,2,0,0,0},
        {0,0,0,0,2,4,4,2,0,0,0,0},
        {0,0,0,0,0,2,2,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0,0,0,0}
    };

    char salida[TAM_SALIDA];

    /*
        configuracion para bloques y color
        chcp 437 permite usar los bloques
        176,177,178 y 219 en consola windows
    */
    system("chcp 437 > nul");
    system("color 0A");

    generar_pixel_art(&imagen[0][0], salida, FILAS, COLUMNAS);

    printf("\nPixel art generado por NASM\n");
    printf("%s", salida);

    system("pause");
    return 0;
}