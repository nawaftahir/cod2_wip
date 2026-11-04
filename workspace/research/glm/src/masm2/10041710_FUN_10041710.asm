.686
.MODEL FLAT, C
EXTRN sub_100558D3:PROC
EXTRN EXTRN g_1019BC88:DWORD:DWORD
.CODE
FUN_10041710 PROC
    sub sub esp, 8
    push push ebx
    push push ebp
    xor xor ebx, ebx
    cmp cmp eax, 62
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
    cmp cmp edi, 0170h
    je L1
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 21
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 24], 0170h
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
    mov mov dword ptr [esp + 12], ecx
    mov mov dword ptr [esp + 16], eax
    xor xor eax, eax
    mov mov ecx, 92
    mov mov edi, esi
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, dword ptr [esp + 12]
    mov mov dword ptr [esi], edx
    mov mov edx, dword ptr [esp + 16]
    mov mov edi, esi
    mov mov dword ptr [esi + 12], ebp
    mov mov dword ptr [esi + 24], ecx
    mov mov dword ptr [esi + 28], edx
    mov mov byte ptr [esi + 16], bl
    call sub_100558D3
    mov mov dword ptr [esi + 8], ebx
    fld fld qword ptr [g_1019BC88]
    mov mov dword ptr [esi + 32], ebx
    mov mov dword ptr [esi + 76], ebx
    mov mov dword ptr [esi + 80], ebx
    mov mov dword ptr [esi + 84], ebx
    mov mov dword ptr [esi + 88], ebx
    mov mov dword ptr [esi + 92], ebx
    mov mov dword ptr [esi + 96], ebx
    mov mov dword ptr [esi + 112], ebx
    mov mov dword ptr [esi + 100], ebx
    mov mov dword ptr [esi + 116], ebx
    mov mov dword ptr [esi + 104], ebx
    mov mov dword ptr [esi + 120], ebx
    mov mov dword ptr [esi + 108], ebx
    mov mov dword ptr [esi + 124], ebx
    pop pop edi
    fstp fstp qword ptr [esi + 56]
    pop pop ebp
    mov mov dword ptr [esi + 0168h], ebx
    mov mov dword ptr [esi + 20], 100
    pop pop ebx
    add add esp, 8
    ret ret
FUN_10041710 ENDP
END
