; FUN_1005f4d0 @ 0x1005f4d0 — auto-synthesized
    EXTRN g_101aac70:DWORD
.CODE
FUN_1005f4d0 PROC
    mov edx, dword ptr [g_101aac70]
    movsx ecx, byte ptr [eax]
    imul edx, edx, 0x45c
    add edx, 0x101a66b0
    cmp ecx, 0x20
    jg L0
    lea ebx, [ebx]
    test ecx, ecx
    je L1
    cmp ecx, 0xa
    jne L2
    inc dword ptr [edx + 0x400]
    mov dword ptr [esi], 1
    movsx ecx, byte ptr [eax + 1]
    inc eax
    cmp ecx, 0x20
    jle L3
    ret
    xor eax, eax
    ret
FUN_1005f4d0 ENDP
END