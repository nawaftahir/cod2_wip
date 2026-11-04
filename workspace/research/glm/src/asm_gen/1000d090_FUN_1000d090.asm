; FUN_1000d090 @ 0x1000d090 — auto-synthesized
    EXTRN g_101d0a68:DWORD
    EXTRN g_101d0a6c:DWORD
    EXTRN g_101d0a70:DWORD
.CODE
FUN_1000d090 PROC
    movzx eax, al
    cmp eax, 5
    ja L0
    jmp dword ptr [eax*4 + 0x1000d0d4]
    mov eax, dword ptr [g_101d0a68]
    jmp L1
    mov eax, dword ptr [g_101d0a6c]
    jmp L1
    mov eax, dword ptr [g_101d0a70]
    test eax, eax
    mov byte ptr [ecx + 1], 2
    jge L2
    xor eax, eax
    mov byte ptr [ecx], al
    ret
    cmp eax, 3
    jle L3
    mov eax, 3
    mov byte ptr [ecx], al
    ret
    mov word ptr [ecx], 0
    ret
FUN_1000d090 ENDP
END