#include <stdio.h>

int count = 0;
void callCount(){
    count++;
    printf("Call Count = %d\n",count);
}