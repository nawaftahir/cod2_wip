; FUN_100864e9 @ 0x100864e9 — auto-synthesized
.CODE
FUN_100864e9 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0x10]
    mov eax, dword ptr [eax + 0x14]
    mov ecx, dword ptr [ebp + 8]
    mov edx, dword ptr [ebp + 0xc]
    mov edx, dword ptr [eax + edx*4]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [ecx + 4]
    push esi
    mov esi, dword ptr [edx + 4]
    cmp eax, esi
    jb L0
    ja L1
    fld qword ptr [ecx + 0x20]
    fcomp qword ptr [edx + 0x20]
    fnstsw ax
    test ah, 5
    jp L2
    or eax, 0xffffffff
    jmp L3
    fld qword ptr [ecx + 0x20]
    fcomp qword ptr [edx + 0x20]
    fnstsw ax
    test ah, 0x41
    jne L4
    xor eax, eax
    inc eax
    jmp L3
    xor eax, eax
    pop esi
    pop ebp
    ret 0xc
FUN_100864e9 ENDP
END