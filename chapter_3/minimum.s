# %edi - hold the index of the current data
# %ebx - smallest data item found
# %eax - current data item


.section .data

# data_items points to the first byte it holds
data_items:
  # tell the assembler to allocate 15 .longs
  # the zero in the end is to tell our program that the list is ending.
  .long 3,67,34,222,45,75,2,54,34,44,33,22,11,66,0

.section .text

.globl _start

_start:
  movl $0, %edi # we start at zero
  movl data_items(,%edi, 4), %eax # load first bytes of data (each register is 4 bytes)
  movl %eax, %ebx # start by assuming the item we have found is the biggest

next:
  # note: `cmpl` also affects the status register %eflags.
  cmpl %ebx, %eax # compare current smallest value with current value
  jge compute_loop # restart loop if b >= a
  movl %eax, %ebx # else set new value as smallest
  jmp compute_loop # restart loop

compute_loop:
  cmpl $0, %eax # is our current item zero?
  je compute_loop_exit # then exit the loop
  incl %edi # else move along to next value (incl = increment)
  movl data_items(, %edi, 4), %eax # load next value 

  cmpl $0, %eax # is our current item zero?
  je compute_loop_exit # then exit the loop
  jmp next # otherwise go to next

compute_loop_exit:
  # %ebx contains the biggest value, let's not populate it and use this value as a status code
  movl $1, %eax # tell program to exit
  int $0x80 # call the kernel
