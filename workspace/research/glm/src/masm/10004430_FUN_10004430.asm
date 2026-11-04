.686
.MODEL FLAT, C
EXTRN sub_10001958:PROC
EXTRN sub_10001989:PROC
EXTRN sub_100019B7:PROC
EXTRN fp_101D49D4:DWORD
EXTRN fp_101D4C14:DWORD
EXTRN g_101AE498:DWORD
EXTRN g_101AE49C:DWORD
.CODE
FUN_10004430 PROC
    sub esp, 24
    push ebx
    push ebp
    push esi
    push edi
    mov ebx, 20
    mov edx, 18
    mov esi, eax
    call sub_10001958
    mov ebx, dword ptr [esi + 4]
    mov edi, eax
    mov eax, dword ptr [esi]
    mov ebp, dword ptr [eax + 00000009Ch]
    lea ecx, [edi + edi*8]
    shl ecx, 2
    push ecx
    add ebp, ebx
    call dword ptr [fp_101D49D4]
    mov dword ptr [esp + 24], eax
    mov ebx, 4
    mov edx, 19
    mov eax, esi
    call sub_10001989
    mov edx, dword ptr [esi]
    mov ecx, dword ptr [edx + 0000000A4h]
    mov edx, dword ptr [esi + 4]
    lea eax, [eax + eax*4]
    shl eax, 2
    add ecx, edx
    push eax
    mov dword ptr [esp + 36], ecx
    call dword ptr [fp_101D49D4]
    mov dword ptr [esp + 32], eax
    mov edx, 20
    mov eax, esi
    call sub_100019B7
    mov ecx, dword ptr [esi]
    mov ebx, dword ptr [ecx + 0000000ACh]
    mov ecx, dword ptr [esi + 4]
    shl eax, 4
    add ebx, ecx
    push eax
    mov dword ptr [esp + 44], ebx
    call dword ptr [fp_101D49D4]
    mov esi, dword ptr [esp + 32]
    xor edx, edx
    add esp, 12
    cmp edi, edx
    mov dword ptr [esp + 36], eax
    mov dword ptr [g_101AE498], esi
    jle L5
    lea eax, [ebp + 12]
    add esi, 4
    mov dword ptr [esp + 16], eax
    mov dword ptr [esp + 20], edi
    jmp L0
    lea ecx, [ecx]
L0:
    movsx ecx, word ptr [eax - 8]
    mov ebp, dword ptr [esp + 24]
    mov dword ptr [esi - 4], ecx
    mov ecx, dword ptr [eax - 12]
    lea edi, [ecx + ecx*4]
    lea edi, [ebp + edi*4]
    mov dword ptr [esi], edi
    mov edi, dword ptr [esi - 4]
    xor ebp, ebp
    cmp edi, edx
    jle L2
    mov edx, dword ptr [esp + 28]
    xor edi, edi
    lea ebx, [edx + ecx*4]
    lea ecx, [ecx]
L1:
    mov eax, dword ptr [ebx]
    push eax
    call dword ptr [fp_101D4C14]
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + edi], edx
    mov edx, dword ptr [eax + 4]
    add ecx, edi
    mov dword ptr [ecx + 4], edx
    mov edx, dword ptr [eax + 8]
    mov dword ptr [ecx + 8], edx
    fld dword ptr [eax + 12]
    mov eax, dword ptr [esi]
    fchs
    fstp dword ptr [edi + eax + 12]
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [eax + edi]
    mov edx, dword ptr [eax + edi + 4]
    add eax, edi
    add esp, 4
    test ecx, ecx
    setle cl
    dec cl
    and ecx, 12
    test edx, edx
    setle dl
    dec dl
    mov byte ptr [eax + 16], cl
    mov ecx, dword ptr [eax + 8]
    and dl, 12
    add dl, 4
    test ecx, ecx
    setle cl
    dec cl
    and cl, 12
    add cl, 8
    mov byte ptr [eax + 17], dl
    mov byte ptr [eax + 18], cl
    mov eax, dword ptr [esi - 4]
    inc ebp
    add ebx, 4
    add edi, 20
    cmp ebp, eax
    jl L1
    mov ebx, dword ptr [esp + 32]
    mov eax, dword ptr [esp + 16]
L2:
    mov ecx, dword ptr [eax]
    lea edx, [ecx + ecx*2]
    mov ecx, dword ptr [g_101AE49C]
    lea edx, [ecx + edx*4]
    mov dword ptr [esi + 16], edx
    movsx ecx, word ptr [eax + 4]
    mov dword ptr [esi + 12], ecx
    movsx edx, word ptr [eax - 6]
    mov dword ptr [esi + 4], edx
    mov ecx, dword ptr [eax - 4]
    mov edx, dword ptr [esp + 36]
    shl ecx, 4
    add ecx, edx
    mov dword ptr [esi + 8], ecx
    mov ecx, dword ptr [esi + 4]
    xor edi, edi
    test ecx, ecx
    jle L4
    xor ecx, ecx
    lea eax, [ebx + 2]
    lea esp, [esp]
L3:
    movzx edx, byte ptr [eax - 2]
    mov ebp, dword ptr [esi]
    lea edx, [edx + edx*4]
    lea edx, [ebp + edx*4]
    mov ebp, dword ptr [esi + 8]
    mov dword ptr [ecx + ebp], edx
    movzx edx, byte ptr [eax - 1]
    mov ebp, dword ptr [esi]
    lea edx, [edx + edx*4]
    lea edx, [ebp + edx*4]
    mov ebp, dword ptr [esi + 8]
    mov dword ptr [ecx + ebp + 4], edx
    movzx edx, byte ptr [eax]
    mov ebp, dword ptr [esi + 16]
    lea edx, [edx + edx*2]
    lea edx, [ebp + edx*4]
    mov ebp, dword ptr [esi + 8]
    mov dword ptr [ecx + ebp + 8], edx
    movzx edx, byte ptr [eax + 1]
    mov ebp, dword ptr [esi + 16]
    lea edx, [edx + edx*2]
    lea edx, [ebp + edx*4]
    mov ebp, dword ptr [esi + 8]
    mov dword ptr [ecx + ebp + 12], edx
    mov edx, dword ptr [esi + 4]
    inc edi
    add eax, 4
    add ecx, 16
    cmp edi, edx
    jl L3
    mov eax, dword ptr [esp + 16]
L4:
    mov ecx, dword ptr [esp + 20]
    xor edx, edx
    mov dword ptr [esi + 24], edx
    mov dword ptr [esi + 28], edx
    add eax, 20
    add esi, 36
    dec ecx
    mov dword ptr [esp + 16], eax
    mov dword ptr [esp + 20], ecx
    jne L0
L5:
    pop edi
    pop esi
    pop ebp
    pop ebx
FUN_10004430 ENDP
END
