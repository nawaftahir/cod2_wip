.686
.MODEL FLAT, C
EXTRN sub_10034CC3:PROC
EXTRN sub_10034CE3:PROC
.CODE
FUN_10034fe0 PROC
    sub esp, 64
    mov eax, dword ptr [esp + 76]
    push ebx
    mov ebx, dword ptr [esp + 72]
    push ebp
    push edi
    push eax
    push ecx
    push ebx
    lea edi, [esp + 68]
    lea edx, [esp + 52]
    mov eax, 2
    call sub_10034CC3
    mov edx, dword ptr [esp + 104]
    mov eax, dword ptr [esp + 96]
    add esp, 12
    push edx
    push eax
    push ebx
    lea edi, [esp + 76]
    lea edx, [esp + 60]
    mov eax, 2
    call sub_10034CE3
    fld dword ptr [esp + 52]
    lea ecx, [esi + 52]
    fchs
    fld dword ptr [esp + 56]
    mov dword ptr [esp + 32], ecx
    lea edx, [esi + 48]
    fchs
    lea eax, [esi + 44]
    lea ecx, [esi + 40]
    add esp, 12
    xor ebx, ebx
    mov dword ptr [esp + 16], edx
    mov dword ptr [esp + 36], eax
    mov dword ptr [esp + 28], ecx
    mov dword ptr [esp + 32], ebx
    lea edi, [esi + 36]
    lea edx, [esi + 32]
    lea ecx, [esi + 28]
    lea eax, [esi + 24]
    mov dword ptr [esp + 24], ebx
L0:
    mov ebp, dword ptr [esp + ebx + 48]
    fld st(1)
    mov dword ptr [ecx], ebp
    fstp dword ptr [eax]
    fld dword ptr [esp + 56]
    mov ebp, dword ptr [esp + 28]
    fmul dword ptr [esp + ebx + 64]
    mov ebx, dword ptr [esp + 40]
    mov dword ptr [ebp], ebx
    mov ebx, dword ptr [esp + 24]
    mov ebx, dword ptr [esp + ebx + 48]
    fst dword ptr [edi]
    mov ebp, dword ptr [esp + 36]
    mov dword ptr [ebp], ebx
    mov ebx, dword ptr [esp + 16]
    add ebp, 32
    mov dword ptr [esp + 36], ebp
    add dword ptr [esp + 16], 32
    mov ebp, dword ptr [esp + 20]
    mov dword ptr [ebx], 0
    mov ebx, dword ptr [esp + 20]
    fstp dword ptr [ebx]
    mov ebx, dword ptr [esp + 32]
    add ebp, 32
    mov dword ptr [esp + 20], ebp
    fst dword ptr [eax + 32]
    mov ebp, dword ptr [esp + 24]
    fld dword ptr [esp + 60]
    mov ebp, dword ptr [esp + ebp + 48]
    inc ebx
    mov dword ptr [esp + 32], ebx
    mov ebx, dword ptr [esp + 28]
    mov dword ptr [ecx + 32], ebp
    mov ebp, dword ptr [esp + 24]
    fmul dword ptr [esp + ebp + 64]
    mov ebp, dword ptr [esp + 44]
    mov dword ptr [ebx + 32], ebp
    add ebx, 32
    add eax, 32
    fst dword ptr [edi + 32]
    add ecx, 32
    mov dword ptr [esp + 28], ebx
    mov ebx, dword ptr [esp + 24]
    mov ebp, dword ptr [esp + ebx + 48]
    mov ebx, dword ptr [esp + 36]
    mov dword ptr [ebx], ebp
    mov ebp, dword ptr [esp + 16]
    mov dword ptr [ebp], 0
    mov ebp, dword ptr [esp + 20]
    add edi, 32
    fstp dword ptr [ebp]
    mov ebp, dword ptr [esp + 32]
    mov dword ptr [edx], 0
    add edx, 32
    inc ebp
    mov dword ptr [esp + 32], ebp
    add dword ptr [esp + 28], 32
    mov ebp, 32
    add ebx, ebp
    mov dword ptr [esp + 36], ebx
    add dword ptr [esp + 16], ebp
    add dword ptr [esp + 20], ebp
    mov ebx, dword ptr [esp + 24]
    add ebx, 4
    mov dword ptr [edx], 0
    add eax, 32
    add ecx, 32
    add edx, 32
    add edi, 32
    cmp ebx, 8
    mov dword ptr [esp + 24], ebx
    jl L0
    mov eax, dword ptr [esp + 32]
    fstp st(0)
    mov ecx, dword ptr [esp + 92]
    fstp st(0)
    add eax, eax
    mov edx, dword ptr [eax*4 + 0101D1BACh]
    mov dword ptr [esi + 20], eax
    mov eax, 03F800000h
    pop edi
    mov dword ptr [esi + 4], eax
    mov dword ptr [esi + 8], eax
    mov eax, dword ptr [esp + 84]
    pop ebp
    mov dword ptr [esi], edx
    mov dword ptr [esi + 12], eax
    mov dword ptr [esi + 16], ecx
    pop ebx
    add esp, 64
    ret
FUN_10034fe0 ENDP
END
