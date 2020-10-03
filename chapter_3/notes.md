## etc
* 1 byte is a number between 0 and 255
* A register is typically 4 bytes
* Addresses are 4 bytes long
* everything that starts with a period is an instruction to the assembler
* .globl tells the assembler not to discard the symbol because the linker will need it
* dollar sign ($) = immediate mode addressing
* without dollar sign ($) = direct addressing
* system call number has to be loaded into %eax
* int = interrupt

## sytem calls
> int 0x80 system call requires %eax and %ebx, other system calls might require other registers to be loaded.

## general purpose registers
* %eax
* %ebx
* %ecx
* %edx
* %edi
* %esi

## special purpose registers
* %ebp
* %esp
* %eip
* %eflags

## memory locations
> There are several different types of memory locations other
> than .long that can be reserved. The main ones are as follows:
### .byte
> Bytes take up one storage location for each number. They are limited to
> numbers between 0 and 255.
### .int
> Ints (which differ from the int instruction) take up two storage locations for
> each number. These are limitted to numbers between 0 and 65535.9
### .long
> Longs take up four storage locations. This is the same amount of space the
> registers use, which is why they are used in this program. They can hold
> numbers between 0 and 4294967295.
### ascii
> The .ascii directive is to enter in characters into memory. Characters each
> take up one storage location (they are converted into bytes internally). So, if
> you gave the directive .ascii "Hello there\0", the assembler would
> reserve 12 storage locations (bytes). The first byte contains the numeric code
> for H, the second byte contains the numeric code for e, and so forth. The last
> character is represented by \0, and it is the terminating character (it will
> never display, it just tells other parts of the program that that’s the end of the
> characters). Letters and numbers that start with a backslash represent
> characters that are not typeable on the keyboard or easily viewable on the
> screen. For example, \n refers to the "newline" character which causes the

# flow control instructions
* je = jump if equal
* jg = jump if b > a
* jge = jump if b >= a
* jl = jump if b < a
* jle = jump if b <= a
* jmp = jump unconditionally
