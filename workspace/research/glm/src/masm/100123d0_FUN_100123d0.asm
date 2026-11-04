.686
.MODEL FLAT, C
EXTRN sub_100139F8:PROC
EXTRN sub_10060DFB:PROC
EXTRN sub_100F6116:PROC
EXTRN sub_100F619F:PROC
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D4A1C:DWORD
EXTRN fp_101D4A3C:DWORD
EXTRN g_101CE688:DWORD
EXTRN g_101CE7FC:DWORD
EXTRN g_101D1BF4:DWORD
EXTRN g_101D1C04:DWORD
.CODE
FUN_100123d0 PROC
    sub esp, 000000C0Ch
    push ebx
    push ebp
    push esi
    push edi
    mov edi, eax
    mov eax, dword ptr [g_101D1BF4]
    mov ecx, dword ptr [eax]
    push 22
    push edi
    push eax
    call dword ptr [ecx + 0x18]
    mov ebx, eax
    xor ebp, ebp
    xor eax, eax
    xor esi, esi
    cmp ebx, ebp
    mov dword ptr [g_101D1C04], eax
    jbe L3
    jmp L0
    lea ecx, [ecx]
L0:
    cmp eax, 000000100h
    jae L3
    mov ecx, dword ptr [g_101D1BF4]
    mov edx, dword ptr [ecx]
    shl eax, 4
    add eax, 0101D1C08h
    push eax
    push esi
    push 22
    push edi
    push ecx
    call dword ptr [edx + 0x1c]
    test eax, eax
    mov eax, dword ptr [g_101D1C04]
    jl L2
    mov ecx, eax
    shl ecx, 4
    mov edx, dword ptr [ecx + 0101D1C10h]
    cmp edx, ebp
    lea ecx, [ecx + 0101D1C10h]
    jne L1
    mov dword ptr [ecx], 60
    mov eax, dword ptr [g_101D1C04]
L1:
    inc eax
    mov dword ptr [g_101D1C04], eax
L2:
    inc esi
    cmp esi, ebx
    jb L0
L3:
    shl eax, 4
    add eax, 0101D1C08h
    mov edx, eax
    sub edx, 0101D1C08h
    push 010012320h
    sar edx, 4
    push edx
    push eax
    push 0101D1C08h
    call sub_100139F8
    mov eax, dword ptr [g_101D1C04]
    add esp, 16
    test eax, eax
    mov dword ptr [esp + 20], ebp
    mov dword ptr [esp + 24], ebp
    jbe L13
    lea edx, [esp + 28]
    sub edx, 4
    lea edi, [esp + 000000420h]
    mov ebx, 0101D1C08h
    mov dword ptr [esp + 24], edx
    sub edi, 8
    mov dword ptr [esp + 16], eax
    mov edi, edi
L4:
    mov esi, dword ptr [esp + 20]
    test esi, esi
    mov eax, dword ptr [ebx + 4]
    mov ecx, dword ptr [ebx]
    jle L5
    cmp dword ptr [edi - 4], ecx
    jne L5
    cmp dword ptr [edi], eax
    je L6
L5:
    cmp ecx, 000000280h
    jl L6
    cmp eax, 0000001E0h
    jl L6
    mov dword ptr [edi + 4], ecx
    mov ecx, dword ptr [esp + 20]
    inc ecx
    mov dword ptr [edi + 8], eax
    mov dword ptr [esp + 20], ecx
    add edi, 8
L6:
    mov esi, dword ptr [ebx + 8]
    xor eax, eax
    test ebp, ebp
    jle L8
L7:
    cmp dword ptr [esp + eax*4 + 28], esi
    je L12
    inc eax
    cmp eax, ebp
    jl L7
L8:
    test ebp, ebp
    mov ecx, ebp
    jle L11
    mov eax, edx
L9:
    mov edx, dword ptr [eax]
    cmp edx, esi
    jle L10
    mov dword ptr [eax + 4], edx
    dec ecx
    sub eax, 4
    test ecx, ecx
    jg L9
L10:
    mov edx, dword ptr [esp + 24]
L11:
    inc ebp
    add edx, 4
    mov dword ptr [esp + ecx*4 + 28], esi
    mov dword ptr [esp + 24], edx
L12:
    mov eax, dword ptr [esp + 16]
    add ebx, 16
    dec eax
    mov dword ptr [esp + 16], eax
    jne L4
    mov dword ptr [esp + 24], ebp
L13:
    mov eax, dword ptr [esp + 20]
    test eax, eax
    mov esi, 0101D3410h
    jne L14
    push 0000001E0h
    push 000000280h
    push 010193C8Ch
    call sub_10060DFB
    push 010194150h
    push 0
    mov edi, eax
    call dword ptr [fp_101D49C8]
    push 0101940F0h
    push 0
    call dword ptr [fp_101D49C8]
    push 010194090h
    push 0
    call dword ptr [fp_101D49C8]
    push edi
    push 010194088h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 48
    call dword ptr [fp_101D4A1C]
L14:
    mov eax, dword ptr [esp + 20]
    xor ebx, ebx
    xor edi, edi
    cmp eax, ebx
    mov dword ptr [esp + 16], ebx
    jle L18
    xor ebp, ebp
    lea ecx, [ecx]
L15:
    mov eax, dword ptr [esp + ebx + 000000420h]
    mov ecx, dword ptr [esp + ebx + 00000041Ch]
    push eax
    push ecx
    push 010193C84h
    push esi
    mov dword ptr [edi*4 + 0101D2C08h], esi
    call sub_100F6116
    lea esi, [esi + eax + 1]
    mov eax, dword ptr [esp + ebp + 00000042Ch]
    add esp, 16
    cmp eax, 000000280h
    jl L16
    cmp dword ptr [esp + ebp + 000000420h], 0000001E0h
    jge L17
L16:
    mov dword ptr [esp + 16], edi
    mov ebp, ebx
L17:
    mov eax, dword ptr [esp + 20]
    inc edi
    add ebx, 8
    cmp edi, eax
    jl L15
    mov ebp, dword ptr [esp + 24]
L18:
    mov edx, dword ptr [esp + 16]
    push 000002021h
    push edx
    push 0101D2C08h
    push 010193C7Ch
    mov dword ptr [edi*4 + 0101D2C08h], 0
    call dword ptr [fp_101D4A3C]
    xor ebx, ebx
    add esp, 16
    test ebp, ebp
    mov dword ptr [g_101CE688], eax
    mov dword ptr [esp + 16], ebx
    jle L21
    xor ebp, ebp
    xor edi, edi
L19:
    mov eax, dword ptr [esp + edi + 28]
    push eax
    push 010193C74h
    push esi
    mov dword ptr [edi + 0101D300Ch], esi
    call sub_100F619F
    lea esi, [esi + eax + 1]
    mov eax, dword ptr [esp + ebp + 40]
    add esp, 12
    cmp eax, 60
    jge L20
    mov dword ptr [esp + 16], ebx
    mov ebp, edi
L20:
    mov eax, dword ptr [esp + 24]
    inc ebx
    add edi, 4
    cmp ebx, eax
    jl L19
L21:
    mov ecx, dword ptr [esp + 16]
    push 000002021h
    push ecx
    push 0101D300Ch
    push 010193C60h
    mov dword ptr [ebx*4 + 0101D300Ch], 0
    call dword ptr [fp_101D4A3C]
    add esp, 16
    pop edi
    pop esi
    pop ebp
    mov dword ptr [g_101CE7FC], eax
    pop ebx
FUN_100123d0 ENDP
END
