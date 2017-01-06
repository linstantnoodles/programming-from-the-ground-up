# My first assembly program!

.section .data

.section .text

._globl _start
_start:
    movl $1, %eax # Load the number 1 into the general purpose register %eax. 1 is the number of the exit system call (will be used later). %eax is always required to be loaded with system call number if you're going to make a system call.
    movl $0, %ebx # Load number 0 as the status code parameter for the system call into a different register.
    int $0x80  # int stands for interrupt. Signals to the kernal to interupt current program to perform a system call with interrupt number 0x80, which is also known as a interrupt vector which determines the type of interrupt.

