.section .data

.section .text
.globl _start


_start:
  movl $1, %eax # prepare call to linux kernel
  movl $0, %ebx # set status code for program

  int $0x80
