#define ROJO_IN       0x80001600
#define ROJO_OUT      0x80001604
#define ROJO_EN       0x80001608    // active low enable

.globl main
main:

li a2, 0x0000FFFF       // load number 
li a3, ROJO_EN          // load enable address
sw a3, 0(a2)            // enable 

li a2, 0x0000F7F0       // load number 
li a3, ROJO_OUT         // load address
sw a2, 0(a3)            // write word

li a3, ROJO_IN         // load address
lw a2, 0(a3)            // write word

.end