# %edi - hold the index of the current data
# %ebx - largest data item found
# %eax - current data item


.section .data

# here, data_items refer to the first byte in our list
data_items:
  # here, .long tells the assembler to reserve memory for our list
  .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text

.globl _start

_start:
  movl $0, %edi # we start at zero
  movl data_items(,%edi, 4), %eax # load first bytes of data (each register is 4 bytes)
  movl %eax, %ebx # start by assuming the item we have found is the biggest

compute_loop:
  cmpl $0, %eax # is our current item zero?
  je compute_loop_exit # then exit the loop
  incl %edi # else move along to next value
  movl data_items(, %edi, 4), %eax # load next value
  cmpl %ebx, %eax # compare current biggest value with current value
  jle compute_loop # restart loop if the new is not bigger
  movl %eax, %ebx # else set new value as biggest
  jmp compute_loop # restart loop

compute_loop_exit:
  # %ebx contains the biggest value, let's not populate it and use this value as a status code
  movl $1, %eax # tell program to exit
  int $0x80 # call the kernel
