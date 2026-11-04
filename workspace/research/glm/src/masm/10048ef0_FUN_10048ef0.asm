.686
.MODEL FLAT, C
EXTRN sub_10048D48:PROC
.CODE
FUN_10048ef0 PROC
    push ecx
    mov ecx, dword ptr [esp + 8]
    mov edx, dword ptr [ecx + 36]
    mov eax, dword ptr [esp + 20]
    push ebx
    mov ebx, dword ptr [ecx + 0000000E4h]
    test ebx, ebx
    mov dword ptr [esp + 4], edx
    jle L1
    mov edx, dword ptr [esp + 20]
    push ebp
    push esi
    sub edx, eax
    push edi
L0:
    mov ecx, dword ptr [esp + 16]
    mov esi, dword ptr [edx + eax]
    mov edi, dword ptr [eax]
    mov ebp, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, ebp
    and ecx, 3
    add eax, 4
    dec ebx
    rep movsb byte ptr es:[edi], byte ptr [esi]
    jne L0
    mov ecx, dword ptr [esp + 24]
    mov eax, dword ptr [esp + 36]
    pop edi
    pop esi
    pop ebp
L1:
    mov edx, dword ptr [esp + 16]
    mov edx, dword ptr [edx + 28]
    shl edx, 3
    pop ebx
    add esp, 4
    mov dword ptr [esp + 16], edx
    mov edx, dword ptr [ecx + 36]
    mov dword ptr [esp + 12], edx
    mov ecx, dword ptr [ecx + 0000000E4h]
    mov dword ptr [esp + 8], ecx
    mov dword ptr [esp + 4], eax
    jmp sub_10048D48
FUN_10048ef0 ENDP
END
