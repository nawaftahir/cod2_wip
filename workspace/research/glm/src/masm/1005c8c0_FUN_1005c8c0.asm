.686
.MODEL FLAT, C
.CODE
FUN_1005c8c0 PROC
    push ebx
    push ebp
    push edi
    mov edi, edx
    add ecx, 24
    sub edi, eax
    mov ebp, 3
    nop
L0:
    mov edx, dword ptr [edi + eax]
    mov dword ptr [eax], edx
    mov edx, dword ptr [edi + eax]
    mov dword ptr [eax + 12], edx
    mov ebx, dword ptr [ecx - 24]
    xor edx, edx
    test ebx, ebx
    setge dl
    mov ebx, esi
    dec edx
    and edx, 12
    fld dword ptr [edx + esi]
    sub ebx, edx
    fmul dword ptr [ecx - 24]
    xor edx, edx
    fadd dword ptr [eax]
    fstp dword ptr [eax]
    fld dword ptr [ebx + 12]
    fmul dword ptr [ecx - 24]
    fadd dword ptr [eax + 12]
    fstp dword ptr [eax + 12]
    mov ebx, dword ptr [ecx - 12]
    test ebx, ebx
    setge dl
    mov ebx, esi
    dec edx
    and edx, 12
    fld dword ptr [esi + edx + 4]
    sub ebx, edx
    fmul dword ptr [ecx - 12]
    xor edx, edx
    fadd dword ptr [eax]
    fstp dword ptr [eax]
    fld dword ptr [ebx + 16]
    fmul dword ptr [ecx - 12]
    fadd dword ptr [eax + 12]
    fstp dword ptr [eax + 12]
    mov ebx, dword ptr [ecx]
    test ebx, ebx
    setge dl
    mov ebx, esi
    add eax, 4
    add ecx, 4
    dec edx
    and edx, 12
    fld dword ptr [esi + edx + 8]
    sub ebx, edx
    dec ebp
    fmul dword ptr [ecx - 4]
    fadd dword ptr [eax - 4]
    fstp dword ptr [eax - 4]
    fld dword ptr [ebx + 20]
    fmul dword ptr [ecx - 4]
    fadd dword ptr [eax + 8]
    fstp dword ptr [eax + 8]
    jne L0
    pop edi
    pop ebp
    pop ebx
    ret
FUN_1005c8c0 ENDP
END
