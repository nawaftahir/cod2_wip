.686
.MODEL FLAT, C
EXTRN sub_100174CD:PROC
EXTRN sub_100174D1:PROC
EXTRN sub_100174D2:PROC
EXTRN sub_1003859B:PROC
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_10017470 PROC
    push push ebx
    push push ebp
    push push esi
    push push edi
    xor xor esi, esi
    call sub_1003859B
    mov mov ebx, 0101D7FD4h
    mov mov ebp, 32
    mov mov esi, ebx
    mov mov edi, 4
    lea lea esp, [esp]
    cmp cmp dword ptr [esi], 0
    je sub_100174D1
    mov mov eax, dword ptr [esi]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    mov mov dword ptr [esi], 0
    jne sub_100174D1
    add add esi, 4
    dec dec edi
    jne sub_100174D2
    add add ebx, 24
    dec dec ebp
    jne sub_100174CD
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_10017470 ENDP
END
