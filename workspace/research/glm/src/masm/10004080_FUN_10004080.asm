.686
.MODEL FLAT, C
EXTRN sub_10001957:PROC
EXTRN fp_101D49D4:DWORD
EXTRN g_101AE49C:DWORD
.CODE
FUN_10004080 PROC
    sub esp, 8
    push ebx
    push esi
    push edi
    mov ebx, 12
    mov edx, 17
    mov edi, eax
    call sub_10001957
    mov esi, eax
    mov eax, dword ptr [edi]
    mov ebx, dword ptr [eax + 000000094h]
    mov eax, dword ptr [edi + 4]
    lea ecx, [esi + esi*2]
    shl ecx, 2
    push ecx
    add ebx, eax
    call dword ptr [fp_101D49D4]
    add esp, 4
    xor edi, edi
    cmp esi, 4
    mov dword ptr [g_101AE49C], eax
    jl L1
    mov edi, ebx
    sub edi, eax
    mov dword ptr [esp + 12], edi
    lea edi, [esi - 4]
    shr edi, 2
    inc edi
    push ebp
    lea ebp, [edi*4]
    lea edx, [ebx + 12]
    lea ecx, [eax + 4]
    mov dword ptr [esp + 20], ebp
L0:
    mov ebp, dword ptr [edx - 12]
    mov dword ptr [ecx - 4], ebp
    mov ebp, dword ptr [esp + 16]
    mov ebp, dword ptr [ecx + ebp]
    mov dword ptr [ecx], ebp
    mov ebp, dword ptr [edx - 4]
    mov dword ptr [ecx + 4], ebp
    mov ebp, dword ptr [edx]
    mov dword ptr [ecx + 8], ebp
    mov ebp, dword ptr [edx + 4]
    mov dword ptr [ecx + 12], ebp
    mov ebp, dword ptr [edx + 8]
    mov dword ptr [ecx + 16], ebp
    mov ebp, dword ptr [edx + 12]
    mov dword ptr [ecx + 20], ebp
    mov ebp, dword ptr [edx + 16]
    mov dword ptr [ecx + 24], ebp
    mov ebp, dword ptr [edx + 20]
    mov dword ptr [ecx + 28], ebp
    mov ebp, dword ptr [edx + 24]
    mov dword ptr [ecx + 32], ebp
    mov ebp, dword ptr [edx + 28]
    mov dword ptr [ecx + 36], ebp
    mov ebp, dword ptr [edx + 32]
    mov dword ptr [ecx + 40], ebp
    add edx, 48
    add ecx, 48
    dec edi
    jne L0
    mov edi, dword ptr [esp + 20]
    pop ebp
L1:
    cmp edi, esi
    jge L3
    lea ecx, [edi + edi*2]
    shl ecx, 2
    lea edx, [ecx + ebx]
    sub ebx, eax
    lea ecx, [ecx + eax + 4]
    sub esi, edi
L2:
    mov eax, dword ptr [edx]
    mov dword ptr [ecx - 4], eax
    mov eax, dword ptr [ebx + ecx]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [edx + 8]
    mov dword ptr [ecx + 4], eax
    add edx, 12
    add ecx, 12
    dec esi
    jne L2
L3:
    pop edi
    pop esi
    pop ebx
    add esp, 8
    ret
FUN_10004080 ENDP
END
