Here's my attempt at breaking down what's going on in maximum.s after reading the book.

First, here's the entire program.

```
.section .data

data_items:
    .long 3,67,24,222,45,75,54,34,44,33,22,11,6,0

.section .text

.globl _start
_start:
    movl $0, %edi
    movl data_items(,%edi,4), %eax
    movl %eax, %ebx

start_loop:
    cmpl $0, %eax
    je loop_exit
    incl %edi
    movl data_items(,%edi,4), %eax
    cmpl %ebx, %eax
    jle start_loop

    movl %eax, %ebx
    jmp start_loop

loop_exit:
   movl $1, %eax
   int $0x80
```

Now, lets go through each section of this source code.

```
.section .data

data_items:
    .long 3,67,24,222,45,75,54,34,44,33,22,11,6,0
```

We learned earlier this chapter that any instructions beginning with `.` are instructions for the assembler. The first line, `.section .data` is telling the assembler that we're about to define what type of data we want to store and what we want to call the location for where that data is stored. `data_items:` means we're creating a symbol called `data_items` that represents values which tell the assembler what type of data we're storing and what their values are.

In the next section, we have three symbols that represent the three main sets of actions in our program. `.section .text` is a pseudo operation that tells the assembler that what follows is the text that makes up the program source code. In other words, the instructions are actually run by the CPU.

`_start` tells linux where to start fetching the instructions (text) for this program to run. Inside `_start`, the first three instructions loads the data we need to find the maximum into the registers.

`movl %0, %edi` means move a long type value zero into the index register. This index represents the position in the list of the number we're looking at. We should expect this to change if since program contains more than one number.

`movl data_items(,%edi,4), %eax` means move the long type data at the address `data_items` using index register which contains our index value and the multiplier 4 into the register %eax which represents the current value we're looking at. This instruction tells the CPU to use indexed addressing mode which takes the general form of `ADDRESSS(,REGISTER_CONTAINING_INDEX, MULTIPLIER_VALUE)`. That means it will go to the location of (address represented by `data_items`) + (0 * 4). We use the number 4 because we're going to be moving our index by four bytes since each long type number takes up four bytes of storage. This will allow us to move forward one word at a time. It's not necessary here since anything mulitplied by zero is zero, but it's still good because it makes it explicit from the very beginning how we'll be accessing our data.

`movl %eax, %ebx` means copy the long in register %eax into %ebx which represents the current maximum. We'll be keeping track of what the current maximum is. In this case, since we've only looked at one number (the first number), that number is our maximum.

We can now start going through our numbers to try to find our maximum. The instructions we'll use to do that is inside the `start_loop`, which represents the section of our program that might be run over and over again (I think `start_loop` is a special keyword that lets the CPU know that).

```
cmpl $0, %eax
je loop_exit
```

This means compare the number zero with the value in %eax. We use zero to denote the end of our list (we need some marker for when we're done looking at values in our list). Once the comparison is done, store the result in some special purpose register. `je` means `jump if equal` and that means if the value in the special register for comparison operations is zero (the two values in the previous comparison were zero), run the instructions at the loop_exit section of the program.

```
incl %edi
movl data_items(,%edi,4), %eax
cmpl %ebx, %eax
jle start_loop

movl %eax, %ebx
jmp start_loop
```

`incl %edi` says increment the value in %edi by one. Next, we use direct addressing to copy the second number into the %eax register which holds the current (new) number that will be evaluated. Finally, we do a comparison between the current maximum inside %ebx with this value. If the second value (in %eax) is less than or equal to the first value (it's not a new maximum!) then we will rerun the instructions at `start_loop`. Otherwise, we will update the maximum by moving the new value into the register `%ebx` which holds the maximum!


### Addressing modes

movl ADDRESS, %eax - Direct addressing
movl string_start(,%ecx,1), %eax - indexed direct addressing
movl (%eax), %ebx - indirect addressing
movl  4(%eax), %ebx - base pointer address
movl $12, %eax - immediate

### Moving data less than 4 bytes (not long).

If you try this command: 

`movb $12, %edx`

You'll get the error: `Error: incorrect register `%edx' used with `b' suffix`

You can't do move byte commands on a full register (4 bytes). Registers an be referenced by two bytes as well as one byte (smallest). For %edx, th two byte part of the register can be referenced by %dx. If you want to do one byte at a time, you can reference the single byte parts of %dx, %dl (least significant half) and %dh (most significant half).

*What's the difference between pseudo-operations or assembler directives and program instructions? Aren't they all ultimately instructions?*
*How does the assembler know which portion of the source code is the loop? is `start_loop` a special symbol, like `_start`?*
*What's the difference between `_start` and `_start:`?*
*What register gets the values from comparison operations?*
The `%eflags` register.
*How come when I add numbers greater thant 255 to the list, the output of `echo $?` is weird? For example, if the max is 333, I get an output of 77. If it's 256, I get an output of 0. Huh?*
* http://www.tldp.org/LDP/abs/html/exitcodes.html
* http://stackoverflow.com/questions/18536693/what-does-echo-mean-in-bash
* http://stackoverflow.com/questions/7248031/meaning-of-in-shell-scripts
* 333 % 256 = 77!

Is some program setting the value of $? to a number between 0 and 255?

"Unix exit statuses are restricted to values 0-255, the range of an unsigned 8-bit integer.". [main return value range](http://stackoverflow.com/questions/5149228/main-return-value-range).

