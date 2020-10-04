## The stack
* the top of the stack is actually the bottom
* `pushl` pushes a register or memory value onto the top of the stack
* `popl` removes the top value from the stack and places it into a register or memory
* `%esp` always contains a pointer to the top of the stack
* `%eip` = instruction pointer
* `%ebp` = stack base pointer register
* `ret` pops top value of stack and sets `%eip` to that value
* `%eax` contains the return value

> `movl (%esp), %eax`  
> moves the value of the top of the stack into `%eax`  
> `movl %esp, %eax`  
> moves the pointer of the top of the stack into `%eax`  
> `movl 4(%esp), %eax`  
> puts the value below the top of the stack into `%eax`  
> `subl $8, %esp` moves the stack pointer down two words to reserve some space
