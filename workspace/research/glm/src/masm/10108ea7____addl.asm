.686
.MODEL FLAT, C
.CODE
___addl PROC
    mov edx, dword ptr [esp + 4]
    push esi
    mov esi, dword ptr [esp + 12]
    lea ecx, [edx + esi]
    xor eax, eax
    cmp ecx, edx
    jb L0
    cmp ecx, esi
    jae L1
L0:
    xor eax, eax
    inc eax
L1:
    mov edx, dword ptr [esp + 16]
    mov dword ptr [edx], ecx
    pop esi
    ret
___addl ENDP
END
