.686
.MODEL FLAT, C
EXTRN sub_1002ABA3:PROC
EXTRN sub_1002ACF0:PROC
.CODE
FUN_1002abf0 PROC
    push push ebx
    mov mov ebx, dword ptr [esp + 12]
    test test ebx, ebx
    push push edi
    mov mov edi, dword ptr [esp + 12]
    jne L0
    call sub_1002ABA3
    pop pop edi
    pop pop ebx
    ret ret
    mov mov ecx, dword ptr [edi + ebx*8 + 0C3FCh]
    lea lea eax, [edi + ebx*8 + 0C3F8h]
L0:
    cmp cmp ecx, eax
    jne L2
    lea lea ecx, [ebx - 1]
    push push ecx
    push push edi
    call L1
L1:
    add add esp, 8
    test test al, al
    jne L3
    pop pop edi
    pop pop ebx
    ret ret
    push push esi
    mov mov esi, dword ptr [edi + ebx*8 + 0C3FCh]
    mov mov edx, dword ptr [esi + 4]
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [edx], eax
    mov mov ecx, dword ptr [esi]
    mov mov edx, dword ptr [esi + 4]
    mov mov dword ptr [ecx + 4], edx
    mov mov ecx, esi
    sub sub ecx, edi
    mov mov eax, 05397829Dh
    imul imul ecx
    sar sar edx, 7
    mov mov eax, edx
    shr shr eax, 31
    add add eax, edx
    imul imul eax, eax, 0188h
    add add eax, edi
    cmp cmp ebx, 1
    jne sub_1002ACF0
L3:
    lea lea ecx, [edi + 0C428h]
    mov mov dword ptr [eax], ecx
    mov mov edx, dword ptr [ecx + 4]
    mov mov dword ptr [eax + 4], edx
    mov mov dword ptr [ecx + 4], eax
    mov mov ecx, dword ptr [eax + 4]
    mov mov dword ptr [ecx], eax
    lea lea edx, [edi + ebx*8 + 0C400h]
    mov mov dword ptr [esi], edx
    mov mov ecx, dword ptr [edx + 4]
    mov mov dword ptr [esi + 4], ecx
    mov mov dword ptr [edx + 4], esi
    mov mov ecx, dword ptr [esi + 4]
    mov mov dword ptr [ecx], esi
    sub sub esi, eax
    mov mov ecx, 4
    sub sub ecx, ebx
    mov mov edi, 1
    shl shl edi, cl
    sub sub esi, 088h
    sar sar esi, 4
    add add edi, esi
    shl shl edi, 4
    lea lea eax, [edi + eax + 088h]
    mov mov dword ptr [eax], edx
    mov mov ecx, dword ptr [edx + 4]
    mov mov dword ptr [eax + 4], ecx
    mov mov dword ptr [edx + 4], eax
    mov mov edx, dword ptr [eax + 4]
    pop pop esi
    pop pop edi
    mov mov dword ptr [edx], eax
    mov mov al, 1
    pop pop ebx
    ret ret
FUN_1002abf0 ENDP
END
