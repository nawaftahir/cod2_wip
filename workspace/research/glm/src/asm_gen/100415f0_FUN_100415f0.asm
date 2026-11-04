; FUN_100415f0 @ 0x100415f0 — auto-synthesized
    EXTRN g_1072d9b4:DWORD
    EXTRN g_1072d9b8:DWORD
    EXTRN g_1072d9e0:DWORD
    EXTRN g_1072d9e4:DWORD
    EXTRN g_1072d9e8:DWORD
    sub_1002df6f PROTO C
    sub_1002df86 PROTO C
    sub_1005eb5f PROTO C
.CODE
FUN_100415f0 PROC
    push ebp
    mov ebp, esp
    and esp, 0xfffffff8
    push ecx
    mov eax, dword ptr [g_1072d9e0]
    test eax, eax
    push esi
    mov esi, dword ptr [ebp + 8]
    je L0
    mov eax, dword ptr [g_1072d9e8]
    cmp eax, dword ptr [esi + 0x1c]
    jne L1
    movzx ecx, word ptr [esi + 0x20]
    cmp dword ptr [g_1072d9e4], ecx
    je L0
    call sub_1002df6f
    movzx edx, word ptr [esi + 0x22]
    add edx, dword ptr [g_1072d9e0]
    cmp edx, 0x100000
    jle L2
    call sub_1002df86
    mov edx, dword ptr [g_1072d9b4]
    mov dword ptr [g_1072d9b8], 1
    movzx eax, word ptr [esi + 0x22]
    mov ecx, dword ptr [esi + 0x24]
    shl eax, 1
    push eax
    mov eax, dword ptr [g_1072d9e0]
    push ecx
    lea ecx, [edx + eax*2]
    push ecx
    call sub_1005eb5f
    movzx edx, word ptr [esi + 0x22]
    mov eax, dword ptr [g_1072d9e0]
    add esp, 0xc
    add eax, edx
    mov dword ptr [g_1072d9e0], eax
    mov eax, dword ptr [esi + 0x1c]
    mov dword ptr [g_1072d9e8], eax
    movzx ecx, word ptr [esi + 0x20]
    mov dword ptr [g_1072d9e4], ecx
    pop esi
    mov esp, ebp
    pop ebp
    ret
FUN_100415f0 ENDP
END