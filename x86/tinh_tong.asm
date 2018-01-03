section .text
    global _main
    extern _printf
    extern _scanf
    extern _getch
    
tinhtong:
    add eax, esi        ;eax = eax + ebx
    inc esi             ;i++
    cmp esi, edx
    jle tinhtong        ;i <= n, continue
    
    mov ebx, eax
    ret
inketqua:
    ;print out msg and result
    push msg_out
    call _printf
    add esp, 4
    
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
    mov edx, DWORD[n]     ; ebx = n
    mov esi, 0            ; i = 0
    mov eax, 0            ; result = 0
    
    call tinhtong
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
    msg_out: db "Tong 1 -> n: ", 0
    fmd: db "%d", 0

section .bss
    n: resb 4