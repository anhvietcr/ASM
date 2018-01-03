section .text
    extern _printf
    extern _scanf
    extern _getch
    global _main
    
CONG:
    ;print msg and a + b
    push msg_out_add
    call _printf
    add esp, 4
    
    mov eax, DWORD[a]
    add eax, DWORD[b]
    push eax
    push fmd
    call _printf
    add esp, 8
    
    push line
    call _printf
    add esp, 4

TRU:
    ;print msg and a - b
    push msg_out_sub
    call _printf
    add esp, 4
    
    mov eax, DWORD[a]
    sub eax, DWORD[b]
    push eax
    push fmd
    call _printf
    add esp, 8

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
    
    ;print msg and get var a
    push msg_in
    call _printf
    add esp, 4
    push a
    push fmd
    call _scanf
    add esp, 8
    
    ;print msg and get var b
    push msg_in
    call _printf
    add esp, 4
    push b
    push fmd
    call _scanf
    add esp, 8

    jmp CONG
    jmp TRU
    jmp exit
    
section .data
    msg_in: db "Nhap 1 so: ",0
    msg_out_add: db "Cong: ", 0
    msg_out_sub: db "Tru: ", 0
    line: db "", 10, 0
    fmd: db "%d", 0
section .bss
    a: resb 4
    b: resb 4