.686
.MODEL FLAT, C
EXTRN sub_10034CC3:PROC
EXTRN sub_10034CE3:PROC
EXTRN sub_100351EE:PROC
.CODE
FUN_10034fe0 PROC
    sub sub esp, 64
    mov mov eax, dword ptr [esp + 76]
    push push ebx
    mov mov ebx, dword ptr [esp + 72]
    push push ebp
    push push edi
    push push eax
    push push ecx
    push push ebx
    lea lea edi, [esp + 68]
    lea lea edx, [esp + 52]
    mov mov eax, 2
    call sub_10034CC3
    mov mov edx, dword ptr [esp + 104]
    mov mov eax, dword ptr [esp + 96]
    add add esp, 12
    push push edx
    push push eax
    push push ebx
    lea lea edi, [esp + 76]
    lea lea edx, [esp + 60]
    mov mov eax, 2
    call sub_10034CE3
    fld fld dword ptr [esp + 52]
    lea lea ecx, [esi + 52]
    fchs fchs
    fld fld dword ptr [esp + 56]
    mov mov dword ptr [esp + 32], ecx
    lea lea edx, [esi + 48]
    fchs fchs
    lea lea eax, [esi + 44]
    lea lea ecx, [esi + 40]
    add add esp, 12
    xor xor ebx, ebx
    mov mov dword ptr [esp + 16], edx
    mov mov dword ptr [esp + 36], eax
    mov mov dword ptr [esp + 28], ecx
    mov mov dword ptr [esp + 32], ebx
    lea lea edi, [esi + 36]
    lea lea edx, [esi + 32]
    lea lea ecx, [esi + 28]
    lea lea eax, [esi + 24]
    mov mov dword ptr [esp + 24], ebx
    mov mov ebp, dword ptr [esp + ebx + 48]
    fld fld st(1)
    mov mov dword ptr [ecx], ebp
    fstp fstp dword ptr [eax]
    fld fld dword ptr [esp + 56]
    mov mov ebp, dword ptr [esp + 28]
    fmul fmul dword ptr [esp + ebx + 64]
    mov mov ebx, dword ptr [esp + 40]
    mov mov dword ptr [ebp], ebx
    mov mov ebx, dword ptr [esp + 24]
    mov mov ebx, dword ptr [esp + ebx + 48]
    fst fst dword ptr [edi]
    mov mov ebp, dword ptr [esp + 36]
    mov mov dword ptr [ebp], ebx
    mov mov ebx, dword ptr [esp + 16]
    add add ebp, 32
    mov mov dword ptr [esp + 36], ebp
    add add dword ptr [esp + 16], 32
    mov mov ebp, dword ptr [esp + 20]
    mov mov dword ptr [ebx], 0
    mov mov ebx, dword ptr [esp + 20]
    fstp fstp dword ptr [ebx]
    mov mov ebx, dword ptr [esp + 32]
    add add ebp, 32
    mov mov dword ptr [esp + 20], ebp
    fst fst dword ptr [eax + 32]
    mov mov ebp, dword ptr [esp + 24]
    fld fld dword ptr [esp + 60]
    mov mov ebp, dword ptr [esp + ebp + 48]
    inc inc ebx
    mov mov dword ptr [esp + 32], ebx
    mov mov ebx, dword ptr [esp + 28]
    mov mov dword ptr [ecx + 32], ebp
    mov mov ebp, dword ptr [esp + 24]
    fmul fmul dword ptr [esp + ebp + 64]
    mov mov ebp, dword ptr [esp + 44]
    mov mov dword ptr [ebx + 32], ebp
    add add ebx, 32
    add add eax, 32
    fst fst dword ptr [edi + 32]
    add add ecx, 32
    mov mov dword ptr [esp + 28], ebx
    mov mov ebx, dword ptr [esp + 24]
    mov mov ebp, dword ptr [esp + ebx + 48]
    mov mov ebx, dword ptr [esp + 36]
    mov mov dword ptr [ebx], ebp
    mov mov ebp, dword ptr [esp + 16]
    mov mov dword ptr [ebp], 0
    mov mov ebp, dword ptr [esp + 20]
    add add edi, 32
    fstp fstp dword ptr [ebp]
    mov mov ebp, dword ptr [esp + 32]
    mov mov dword ptr [edx], 0
    add add edx, 32
    inc inc ebp
    mov mov dword ptr [esp + 32], ebp
    add add dword ptr [esp + 28], 32
    mov mov ebp, 32
    add add ebx, ebp
    mov mov dword ptr [esp + 36], ebx
    add add dword ptr [esp + 16], ebp
    add add dword ptr [esp + 20], ebp
    mov mov ebx, dword ptr [esp + 24]
    add add ebx, 4
    mov mov dword ptr [edx], 0
    add add eax, 32
    add add ecx, 32
    add add edx, 32
    add add edi, 32
    cmp cmp ebx, 8
    mov mov dword ptr [esp + 24], ebx
    jl sub_100351EE
    mov mov eax, dword ptr [esp + 32]
    fstp fstp st(0)
    mov mov ecx, dword ptr [esp + 92]
    fstp fstp st(0)
    add add eax, eax
    mov mov edx, dword ptr [eax*4 + 0101D1BACh]
    mov mov dword ptr [esi + 20], eax
    mov mov eax, 03F800000h
    pop pop edi
    mov mov dword ptr [esi + 4], eax
    mov mov dword ptr [esi + 8], eax
    mov mov eax, dword ptr [esp + 84]
    pop pop ebp
    mov mov dword ptr [esi], edx
    mov mov dword ptr [esi + 12], eax
    mov mov dword ptr [esi + 16], ecx
    pop pop ebx
    add add esp, 64
    ret ret
FUN_10034fe0 ENDP
END
