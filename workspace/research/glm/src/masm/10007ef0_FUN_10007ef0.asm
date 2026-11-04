.686
.MODEL FLAT, C
EXTRN g_1019BDE4:DWORD
EXTRN g_1019BE58:DWORD
.CODE
FUN_10007ef0 PROC
    sub esp, 00000028Ch
    push ebx
    mov ebx, dword ptr [esp + 000000298h]
    push ebp
    push esi
    mov esi, eax
    mov eax, dword ptr [ebx]
    push edi
    xor edi, edi
    xor ebp, ebp
    xor ecx, ecx
    test eax, eax
    jle L3
    mov edx, dword ptr [esp + 0000002A0h]
    add edx, 4
    lea esp, [esp]
L0:
    fld dword ptr [edx + 4]
    mov byte ptr [esp + ecx + 20], 2
    fmul dword ptr [esi + 8]
    fld dword ptr [edx - 4]
    fmul dword ptr [esi]
    faddp st(1)
    fld dword ptr [esi + 4]
    fmul dword ptr [edx]
    faddp st(1)
    fadd dword ptr [esi + 12]
    fsub dword ptr [g_1019BDE4]
    fcom dword ptr [g_1019BE58]
    fst dword ptr [esp + ecx*4 + 000000098h]
    fnstsw ax
    test ah, 5
    jp L1
    fstp st(0)
    mov byte ptr [esp + ecx + 20], 1
    inc ebp
    jmp L2
L1:
    fcomp dword ptr [g_1019BDE4]
    fnstsw ax
    test ah, 65
    jne L2
    mov byte ptr [esp + ecx + 20], 0
    inc edi
L2:
    mov eax, dword ptr [ebx]
    inc ecx
    add edx, 12
    cmp ecx, eax
    jl L0
    test edi, edi
    jne L4
L3:
    pop edi
    pop esi
    pop ebp
    mov dword ptr [ebx], 0
    xor eax, eax
    pop ebx
    add esp, 00000028Ch
    ret
L4:
    test ebp, ebp
    jne L5
    mov eax, dword ptr [esp + 0000002A0h]
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 00000028Ch
    ret
L5:
    mov al, byte ptr [esp + 20]
    fld dword ptr [esp + 000000098h]
    mov esi, dword ptr [esp + 0000002A8h]
    fstp dword ptr [esp + ecx*4 + 000000098h]
    mov byte ptr [esp + ecx + 20], al
    mov ecx, dword ptr [esp + 0000002A0h]
    mov eax, 1
    lea edx, [esp + 20]
    xor ebp, ebp
    xor edi, edi
    add ecx, 8
    sub eax, edx
    mov dword ptr [esp + 16], eax
L6:
    cmp ebp, 000000080h
    jge L11
    mov dl, byte ptr [esp + edi + 20]
    cmp dl, 2
    lea eax, [esp + edi + 20]
    jne L7
    mov eax, dword ptr [ecx - 8]
    mov dword ptr [esi], eax
    mov edx, dword ptr [ecx - 4]
    mov dword ptr [esi + 4], edx
    mov eax, dword ptr [ecx]
    mov dword ptr [esi + 8], eax
    inc ebp
    add esi, 12
    jmp L10
L7:
    test dl, dl
    jne L8
    mov ebx, dword ptr [ecx - 8]
    mov dword ptr [esi], ebx
    mov ebx, dword ptr [ecx - 4]
    mov dword ptr [esi + 4], ebx
    mov ebx, dword ptr [ecx]
    mov dword ptr [esi + 8], ebx
    inc ebp
    add esi, 12
L8:
    mov bl, byte ptr [eax + 1]
    cmp bl, 2
    je L9
    cmp bl, dl
    mov ebx, dword ptr [esp + 0000002A4h]
    je L10
    mov edx, dword ptr [esp + 16]
    fld dword ptr [esp + edi*4 + 000000098h]
    fsub dword ptr [esp + edi*4 + 00000009Ch]
    add eax, edx
    cdq
    idiv dword ptr [ebx]
    inc ebp
    fdivr dword ptr [esp + edi*4 + 000000098h]
    add esi, 12
    lea eax, [edx + edx*2]
    mov edx, dword ptr [esp + 0000002A0h]
    lea eax, [edx + eax*4]
    fld dword ptr [eax]
    fsub dword ptr [ecx - 8]
    fmul st(1)
    fadd dword ptr [ecx - 8]
    fstp dword ptr [esi - 12]
    fld dword ptr [eax + 4]
    fsub dword ptr [ecx - 4]
    fmul st(1)
    fadd dword ptr [ecx - 4]
    fstp dword ptr [esi - 8]
    fld dword ptr [eax + 8]
    fsub dword ptr [ecx]
    fmul st(1)
    fadd dword ptr [ecx]
    fstp dword ptr [esi - 4]
    fstp st(0)
    jmp L10
L9:
    mov ebx, dword ptr [esp + 0000002A4h]
L10:
    mov eax, dword ptr [ebx]
    inc edi
    add ecx, 12
    cmp edi, eax
    jl L6
L11:
    mov eax, dword ptr [esp + 0000002A8h]
    pop edi
    pop esi
    mov dword ptr [ebx], ebp
    pop ebp
    pop ebx
    add esp, 00000028Ch
    ret
FUN_10007ef0 ENDP
END
