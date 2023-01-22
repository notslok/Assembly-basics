
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
 ;----add and subtract
;mov al, 20
;sub al, 2
;add al, 5

;----multiply
;mov al, 20 
;mov bl, 20
;mul bl      ; puts hex(20*20) in ax       

;mov ax, 5000
;mov bx, 20
;mul bx       ; ad the hex(5000*20) is too large, the product is stored using ax and dx registers   

;---------IMUL for negative number multiplication
;mov al, -2      
;mov bl, -4
;imul bl         ; stores (08) in al  



;=================Division

mov ax, 20
mov bl, 10
div bl      ; for small numbers stores  quotient in al and remainder in ah

mov dx, 0x0a
mov ax, 0xffff
mov bx, 400
div bx      ; for large numbers stores  quotient in ax and remainder in dx

mov bx, 0
div bx      ; now it will throw interrupt corresponding to division by 0 i.e. stored in 0x00 of interrupt vector table...which we can also change in 8086 to direct it to a custom interrupt handler

; for rest of the operation refer to the pdf...(http://www.gabrielececchetti.it/Teaching/CalcolatoriElettronici/Docs/i8086_instruction_set.pdf)

ret




