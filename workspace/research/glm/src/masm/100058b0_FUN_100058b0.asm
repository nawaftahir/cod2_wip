.686
.MODEL FLAT, C
EXTRN fp_101D49DC:DWORD
EXTRN g_101AE500:DWORD
EXTRN g_101AE504:DWORD
EXTRN g_101AE508:DWORD
EXTRN g_10678504:DWORD
.CODE
FUN_100058b0 PROC
    mov ecx, dword ptr [g_101AE504]
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    mov esi, dword ptr [g_101AE500]
    xor ebx, ebx
    test ecx, ecx
    push edi
    jle L3
    xor edx, edx
    lea esp, [esp]
L0:
    mov eax, dword ptr [g_10678504]
    sub eax, dword ptr [edx + esi + 32]
    lea edi, [edx + esi]
    js L1
    cmp eax, dword ptr [edi + 36]
    jg L1
    inc ebx
    add edx, 40
    jmp L2
L1:
    dec ecx
    lea eax, [ecx + ecx*4]
    mov dword ptr [g_101AE504], ecx
    lea esi, [esi + eax*8]
    mov ecx, 10
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov esi, dword ptr [g_101AE500]
    mov ecx, dword ptr [g_101AE504]
L2:
    cmp ebx, ecx
    jl L0
L3:
    test esi, esi
    je L5
    mov eax, dword ptr [ebp + 72]
    test eax, eax
    jne L4
    mov eax, dword ptr [g_101AE508]
    lea ecx, [eax + eax*4]
    shl ecx, 3
    push ecx
    call dword ptr [fp_101D49DC]
    mov dword ptr [ebp + 72], eax
    mov esi, dword ptr [g_101AE500]
    mov ecx, dword ptr [g_101AE504]
    add esp, 4
L4:
    mov edi, dword ptr [ebp + 72]
    lea ecx, [ecx + ecx*4]
    shl ecx, 3
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov eax, dword ptr [g_101AE504]
    pop edi
    pop esi
    mov dword ptr [ebp + 76], eax
    pop ebp
    pop ebx
    ret
L5:
    pop edi
    pop esi
    mov dword ptr [ebp + 76], ecx
    pop ebp
    pop ebx
    ret
FUN_100058b0 ENDP
END
