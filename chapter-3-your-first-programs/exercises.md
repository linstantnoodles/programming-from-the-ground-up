#### Concepts
*What does if mean if a line in the program starts with the ’#’ character?*

It's a comment! These lines will be ignored by the assembler.

*What is the difference between an assembly language file and an object code file?*

An assembly language file contains the text that an assembler uses to create an object code file. It's the text that we wrote. Object code is lower level and closer to machine code. It's also used during the linking phase to link to other assembled programs.

*What does the linker do?*

It links object code files with other code files - allowing you to combine different programs that you've assembled.

*How do you check the result status code of the last program you ran?*

You load the status number into a special register (%ebx). And when the program exits with that code in %ebx, calling echo $? will print out the status code.

*What is the difference between movl $1, %eax and movl 1, %eax?*

`movl %1, %eax` copies the number one to the register %eax using immediate mode. `movl 1, %eax` copies the value in address `1` into the register %eax using direct addressing mode.

*Which register holds the system call number?*

`%eax` does. When an interrupt runs, it checks that register to figure out which system call to use.

#### Exercises

*Modify the first program to return the value 3.*

Just remove the `start_loop` label and it's values.

*Modify the maximum program to find the minimum instead.*

Change the terminating character to be the largest number.

```
.long 3,67,24,222,45,75,54,34,44,33,22,11,6,256
```

*Modify the maximum program to use the number 255 to end the list rather than the number 0*

Already did something like this to find the minimum! See above.

*Modify the maximum program to use an ending address rather than the number 0 to know when to stop.*

I saved the index for the 14th word (13) inside a register and then referenced the 0 by address inside the `start_loop`.

```
cmpl data_items(,%ecx,4), %eax
```

*Modify the maximum program to use a length count rather than the number 0 to know when to stop.*

Inside `start_loop`, do `cmpl %ecx, %edi` with 13 loaded into the `%ecx` register.

*What would the instruction movl _start, %eax do? Be specific, based on your knowledge of both addressing modes and the meaning of _start. How would this differ from the instruction movl $_start, %eax?*

`movl _start, %eax` will use direct addressing mode to copy the first four bytes (a whole word) of the program instruction location into the `%eax` register. By adding a dollar sign, we'll be using immediate mode which means "load the word `_start` into the register %eax".
