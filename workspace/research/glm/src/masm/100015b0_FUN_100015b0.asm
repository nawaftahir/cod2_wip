.686
.MODEL FLAT, C
EXTRN sub_1002972E:PROC
EXTRN fp_101D49D4:DWORD
EXTRN fp_101D49E4:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_101D7E94:DWORD
EXTRN g_101D7E98:DWORD
EXTRN g_101D7E9C:DWORD
.CODE
FUN_100015b0 PROC
    push ecx
    mov eax, dword ptr [g_101D1B9C]
    mov eax, dword ptr [eax + 0000000F4h]
    shl eax, 3
    push ebp
    push eax
    call dword ptr [fp_101D49D4]
    mov ecx, dword ptr [g_101D1B9C]
    mov dword ptr [g_101D7E94], eax
    mov eax, dword ptr [ecx + 16]
    shl eax, 2
    push eax
    call dword ptr [fp_101D49D4]
    mov edx, dword ptr [g_101D1B9C]
    mov dword ptr [g_101D7E98], eax
    mov eax, dword ptr [edx + 0000000ECh]
    shl eax, 2
    push eax
    call dword ptr [fp_101D49D4]
    mov dword ptr [g_101D7E9C], eax
    mov eax, dword ptr [g_101D1B9C]
    mov ecx, dword ptr [eax + 0000000F4h]
    xor ebp, ebp
    add esp, 12
    cmp ecx, ebp
    jle L1
    push ebx
    push esi
    mov dword ptr [esp + 12], ebp
    push edi
    lea ebx, [ebx]
L0:
    mov eax, dword ptr [eax + 0000000F8h]
    mov esi, dword ptr [esp + 16]
    mov ecx, dword ptr [g_101D7E94]
    mov ebx, dword ptr [eax + esi + 16]
    add eax, esi
    lea edi, [ecx + ebp*8]
    call sub_1002972E
    mov esi, eax
    shl esi, 4
    push 4
    push esi
    call dword ptr [fp_101D49E4]
    mov edx, eax
    mov dword ptr [edi + 4], edx
    mov edi, edx
    mov ecx, esi
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    mov edx, dword ptr [esp + 24]
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov eax, dword ptr [g_101D1B9C]
    mov ecx, dword ptr [eax + 0000000F4h]
    add esp, 8
    inc ebp
    add edx, 96
    cmp ebp, ecx
    mov dword ptr [esp + 16], edx
    jl L0
    pop edi
    pop esi
    pop ebx
L1:
    pop ebp
    pop ecx
    ret
FUN_100015b0 ENDP
END
