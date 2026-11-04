.686
.MODEL FLAT, C
EXTRN sub_10048B18:PROC
EXTRN sub_10048CEA:PROC
EXTRN sub_10048D16:PROC
.CODE
FUN_10048c10 PROC
    test test al, al
    je L0
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 4
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    mov mov edx, dword ptr [esi + 4]
    push push 64
    push push 1
    push push esi
    call call dword ptr [edx]
    mov mov dword ptr [esi + 014Ch], eax
    mov mov dword ptr [eax], 0100485A0h
    mov mov ecx, dword ptr [esi + 015Ch]
    mov mov dl, byte ptr [ecx + 8]
    add add esp, 12
    test test dl, dl
    je L1
    push push esi
    mov mov dword ptr [eax + 4], 010048860h
    call sub_10048B18
    add add esp, 4
    ret ret
    mov mov dword ptr [eax + 4], 010048630h
    mov mov edx, dword ptr [esi + 68]
    mov mov ecx, dword ptr [esi + 76]
    push push ebp
    xor xor ebp, ebp
    test test edx, edx
    jle sub_10048D16
    push push ebx
    push push edi
    lea lea edi, [ecx + 8]
    lea lea ebx, [eax + 8]
    jmp sub_10048CEA
    lea lea ebx, [ebx]
    mov mov eax, dword ptr [edi + 20]
    imul imul eax, dword ptr [esi + 0E0h]
    mov mov edx, dword ptr [esi + 0E4h]
    push push edx
    shl shl eax, 3
    cdq cdq
    idiv idiv dword ptr [edi]
L1:
    mov mov ecx, dword ptr [esi + 4]
    push push eax
    push push 1
    push push esi
    call call dword ptr [ecx + 8]
    add add esp, 16
    mov mov dword ptr [ebx], eax
    mov mov eax, dword ptr [esi + 68]
    inc inc ebp
    add add ebx, 4
    add add edi, 84
    cmp cmp ebp, eax
FUN_10048c10 ENDP
END
