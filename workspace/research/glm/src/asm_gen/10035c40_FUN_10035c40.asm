; FUN_10035c40 @ 0x10035c40 — auto-synthesized
    EXTRN g_10764578:DWORD
    EXTRN g_1076457c:DWORD
    sub_10035c3d PROTO C
.CODE
FUN_10035c40 PROC
    push ebp
    push esi
    mov esi, dword ptr [g_1076457c]
    push edi
    dec esi
    xor edi, edi
    test esi, esi
    jl L0
    mov edx, dword ptr [g_10764578]
    lea eax, [edi + esi]
    sar eax, 1
    lea ecx, [eax + eax*2]
    movzx ebp, word ptr [edx + ecx*2]
    lea edx, [edx + ecx*2]
    mov ecx, ebx
    sub ecx, ebp
    jne L1
    movzx ebp, word ptr [edx + 2]
    mov ecx, dword ptr [esp + 0x10]
    sub ecx, ebp
    jne L1
    movzx edx, word ptr [edx + 4]
    mov ecx, dword ptr [esp + 0x14]
    sub ecx, edx
    je L2
    test ecx, ecx
    jge L3
    lea esi, [eax - 1]
    jmp L4
    lea edi, [eax + 1]
    cmp edi, esi
    jle L5
    mov eax, dword ptr [esp + 0x18]
    test eax, eax
    je L6
    mov eax, dword ptr [esp + 0x14]
    mov ecx, dword ptr [esp + 0x10]
    push eax
    push ecx
    push ebx
    mov edx, edi
    call sub_10035c3d
    add esp, 0xc
    test al, al
    je L6
    mov eax, edi
    pop edi
    pop esi
    pop ebp
    ret
    or eax, 0xffffffff
    pop edi
    pop esi
    pop ebp
    ret
FUN_10035c40 ENDP
END