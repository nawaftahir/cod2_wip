.686
.MODEL FLAT, C
EXTRN sub_1002ABA3:PROC
.CODE
FUN_1002abf0 PROC
L0:
    push ebx
    mov ebx, dword ptr [esp + 12]
    test ebx, ebx
    push edi
    mov edi, dword ptr [esp + 12]
    jne L1
    call sub_1002ABA3
    pop edi
    pop ebx
    ret
L1:
    mov ecx, dword ptr [edi + ebx*8 + 00000C3FCh]
    lea eax, [edi + ebx*8 + 00000C3F8h]
    cmp ecx, eax
    jne L2
    lea ecx, [ebx - 1]
    push ecx
    push edi
    call L0
    add esp, 8
    test al, al
    jne L2
    pop edi
    pop ebx
    ret
L2:
    push esi
    mov esi, dword ptr [edi + ebx*8 + 00000C3FCh]
    mov edx, dword ptr [esi + 4]
    mov eax, dword ptr [esi]
    mov dword ptr [edx], eax
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esi + 4]
    mov dword ptr [ecx + 4], edx
    mov ecx, esi
    sub ecx, edi
    mov eax, 05397829Dh
    imul ecx
    sar edx, 7
    mov eax, edx
    shr eax, 31
    add eax, edx
    imul eax, eax, 000000188h
    add eax, edi
    cmp ebx, 1
    jne L3
    lea ecx, [edi + 00000C428h]
    mov dword ptr [eax], ecx
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [eax + 4], edx
    mov dword ptr [ecx + 4], eax
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [ecx], eax
L3:
    lea edx, [edi + ebx*8 + 00000C400h]
    mov dword ptr [esi], edx
    mov ecx, dword ptr [edx + 4]
    mov dword ptr [esi + 4], ecx
    mov dword ptr [edx + 4], esi
    mov ecx, dword ptr [esi + 4]
    mov dword ptr [ecx], esi
    sub esi, eax
    mov ecx, 4
    sub ecx, ebx
    mov edi, 1
    shl edi, cl
    sub esi, 000000088h
    sar esi, 4
    add edi, esi
    shl edi, 4
    lea eax, [edi + eax + 000000088h]
    mov dword ptr [eax], edx
    mov ecx, dword ptr [edx + 4]
    mov dword ptr [eax + 4], ecx
    mov dword ptr [edx + 4], eax
    mov edx, dword ptr [eax + 4]
    pop esi
    pop edi
    mov dword ptr [edx], eax
    mov al, 1
    pop ebx
    ret
FUN_1002abf0 ENDP
END
