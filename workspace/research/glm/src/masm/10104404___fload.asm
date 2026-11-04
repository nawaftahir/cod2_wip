.686
.MODEL FLAT, C
.CODE
__fload PROC
    push ebp
    mov ebp, esp
    add esp, -12
    push ebx
    mov ax, word ptr [ebp + 14]
    mov bx, ax
    and ax, 000007FF0h
    cmp ax, 000007FF0h
    jne L0
    or bx, 000007FFFh
    mov word ptr [ebp - 2], bx
    mov eax, dword ptr [ebp + 12]
    mov ebx, dword ptr [ebp + 8]
    shld eax, ebx, 11
    mov dword ptr [ebp - 6], eax
    mov dword ptr [ebp - 10], ebx
    fld xword ptr [ebp - 10]
    jmp L1
L0:
    fld qword ptr [ebp + 8]
L1:
    pop ebx
    leave
    ret
__fload ENDP
END
