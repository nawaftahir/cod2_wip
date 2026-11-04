.686
.MODEL FLAT, C
EXTRN sub_1003859B:PROC
EXTRN g_1076A830:DWORD
.CODE
FUN_10017470 PROC
    push ebx
    push ebp
    push esi
    push edi
    xor esi, esi
    call sub_1003859B
    mov ebx, 0101D7FD4h
    mov ebp, 32
L0:
    mov esi, ebx
    mov edi, 4
    lea esp, [esp]
L1:
    cmp dword ptr [esi], 0
    je L3
L2:
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    mov dword ptr [esi], 0
    jne L2
L3:
    add esi, 4
    dec edi
    jne L1
    add ebx, 24
    dec ebp
    jne L0
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_10017470 ENDP
END
