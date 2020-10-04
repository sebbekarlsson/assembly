rm *.o
as --32 power.s -o power.o
ld power.o -o power -m elf_i386 && ./power
echo $?
