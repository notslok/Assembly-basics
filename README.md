# Assembly-basics
Brushing up x86 and 8086 asm

## 8086 execution(linux):
 ----- used emu8086 emulator ------
 
## x86 execution(linux):

1) **nasm -f elf64 <filename.asm> -o <filename.o>**     // generating object code using nasm package of linux

2) **ld <filename.o> -o \<filename\>**                  // using GNU linker "ld" to link object file to get executable

3) **./\<filename\>**                                   // runnig executablle to get output
