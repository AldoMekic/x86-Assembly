
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL small
.STACK 100h
.DATA
    array DW 100, 200, 300, 400, 500, 600, 700
    sum   DB 10 DUP('$')  
    length DB 0          

.CODE
Start:
    mov ax, @DATA      
    mov ds, ax

    mov cx, 7           
    lea bx, array       
    xor ax, ax          

sum_loop:
    add bx, 2           
    loop sum_loop       

   
    lea di, sum + 9     
    mov [di], '$'       
    dec di              

convert_to_string:
    xor dx, dx          
    mov cx, 10          
    div cx              
    add dl, '0'         
    mov [di], dl        
    dec di              
    test ax, ax         
    jnz convert_to_string 
    inc di              

   
    mov ah, 09h         
    mov dx, di          
    int 21h             

    
    mov ax, 4C00h
    int 21h
END Start

ret




