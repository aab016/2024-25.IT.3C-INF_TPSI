#include <stdio.h>  // printf
#include <stdlib.h> // exit

#include "tatooine.h"

void main()
{
    int abitanti_di_tatooine = numero_abitanti();
    printf("Gli abitanti di Tatooine sono %d, che la forza sia con te", abitanti_di_tatooine);
    exit(0);
}
