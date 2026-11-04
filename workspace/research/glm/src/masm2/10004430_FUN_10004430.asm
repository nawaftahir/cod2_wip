.686
.MODEL FLAT, C
EXTRN sub_10001958:PROC
EXTRN sub_10001989:PROC
EXTRN sub_100019B7:PROC
EXTRN sub_10004681:PROC
EXTRN sub_10004685:PROC
EXTRN sub_10004710:PROC
EXTRN sub_10004723:PROC
EXTRN sub_100047E6:PROC
EXTRN sub_100047EE:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN fp_101D4C14:DWORD:DWORD
EXTRN EXTRN g_101AE498:DWORD:DWORD
EXTRN EXTRN g_101AE49C:DWORD:DWORD
.CODE
FUN_10004430 PROC
    sub sub esp, 24
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov ebx, 20
    mov mov edx, 18
    mov mov esi, eax
    call sub_10001958
    mov mov ebx, dword ptr [esi + 4]
    mov mov edi, eax
    mov mov eax, dword ptr [esi]
    mov mov ebp, dword ptr [eax + 09Ch]
    lea lea ecx, [edi + edi*8]
    shl shl ecx, 2
    push push ecx
    add add ebp, ebx
    call dword ptr [fp_101D49D4]
    mov mov dword ptr [esp + 24], eax
    mov mov ebx, 4
    mov mov edx, 19
    mov mov eax, esi
    call sub_10001989
    mov mov edx, dword ptr [esi]
    mov mov ecx, dword ptr [edx + 0A4h]
    mov mov edx, dword ptr [esi + 4]
    lea lea eax, [eax + eax*4]
    shl shl eax, 2
    add add ecx, edx
    push push eax
    mov mov dword ptr [esp + 36], ecx
    call dword ptr [fp_101D49D4]
    mov mov dword ptr [esp + 32], eax
    mov mov edx, 20
    mov mov eax, esi
    call sub_100019B7
    mov mov ecx, dword ptr [esi]
    mov mov ebx, dword ptr [ecx + 0ACh]
    mov mov ecx, dword ptr [esi + 4]
    shl shl eax, 4
    add add ebx, ecx
    push push eax
    mov mov dword ptr [esp + 44], ebx
    call dword ptr [fp_101D49D4]
    mov mov esi, dword ptr [esp + 32]
    xor xor edx, edx
    add add esp, 12
    cmp cmp edi, edx
    mov mov dword ptr [esp + 36], eax
    mov mov dword ptr [g_101AE498], esi
    jle sub_10004710
    lea lea eax, [ebp + 12]
    add add esi, 4
    mov mov dword ptr [esp + 16], eax
    mov mov dword ptr [esp + 20], edi
    jmp L0
    lea lea ecx, [ecx]
    movsx movsx ecx, word ptr [eax - 8]
    mov mov ebp, dword ptr [esp + 24]
    mov mov dword ptr [esi - 4], ecx
    mov mov ecx, dword ptr [eax - 12]
    lea lea edi, [ecx + ecx*4]
    lea lea edi, [ebp + edi*4]
    mov mov dword ptr [esi], edi
    mov mov edi, dword ptr [esi - 4]
    xor xor ebp, ebp
    cmp cmp edi, edx
    jle sub_10004681
    mov mov edx, dword ptr [esp + 28]
    xor xor edi, edi
    lea lea ebx, [edx + ecx*4]
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [ebx]
    push push eax
    call dword ptr [fp_101D4C14]
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + edi], edx
    mov mov edx, dword ptr [eax + 4]
    add add ecx, edi
    mov mov dword ptr [ecx + 4], edx
    mov mov edx, dword ptr [eax + 8]
    mov mov dword ptr [ecx + 8], edx
    fld fld dword ptr [eax + 12]
    mov mov eax, dword ptr [esi]
    fchs fchs
    fstp fstp dword ptr [edi + eax + 12]
    mov mov eax, dword ptr [esi]
    mov mov ecx, dword ptr [eax + edi]
    mov mov edx, dword ptr [eax + edi + 4]
    add add eax, edi
    add add esp, 4
    test test ecx, ecx
    setle setle cl
    dec dec cl
    and and ecx, 12
    test test edx, edx
    setle setle dl
    dec dec dl
    mov mov byte ptr [eax + 16], cl
    mov mov ecx, dword ptr [eax + 8]
    and and dl, 12
    add add dl, 4
    test test ecx, ecx
    setle setle cl
    dec dec cl
    and and cl, 12
    add add cl, 8
    mov mov byte ptr [eax + 17], dl
    mov mov byte ptr [eax + 18], cl
    mov mov eax, dword ptr [esi - 4]
    inc inc ebp
    add add ebx, 4
    add add edi, 20
    cmp cmp ebp, eax
    jl sub_10004685
    mov mov ebx, dword ptr [esp + 32]
    mov mov eax, dword ptr [esp + 16]
    mov mov ecx, dword ptr [eax]
    lea lea edx, [ecx + ecx*2]
    mov mov ecx, dword ptr [g_101AE49C]
    lea lea edx, [ecx + edx*4]
    mov mov dword ptr [esi + 16], edx
    movsx movsx ecx, word ptr [eax + 4]
    mov mov dword ptr [esi + 12], ecx
    movsx movsx edx, word ptr [eax - 6]
    mov mov dword ptr [esi + 4], edx
    mov mov ecx, dword ptr [eax - 4]
    mov mov edx, dword ptr [esp + 36]
    shl shl ecx, 4
    add add ecx, edx
    mov mov dword ptr [esi + 8], ecx
    mov mov ecx, dword ptr [esi + 4]
    xor xor edi, edi
    test test ecx, ecx
    jle sub_100047E6
    xor xor ecx, ecx
    lea lea eax, [ebx + 2]
    lea lea esp, [esp]
    movzx movzx edx, byte ptr [eax - 2]
    mov mov ebp, dword ptr [esi]
    lea lea edx, [edx + edx*4]
    lea lea edx, [ebp + edx*4]
    mov mov ebp, dword ptr [esi + 8]
    mov mov dword ptr [ecx + ebp], edx
    movzx movzx edx, byte ptr [eax - 1]
    mov mov ebp, dword ptr [esi]
    lea lea edx, [edx + edx*4]
    lea lea edx, [ebp + edx*4]
    mov mov ebp, dword ptr [esi + 8]
    mov mov dword ptr [ecx + ebp + 4], edx
    movzx movzx edx, byte ptr [eax]
    mov mov ebp, dword ptr [esi + 16]
    lea lea edx, [edx + edx*2]
    lea lea edx, [ebp + edx*4]
    mov mov ebp, dword ptr [esi + 8]
    mov mov dword ptr [ecx + ebp + 8], edx
    movzx movzx edx, byte ptr [eax + 1]
    mov mov ebp, dword ptr [esi + 16]
    lea lea edx, [edx + edx*2]
    lea lea edx, [ebp + edx*4]
    mov mov ebp, dword ptr [esi + 8]
    mov mov dword ptr [ecx + ebp + 12], edx
    mov mov edx, dword ptr [esi + 4]
    inc inc edi
    add add eax, 4
    add add ecx, 16
    cmp cmp edi, edx
    jl sub_100047EE
    mov mov eax, dword ptr [esp + 16]
    mov mov ecx, dword ptr [esp + 20]
    xor xor edx, edx
    mov mov dword ptr [esi + 24], edx
    mov mov dword ptr [esi + 28], edx
    add add eax, 20
    add add esi, 36
    dec dec ecx
    mov mov dword ptr [esp + 16], eax
    mov mov dword ptr [esp + 20], ecx
    jne sub_10004723
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
FUN_10004430 ENDP
END
