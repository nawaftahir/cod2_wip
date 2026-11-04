.686
.MODEL FLAT, C
EXTRN sub_100FCA75:PROC
EXTRN sub_100FCB2E:PROC
EXTRN sub_100FCB56:PROC
EXTRN sub_100FCB6F:PROC
EXTRN sub_100FCB86:PROC
EXTRN sub_100FCB9B:PROC
EXTRN g_101A4DB0:DWORD
EXTRN g_101A4DB4:DWORD
EXTRN g_101A4DB8:DWORD
.CODE
_localtime PROC
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    cmp dword ptr [esi], 0
    jge L0
    xor eax, eax
    jmp L9
L0:
    call sub_100FCA75
    mov eax, dword ptr [esi]
    cmp eax, 00003F480h
    jle L1
    cmp eax, 07FFC0B7Fh
    jge L1
    sub eax, dword ptr [g_101A4DB0]
    mov dword ptr [ebp + 8], eax
    lea eax, [ebp + 8]
    push eax
    call sub_100FCB56
    cmp dword ptr [g_101A4DB4], 0
    pop ecx
    mov esi, eax
    je L8
    push esi
    call sub_100FCB2E
    test eax, eax
    pop ecx
    je L8
    mov eax, dword ptr [g_101A4DB8]
    sub dword ptr [ebp + 8], eax
    lea eax, [ebp + 8]
    push eax
    call sub_100FCB86
    mov esi, eax
    pop ecx
    mov dword ptr [esi + 32], 1
    jmp L8
L1:
    push esi
    call sub_100FCB9B
    cmp dword ptr [g_101A4DB4], 0
    pop ecx
    mov esi, eax
    je L2
    push esi
    call sub_100FCB6F
    test eax, eax
    pop ecx
    je L2
    mov eax, dword ptr [esi]
    sub eax, dword ptr [g_101A4DB8]
    sub eax, dword ptr [g_101A4DB0]
    mov dword ptr [ebp + 8], eax
    mov dword ptr [esi + 32], 1
    mov eax, dword ptr [ebp + 8]
    jmp L3
L2:
    mov eax, dword ptr [esi]
    sub eax, dword ptr [g_101A4DB0]
    mov dword ptr [ebp + 8], eax
L3:
    push ebx
    push 60
    pop ecx
    cdq
    mov ebx, ecx
    idiv ebx
    test edx, edx
    mov dword ptr [esi], edx
    jge L4
    add edx, ecx
    mov dword ptr [esi], edx
    sub dword ptr [ebp + 8], ecx
L4:
    mov eax, dword ptr [ebp + 8]
    cdq
    mov ebx, ecx
    idiv ebx
    add eax, dword ptr [esi + 4]
    mov dword ptr [ebp + 8], eax
    cdq
    idiv ebx
    pop ebx
    test edx, edx
    mov dword ptr [esi + 4], edx
    jge L5
    add edx, 60
    mov dword ptr [esi + 4], edx
    sub dword ptr [ebp + 8], ecx
L5:
    mov eax, dword ptr [ebp + 8]
    cdq
    idiv ecx
    push 24
    pop ecx
    add eax, dword ptr [esi + 8]
    mov dword ptr [ebp + 8], eax
    cdq
    idiv ecx
    test edx, edx
    mov dword ptr [esi + 8], edx
    jge L6
    add edx, ecx
    mov dword ptr [esi + 8], edx
    sub dword ptr [ebp + 8], ecx
L6:
    mov eax, dword ptr [ebp + 8]
    push 24
    cdq
    pop ecx
    idiv ecx
    mov ecx, eax
    test ecx, ecx
    mov dword ptr [ebp + 8], ecx
    jle L10
    mov eax, dword ptr [esi + 24]
    add eax, ecx
    cdq
    push 7
    pop ecx
    idiv ecx
    mov dword ptr [esi + 24], edx
    mov eax, dword ptr [ebp + 8]
    add dword ptr [esi + 12], eax
L7:
    mov eax, dword ptr [ebp + 8]
    add dword ptr [esi + 28], eax
L8:
    mov eax, esi
L9:
    pop esi
    pop ebp
    ret
L10:
    jge L8
    mov eax, dword ptr [esi + 24]
    lea eax, [eax + ecx + 7]
    cdq
    push 7
    pop ecx
    idiv ecx
    mov dword ptr [esi + 24], edx
    mov eax, dword ptr [ebp + 8]
    add dword ptr [esi + 12], eax
    mov eax, dword ptr [esi + 12]
    test eax, eax
    jg L7
    add eax, 31
    dec dword ptr [esi + 20]
    mov dword ptr [esi + 12], eax
    mov dword ptr [esi + 28], 00000016Ch
    mov dword ptr [esi + 16], 11
    jmp L8
_localtime ENDP
END
