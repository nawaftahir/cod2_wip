.686
.MODEL FLAT, C
.CODE
FUN_10057a40 PROC
    sub esp, 24
    mov edx, dword ptr [esp + 28]
    push ebx
    push ebp
    push esi
    push edi
    xor edi, edi
    lea eax, [edx - 1]
    xor ebp, ebp
    cmp eax, 4
    mov esi, 1
    mov dword ptr [esp + 16], edi
    mov dword ptr [esp + 20], esi
    jl L9
    mov eax, 0FFFFFFFCh
    sub eax, ecx
    mov dword ptr [esp + 28], eax
    mov eax, 4
    sub eax, ecx
    mov dword ptr [esp + 32], eax
    mov eax, 12
    sub eax, ecx
    mov dword ptr [esp + 36], eax
    mov eax, 0FFFFFFF4h
    xor ebx, ebx
    sub eax, ecx
    mov esi, 3
    lea edx, [ecx + 20]
    mov dword ptr [esp + 24], eax
    mov edi, edi
L0:
    fld dword ptr [ebx + ecx + 4]
    fcomp dword ptr [edx - 8]
    fnstsw ax
    test ah, 65
    jp L1
    mov eax, dword ptr [esp + 20]
    mov dword ptr [esp + 16], eax
    mov eax, dword ptr [esp + 24]
    lea ebx, [eax + edx]
    jmp L2
L1:
    fld dword ptr [edi + ecx + 4]
    fcomp dword ptr [edx - 8]
    fnstsw ax
    test ah, 65
    jne L2
    mov eax, dword ptr [esp + 24]
    mov ebp, dword ptr [esp + 20]
    lea edi, [eax + edx]
L2:
    fld dword ptr [ebx + ecx + 4]
    fcomp dword ptr [edx]
    fnstsw ax
    test ah, 65
    jp L3
    lea eax, [esi - 1]
    mov dword ptr [esp + 16], eax
    mov eax, dword ptr [esp + 28]
    lea ebx, [eax + edx]
    jmp L4
L3:
    fld dword ptr [edi + ecx + 4]
    fcomp dword ptr [edx]
    fnstsw ax
    test ah, 65
    jne L4
    mov eax, dword ptr [esp + 28]
    lea ebp, [esi - 1]
    lea edi, [eax + edx]
L4:
    fld dword ptr [ebx + ecx + 4]
    fcomp dword ptr [edx + 8]
    fnstsw ax
    test ah, 65
    jp L5
    mov eax, dword ptr [esp + 32]
    mov dword ptr [esp + 16], esi
    lea ebx, [eax + edx]
    jmp L6
L5:
    fld dword ptr [edi + ecx + 4]
    fcomp dword ptr [edx + 8]
    fnstsw ax
    test ah, 65
    jne L6
    mov eax, dword ptr [esp + 32]
    mov ebp, esi
    lea edi, [eax + edx]
L6:
    fld dword ptr [ebx + ecx + 4]
    fcomp dword ptr [edx + 16]
    fnstsw ax
    test ah, 65
    jp L7
    lea eax, [esi + 1]
    mov dword ptr [esp + 16], eax
    mov eax, dword ptr [esp + 36]
    lea ebx, [eax + edx]
    jmp L8
L7:
    fld dword ptr [edi + ecx + 4]
    fcomp dword ptr [edx + 16]
    fnstsw ax
    test ah, 65
    jne L8
    mov eax, dword ptr [esp + 36]
    lea ebp, [esi + 1]
    lea edi, [eax + edx]
L8:
    add dword ptr [esp + 20], 4
    mov eax, dword ptr [esp + 44]
    add eax, -3
    add esi, 4
    add edx, 32
    cmp dword ptr [esp + 20], eax
    jl L0
    mov edi, dword ptr [esp + 16]
    mov esi, dword ptr [esp + 20]
    mov edx, dword ptr [esp + 44]
