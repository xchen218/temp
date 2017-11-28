#include <stdio.h>
extern unsigned long rotate(unsigned long val, unsigned long num, unsigned long direction);
/*unsigned long rotate(unsigned long val, unsigned long num, unsigned long direction){
    num = num%64;
    unsigned long high = 0, low = 0;
    unsigned long lowaux = 1,highaux = 1;
    unsigned long i;
    if(direction == 0){
        for(i = 0; i<num; i++){
            low = lowaux+low;
            lowaux = lowaux<<1;
        }
    lowaux = (val&low)<<(64-num);
    highaux = (val-low)>>num;
        return lowaux+highaux;
    }
    if(direction == 1){
        for(i = 0; i<64-num; i++){
            low = lowaux+low;
            lowaux = lowaux<<1;
        }
    lowaux = (val&low)<<num;
    highaux = (val-low)>>(64-num);
        return lowaux+highaux;
    }
}

int main(){
    unsigned long val, num, direction;
    unsigned long result;
    scanf("%lx %ld %ld",&val,&num,&direction);
    result = rotate(val,num,direction);
    printf("%#lX\n",result);
    return 0;
}
