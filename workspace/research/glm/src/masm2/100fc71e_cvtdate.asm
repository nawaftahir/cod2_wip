.686
.MODEL FLAT, C
EXTRN sub_100FC8ED:PROC
EXTRN sub_100FC8FF:PROC
EXTRN sub_100FC913:PROC
EXTRN sub_100FC922:PROC
EXTRN sub_100FC942:PROC
EXTRN sub_100FC95E:PROC
EXTRN sub_100FC963:PROC
EXTRN sub_100FC969:PROC
EXTRN sub_100FC97B:PROC
EXTRN sub_100FC98B:PROC
EXTRN sub_100FC9D6:PROC
EXTRN sub_100FCA3D:PROC
EXTRN sub_100FCA3F:PROC
EXTRN sub_100FCA54:PROC
EXTRN sub_100FCA69:PROC
EXTRN EXTRN g_101A4DB8:DWORD:DWORD
EXTRN EXTRN g_101A4E48:DWORD:DWORD
EXTRN EXTRN g_101A4E4C:DWORD:DWORD
EXTRN EXTRN g_101A4E50:DWORD:DWORD
EXTRN EXTRN g_101A4E54:DWORD:DWORD
EXTRN EXTRN g_101A4E58:DWORD:DWORD
EXTRN EXTRN g_101A4E5C:DWORD:DWORD
.CODE
cvtdate PROC
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push ebx
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 16]
    mov mov esi, eax
    mov mov eax, edi
    push push 4
    cdq cdq
    pop pop ebx
    idiv idiv ebx
    cmp cmp dword ptr [ebp + 12], 1
    jne L4
    test test edx, edx
    mov mov dword ptr [ebp - 8], edx
    jne L0
    mov mov eax, edi
    push push 100
    cdq cdq
    pop pop ebx
    idiv idiv ebx
    test test edx, edx
    jne L1
    lea lea eax, [edi + 076Ch]
    cdq cdq
    mov mov ebx, 0190h
    idiv idiv ebx
    test test edx, edx
    je L2
    mov mov eax, esi
    shl shl eax, 2
    mov mov esi, dword ptr [eax + 0101A55ECh]
    jmp L3
    mov mov eax, esi
    shl shl eax, 2
    mov mov esi, dword ptr [eax + 0101A55B8h]
    mov mov dword ptr [ebp + 12], eax
    lea lea eax, [edi + 012Bh]
    cdq cdq
    lea lea ebx, [edi - 1]
    mov mov edi, 0190h
    idiv idiv edi
    push push 100
    pop pop edi
    inc inc esi
    push push 4
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, ebx
    cdq cdq
    idiv idiv edi
    mov mov edx, dword ptr [ebp - 4]
    pop pop edi
    push push 7
    sub sub edx, eax
    mov mov eax, dword ptr [ebp + 16]
    dec dec eax
    mov mov ebx, edx
    cdq cdq
    idiv idiv edi
    mov mov edi, dword ptr [ebp + 16]
    mov mov edx, edi
    imul imul edx, edx, 016Dh
    add add eax, esi
    add add eax, ebx
    lea lea eax, [edx + eax - 063DBh]
    cdq cdq
    pop pop ebx
    idiv idiv ebx
    mov mov eax, dword ptr [ebp + 20]
    imul imul eax, eax, 7
    sub sub eax, edx
    add add eax, dword ptr [ebp + 24]
    cmp cmp edx, dword ptr [ebp + 24]
    jg L5
    lea lea esi, [esi + eax - 7]
    jmp L6
    add add esi, eax
    cmp cmp dword ptr [ebp + 20], 5
    jne sub_100FC922
    cmp cmp dword ptr [ebp - 8], 0
    jne L7
    mov mov eax, edi
    push push 100
    cdq cdq
    pop pop ebx
    idiv idiv ebx
    test test edx, edx
    jne sub_100FC8ED
    lea lea eax, [edi + 076Ch]
    cdq cdq
    mov mov ebx, 0190h
    idiv idiv ebx
    test test edx, edx
    je sub_100FC8FF
    mov mov eax, dword ptr [ebp + 12]
    mov mov eax, dword ptr [eax + 0101A55F0h]
    jmp sub_100FC913
    mov mov eax, dword ptr [ebp + 12]
    mov mov eax, dword ptr [eax + 0101A55BCh]
    cmp cmp esi, eax
    jle sub_100FC95E
    sub sub esi, 7
    jmp sub_100FC963
    test test edx, edx
    jne sub_100FC942
    mov mov eax, edi
    push push 100
    cdq cdq
    pop pop ebx
    idiv idiv ebx
    test test edx, edx
    jne sub_100FC969
    lea lea eax, [edi + 076Ch]
    cdq cdq
    mov mov ebx, 0190h
    idiv idiv ebx
    test test edx, edx
    je sub_100FC97B
    mov mov esi, dword ptr [esi*4 + 0101A55ECh]
    jmp sub_100FC98B
    mov mov esi, dword ptr [esi*4 + 0101A55B8h]
    add add esi, dword ptr [ebp + 28]
    imul imul ecx, ecx, 60
    add add ecx, dword ptr [ebp + 32]
    imul imul ecx, ecx, 60
    cmp cmp dword ptr [ebp + 8], 1
    jne sub_100FC9D6
    add add ecx, dword ptr [ebp + 36]
    mov mov dword ptr [g_101A4E4C], esi
    imul imul ecx, ecx, 03E8h
    add add ecx, dword ptr [ebp + 40]
    mov mov dword ptr [g_101A4E48], edi
    mov mov dword ptr [g_101A4E50], ecx
    jmp sub_100FCA3D
    add add ecx, dword ptr [g_101A4DB8]
    mov mov dword ptr [g_101A4E58], esi
L5:
    add add ecx, dword ptr [ebp + 36]
    imul imul ecx, ecx, 03E8h
    add add ecx, dword ptr [ebp + 40]
    mov mov dword ptr [g_101A4E5C], ecx
    jns sub_100FCA3F
    add add ecx, 05265C00h
    dec dec esi
    jmp sub_100FCA54
    mov mov eax, 05265C00h
    cmp cmp ecx, eax
    jl sub_100FCA69
    sub sub ecx, eax
    inc inc esi
    mov mov dword ptr [g_101A4E5C], ecx
    mov mov dword ptr [g_101A4E58], esi
    mov mov dword ptr [g_101A4E54], edi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
cvtdate ENDP
END
