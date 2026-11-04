; FUN_10002f50 @ 0x10002f50 — auto-synthesized
    EXTRN g_1019bc80:DWORD
    EXTRN g_1019bd54:DWORD
    sub_10013946 PROTO C
    sub_100f5df0 PROTO C
    sub_100f78fa PROTO C
.CODE
FUN_10002f50 PROC
    sub esp, 0x18
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x28]
    push esi
    mov esi, 1
    cmp edi, esi
    mov ebx, eax
    mov byte ptr [esp + 0xf], 1
    jle L0
    lea ebx, [ebx]
    mov eax, dword ptr [ebp + esi*8]
    push ebx
    push eax
    call sub_100f78fa
    add esp, 8
    test eax, eax
    je L1
    inc esi
    cmp esi, edi
    jl L2
    mov esi, dword ptr [esp + 0x28]
    xor bl, bl
    jmp L3
    mov esi, dword ptr [ebp + esi*8 + 4]
    test esi, esi
    jne L4
    mov esi, dword ptr [esp + 0x28]
    xor bl, bl
    jmp L3
    mov bl, byte ptr [esp + 0xf]
    lea ecx, [esp + 0x20]
    push ecx
    lea edx, [esp + 0x20]
    push edx
    lea eax, [esp + 0x20]
    push eax
    lea ecx, [esp + 0x20]
    push ecx
    push 0x10191914
    push esi
    call sub_100f5df0
    add esp, 0x18
    cmp eax, 4
    je L5
    push 0x101918f0
    push 1
    call sub_10013946
    add esp, 8
    mov eax, dword ptr [esp + 0x30]
    lea ecx, [esp + 0x14]
    sub ecx, eax
    mov edx, 4
    mov esi, dword ptr [ecx + eax]
    fild dword ptr [ecx + eax]
    test esi, esi
    jge L6
    fadd dword ptr [g_1019bc80]
    fmul dword ptr [g_1019bd54]
    add eax, 4
    dec edx
    fstp dword ptr [eax - 4]
    jne L7
    pop esi
    pop ebp
    mov al, bl
    pop ebx
    add esp, 0x18
    ret
FUN_10002f50 ENDP
END