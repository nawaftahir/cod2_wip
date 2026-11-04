; FUN_10035890 @ 0x10035890 — auto-synthesized
    EXTRN g_101d1ba8:DWORD
    EXTRN g_1073055c:DWORD
    sub_1000d4a3 PROTO C
    sub_1002e8d8 PROTO C
    sub_1003a960 PROTO C
    sub_100f6349 PROTO C
    sub_100f883a PROTO C
.CODE
FUN_10035890 PROC
    mov eax, 0x2008
    call sub_100f883a
    push ebx
    push esi
    push edi
    lea edi, [esp + 0xc]
    mov ebx, 0x1000c7e0
    mov dword ptr [esp + 0xc], 0
    call sub_1000d4a3
    mov eax, dword ptr [esp + 0xc]
    push 0x10035850
    push 4
    push eax
    lea ecx, [esp + 0x1c]
    push ecx
    call sub_100f6349
    mov eax, dword ptr [esp + 0x1c]
    xor ecx, ecx
    add esp, 0x10
    xor esi, esi
    cmp eax, ecx
    jle L0
    jmp L1
    lea ebx, [ebx]
    mov eax, dword ptr [esp + esi*4 + 0x10]
    cmp byte ptr [eax + 0xa], cl
    je L0
    cmp dword ptr [eax], 3
    jne L2
    push 0x3f800000
    push 0x3f800000
    push ecx
    push ecx
    push 0x41000000
    push 0x41000000
    push ecx
    mov dword ptr [g_1073055c], eax
    mov eax, dword ptr [g_101d1ba8]
    push ecx
    or ebx, 0xffffffff
    call sub_1002e8d8
    add esp, 0x20
    call sub_1003a960
    xor ecx, ecx
    mov eax, dword ptr [esp + 0xc]
    inc esi
    cmp esi, eax
    jl L1
    pop edi
    pop esi
    mov dword ptr [g_1073055c], ecx
    pop ebx
FUN_10035890 ENDP
END