.686
.MODEL FLAT, C
EXTRN sub_1004F8B0:PROC
EXTRN sub_100558D7:PROC
.CODE
FUN_10049e00 PROC
    sub esp, 8
    push ebx
    push ebp
    push esi
    xor ebx, ebx
    cmp eax, 62
    mov esi, edx
    push edi
    mov edi, ecx
    mov dword ptr [esi + 4], ebx
    je L0
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 12
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 24], 62
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 28], eax
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
L0:
    cmp edi, 0000001B8h
    je L1
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 21
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 24], 0000001B8h
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 28], edi
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L1:
    mov ecx, dword ptr [esi + 24]
    mov eax, dword ptr [esi + 28]
    mov edx, dword ptr [esi]
    mov ebp, dword ptr [esi + 12]
    mov dword ptr [esp + 16], ecx
    mov dword ptr [esp + 20], eax
    xor eax, eax
    mov ecx, 110
    mov edi, esi
    rep stosd dword ptr es:[edi], eax
    mov ecx, dword ptr [esp + 16]
    mov dword ptr [esi], edx
    mov edx, dword ptr [esp + 20]
    mov edi, esi
    mov dword ptr [esi + 12], ebp
    mov dword ptr [esi + 24], ecx
    mov dword ptr [esi + 28], edx
    mov byte ptr [esi + 16], 1
    call sub_100558D7
    mov dword ptr [esi + 8], ebx
    mov dword ptr [esi + 32], ebx
    mov dword ptr [esi + 000000098h], ebx
    mov dword ptr [esi + 00000009Ch], ebx
    mov dword ptr [esi + 0000000A0h], ebx
    mov dword ptr [esi + 0000000A4h], ebx
    mov dword ptr [esi + 0000000A8h], ebx
    mov dword ptr [esi + 0000000B8h], ebx
    mov dword ptr [esi + 0000000ACh], ebx
    mov dword ptr [esi + 0000000BCh], ebx
    mov dword ptr [esi + 0000000B0h], ebx
    mov dword ptr [esi + 0000000C0h], ebx
    mov dword ptr [esi + 0000000B4h], ebx
    mov dword ptr [esi + 0000000C4h], ebx
    mov dword ptr [esi + 000000114h], ebx
    call sub_1004F8B0
    mov eax, dword ptr [esi + 4]
    push 24
    push ebx
    push esi
    call dword ptr [eax]
    mov dword ptr [esi + 000000198h], eax
    add esp, 12
    pop edi
    mov byte ptr [eax + 16], bl
    mov byte ptr [eax + 17], bl
    mov dword ptr [eax], 01004D460h
    mov dword ptr [eax + 4], 01004D520h
    mov dword ptr [eax + 8], 01004D400h
    mov dword ptr [eax + 12], 01004D440h
    mov byte ptr [eax + 20], 1
    mov dword ptr [esi + 20], 0000000C8h
    pop esi
    pop ebp
    pop ebx
    add esp, 8
    ret
FUN_10049e00 ENDP
END
