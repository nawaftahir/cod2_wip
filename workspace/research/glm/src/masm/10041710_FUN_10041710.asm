.686
.MODEL FLAT, C
EXTRN sub_100558D3:PROC
EXTRN g_1019BC88:DWORD
.CODE
FUN_10041710 PROC
    sub esp, 8
    push ebx
    push ebp
    xor ebx, ebx
    cmp eax, 62
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
    cmp edi, 000000170h
    je L1
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 21
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 24], 000000170h
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
    mov dword ptr [esp + 12], ecx
    mov dword ptr [esp + 16], eax
    xor eax, eax
    mov ecx, 92
    mov edi, esi
    rep stosd dword ptr es:[edi], eax
    mov ecx, dword ptr [esp + 12]
    mov dword ptr [esi], edx
    mov edx, dword ptr [esp + 16]
    mov edi, esi
    mov dword ptr [esi + 12], ebp
    mov dword ptr [esi + 24], ecx
    mov dword ptr [esi + 28], edx
    mov byte ptr [esi + 16], bl
    call sub_100558D3
    mov dword ptr [esi + 8], ebx
    fld qword ptr [g_1019BC88]
    mov dword ptr [esi + 32], ebx
    mov dword ptr [esi + 76], ebx
    mov dword ptr [esi + 80], ebx
    mov dword ptr [esi + 84], ebx
    mov dword ptr [esi + 88], ebx
    mov dword ptr [esi + 92], ebx
    mov dword ptr [esi + 96], ebx
    mov dword ptr [esi + 112], ebx
    mov dword ptr [esi + 100], ebx
    mov dword ptr [esi + 116], ebx
    mov dword ptr [esi + 104], ebx
    mov dword ptr [esi + 120], ebx
    mov dword ptr [esi + 108], ebx
    mov dword ptr [esi + 124], ebx
    pop edi
    fstp qword ptr [esi + 56]
    pop ebp
    mov dword ptr [esi + 000000168h], ebx
    mov dword ptr [esi + 20], 100
    pop ebx
    add esp, 8
    ret
FUN_10041710 ENDP
END
