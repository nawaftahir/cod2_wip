; FUN_10032e20 @ 0x10032e20 — auto-synthesized
    EXTRN g_101d494c:DWORD
    EXTRN g_101d4950:DWORD
    EXTRN g_101d4958:DWORD
.CODE
FUN_10032e20 PROC
    mov al, byte ptr [g_101d4958]
    test al, al
    je L0
    mov eax, dword ptr [g_101d494c]
    mov ecx, dword ptr [eax]
    push 1
    push 0
    push 0
    push eax
    call dword ptr [ecx + 0x1c]
    cmp eax, 0x88760868
    je L1
    cmp eax, 1
    setne al
    test al, al
    je L2
    mov byte ptr [g_101d4958], 0
    mov eax, dword ptr [g_101d4950]
    add eax, 0xffffb1e0
    mov edx, eax
    sar edx, 0x1f
    not edx
    and edx, eax
    mov dword ptr [g_101d4950], edx
    ret
FUN_10032e20 ENDP
END