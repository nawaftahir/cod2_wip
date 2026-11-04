.686
.MODEL FLAT, C
EXTRN sub_100016E9:PROC
EXTRN sub_100016F3:PROC
EXTRN sub_1002972E:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN fp_101D49E4:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_101D7E94:DWORD:DWORD
EXTRN EXTRN g_101D7E98:DWORD:DWORD
EXTRN EXTRN g_101D7E9C:DWORD:DWORD
.CODE
FUN_100015b0 PROC
    push push ecx
    mov mov eax, dword ptr [g_101D1B9C]
    mov mov eax, dword ptr [eax + 0F4h]
    shl shl eax, 3
    push push ebp
    push push eax
    call dword ptr [fp_101D49D4]
    mov mov ecx, dword ptr [g_101D1B9C]
    mov mov dword ptr [g_101D7E94], eax
    mov mov eax, dword ptr [ecx + 16]
    shl shl eax, 2
    push push eax
    call dword ptr [fp_101D49D4]
    mov mov edx, dword ptr [g_101D1B9C]
    mov mov dword ptr [g_101D7E98], eax
    mov mov eax, dword ptr [edx + 0ECh]
    shl shl eax, 2
    push push eax
    call dword ptr [fp_101D49D4]
    mov mov dword ptr [g_101D7E9C], eax
    mov mov eax, dword ptr [g_101D1B9C]
    mov mov ecx, dword ptr [eax + 0F4h]
    xor xor ebp, ebp
    add add esp, 12
    cmp cmp ecx, ebp
    jle sub_100016E9
    push push ebx
    push push esi
    mov mov dword ptr [esp + 12], ebp
    push push edi
    lea lea ebx, [ebx]
    mov mov eax, dword ptr [eax + 0F8h]
    mov mov esi, dword ptr [esp + 16]
    mov mov ecx, dword ptr [g_101D7E94]
    mov mov ebx, dword ptr [eax + esi + 16]
    add add eax, esi
    lea lea edi, [ecx + ebp*8]
    call sub_1002972E
    mov mov esi, eax
    shl shl esi, 4
    push push 4
    push push esi
    call dword ptr [fp_101D49E4]
    mov mov edx, eax
    mov mov dword ptr [edi + 4], edx
    mov mov edi, edx
    mov mov ecx, esi
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    mov mov edx, dword ptr [esp + 24]
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov eax, dword ptr [g_101D1B9C]
    mov mov ecx, dword ptr [eax + 0F4h]
    add add esp, 8
    inc inc ebp
    add add edx, 96
    cmp cmp ebp, ecx
    mov mov dword ptr [esp + 16], edx
    jl sub_100016F3
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    pop pop ecx
    ret ret
FUN_100015b0 ENDP
END
