.section .data

.section .text

.globl _start
_start:
  pushl $5 # push second argument
  pushl $2 # push first argument
  call multiply # call our function
  addl $8, %esp # move stack pointer back
  movl %eax, %ebx # store result from function into %ebx

  movl $1, %eax # exit (%ebx is returned)
  int $0x80

.type multiply, @function
multiply:
  pushl %ebp # save old base pointer
  movl %esp, %ebp # make stack pointer the base pointer
  subl $4, %esp # make room for our local variables
  movl 8(%ebp), %eax # put first argument in %eax
  movl 12(%ebp), %ecx # put second argument in %ecx

  imull %eax, %ecx # multiply the current result by the base numbr

  # local variable
  movl %ecx, -4(%ebp) # store current result

  # end
  movl -4(%ebp), %eax # put return value in %eax
  movl %ebp, %esp # restore stack pointer
  popl %ebp # restore base pointer
  ret
