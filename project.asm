
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL small
.STACK 100h
.DATA
    array DW 1, 5, 6, 10, 9, -3, 2
    indexArray DW 0, 1, 2, 3, 4, 5, 6
    sumStr DB 10 DUP('$') 
    sum    DW 0           

.CODE
Start:
    mov ax, @DATA      
    mov ds, ax

    mov cx, 7          
    xor bx, bx        
    xor si, si        

sum_products:
    mov ax, [array + bx]  
    test ax, 1            
    jnz skip_addition      

    mov di, [indexArray + bx]  
    imul di                   
    add si, ax                
    adc si, dx              

skip_addition:
    add bx, 2                 
    loop sum_products         

   
    mov ax, si
    
   
    lea di, sumStr + 9 
    mov [di], '$'     
    dec di             

convert_to_string:
    xor dx, dx         
    mov bx, 10         
    div bx             
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




