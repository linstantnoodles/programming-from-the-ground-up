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

