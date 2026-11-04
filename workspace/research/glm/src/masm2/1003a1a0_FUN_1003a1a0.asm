.686
.MODEL FLAT, C
EXTRN sub_10037455:PROC
EXTRN sub_10037552:PROC
EXTRN sub_1003A331:PROC
EXTRN sub_1003A332:PROC
EXTRN sub_1003A36E:PROC
EXTRN sub_1003A37A:PROC
EXTRN sub_1003A37C:PROC
EXTRN sub_1003A3FA:PROC
EXTRN sub_1003A446:PROC
EXTRN sub_1003A451:PROC
EXTRN sub_1003A453:PROC
EXTRN sub_1003A454:PROC
EXTRN sub_100F6CE4:PROC
EXTRN sub_100F6D37:PROC
EXTRN sub_100F6DA0:PROC
EXTRN sub_100F6DA3:PROC
EXTRN sub_100F6DF4:PROC
EXTRN sub_100F6E60:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1003a1a0 PROC
    mov mov eax, dword ptr [g_1072D9BC]
    mov mov edx, dword ptr [eax + 56]
    mov mov eax, dword ptr [edx + 64]
    sub sub esp, 0340h
    test test eax, eax
    push push ebx
    push push esi
    je L0
    mov mov dl, byte ptr [eax + 14]
    test test dl, dl
    je L1
    mov mov eax, dword ptr [esp + 034Ch]
    push push eax
    push push ecx
    mov mov ecx, 8
    lea lea esi, [esp + 16]
    call sub_10037455
    add add esp, 8
    jmp L2
    mov mov eax, dword ptr [esp + 034Ch]
    lea lea edx, [esp + 8]
    push push edx
    push push eax
    push push ecx
    mov mov ebx, 8
    call sub_10037552
    add add esp, 12
    mov mov ebx, eax
    xor xor esi, esi
    test test ebx, ebx
    jle sub_1003A331
    push push edi
    lea lea edi, [esp + 12]
    jmp L3
    lea lea esp, [esp]
    nop nop
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    je L4
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L6
    push push 0101989B8h
    push push 010193358h
    push push eax
    call sub_100F6DA0
    mov mov edx, dword ptr [g_10764584]
    push push edx
    call sub_100F6CE4
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push 1
    push push esi
    push push eax
    call call dword ptr [ecx + 0D4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L5
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1003A36E
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
L3:
    setne setne cl
    test test cl, cl
    je sub_1003A37C
    push push 010198980h
    push push 010193358h
    push push eax
    call sub_100F6DF4
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6D37
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push edi
    push push esi
    push push eax
    call call dword ptr [ecx + 0CCh]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003A37A
    inc inc esi
    add add edi, 104
    cmp cmp esi, ebx
    jl sub_1003A332
    cmp cmp esi, 8
    pop pop edi
    jae sub_1003A451
    jmp sub_1003A3FA
    lea lea ebx, [ebx]
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1003A446
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003A454
    push push 010198954h
    push push 010193358h
    push push eax
    call sub_100F6E60
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6DA3
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push 0
    push push esi
    push push eax
    call call dword ptr [ecx + 0D4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003A453
    inc inc esi
FUN_1003a1a0 ENDP
END
