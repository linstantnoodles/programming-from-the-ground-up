#### Concept

*Describe the fetch-execute cycle.*

In the Von Neumman architecture of a computer, there is a central processing unit (CPU) and then there is memory. These are the two primary components that deals with computation. The CPU is further divided into several sub components:

* Program counter
* Instruction decoder
* Data bus
* Registries 
* Arithmetic logic unit

The fetch-execute cycle of the CPU describes how the CPU processes instructions issued by programs. In the fetching part, the CPU looks at the program counter which is the location of the next instruction it needs to interpret and execute. It then fetches the instruction containing the operation to execute and the data, which is then decoded using the instruction decoder. If the instruction points to data with memory addresses, it goes and gets them using the data bus. Once it has all the data it needs to run the operation on, the operation is then executed by the arithmetic logic unit. 

*What is a register? How would computation be more difficult without registers?*

A register is a memory location that's on the CPU itself. The purpose of the registers is to store data that the CPU is currently working with. Kind of like the items that's currently on a work bench. Since it's on the CPU, the CPU is able to process information in the registers more quickly than if they were located elsewhere.

*How do you represent numbers larger than 255?*

A byte is the smallest unit of storage on most computers. A single byte represents eight bits. A single bit can represent two things. 2 ^ 8 = 256. Therefore, it can represent 256 things or the numbers 0 - 255. Those things can be numbers and if you want to represent a number bigger than 255, you must add another unit of storage, which is to say you must add another byte.

*How big are the registers on the machines we will be using?*

4 bytes or 32 bits or a "word". When we say that a computer has a 32 bit processor, it's referring to the size of the registers on the CPU.

*How does a computer know how to interpret a given byte or set of bytes of memory?*

It knows how to interpret it based on the instructions given to it by the program. The instructions issued by program A might tell the CPU to treat the byte of information as an address whereas another instruction by program B might tell it to treat it like an integer.

Put another way, you can have two bytes that are exactly the same but used completely differently. And it's in how they're used / interpreted that makes it useful. Having just raw numbers is not useful as far as we, the end users, are concerned.

*What are the addressing modes and what are they used for?*

They tell the CPU how to access data. Does it treat the byte as an address or as a number? In other words, does the data come with the instruction or does the instruction contain an address to the data that lives elsewhere?

Immediate - Data is in the instruction
Register addressing - Data is in the register specified in the instruction
Direct addressing - Address to the data
Indexed direct addressing - Address to the data and the register (AKA index register, a special purpose register) containing an offset number
Indirect addressing - A register containing a pointer to the data. The pointer is not the data - it points to the data. So if the pointer is 2002, it will go to the location 2002 to fetch the data. The indirect part refers to the indirectness of the memory address - not to the data! Pretty much any address in memory is a pointer. Whether that's an address in the register or an address in the instruction. 
Base pointer indirect addressing - A register container a pointer to the data and an offset number. Kind of like an indexed indirect addressing. Except instead of pointing to an index register, it includes the actual offset number in the instruction. 

*What does the instruction pointer do?*

Instruction pointer is a special purpose register than containers a pointer to an instruction.
