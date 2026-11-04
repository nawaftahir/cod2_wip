; FUN_1006c827 @ 0x1006c827 — auto-synthesized
    sub_100f8cc4 PROTO C
.CODE
FUN_1006c827 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x20
    mov eax, dword ptr [ebp + 0xc]
    mov edx, dword ptr [ebp + 0x10]
    fld qword ptr [eax]
    fmul qword ptr [edx]
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    fstp qword ptr [ebp - 0x20]
    push edi
    fld qword ptr [eax]
    xor ebx, ebx
    fmul qword ptr [edx + 8]
    fstp qword ptr [ebp - 0x18]
    fld qword ptr [edx]
    fmul qword ptr [eax + 8]
    fstp qword ptr [ebp - 0x10]
    fld qword ptr [eax + 8]
    fmul qword ptr [edx + 8]
    fstp qword ptr [ebp - 8]
    fld qword ptr [ecx + 0xa0]
    fstp qword ptr [esi]
    fld qword ptr [ecx + 0xa8]
    fstp qword ptr [esi + 8]
    push ecx
    lea edi, [ebp + ebx*8 - 0x20]
    fld qword ptr [edi]
    push ecx
    fstp qword ptr [esp]
    call sub_100f8cc4
    test eax, eax
    pop ecx
    pop ecx
    je L0
    test byte ptr [ebp + 0x14], 0x40
    jne L1
    fldz
    fstp qword ptr [edi]
    fld qword ptr [esi]
    fcomp qword ptr [edi]
    fnstsw ax
    test ah, 0x41
    jne L2
    fld qword ptr [edi]
    fstp qword ptr [esi]
    fld qword ptr [esi + 8]
    fcomp qword ptr [edi]
    fnstsw ax
    test ah, 5
    jp L3
    fld qword ptr [edi]
    fstp qword ptr [esi + 8]
    inc ebx
    cmp ebx, 4
    jb L4
    jmp L5
    lea eax, [ebp + ebx*8 - 0x20]
    fld qword ptr [eax]
    fstp qword ptr [esi]
    fld qword ptr [eax]
    fstp qword ptr [esi + 8]
    pop edi
    pop esi
    pop ebx
    leave
    ret 0x10
FUN_1006c827 ENDP
END