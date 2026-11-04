.686
.MODEL FLAT, C
EXTRN sub_100F792A:PROC
EXTRN sub_100F7970:PROC
EXTRN sub_100F7A4C:PROC
EXTRN sub_100FA2F9:PROC
EXTRN sub_100FA3A7:PROC
EXTRN sub_10100630:PROC
EXTRN sub_10100631:PROC
EXTRN sub_101008E2:PROC
EXTRN sub_10100F63:PROC
EXTRN sub_10108725:PROC
EXTRN sub_10108820:PROC
EXTRN fp_101AE18C:DWORD
EXTRN g_101A50D0:DWORD
EXTRN g_101AE16C:DWORD
EXTRN g_101AE16D:DWORD
EXTRN g_101AE170:DWORD
EXTRN g_101AE174:DWORD
EXTRN g_101AE178:DWORD
EXTRN g_101AE17C:DWORD
EXTRN g_101AE180:DWORD
EXTRN g_101AE184:DWORD
EXTRN g_101AE188:DWORD
.CODE
_LangCountryEnumProc@4 PROC
    push ebp
    mov ebp, esp
    sub esp, 124
    mov eax, dword ptr [g_101A50D0]
    mov edx, dword ptr [ebp + 8]
    push esi
    mov dword ptr [ebp - 4], eax
    call sub_10100630
    mov esi, eax
    push 120
    lea eax, [ebp - 124]
    push eax
    mov eax, dword ptr [g_101AE17C]
    neg eax
    sbb eax, eax
    and eax, 0FFFFF005h
    add eax, 000001002h
    push eax
    push esi
    call dword ptr [fp_101AE18C]
    test eax, eax
    jne L0
    and dword ptr [g_101AE16C], eax
    inc eax
    jmp L12
L0:
    push ebx
    push edi
    lea eax, [ebp - 124]
    push eax
    push dword ptr [g_101AE180]
    call sub_100F792A
    test eax, eax
    pop ecx
    pop ecx
    mov ebx, 0FFFFF002h
    mov edi, 000001001h
    jne L4
    push 120
    lea eax, [ebp - 124]
    push eax
    mov eax, dword ptr [g_101AE178]
    neg eax
    sbb eax, eax
    and eax, ebx
    add eax, edi
    push eax
    push esi
    call dword ptr [fp_101AE18C]
    test eax, eax
    je L5
    lea eax, [ebp - 124]
    push eax
    push dword ptr [g_101AE188]
    call sub_100F7970
    test eax, eax
    pop ecx
    pop ecx
    jne L1
    or word ptr [g_101AE16C], 000000304h
    mov dword ptr [g_101AE170], esi
    jmp L3
L1:
    test byte ptr [g_101AE16C], 2
    jne L4
    mov eax, dword ptr [g_101AE184]
    test eax, eax
    je L2
    push eax
    lea eax, [ebp - 124]
    push eax
    push dword ptr [g_101AE188]
    call sub_10108725
    add esp, 12
    test eax, eax
    jne L2
    push dword ptr [g_101AE188]
    or dword ptr [g_101AE16C], 2
    mov dword ptr [g_101AE174], esi
    call sub_100FA2F9
    cmp eax, dword ptr [g_101AE184]
    pop ecx
    jne L4
    mov dword ptr [g_101AE170], esi
    jmp L4
L2:
    test byte ptr [g_101AE16C], 1
    jne L4
    push esi
    call sub_10100631
    test eax, eax
    pop ecx
    je L4
    or dword ptr [g_101AE16C], 1
L3:
    mov dword ptr [g_101AE174], esi
L4:
    mov ecx, dword ptr [g_101AE16C]
    mov eax, 000000300h
    and ecx, eax
    cmp ecx, eax
    je L10
    push 120
    lea eax, [ebp - 124]
    push eax
    mov eax, dword ptr [g_101AE178]
    neg eax
    sbb eax, eax
    and eax, ebx
    add eax, edi
    push eax
    push esi
    call dword ptr [fp_101AE18C]
    test eax, eax
    jne L6
L5:
    and dword ptr [g_101AE16C], 0
    xor eax, eax
    inc eax
    jmp L11
L6:
    lea eax, [ebp - 124]
    push eax
    push dword ptr [g_101AE188]
    call sub_100F7A4C
    pop ecx
    xor edi, edi
    test eax, eax
    pop ecx
    jne L7
    or byte ptr [g_101AE16D], 2
    cmp dword ptr [g_101AE178], edi
    jne L9
    cmp dword ptr [g_101AE184], edi
    je L9
    push dword ptr [g_101AE188]
    call sub_100FA3A7
    cmp eax, dword ptr [g_101AE184]
    pop ecx
    jne L9
    push 1
    jmp L8
L7:
    cmp dword ptr [g_101AE178], edi
    jne L10
    mov eax, dword ptr [g_101AE184]
    cmp eax, edi
    je L10
    push eax
    lea eax, [ebp - 124]
    push eax
    push dword ptr [g_101AE188]
    call sub_10108820
    add esp, 12
    test eax, eax
    jne L10
    push edi
L8:
    push esi
    call sub_101008E2
    test eax, eax
    pop ecx
    pop ecx
    je L10
L9:
    or byte ptr [g_101AE16D], 1
    cmp dword ptr [g_101AE170], edi
    jne L10
    mov dword ptr [g_101AE170], esi
L10:
    mov eax, dword ptr [g_101AE16C]
    shr eax, 2
    not eax
    and eax, 1
L11:
    pop edi
    pop ebx
L12:
    mov ecx, dword ptr [ebp - 4]
    pop esi
    call sub_10100F63
    leave
    ret 4
_LangCountryEnumProc@4 ENDP
END
