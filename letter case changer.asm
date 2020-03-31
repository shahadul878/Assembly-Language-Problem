.model small
.stack 200H
.data
mgs1 DB 'Enter a character: $ '
mgs2 DB 10,13, 'Invalid  character $ '
mgs3 DB 10,13, 'Upper to lower case  character $ '
mgs4 DB 10,13, 'Lower to Upper case  character $ '
.code 
main PROC 
    MOV AX,@data
    MOV DS,AX
    
    MOV AH,9
    LEA DX,mgs1
    INT 21h
    
    MOV AH,1
    INT 21h
    MOV BL,AL
    
    CMP BL,41h
    JL notchar
    
    CMP BL,5Ah
    JLE UCLC
    
    
    CMP BL,7Ah
    JLE LCUC
   
   notchar:    
    MOV AH,9
    LEA DX,mgs2
    INT 21h
    JL exit 
   
   UCLC: 
    MOV AH,9
    LEA DX,mgs3
    INT 21h
     
    ADD BL, 20h
   
                   
    MOV AH,2
    MOV DL,BL
    INT 21h
    
    MOV AH,4ch
    INT 21h 
   
   LCUC:
   
    MOV AH,9
    LEA DX,mgs4
    INT 21h
     
    SUB BL, 20h
   
                   
    MOV AH,2
    MOV DL,BL
    INT 21h 
    JL exit   
   
   
   
   
 EXIT:   
    MOV AH,4ch
    INT 21h
    
    
    
    main ENDP
     
     
     
     
END main
    