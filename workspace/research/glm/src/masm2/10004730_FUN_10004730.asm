.686
.MODEL FLAT, C
EXTRN sub_10001958:PROC
EXTRN sub_10001973:PROC
EXTRN sub_1000486B:PROC
EXTRN sub_10004874:PROC
EXTRN sub_1000488B:PROC
EXTRN sub_10004898:PROC
EXTRN sub_100048FF:PROC
EXTRN sub_10004903:PROC
EXTRN sub_1000496B:PROC
EXTRN sub_10004999:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN fp_101D4C14:DWORD:DWORD
EXTRN EXTRN g_101AE290:DWORD:DWORD
EXTRN EXTRN g_101AE294:DWORD:DWORD
.CODE
FUN_10004730 PROC
    sub sub esp, 8
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov ebx, 36
    mov mov edx, 25
    mov mov esi, eax
    call sub_10001958
    mov mov edx, dword ptr [esi + 4]
    mov mov ebp, eax
    mov mov eax, dword ptr [esi]
    mov mov edi, dword ptr [eax + 0D4h]
    add add edi, edx
    mov mov edx, 26
    mov mov eax, esi
    call sub_10001973
    mov mov ecx, dword ptr [esi]
    mov mov ebx, dword ptr [ecx + 0DCh]
    mov mov ecx, dword ptr [esi + 4]
    mov mov dword ptr [esp + 20], eax
    add add eax, ebp
    mov mov dword ptr [g_101AE290], eax
    lea lea eax, [eax + eax*2]
    shl shl eax, 3
    push push eax
    add add ebx, ecx
    call dword ptr [fp_101D49D4]
    add add esp, 4
    test test ebp, ebp
    mov mov esi, eax
    mov mov dword ptr [g_101AE294], esi
    jle sub_1000486B
    mov mov dword ptr [esp + 16], ebp
    jmp L2
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [edi]
    push push eax
    call dword ptr [fp_101D4C14]
    mov mov dword ptr [esi + 12], eax
    mov mov dword ptr [esi], -1
    mov mov ecx, dword ptr [edi + 4]
    add add esp, 4
    test test ecx, ecx
    jl L3
    lea lea edx, [ecx + ecx*2]
    jmp L4
    mov mov eax, ebp
    sub sub eax, ecx
    dec dec eax
    lea lea edx, [eax + eax*2]
    mov mov eax, dword ptr [g_101AE294]
    lea lea ecx, [eax + edx*8]
    mov mov dword ptr [esi + 16], ecx
    mov mov ecx, dword ptr [edi + 8]
    test test ecx, ecx
    jl sub_1000488B
    lea lea edx, [ecx + ecx*2]
    jmp sub_10004898
    mov mov eax, ebp
    sub sub eax, ecx
    dec dec eax
    lea lea edx, [eax + eax*2]
    mov mov eax, dword ptr [g_101AE294]
    lea lea ecx, [eax + edx*8]
    mov mov eax, dword ptr [esp + 16]
    mov mov dword ptr [esi + 20], ecx
    add add edi, 36
    add add esi, 24
    dec dec eax
    mov mov dword ptr [esp + 16], eax
    jne sub_10004874
    mov mov eax, dword ptr [esp + 20]
    test test eax, eax
    jle sub_100048FF
    add add esi, 12
    nop nop
    mov mov edx, dword ptr [ebx + 24]
    mov mov dword ptr [esi - 4], edx
    mov mov ecx, dword ptr [ebx]
    mov mov dword ptr [esi], ecx
    add add ebx, 36
    add add esi, 24
    dec dec eax
    jne sub_10004903
    mov mov esi, dword ptr [g_101AE294]
    cmp cmp dword ptr [esi], -1
    mov mov dword ptr [esi + 4], 0
    jne sub_1000496B
    mov mov edx, dword ptr [esi + 16]
    push push esi
    push push edx
    call L0
    mov mov eax, dword ptr [esi + 20]
    push push esi
    push push eax
    call L1
    mov mov ecx, dword ptr [esi + 16]
    mov mov edx, dword ptr [esi + 20]
    mov mov dword ptr [esi + 8], -2
    mov mov eax, dword ptr [ecx + 8]
    mov mov ecx, dword ptr [edx + 8]
    add add esp, 16
    cmp cmp eax, ecx
    jne sub_10004999
    mov mov dword ptr [esi + 8], eax
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
FUN_10004730 ENDP
END
