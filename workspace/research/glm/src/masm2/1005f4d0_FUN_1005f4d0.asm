.686
.MODEL FLAT, C
EXTRN sub_1005F52C:PROC
EXTRN sub_1005F52E:PROC
EXTRN sub_1005F52F:PROC
EXTRN sub_1005F534:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_1005f4d0 PROC
    mov mov edx, dword ptr [g_101AAC70]
    movsx movsx ecx, byte ptr [eax]
    imul imul edx, edx, 045Ch
    add add edx, 0101A66B0h
    cmp cmp ecx, 32
    jg sub_1005F52C
    lea lea ebx, [ebx]
    test test ecx, ecx
    je sub_1005F534
    cmp cmp ecx, 10
    jne sub_1005F52E
    inc inc dword ptr [edx + 0400h]
    mov mov dword ptr [esi], 1
    movsx movsx ecx, byte ptr [eax + 1]
    inc inc eax
    cmp cmp ecx, 32
    jle sub_1005F52F
    ret ret
    xor xor eax, eax
    ret ret
FUN_1005f4d0 ENDP
END
