.686
.MODEL FLAT, C
EXTRN g_101AAC70:DWORD
.CODE
FUN_1005f4d0 PROC
    mov edx, dword ptr [g_101AAC70]
    movsx ecx, byte ptr [eax]
    imul edx, edx, 00000045Ch
    add edx, 0101A66B0h
    cmp ecx, 32
    jg L3
    lea ebx, [ebx]
L0:
    test ecx, ecx
    je L2
    cmp ecx, 10
    jne L1
    inc dword ptr [edx + 000000400h]
    mov dword ptr [esi], 1
L1:
    movsx ecx, byte ptr [eax + 1]
    inc eax
    cmp ecx, 32
    jle L0
    ret
L2:
    xor eax, eax
L3:
    ret
FUN_1005f4d0 ENDP
END
