section .text
    global _main
    extern _printf
    extern _gets
    extern _getch

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
    
    ;print msg and read string
    push msg_in
    call _printf
    add esp, 4
    
    push string
    push fms
    call _gets
    add esp, 8
    
    ;printout this result
    mov eax, string
    push eax
    push fms
    call _printf
    add esp, 8
    
    ;exit program
    jmp exit

section .data
    msg_in: db "Nhap 1 chuoi: ", 0
    fms: db "%s", 0
section .bss
    string: resb 20