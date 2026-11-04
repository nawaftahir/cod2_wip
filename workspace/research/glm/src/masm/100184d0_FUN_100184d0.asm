.686
.MODEL FLAT, C
EXTRN sub_100184A4:PROC
EXTRN sub_1005FB5B:PROC
EXTRN g_1018FD50:DWORD
.CODE
FUN_100184d0 PROC
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [g_1018FD50]
    push edi
    xor edi, edi
    test esi, esi
    je L5
    mov ebp, 01018FD50h
L0:
    mov eax, edx
L1:
    mov bl, byte ptr [eax]
    mov cl, bl
    cmp bl, byte ptr [esi]
    jne L3
    test cl, cl
    je L2
    mov bl, byte ptr [eax + 1]
    mov cl, bl
    cmp bl, byte ptr [esi + 1]
    jne L3
    add eax, 2
    add esi, 2
    test cl, cl
    jne L1
L2:
    xor eax, eax
    jmp L4
L3:
    sbb eax, eax
    sbb eax, -1
L4:
    test eax, eax
    je L6
    mov esi, dword ptr [ebp + 16]
    add ebp, 16
    inc edi
    test esi, esi
    jne L0
L5:
    pop edi
    pop esi
    pop ebp
    mov eax, 1
    pop ebx
    ret
L6:
    mov ebp, dword ptr [esp + 20]
    push 1
    push 010195884h
    mov ecx, ebp
    call sub_1005FB5B
    add esp, 8
    test eax, eax
    je L7
    mov esi, edi
    shl esi, 4
    mov ebx, dword ptr [esi + 01018FD54h]
    mov ecx, ebp
    call sub_100184A4
    test eax, eax
    jne L8
L7:
    pop edi
    pop esi
    pop ebp
    mov eax, 2
    pop ebx
    ret
L8:
    shl edi, 2
    mov edx, dword ptr [edi*4 + 01018FD58h]
    xor ecx, ecx
    test edx, edx
    jne L10
    lea edx, [esi + 01018FD58h]
L9:
    mov esi, dword ptr [edx + 4]
    add edx, 4
    inc ecx
    test esi, esi
    je L9
L10:
    mov edx, dword ptr [esp + 24]
    add edi, ecx
    mov esi, dword ptr [edi*4 + 01018FD58h]
    mov edi, dword ptr [edx + ecx*4]
    or edi, esi
    mov esi, dword ptr [edx + ecx*4 + 8]
    mov dword ptr [edx + ecx*4], edi
    mov eax, dword ptr [eax + 4]
    or esi, eax
    pop edi
    mov dword ptr [edx + ecx*4 + 8], esi
    pop esi
    pop ebp
    xor eax, eax
    pop ebx
    ret
FUN_100184d0 ENDP
END
