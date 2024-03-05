
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL small 
.STACK 100h
.DATA 

.CODE 
Start: 
    mov ah, 01h 
    int 21h 

    mov dl, al 

    call ispis 
    call ispis 

    mov ax, 4c00h 
    int 21h 

    ispis PROC NEAR 
        mov ah, 02h 
        int 21h 
        ret 
    ispis ENDP 

    END Start
 
 


ret




