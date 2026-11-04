; FUN_100126d0 @ 0x100126d0 — auto-synthesized
    EXTRN fp_1010c0e0:DWORD
    EXTRN fp_101d49c8:DWORD
    EXTRN g_101d1bf4:DWORD
    EXTRN g_101d1bfc:DWORD
    sub_10012783 PROTO C
    sub_1001279a PROTO C
.CODE
FUN_100126d0 PROC
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    push edi
    jmp L0
    lea esp, [esp]
    push 0x10193c40
    push 0
    call dword ptr [fp_101d49c8]
    add esp, 8
    xor edi, edi
    mov edx, dword ptr [esp + 0x10]
    mov eax, dword ptr [g_101d1bf4]
    mov ecx, dword ptr [eax]
    push 0x101d1bf8
    push ebx
    push ebp
    push edx
    mov edx, dword ptr [g_101d1bfc]
    push 1
    push edx
    push eax
    call dword ptr [ecx + 0x40]
    mov esi, eax
    test esi, esi
    jge sub_10012783
    push 0x64
    call dword ptr [fp_1010c0e0]
    inc edi
    cmp edi, 0x14
    jne L1
    mov eax, dword ptr [g_101d1bfc]
    test eax, eax
    je sub_1001279a
    mov dword ptr [g_101d1bfc], 0
FUN_100126d0 ENDP
END