.686
.MODEL FLAT, C
EXTRN sub_100184A4:PROC
EXTRN sub_100185CA:PROC
EXTRN sub_100185EA:PROC
EXTRN sub_10018625:PROC
EXTRN sub_1001862B:PROC
EXTRN sub_1005FB5B:PROC
EXTRN EXTRN g_1018FD50:DWORD:DWORD
.CODE
FUN_100184d0 PROC
    push push ebx
    push push ebp
    push push esi
    mov mov esi, dword ptr [g_1018FD50]
    push push edi
    xor xor edi, edi
    test test esi, esi
    je L2
    mov mov ebp, 01018FD50h
    mov mov eax, edx
    mov mov bl, byte ptr [eax]
    mov mov cl, bl
    cmp cmp bl, byte ptr [esi]
    jne L1
    test test cl, cl
    je L1
    mov mov bl, byte ptr [eax + 1]
    mov mov cl, bl
    cmp cmp bl, byte ptr [esi + 1]
    jne L4
    add add eax, 2
    add add esi, 2
    test test cl, cl
    jne L0
    xor xor eax, eax
    jmp L5
    sbb sbb eax, eax
    sbb sbb eax, -1
    test test eax, eax
    je L6
    mov mov esi, dword ptr [ebp + 16]
    add add ebp, 16
    inc inc edi
    test test esi, esi
    jne L3
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov eax, 1
    pop pop ebx
    ret ret
    mov mov ebp, dword ptr [esp + 20]
    push push 1
L2:
    push push 010195884h
L3:
    mov mov ecx, ebp
    call sub_1005FB5B
    add add esp, 8
    test test eax, eax
    je sub_100185CA
    mov mov esi, edi
    shl shl esi, 4
    mov mov ebx, dword ptr [esi + 01018FD54h]
    mov mov ecx, ebp
    call sub_100184A4
    test test eax, eax
    jne sub_100185EA
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov eax, 2
    pop pop ebx
    ret ret
    shl shl edi, 2
    mov mov edx, dword ptr [edi*4 + 01018FD58h]
    xor xor ecx, ecx
    test test edx, edx
    jne sub_10018625
    lea lea edx, [esi + 01018FD58h]
    mov mov esi, dword ptr [edx + 4]
    add add edx, 4
    inc inc ecx
    test test esi, esi
    je sub_1001862B
    mov mov edx, dword ptr [esp + 24]
    add add edi, ecx
    mov mov esi, dword ptr [edi*4 + 01018FD58h]
    mov mov edi, dword ptr [edx + ecx*4]
    or or edi, esi
    mov mov esi, dword ptr [edx + ecx*4 + 8]
    mov mov dword ptr [edx + ecx*4], edi
    mov mov eax, dword ptr [eax + 4]
    or or esi, eax
    pop pop edi
    mov mov dword ptr [edx + ecx*4 + 8], esi
    pop pop esi
    pop pop ebp
    xor xor eax, eax
    pop pop ebx
    ret ret
FUN_100184d0 ENDP
END
