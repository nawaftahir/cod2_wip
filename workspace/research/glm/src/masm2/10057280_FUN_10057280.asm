.686
.MODEL FLAT, C
EXTRN sub_100571EC:PROC
EXTRN sub_1005736A:PROC
EXTRN sub_10057371:PROC
EXTRN sub_10057377:PROC
EXTRN sub_10057380:PROC
EXTRN sub_1005738F:PROC
.CODE
FUN_10057280 PROC
    sub sub esp, 20
    mov mov eax, dword ptr [esp + 24]
    mov mov ecx, dword ptr [eax + 01B0h]
    mov mov edx, dword ptr [ecx + 24]
    push push esi
    mov mov esi, dword ptr [esp + 40]
    test test esi, esi
    mov mov dword ptr [esp + 12], edx
    mov mov edx, dword ptr [eax + 100]
    mov mov dword ptr [esp + 16], edx
    jle sub_1005736A
    mov mov eax, dword ptr [esp + 36]
    mov mov ecx, dword ptr [esp + 32]
    push push ebx
    sub sub ecx, eax
    push push ebp
    mov mov dword ptr [esp + 12], eax
    mov mov dword ptr [esp + 28], ecx
    mov mov dword ptr [esp + 16], esi
    push push edi
    test test edx, edx
    mov mov esi, dword ptr [ecx + eax]
    mov mov ebx, dword ptr [eax]
    jbe sub_10057377
    mov mov dword ptr [esp + 52], edx
    mov mov edi, edi
    movzx movzx ecx, byte ptr [esi]
    movzx movzx eax, byte ptr [esi + 1]
    mov mov ebp, dword ptr [esp + 24]
    shr shr ecx, 3
    mov mov ebp, dword ptr [ebp + ecx*4]
    inc inc esi
    movzx movzx edx, byte ptr [esi + 1]
    shr shr eax, 2
    inc inc esi
    shr shr edx, 3
    mov mov edi, eax
    shl shl edi, 5
    add add edi, edx
    lea lea edi, [ebp + edi*2]
    inc inc esi
    cmp cmp word ptr [edi], 0
    jne sub_1005738F
    push push edx
    push push ecx
    mov mov ecx, dword ptr [esp + 48]
    push push ecx
    call sub_100571EC
    add add esp, 12
    mov mov dl, byte ptr [edi]
    mov mov eax, dword ptr [esp + 52]
    dec dec dl
    mov mov byte ptr [ebx], dl
    inc inc ebx
    dec dec eax
    mov mov dword ptr [esp + 52], eax
    jne sub_10057371
    mov mov edx, dword ptr [esp + 28]
    mov mov eax, dword ptr [esp + 16]
    mov mov ecx, dword ptr [esp + 32]
    mov mov esi, dword ptr [esp + 20]
    add add eax, 4
    dec dec esi
    mov mov dword ptr [esp + 16], eax
    mov mov dword ptr [esp + 20], esi
    jne sub_10057380
    pop pop edi
    pop pop ebp
    pop pop ebx
    pop pop esi
    add add esp, 20
    ret ret
FUN_10057280 ENDP
END
