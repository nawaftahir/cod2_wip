.686
.MODEL FLAT, C
EXTRN sub_100F7011:PROC
EXTRN sub_100F7020:PROC
EXTRN sub_100F7025:PROC
EXTRN sub_100F7040:PROC
EXTRN sub_100F7067:PROC
EXTRN sub_100F70AA:PROC
EXTRN sub_100F70F5:PROC
EXTRN sub_100F7111:PROC
EXTRN sub_100F7128:PROC
EXTRN sub_100F7147:PROC
EXTRN sub_100FCA75:PROC
EXTRN sub_100FCB2E:PROC
EXTRN sub_100FCB56:PROC
EXTRN sub_100FCB6F:PROC
EXTRN sub_100FCB86:PROC
EXTRN sub_100FCB9B:PROC
EXTRN EXTRN g_101A4DB0:DWORD:DWORD
EXTRN EXTRN g_101A4DB4:DWORD:DWORD
EXTRN EXTRN g_101A4DB8:DWORD:DWORD
.CODE
_localtime PROC
    push push ebp
    mov mov ebp, esp
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    cmp cmp dword ptr [esi], 0
    jge L0
    xor xor eax, eax
    jmp L5
    call sub_100FCA75
    mov mov eax, dword ptr [esi]
    cmp cmp eax, 03F480h
L0:
    jle L1
    cmp cmp eax, 07FFC0B7Fh
    jge L2
    sub sub eax, dword ptr [g_101A4DB0]
    mov mov dword ptr [ebp + 8], eax
    lea lea eax, [ebp + 8]
    push push eax
    call sub_100FCB56
    cmp cmp dword ptr [g_101A4DB4], 0
    pop pop ecx
    mov mov esi, eax
    je sub_100F7011
    push push esi
    call sub_100FCB2E
    test test eax, eax
    pop pop ecx
    je sub_100F7020
    mov mov eax, dword ptr [g_101A4DB8]
    sub sub dword ptr [ebp + 8], eax
    lea lea eax, [ebp + 8]
    push push eax
    call sub_100FCB86
    mov mov esi, eax
    pop pop ecx
    mov mov dword ptr [esi + 32], 1
    jmp sub_100F7040
    push push esi
    call sub_100FCB9B
    cmp cmp dword ptr [g_101A4DB4], 0
    pop pop ecx
    mov mov esi, eax
    je L3
    push push esi
    call sub_100FCB6F
    test test eax, eax
    pop pop ecx
    je L4
    mov mov eax, dword ptr [esi]
    sub sub eax, dword ptr [g_101A4DB8]
    sub sub eax, dword ptr [g_101A4DB0]
    mov mov dword ptr [ebp + 8], eax
    mov mov dword ptr [esi + 32], 1
    mov mov eax, dword ptr [ebp + 8]
    jmp L6
    mov mov eax, dword ptr [esi]
    sub sub eax, dword ptr [g_101A4DB0]
    mov mov dword ptr [ebp + 8], eax
    push push ebx
    push push 60
    pop pop ecx
    cdq cdq
    mov mov ebx, ecx
    idiv idiv ebx
    test test edx, edx
    mov mov dword ptr [esi], edx
    jge sub_100F7025
    add add edx, ecx
    mov mov dword ptr [esi], edx
    sub sub dword ptr [ebp + 8], ecx
    mov mov eax, dword ptr [ebp + 8]
    cdq cdq
    mov mov ebx, ecx
    idiv idiv ebx
    add add eax, dword ptr [esi + 4]
    mov mov dword ptr [ebp + 8], eax
    cdq cdq
    idiv idiv ebx
    pop pop ebx
    test test edx, edx
    mov mov dword ptr [esi + 4], edx
    jge sub_100F7067
    add add edx, 60
    mov mov dword ptr [esi + 4], edx
    sub sub dword ptr [ebp + 8], ecx
    mov mov eax, dword ptr [ebp + 8]
    cdq cdq
    idiv idiv ecx
    push push 24
    pop pop ecx
    add add eax, dword ptr [esi + 8]
    mov mov dword ptr [ebp + 8], eax
    cdq cdq
    idiv idiv ecx
    test test edx, edx
    mov mov dword ptr [esi + 8], edx
    jge sub_100F70AA
    add add edx, ecx
    mov mov dword ptr [esi + 8], edx
    sub sub dword ptr [ebp + 8], ecx
    mov mov eax, dword ptr [ebp + 8]
    push push 24
    cdq cdq
    pop pop ecx
    idiv idiv ecx
    mov mov ecx, eax
    test test ecx, ecx
    mov mov dword ptr [ebp + 8], ecx
    jle sub_100F70F5
    mov mov eax, dword ptr [esi + 24]
    add add eax, ecx
    cdq cdq
    push push 7
    pop pop ecx
    idiv idiv ecx
    mov mov dword ptr [esi + 24], edx
    mov mov eax, dword ptr [ebp + 8]
    add add dword ptr [esi + 12], eax
    mov mov eax, dword ptr [ebp + 8]
    add add dword ptr [esi + 28], eax
    mov mov eax, esi
    pop pop esi
    pop pop ebp
    ret ret
    jge sub_100F7111
    mov mov eax, dword ptr [esi + 24]
    lea lea eax, [eax + ecx + 7]
    cdq cdq
    push push 7
    pop pop ecx
    idiv idiv ecx
    mov mov dword ptr [esi + 24], edx
    mov mov eax, dword ptr [ebp + 8]
    add add dword ptr [esi + 12], eax
    mov mov eax, dword ptr [esi + 12]
    test test eax, eax
    jg sub_100F7128
    add add eax, 31
    dec dec dword ptr [esi + 20]
    mov mov dword ptr [esi + 12], eax
    mov mov dword ptr [esi + 28], 016Ch
    mov mov dword ptr [esi + 16], 11
    jmp sub_100F7147
_localtime ENDP
END
