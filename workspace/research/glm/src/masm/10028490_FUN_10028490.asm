.686
.MODEL FLAT, C
EXTRN sub_100287E8:PROC
.CODE
FUN_10028490 PROC
    push esi
    push edi
    mov edi, eax
    mov esi, ecx
    sub esi, edi
    mov eax, esi
    sar eax, 3
    cmp eax, 1
    jle L1
L0:
    mov ecx, dword ptr [edi + esi - 4]
    mov eax, dword ptr [edi + esi - 8]
    mov edx, dword ptr [edi]
    push ebx
    push ecx
    push eax
    lea eax, [esi - 8]
    sar eax, 3
    mov dword ptr [edi + esi - 8], edx
    mov edx, dword ptr [edi + 4]
    push eax
    xor eax, eax
    mov dword ptr [edi + esi - 4], edx
    call sub_100287E8
    sub esi, 8
    mov eax, esi
    sar eax, 3
    add esp, 16
    cmp eax, 1
    jg L0
L1:
    pop edi
    pop esi
    ret
FUN_10028490 ENDP
END
