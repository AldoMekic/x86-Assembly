
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL small 
.DATA 
    string1 DB "Broj je manji od 5 !$" 
    string2 DB "Broj je veci od 5 !$" 
    string3 DB "Unijeli ste broj 5 !$" 
.STACK 
.CODE 
Start: 
    mov ax, @DATA 
    mov ds, ax 
    mov ah, 01h 
    int 21h 
    cmp al, '5' 
    je pet 
    jg veci 
    mov dx, OFFSET string1 
    mov ah, 09h 
    int 21h 
    jmp kraj 
    pet: 
        mov dx, OFFSET string3 
        mov ah, 09h 
        int 21h 
        jmp kraj 
    veci: 
        mov dx, OFFSET string2 
        mov ah, 09h 
        int 21h 
    kraj: 
    mov ax, 4c00h 
    int 21h 
END Start

ret




