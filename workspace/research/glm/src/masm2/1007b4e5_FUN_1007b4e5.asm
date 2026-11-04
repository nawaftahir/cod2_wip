.686
.MODEL FLAT, C
EXTRN sub_1007A720:PROC
EXTRN sub_1007B5F7:PROC
EXTRN sub_1007B601:PROC
EXTRN sub_1007B614:PROC
EXTRN sub_1007B62E:PROC
EXTRN sub_1007B657:PROC
EXTRN sub_1007B6D9:PROC
EXTRN sub_1007B6E7:PROC
EXTRN sub_100861D6:PROC
EXTRN sub_100861ED:PROC
EXTRN sub_10086208:PROC
EXTRN sub_1008B3DE:PROC
EXTRN sub_100F78B4:PROC
EXTRN sub_100F78C5:PROC
EXTRN EXTRN g_1019BEB8:DWORD:DWORD
.CODE
FUN_1007b4e5 PROC
    mov mov edi, edi
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov ebx, dword ptr [esi + 4]
    test test ebx, ebx
    push push edi
    je sub_1007B5F7
    cmp cmp dword ptr [ebx + 4], 4
    jne sub_1007B601
    mov mov ecx, dword ptr [esi + 8]
    test test ecx, ecx
    jne L0
    mov mov eax, 080004005h
    jmp sub_1007B614
    push push dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    push push dword ptr [esi + 16]
    add add eax, 24
    push push eax
    push push ebx
    call sub_1008B3DE
    test test eax, eax
    jl sub_1007B62E
    push push dword ptr [esi + 24]
    call sub_100F78B4
    mov mov eax, dword ptr [ebx + 24]
    shl shl eax, 2
    push push eax
    call sub_100F78C5
    mov mov edi, eax
    test test edi, edi
    pop pop ecx
    pop pop ecx
    mov mov dword ptr [esi + 24], edi
    jne L1
    mov mov eax, 08007000Eh
    jmp sub_1007B657
    mov mov ecx, dword ptr [ebx + 24]
    fld1 fld1
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    or or eax, -1
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    xor xor edi, edi
    fstp fstp qword ptr [esp]
    push push edi
    push push edi
    push push dword ptr [ecx + 120]
    call sub_100861D6
    fldz fldz
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push edi
    push push edi
    mov mov dword ptr [esi + 32], eax
    push push dword ptr [ecx + 120]
    call sub_100861ED
    fld fld qword ptr [g_1019BEB8]
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push edi
    push push edi
    mov mov dword ptr [esi + 36], eax
    push push dword ptr [ecx + 120]
    call sub_10086208
    or or dword ptr [esi + 48], -1
    mov mov dword ptr [esi + 40], eax
L1:
    mov mov eax, dword ptr [esi + 32]
    push push edi
    mov mov dword ptr [esi + 44], eax
    mov mov dword ptr [esi + 52], 1
    push push dword ptr [ebx + 28]
    mov mov ecx, esi
    call sub_1007A720
    cmp cmp eax, edi
    jl sub_1007B6D9
    mov mov eax, dword ptr [esi + 76]
    neg neg eax
    sbb sbb eax, eax
    and and eax, 080004005h
    jmp sub_1007B6E7
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
FUN_1007b4e5 ENDP
END
