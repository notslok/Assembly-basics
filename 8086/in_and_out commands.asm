
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov al, 'A'     ; moving hex('A') to register al
out 130, al     ; output value stored in register al, to the virtual device(printer.exe) at port 130d(ecimal)

in al, 110      ; write valuein register al from port 110... allocated to simple.exe
ret




