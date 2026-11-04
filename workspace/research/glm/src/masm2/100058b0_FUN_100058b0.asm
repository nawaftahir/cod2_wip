.686
.MODEL FLAT, C
EXTRN sub_100059A4:PROC
EXTRN sub_100059C1:PROC
EXTRN EXTRN fp_101D49DC:DWORD:DWORD
EXTRN EXTRN g_101AE500:DWORD:DWORD
EXTRN EXTRN g_101AE504:DWORD:DWORD
EXTRN EXTRN g_101AE508:DWORD:DWORD
EXTRN EXTRN g_10678504:DWORD:DWORD
.CODE
FUN_100058b0 PROC
    mov mov ecx, dword ptr [g_101AE504]
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push esi
    mov mov esi, dword ptr [g_101AE500]
    xor xor ebx, ebx
    test test ecx, ecx
    push push edi
    jle L2
    xor xor edx, edx
    lea lea esp, [esp]
    mov mov eax, dword ptr [g_10678504]
    sub sub eax, dword ptr [edx + esi + 32]
    lea lea edi, [edx + esi]
    js L0
    cmp cmp eax, dword ptr [edi + 36]
    jg L1
    inc inc ebx
    add add edx, 40
    jmp L4
    dec dec ecx
    lea lea eax, [ecx + ecx*4]
    mov mov dword ptr [g_101AE504], ecx
    lea lea esi, [esi + eax*8]
    mov mov ecx, 10
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov esi, dword ptr [g_101AE500]
    mov mov ecx, dword ptr [g_101AE504]
    cmp cmp ebx, ecx
    jl L3
    test test esi, esi
    je sub_100059C1
    mov mov eax, dword ptr [ebp + 72]
    test test eax, eax
    jne sub_100059A4
    mov mov eax, dword ptr [g_101AE508]
    lea lea ecx, [eax + eax*4]
    shl shl ecx, 3
    push push ecx
    call dword ptr [fp_101D49DC]
    mov mov dword ptr [ebp + 72], eax
L3:
    mov mov esi, dword ptr [g_101AE500]
    mov mov ecx, dword ptr [g_101AE504]
    add add esp, 4
    mov mov edi, dword ptr [ebp + 72]
    lea lea ecx, [ecx + ecx*4]
L4:
    shl shl ecx, 3
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov eax, dword ptr [g_101AE504]
    pop pop edi
    pop pop esi
    mov mov dword ptr [ebp + 76], eax
    pop pop ebp
    pop pop ebx
    ret ret
    pop pop edi
    pop pop esi
    mov mov dword ptr [ebp + 76], ecx
    pop pop ebp
    pop pop ebx
    ret ret
FUN_100058b0 ENDP
END
