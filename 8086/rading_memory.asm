
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h                     ; sets IP to 0x0100

mov [0x00], 0x30 ; written at 0x0000 addresses away from offset of 0x0700 given as offset in register DS

mov bx, 0xfff0
mov [bx], 0x30  ;moves 0x30 to address 0xfff0 i.e stored in register bx....[.] works like dereferencing 
                ;ax register cant be used in such a way
                
mov word [bx], 0xff ;changes two bytes at the addressed stored in register bx
mov byte [bx], 0xff ;changes one bytes at the addressed stored in register bx

; reading data from memory to a register

mov ax, 0x00 ;reading data stored in address 0700:0000 in register ax
;also
mov bx, 0xff0 ; storing address in bx
mov ax, [bx]  ; reading the value stored in the address stored by bx in ax
ret




