.686
.MODEL FLAT, C
EXTRN sub_10037455:PROC
EXTRN sub_10037552:PROC
EXTRN sub_1003A451:PROC
EXTRN sub_100F6CE4:PROC
EXTRN sub_100F6D37:PROC
EXTRN sub_100F6DA0:PROC
EXTRN sub_100F6DA3:PROC
EXTRN sub_100F6DF4:PROC
EXTRN sub_100F6E60:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_1072D9BC:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1003a1a0 PROC
    mov eax, dword ptr [g_1072D9BC]
    mov edx, dword ptr [eax + 56]
    mov eax, dword ptr [edx + 64]
    sub esp, 000000340h
    test eax, eax
    push ebx
    push esi
    je L0
    mov dl, byte ptr [eax + 14]
    test dl, dl
    je L0
    mov eax, dword ptr [esp + 00000034Ch]
    push eax
    push ecx
    mov ecx, 8
    lea esi, [esp + 16]
    call sub_10037455
    add esp, 8
    jmp L1
L0:
    mov eax, dword ptr [esp + 00000034Ch]
    lea edx, [esp + 8]
    push edx
    push eax
    push ecx
    mov ebx, 8
    call sub_10037552
    add esp, 12
L1:
    mov ebx, eax
    xor esi, esi
    test ebx, ebx
    jle L6
    push edi
    lea edi, [esp + 12]
    jmp L2
    lea esp, [esp]
    nop
L2:
    mov ecx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L3
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L3
    push 0101989B8h
    push 010193358h
    push eax
    call sub_100F6DA0
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100F6CE4
    add esp, 16
L3:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push 1
    push esi
    push eax
    call dword ptr [ecx + 0xd4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L2
L4:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L5
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L5
    push 010198980h
    push 010193358h
    push eax
    call sub_100F6DF4
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6D37
    add esp, 16
L5:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push edi
    push esi
    push eax
    call dword ptr [ecx + 0xcc]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L4
    inc esi
    add edi, 104
    cmp esi, ebx
    jl L2
    cmp esi, 8
    pop edi
    jae sub_1003A451
    jmp L6
    lea ebx, [ebx]
L6:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L7
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L7
    push 010198954h
    push 010193358h
    push eax
    call sub_100F6E60
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6DA3
    add esp, 16
L7:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push 0
    push esi
    push eax
    call dword ptr [ecx + 0xd4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L6
    inc esi
FUN_1003a1a0 ENDP
END
