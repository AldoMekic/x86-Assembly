
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL small 
.DATA 
.STACK 
.CODE 

unos MACRO 
    mov ah, 01h 
    int 21h 
ENDM

ispis PROC NEAR 
    mov ah, 02h 
    int 21h  
ispis ENDP


Start: 
unos 
mov dl, al


 
call ispis 
call ispis 
mov ax, 4c00h 
int 21h 
END Start
           
 
 


ret




