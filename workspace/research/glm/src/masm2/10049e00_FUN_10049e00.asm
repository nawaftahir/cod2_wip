.686
.MODEL FLAT, C
EXTRN sub_1004F8B0:PROC
EXTRN sub_100558D7:PROC
.CODE
FUN_10049e00 PROC
    sub sub esp, 8
    push push ebx
    push push ebp
    push push esi
    xor xor ebx, ebx
    cmp cmp eax, 62
    mov mov esi, edx
    push push edi
    mov mov edi, ecx
    mov mov dword ptr [esi + 4], ebx
    je L0
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 12
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 24], 62
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 28], eax
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx]
    add add esp, 4
    cmp cmp edi, 01B8h
    je L1
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 21
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 24], 01B8h
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 28], edi
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov ecx, dword ptr [esi + 24]
    mov mov eax, dword ptr [esi + 28]
    mov mov edx, dword ptr [esi]
    mov mov ebp, dword ptr [esi + 12]
    mov mov dword ptr [esp + 16], ecx
    mov mov dword ptr [esp + 20], eax
    xor xor eax, eax
    mov mov ecx, 110
    mov mov edi, esi
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, dword ptr [esp + 16]
    mov mov dword ptr [esi], edx
    mov mov edx, dword ptr [esp + 20]
    mov mov edi, esi
    mov mov dword ptr [esi + 12], ebp
    mov mov dword ptr [esi + 24], ecx
    mov mov dword ptr [esi + 28], edx
    mov mov byte ptr [esi + 16], 1
    call sub_100558D7
L1:
    mov mov dword ptr [esi + 8], ebx
    mov mov dword ptr [esi + 32], ebx
    mov mov dword ptr [esi + 098h], ebx
    mov mov dword ptr [esi + 09Ch], ebx
    mov mov dword ptr [esi + 0A0h], ebx
    mov mov dword ptr [esi + 0A4h], ebx
    mov mov dword ptr [esi + 0A8h], ebx
    mov mov dword ptr [esi + 0B8h], ebx
    mov mov dword ptr [esi + 0ACh], ebx
    mov mov dword ptr [esi + 0BCh], ebx
    mov mov dword ptr [esi + 0B0h], ebx
    mov mov dword ptr [esi + 0C0h], ebx
    mov mov dword ptr [esi + 0B4h], ebx
    mov mov dword ptr [esi + 0C4h], ebx
    mov mov dword ptr [esi + 0114h], ebx
    call sub_1004F8B0
    mov mov eax, dword ptr [esi + 4]
    push push 24
    push push ebx
    push push esi
    call call dword ptr [eax]
    mov mov dword ptr [esi + 0198h], eax
    add add esp, 12
    pop pop edi
    mov mov byte ptr [eax + 16], bl
    mov mov byte ptr [eax + 17], bl
    mov mov dword ptr [eax], 01004D460h
    mov mov dword ptr [eax + 4], 01004D520h
    mov mov dword ptr [eax + 8], 01004D400h
    mov mov dword ptr [eax + 12], 01004D440h
    mov mov byte ptr [eax + 20], 1
    mov mov dword ptr [esi + 20], 0C8h
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 8
    ret ret
FUN_10049e00 ENDP
END
