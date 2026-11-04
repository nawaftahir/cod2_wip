.686
.MODEL FLAT, C
EXTRN sub_10001958:PROC
EXTRN sub_10001973:PROC
EXTRN sub_100047EF:PROC
EXTRN sub_100047F9:PROC
EXTRN fp_101D49D4:DWORD
EXTRN fp_101D4C14:DWORD
EXTRN g_101AE290:DWORD
EXTRN g_101AE294:DWORD
.CODE
FUN_10004730 PROC
    sub esp, 8
    push ebx
    push ebp
    push esi
    push edi
    mov ebx, 36
    mov edx, 25
    mov esi, eax
    call sub_10001958
    mov edx, dword ptr [esi + 4]
    mov ebp, eax
    mov eax, dword ptr [esi]
    mov edi, dword ptr [eax + 0000000D4h]
    add edi, edx
    mov edx, 26
    mov eax, esi
    call sub_10001973
    mov ecx, dword ptr [esi]
    mov ebx, dword ptr [ecx + 0000000DCh]
    mov ecx, dword ptr [esi + 4]
    mov dword ptr [esp + 20], eax
    add eax, ebp
    mov dword ptr [g_101AE290], eax
    lea eax, [eax + eax*2]
    shl eax, 3
    push eax
    add ebx, ecx
    call dword ptr [fp_101D49D4]
    add esp, 4
    test ebp, ebp
    mov esi, eax
    mov dword ptr [g_101AE294], esi
    jle L5
    mov dword ptr [esp + 16], ebp
    jmp L0
    lea ecx, [ecx]
L0:
    mov eax, dword ptr [edi]
    push eax
    call dword ptr [fp_101D4C14]
    mov dword ptr [esi + 12], eax
    mov dword ptr [esi], 0FFFFFFFFh
    mov ecx, dword ptr [edi + 4]
    add esp, 4
    test ecx, ecx
    jl L1
    lea edx, [ecx + ecx*2]
    jmp L2
L1:
    mov eax, ebp
    sub eax, ecx
    dec eax
    lea edx, [eax + eax*2]
L2:
    mov eax, dword ptr [g_101AE294]
    lea ecx, [eax + edx*8]
    mov dword ptr [esi + 16], ecx
    mov ecx, dword ptr [edi + 8]
    test ecx, ecx
    jl L3
    lea edx, [ecx + ecx*2]
    jmp L4
L3:
    mov eax, ebp
    sub eax, ecx
    dec eax
    lea edx, [eax + eax*2]
L4:
    mov eax, dword ptr [g_101AE294]
    lea ecx, [eax + edx*8]
    mov eax, dword ptr [esp + 16]
    mov dword ptr [esi + 20], ecx
    add edi, 36
    add esi, 24
    dec eax
    mov dword ptr [esp + 16], eax
    jne L0
L5:
    mov eax, dword ptr [esp + 20]
    test eax, eax
    jle L7
    add esi, 12
    nop
L6:
    mov edx, dword ptr [ebx + 24]
    mov dword ptr [esi - 4], edx
    mov ecx, dword ptr [ebx]
    mov dword ptr [esi], ecx
    add ebx, 36
    add esi, 24
    dec eax
    jne L6
L7:
    mov esi, dword ptr [g_101AE294]
    cmp dword ptr [esi], -1
    mov dword ptr [esi + 4], 0
    jne L8
    mov edx, dword ptr [esi + 16]
    push esi
    push edx
    call sub_100047EF
    mov eax, dword ptr [esi + 20]
    push esi
    push eax
    call sub_100047F9
    mov ecx, dword ptr [esi + 16]
    mov edx, dword ptr [esi + 20]
    mov dword ptr [esi + 8], 0FFFFFFFEh
    mov eax, dword ptr [ecx + 8]
    mov ecx, dword ptr [edx + 8]
    add esp, 16
    cmp eax, ecx
    jne L8
    mov dword ptr [esi + 8], eax
L8:
    pop edi
    pop esi
    pop ebp
    pop ebx
FUN_10004730 ENDP
END
