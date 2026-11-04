.686
.MODEL FLAT, C
EXTRN sub_100180AB:PROC
.CODE
FUN_10017c50 PROC
    push esi
    mov esi, eax
    sub esi, edi
    mov eax, esi
    sar eax, 2
    cmp eax, 1
    jle L1
L0:
    mov eax, dword ptr [edi + esi - 4]
    mov ecx, dword ptr [edi]
    push ebx
    push eax
    lea edx, [esi - 4]
    sar edx, 2
    mov dword ptr [edi + esi - 4], ecx
    push edx
    xor eax, eax
    mov ecx, edi
    call sub_100180AB
    sub esi, 4
    mov eax, esi
    sar eax, 2
    add esp, 12
    cmp eax, 1
    jg L0
L1:
    pop esi
    ret
FUN_10017c50 ENDP
END
