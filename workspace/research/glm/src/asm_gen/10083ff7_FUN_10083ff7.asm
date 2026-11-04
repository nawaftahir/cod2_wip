; FUN_10083ff7 @ 0x10083ff7 — auto-synthesized
    EXTRN g_1010c098:DWORD
    EXTRN g_101ac968:DWORD
    sub_100f788f PROTO C
    sub_100f7897 PROTO C
    sub_100f78af PROTO C
    sub_100f78be PROTO C
    sub_100f78c6 PROTO C
.CODE
FUN_10083ff7 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    xor ebx, ebx
    cmp dword ptr [g_101ac968], ebx
    jne L0
    push esi
    xor esi, esi
    push edi
    inc esi
    push ebx
    mov dword ptr [g_101ac968], esi
    mov dword ptr [ebp - 4], ebx
    call sub_100f788f
    push ebx
    mov edi, eax
    call sub_100f7897
    test edi, edi
    pop ecx
    pop ecx
    mov ebx, eax
    je L1
    test ebx, ebx
    je L1
    cmp edi, ebx
    jne L2
    mov dword ptr [ebp - 4], esi
    test edi, edi
    je L3
    push edi
    call sub_100f78af
    pop ecx
    test ebx, ebx
    je L4
    cmp ebx, edi
    je L4
    push ebx
    call sub_100f78be
    pop ecx
    push 0
    call sub_100f78c6
    cmp dword ptr [ebp - 4], 0
    pop ecx
    je L5
    mov esi, dword ptr [g_1010c098]
    push 0x101101c8
    call esi
    push 0x10110168
    call esi
    push 0x10110110
    call esi
    push 0x101100e0
    call esi
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_10083ff7 ENDP
END