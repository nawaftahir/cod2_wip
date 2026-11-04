; FUN_1006e16c @ 0x1006e16c — auto-synthesized
    sub_1006c90d PROTO C
    sub_100f8c7f PROTO C
    sub_100f8cbb PROTO C
.CODE
FUN_1006e16c PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x10
    mov eax, dword ptr [ecx + 8]
    mov edx, dword ptr [eax + 0x14]
    mov eax, dword ptr [ebp + 8]
    push esi
    mov esi, dword ptr [edx + eax*4]
    test byte ptr [esi], 0x80
    je L0
    fld qword ptr [esi + 0x20]
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_100f8c7f
    test eax, eax
    pop ecx
    pop ecx
    je L1
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    je L2
    fld qword ptr [esi + 0x20]
    jmp L3
    lea edx, [ebp - 0x10]
    push edx
    push eax
    call sub_1006c90d
    test eax, eax
    jl L4
    fld qword ptr [ebp - 8]
    fld qword ptr [ebp - 0x10]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L1
    fld qword ptr [ebp - 0x10]
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_100f8cbb
    test eax, eax
    pop ecx
    pop ecx
    je L1
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    je L2
    fld qword ptr [ebp - 0x10]
    fstp qword ptr [eax]
    xor eax, eax
    jmp L4
    mov eax, 0x80004005
    pop esi
    leave
    ret 8
FUN_1006e16c ENDP
END