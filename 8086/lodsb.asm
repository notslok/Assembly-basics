
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov si, message ; points to message label
lodsb   ; loads/reads byte at ds:[si] into al and depending on df flag...increments or decrements si by 1


ret                                     


message:    db 'Hello, world1', 0




