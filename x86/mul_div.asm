section .text
    global _main
    extern _printf
    extern _scanf
    extern _getch
NHAN:
    push msg_out_mul
    call _printf
    add esp, 4

    ;edx:eax / hi:lo
    mov eax, DWORD[a]
    mul DWORD[b]
    push eax
    push fmd
    call _printf
    add esp, 8
    
    push line 
    call _printf
    add esp, 4
        
CHIA:
    push msg_out_div
    call _printf
    add esp, 4
    
    ;edx:eax / hi:lo
    mov eax, DWORD[a]
    div DWORD[b]
    push eax
    push fmd
    call _printf
    add esp, 8
    
    push line 
    call _printf
    add esp, 4
MOD:
    push msg_out_mod
    call _printf
    add esp, 4
    
    ;edx:eax / hi:lo
    mov eax, DWORD[a]
    div DWORD[b]
    push edx
    push fmd
    call _printf
    add esp, 8
    
    push line 
    call _printf
    add esp, 4
exit:
    ;destroy stack frame
    popad
    mov esp, ebp
    pop ebp
    call _getch
    ret
_main:
    ;create stack frame
    push ebp
    mov ebp, esp
    pushad
    
    ;print msg and read a
    push msg_in
    call _printf
    add esp, 4
    push a
    push fmd
    call _scanf
    add esp, 8
    
    ;print msg and read b
    push msg_in
    call _printf
    add esp, 4
    push b
    push fmd
    call _scanf
    add esp, 8
            
    jmp NHAN
    jmp CHIA
    jmp MOD
    jmp exit
   
section .data
    msg_in: db "Nhap 1 so: ", 0
    msg_out_mul: db "Nhan: ", 0
    msg_out_div: db "Chia: ", 0
    msg_out_mod: db "So du: ", 0
    line: db "", 10, 0
    fmd: db "%d", 0
section .bss
    a: resb 4
    b: resb 4