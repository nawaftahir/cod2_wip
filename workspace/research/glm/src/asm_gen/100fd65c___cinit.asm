; __cinit @ 0x100fd65c — auto-synthesized
    EXTRN g_101a461c:DWORD
    sub_101082b8 PROTO C
.CODE
__cinit PROC
    mov eax, dword ptr [g_101a461c]
    test eax, eax
    je L0
    push dword ptr [esp + 4]
    call eax
    pop ecx
    push esi
    push edi
    mov ecx, 0x1019e00c
    mov edi, 0x1019e020
    xor eax, eax
    cmp ecx, edi
    mov esi, ecx
    jae L1
    test eax, eax
    jne L2
    mov ecx, dword ptr [esi]
    test ecx, ecx
    je L3
    call ecx
    add esi, 4
    cmp esi, edi
    jb L4
    test eax, eax
    jne L2
    push 0x100fdf09
    call sub_101082b8
    mov esi, 0x1019e000
    mov eax, esi
    mov edi, 0x1019e008
    cmp eax, edi
    pop ecx
    jae L5
    mov eax, dword ptr [esi]
    test eax, eax
    je L6
    call eax
    add esi, 4
    cmp esi, edi
    jb L7
    xor eax, eax
    pop edi
    pop esi
    ret
__cinit ENDP
END