; __fload @ 0x10104404 — auto-synthesized
.CODE
__fload PROC
    push ebp
    mov ebp, esp
    add esp, -0xc
    push ebx
    mov ax, word ptr [ebp + 0xe]
    mov bx, ax
    and ax, 0x7ff0
    cmp ax, 0x7ff0
    jne L0
    or bx, 0x7fff
    mov word ptr [ebp - 2], bx
    mov eax, dword ptr [ebp + 0xc]
    mov ebx, dword ptr [ebp + 8]
    shld eax, ebx, 0xb
    mov dword ptr [ebp - 6], eax
    mov dword ptr [ebp - 0xa], ebx
    fld xword ptr [ebp - 0xa]
    jmp L1
    fld qword ptr [ebp + 8]
    pop ebx
    leave
    ret
__fload ENDP
END