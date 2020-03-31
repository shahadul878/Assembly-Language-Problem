.MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT  DB 10,13, 'The Upper Case Letters from A to Z are : $\'
    
    PROMPT2  DB 10,13, 'The Lower Case Letters from a to z are : $\'
    
    PROMPT3  DB 10,13, 'Show 0-9 Number : $\'


 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS 
     MOV DS, AX

     LEA DX, PROMPT               ; load and print PROMPT 
     MOV AH, 9
     INT 21H

     MOV CX, 26                   ; initialize CX

     MOV AH, 2                    ; set output function  
     MOV DL, 65d                  ; initialize DL=A

     @WHILE_LOOP:                 ; loop label
       CMP CX, 0                  ; compare CX and 0

       JE @END_LOOP               ; jump to label @END_LOOP if CX=0

       INT 21H                    ; print character

       INC DL                     ; increment DL to next ASCII character
       DEC CX                     ; decrement CX
     JMP @WHILE_LOOP              ; jump to label @WHILE_LOOP

     @END_LOOP:                   ; jump label
     
     
     LEA DX, PROMPT2              ; load and print PROMPT2 
     MOV AH, 9
     INT 21H

     MOV CX, 26                   ; initialize CX

     MOV AH, 2                    ; set output function  
     MOV DL, 97d                  ; initialize DL=A

     @WHILE_LOOP2:                 ; loop label
       CMP CX, 0                  ; compare CX and 0

       JE @END_LOOP2               ; jump to label @END_LOOP if CX=0

       INT 21H                    ; print character

       INC DL                     ; increment DL to next ASCII character
       DEC CX                     ; decrement CX
     JMP @WHILE_LOOP2              ; jump to label @WHILE_LOOP

     @END_LOOP2:                   ; jump label
     
     
     LEA DX, PROMPT3              ; load and print PROMPT3 
     MOV AH, 9
     INT 21H

     MOV CX, 9                   ; initialize CX

     MOV AH, 2                    ; set output function  
     MOV DL, 49d                  ; initialize DL=A

     @WHILE_LOOP3:                 ; loop label
       CMP CX, 0                  ; compare CX and 0

       JE @END_LOOP3               ; jump to label @END_LOOP if CX=0

       INT 21H                    ; print character

       INC DL                     ; increment DL to next ASCII character
       DEC CX                     ; decrement CX
     JMP @WHILE_LOOP3              ; jump to label @WHILE_LOOP

     @END_LOOP3:                   ; jump label
     
     
     
     

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN