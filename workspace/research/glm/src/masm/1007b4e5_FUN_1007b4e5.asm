.686
.MODEL FLAT, C
EXTRN sub_1007A720:PROC
EXTRN sub_100861D6:PROC
EXTRN sub_100861ED:PROC
EXTRN sub_10086208:PROC
EXTRN sub_1008B3DE:PROC
EXTRN sub_100F78B4:PROC
EXTRN sub_100F78C5:PROC
EXTRN g_1019BEB8:DWORD
.CODE
FUN_1007b4e5 PROC
    mov edi, edi
    push ebx
    push esi
    mov esi, ecx
    mov ebx, dword ptr [esi + 4]
    test ebx, ebx
    push edi
    je L2
    cmp dword ptr [ebx + 4], 4
    jne L2
    mov ecx, dword ptr [esi + 8]
    test ecx, ecx
    jne L0
    mov eax, 080004005h
    jmp L3
L0:
    push dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    push dword ptr [esi + 16]
    add eax, 24
    push eax
    push ebx
    call sub_1008B3DE
    test eax, eax
    jl L3
    push dword ptr [esi + 24]
    call sub_100F78B4
    mov eax, dword ptr [ebx + 24]
    shl eax, 2
    push eax
    call sub_100F78C5
    mov edi, eax
    test edi, edi
    pop ecx
    pop ecx
    mov dword ptr [esi + 24], edi
    jne L1
    mov eax, 08007000Eh
    jmp L3
L1:
    mov ecx, dword ptr [ebx + 24]
    fld1
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    or eax, 0FFFFFFFFh
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    xor edi, edi
    fstp qword ptr [esp]
    push edi
    push edi
    push dword ptr [ecx + 120]
    call sub_100861D6
    fldz
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push edi
    push edi
    mov dword ptr [esi + 32], eax
    push dword ptr [ecx + 120]
    call sub_100861ED
    fld qword ptr [g_1019BEB8]
    mov ecx, dword ptr [esi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push edi
    push edi
    mov dword ptr [esi + 36], eax
    push dword ptr [ecx + 120]
    call sub_10086208
    or dword ptr [esi + 48], 0FFFFFFFFh
    mov dword ptr [esi + 40], eax
    mov eax, dword ptr [esi + 32]
    push edi
    mov dword ptr [esi + 44], eax
    mov dword ptr [esi + 52], 1
    push dword ptr [ebx + 28]
    mov ecx, esi
    call sub_1007A720
    cmp eax, edi
    jl L3
    mov eax, dword ptr [esi + 76]
    neg eax
    sbb eax, eax
    and eax, 080004005h
    jmp L3
L2:
    xor eax, eax
L3:
    pop edi
    pop esi
    pop ebx
    ret
FUN_1007b4e5 ENDP
END
