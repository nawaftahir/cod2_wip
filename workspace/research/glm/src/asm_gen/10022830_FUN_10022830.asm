; FUN_10022830 @ 0x10022830 — auto-synthesized
    EXTRN g_101d1bf8:DWORD
    EXTRN g_101d4814:DWORD
    EXTRN g_101d4828:DWORD
    EXTRN g_101d4924:DWORD
    sub_10022803 PROTO C
    sub_10061d53 PROTO C
    sub_100efeb0 PROTO C
.CODE
FUN_10022830 PROC
    mov eax, dword ptr [g_101d4924]
    sub esp, 8
    test eax, eax
    jne L0
    mov eax, dword ptr [g_101d4814]
    test eax, eax
    jne L1
    mov eax, dword ptr [g_101d4828]
    test eax, eax
    mov dword ptr [g_101d4924], eax
    je L1
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 4]
    mov eax, dword ptr [g_101d4924]
    add esp, 8
    ret
    push esi
    push edi
    lea edx, [esp + 8]
    push edx
    lea eax, [esp + 0x10]
    push eax
    call sub_10022803
    mov esi, dword ptr [esp + 0x10]
    mov eax, dword ptr [g_101d1bf8]
    mov edi, dword ptr [esp + 0x14]
    mov ecx, dword ptr [eax]
    add esp, 8
    push 0
    push 0x101d4924
    push 0
    push 0
    push 0
    push 0x4b
    push esi
    push edi
    push eax
    call dword ptr [ecx + 0x74]
    test eax, eax
    jge L2
    push eax
    call sub_100efeb0
    push eax
    push esi
    push edi
    push 0x10196b6c
    push 0
    call sub_10061d53
    add esp, 0x14
    mov eax, dword ptr [g_101d4924]
    pop edi
    pop esi
    add esp, 8
    ret
FUN_10022830 ENDP
END