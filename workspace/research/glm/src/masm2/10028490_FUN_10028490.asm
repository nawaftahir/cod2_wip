.686
.MODEL FLAT, C
EXTRN sub_100284EA:PROC
EXTRN sub_100287E8:PROC
.CODE
FUN_10028490 PROC
    push push esi
    push push edi
    mov mov edi, eax
    mov mov esi, ecx
    sub sub esi, edi
    mov mov eax, esi
    sar sar eax, 3
    cmp cmp eax, 1
    jle sub_100284EA
    mov mov ecx, dword ptr [edi + esi - 4]
    mov mov eax, dword ptr [edi + esi - 8]
    mov mov edx, dword ptr [edi]
    push push ebx
    push push ecx
    push push eax
    lea lea eax, [esi - 8]
    sar sar eax, 3
    mov mov dword ptr [edi + esi - 8], edx
    mov mov edx, dword ptr [edi + 4]
    push push eax
    xor xor eax, eax
    mov mov dword ptr [edi + esi - 4], edx
    call sub_100287E8
    sub sub esi, 8
    mov mov eax, esi
    sar sar eax, 3
    add add esp, 16
    cmp cmp eax, 1
    jg sub_100284EA
    pop pop edi
    pop pop esi
    ret ret
FUN_10028490 ENDP
END
