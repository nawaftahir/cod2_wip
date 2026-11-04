.686
.MODEL FLAT, C
EXTRN sub_10017C9A:PROC
EXTRN sub_100180AB:PROC
.CODE
FUN_10017c50 PROC
    push push esi
    mov mov esi, eax
    sub sub esi, edi
    mov mov eax, esi
    sar sar eax, 2
    cmp cmp eax, 1
    jle sub_10017C9A
    mov mov eax, dword ptr [edi + esi - 4]
    mov mov ecx, dword ptr [edi]
    push push ebx
    push push eax
    lea lea edx, [esi - 4]
    sar sar edx, 2
    mov mov dword ptr [edi + esi - 4], ecx
    push push edx
    xor xor eax, eax
    mov mov ecx, edi
    call sub_100180AB
    sub sub esi, 4
    mov mov eax, esi
    sar sar eax, 2
    add add esp, 12
    cmp cmp eax, 1
    jg sub_10017C9A
    pop pop esi
    ret ret
FUN_10017c50 ENDP
END