L9:
    cmp esi, edx
    jge L13
    lea eax, [ebp*8]
    mov dword ptr [esp + 32], eax
    lea edx, [esi*8]
    lea eax, [edi*8]
    mov dword ptr [esp + 36], eax
    lea ebx, [edx + ecx + 4]
L10:
    mov eax, dword ptr [esp + 36]
    fld dword ptr [eax + ecx + 4]
    fcomp dword ptr [ebx]
    fnstsw ax
    test ah, 65
    jp L11
    mov dword ptr [esp + 16], esi
    mov dword ptr [esp + 36], edx
    mov edi, esi
    jmp L12
L11:
    mov eax, dword ptr [esp + 32]
    fld dword ptr [eax + ecx + 4]
    fcomp dword ptr [ebx]
    fnstsw ax
    test ah, 65
    jne L12
    mov ebp, esi
    mov dword ptr [esp + 32], edx
L12:
    mov eax, dword ptr [esp + 44]
    inc esi
    add edx, 8
    add ebx, 8
    cmp esi, eax
    jl L10
    mov edx, eax
L13:
    cmp ebp, edi
    mov esi, dword ptr [ecx + ebp*8]
    mov eax, dword ptr [esp + 48]
    mov dword ptr [eax], esi
    mov esi, dword ptr [ecx + ebp*8 + 4]
    mov dword ptr [eax + 4], esi
    mov esi, dword ptr [ecx + edi*8]
    mov dword ptr [eax + 8], esi
    mov esi, dword ptr [ecx + edi*8 + 4]
    mov dword ptr [eax + 12], esi
    lea eax, [edx - 1]
    jle L15
    cmp ebp, eax
    je L14
    fld dword ptr [ecx + ebp*8]
    mov esi, dword ptr [ecx + eax*8]
    fld dword ptr [ecx + ebp*8 + 4]
    mov dword ptr [ecx + ebp*8], esi
    mov esi, dword ptr [ecx + eax*8 + 4]
    fxch st(1)
    mov dword ptr [ecx + ebp*8 + 4], esi
    fstp dword ptr [ecx + eax*8]
    fstp dword ptr [ecx + eax*8 + 4]
L14:
    lea eax, [edx - 2]
    cmp edi, eax
    je L17
    fld dword ptr [ecx + edi*8]
    mov edx, dword ptr [ecx + eax*8]
    fld dword ptr [ecx + edi*8 + 4]
    mov dword ptr [ecx + edi*8], edx
    mov edx, dword ptr [ecx + eax*8 + 4]
    fxch st(1)
    mov dword ptr [ecx + edi*8 + 4], edx
    fstp dword ptr [ecx + eax*8]
    pop edi
    pop esi
    fstp dword ptr [ecx + eax*8 + 4]
    pop ebp
    pop ebx
    add esp, 24
    ret
L15:
    cmp edi, eax
    je L16
    fld dword ptr [ecx + edi*8]
    mov esi, dword ptr [ecx + eax*8]
    fld dword ptr [ecx + edi*8 + 4]
    mov dword ptr [ecx + edi*8], esi
    mov esi, dword ptr [ecx + eax*8 + 4]
    fxch st(1)
    mov dword ptr [ecx + edi*8 + 4], esi
    fstp dword ptr [ecx + eax*8]
    fstp dword ptr [ecx + eax*8 + 4]
L16:
    lea eax, [edx - 2]
    cmp ebp, eax
    je L17
    fld dword ptr [ecx + ebp*8]
    mov edx, dword ptr [ecx + eax*8]
    fld dword ptr [ecx + ebp*8 + 4]
    mov dword ptr [ecx + ebp*8], edx
    mov edx, dword ptr [ecx + eax*8 + 4]
    fxch st(1)
    mov dword ptr [ecx + ebp*8 + 4], edx
    fstp dword ptr [ecx + eax*8]
    fstp dword ptr [ecx + eax*8 + 4]
L17:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 24
    ret
FUN_10057a40 ENDP
END
