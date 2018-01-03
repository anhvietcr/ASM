section .text
    global _main
    extern _printf
    extern _scanf
    extern _getch
    
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
    
    ;load address array to register, init i = 0
    mov ebx, array
    mov esi, 0
    
    ;let's go
    call Nhap
    call Xuat 
    call exit
    
Xuat:
    ;print out array[i]
    push DWORD [ebx]
    push fmd
    call _printf
    add esp, 8
    
    ;+stack pointer, +i
    add esi, 1
    add ebx, 4
    cmp esi, DWORD[n]    
    jl Xuat
    
    ret
Nhap:
    ;printf msg read i
    push msg_in_index
    call _printf
    add esp, 4
    
    ;read array[i]
    push ebx
    push fmd
    call _scanf
    add esp, 8
    
    ;+stack pointer, +i
    add ebx, 4
    add esi, 1
    cmp esi, DWORD[n]
    jl Nhap
    
    ;reset i & stack
    mov ebx, array
    mov esi, 0
    
    ret
exit:                                         
    ;destroy stack frame
    popad
    mov esp, ebp
    pop ebp
    call _getch
    ret
    
section .data
    msg_in: db "Nhap n: ", 0
    msg_in_index: db ">_ ", 0
    space: db " ", 0
    fmd: db "%d", 0

section .bss
    n: resb 4
    array: resb 20