
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
; stosb ---> stores/writes byte in AL register into  es:[di] and updates di by (+/-)1 depending on df flag


mov al, 'A'
mov di, message     ;storing message in di
stosb               ; 'Hello world' becomes 'Aello World'

ret

message: db 'Hello world', 0




