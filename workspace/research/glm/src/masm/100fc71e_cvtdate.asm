.686
.MODEL FLAT, C
EXTRN g_101A4DB8:DWORD
EXTRN g_101A4E48:DWORD
EXTRN g_101A4E4C:DWORD
EXTRN g_101A4E50:DWORD
EXTRN g_101A4E54:DWORD
EXTRN g_101A4E58:DWORD
EXTRN g_101A4E5C:DWORD
.CODE
cvtdate PROC
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 16]
    mov esi, eax
    mov eax, edi
    push 4
    cdq
    pop ebx
    idiv ebx
    cmp dword ptr [ebp + 12], 1
    jne L8
    test edx, edx
    mov dword ptr [ebp - 8], edx
    jne L0
    mov eax, edi
    push 100
    cdq
    pop ebx
    idiv ebx
    test edx, edx
    jne L1
L0:
    lea eax, [edi + 00000076Ch]
    cdq
    mov ebx, 000000190h
    idiv ebx
    test edx, edx
    je L1
    mov eax, esi
    shl eax, 2
    mov esi, dword ptr [eax + 0101A55ECh]
    jmp L2
L1:
    mov eax, esi
    shl eax, 2
    mov esi, dword ptr [eax + 0101A55B8h]
L2:
    mov dword ptr [ebp + 12], eax
    lea eax, [edi + 00000012Bh]
    cdq
    lea ebx, [edi - 1]
    mov edi, 000000190h
    idiv edi
    push 100
    pop edi
    inc esi
    push 4
    mov dword ptr [ebp - 4], eax
    mov eax, ebx
    cdq
    idiv edi
    mov edx, dword ptr [ebp - 4]
    pop edi
    push 7
    sub edx, eax
    mov eax, dword ptr [ebp + 16]
    dec eax
    mov ebx, edx
    cdq
    idiv edi
    mov edi, dword ptr [ebp + 16]
    mov edx, edi
    imul edx, edx, 00000016Dh
    add eax, esi
    add eax, ebx
    lea eax, [edx + eax - 0000063DBh]
    cdq
    pop ebx
    idiv ebx
    mov eax, dword ptr [ebp + 20]
    imul eax, eax, 7
    sub eax, edx
    add eax, dword ptr [ebp + 24]
    cmp edx, dword ptr [ebp + 24]
    jg L3
    lea esi, [esi + eax - 7]
    jmp L4
L3:
    add esi, eax
L4:
    cmp dword ptr [ebp + 20], 5
    jne L12
    cmp dword ptr [ebp - 8], 0
    jne L5
    mov eax, edi
    push 100
    cdq
    pop ebx
    idiv ebx
    test edx, edx
    jne L6
L5:
    lea eax, [edi + 00000076Ch]
    cdq
    mov ebx, 000000190h
    idiv ebx
    test edx, edx
    je L6
    mov eax, dword ptr [ebp + 12]
    mov eax, dword ptr [eax + 0101A55F0h]
    jmp L7
L6:
    mov eax, dword ptr [ebp + 12]
    mov eax, dword ptr [eax + 0101A55BCh]
L7:
    cmp esi, eax
    jle L12
    sub esi, 7
    jmp L12
L8:
    test edx, edx
    jne L9
    mov eax, edi
    push 100
    cdq
    pop ebx
    idiv ebx
    test edx, edx
    jne L10
L9:
    lea eax, [edi + 00000076Ch]
    cdq
    mov ebx, 000000190h
    idiv ebx
    test edx, edx
    je L10
    mov esi, dword ptr [esi*4 + 0101A55ECh]
    jmp L11
L10:
    mov esi, dword ptr [esi*4 + 0101A55B8h]
L11:
    add esi, dword ptr [ebp + 28]
L12:
    imul ecx, ecx, 60
    add ecx, dword ptr [ebp + 32]
    imul ecx, ecx, 60
    cmp dword ptr [ebp + 8], 1
    jne L13
    add ecx, dword ptr [ebp + 36]
    mov dword ptr [g_101A4E4C], esi
    imul ecx, ecx, 0000003E8h
    add ecx, dword ptr [ebp + 40]
    mov dword ptr [g_101A4E48], edi
    mov dword ptr [g_101A4E50], ecx
    jmp L17
L13:
    add ecx, dword ptr [g_101A4DB8]
    mov dword ptr [g_101A4E58], esi
    add ecx, dword ptr [ebp + 36]
    imul ecx, ecx, 0000003E8h
    add ecx, dword ptr [ebp + 40]
    mov dword ptr [g_101A4E5C], ecx
    jns L14
    add ecx, 005265C00h
    dec esi
    jmp L15
L14:
    mov eax, 005265C00h
    cmp ecx, eax
    jl L16
    sub ecx, eax
    inc esi
L15:
    mov dword ptr [g_101A4E5C], ecx
    mov dword ptr [g_101A4E58], esi
L16:
    mov dword ptr [g_101A4E54], edi
L17:
    pop edi
    pop esi
    pop ebx
    leave
    ret
cvtdate ENDP
END
