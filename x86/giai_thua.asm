section .text
    global _main
    extern _printf
    extern _scanf
    extern _getch
    
giaithua:
    ;return n!
    mul esi       ;eax = eax * esi
    add esi, -1   ;i--
    cmp esi, 1    
    jge giaithua  ;esi >= 1, continue
    
    mov ebx, eax
    ret           ;return ebx

inketqua:
    ;print msg out
    push msg_out
    call _printf
    add esp, 4
    
    ;print result
    push ebx
    push fmd
    call _printf
    add esp, 8    
        
    ret 
           
 _main: 
    ;create stack frame
    push ebp
    mov ebp, esp
    pushad
    
    ;print msg and read n
    push msg_in
    call _printf
    add esp, 4
    
    push n
    push fmd
    call _scanf
    add esp, 8
    
    ;let's go
    mov esi, DWORD[n]     ; i = n 
        
    call giaithua
    call inketqua
exit:
    ;destroy stack frame
    popad
    mov esp, ebp
    pop ebp
    call _getch
    ret   
section .data
    msg_in: db "Nhap n: ", 0
    msg_out: db "!N (n giai thua) = ", 0
    
    fmd: db "%d", 0
section .bss
    n: resb 4