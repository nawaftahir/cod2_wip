.686
.MODEL FLAT, C
EXTRN sub_10099837:PROC
EXTRN sub_10099B9E:PROC
EXTRN sub_10099BD2:PROC
EXTRN sub_1009A25C:PROC
EXTRN sub_1009A549:PROC
EXTRN sub_1009A8F8:PROC
EXTRN sub_1009A934:PROC
EXTRN sub_1009CAC6:PROC
EXTRN sub_1009CB3A:PROC
EXTRN sub_1009CBB0:PROC
EXTRN sub_1009CC3E:PROC
EXTRN sub_1009CC42:PROC
EXTRN sub_1009CC8C:PROC
EXTRN sub_1009CCCC:PROC
EXTRN sub_1009CCFB:PROC
EXTRN sub_1009CD23:PROC
EXTRN sub_1009CD47:PROC
EXTRN sub_1009CD91:PROC
EXTRN sub_1009CDDC:PROC
EXTRN sub_1009CE0B:PROC
EXTRN sub_1009D22D:PROC
EXTRN sub_100F791F:PROC
EXTRN sub_100F794C:PROC
EXTRN sub_100F805F:PROC
EXTRN sub_100F8067:PROC
EXTRN sub_100F99FD:PROC
EXTRN g_1019BE20:DWORD
.CODE
FUN_1009ee58 PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 40
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    test edi, edi
    mov dword ptr [ebp - 4], ecx
    je L62
    cmp dword ptr [edi + 4], 13
    jne L62
    mov esi, dword ptr [edi + 24]
    imul esi, dword ptr [edi + 20]
    push dword ptr [ebp + 12]
    mov dword ptr [ebp + 8], esi
    push dword ptr [edi + 16]
    call sub_1009A25C
    cmp esi, eax
    jne L62
    mov eax, dword ptr [edi + 28]
    cmp eax, 2
    jl L1
    cmp eax, 3
    jle L62
    cmp eax, 19
    jle L1
    cmp eax, 21
    jle L62
    cmp eax, 25
    je L62
    cmp eax, 26
    je L4
    cmp eax, 27
    je L62
L1:
    mov eax, dword ptr [edi + 32]
    xor esi, esi
    push ebx
    xor ebx, ebx
    cmp eax, esi
    mov dword ptr [ebp - 40], ebx
    mov dword ptr [ebp - 24], esi
    mov dword ptr [ebp - 8], esi
    mov dword ptr [ebp - 12], esi
    mov dword ptr [ebp - 16], esi
    mov dword ptr [ebp - 32], esi
    je L2
    cmp dword ptr [eax + 4], 13
    jne L2
    mov ebx, eax
    mov eax, dword ptr [ebx + 24]
    imul eax, dword ptr [ebx + 20]
    mov dword ptr [ebp - 16], eax
    shl eax, 4
    push eax
    mov dword ptr [ebp - 40], ebx
    call sub_100F791F
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 8], eax
    je L3
L2:
    mov eax, dword ptr [edi + 36]
    test eax, eax
    je L5
    cmp dword ptr [eax + 4], 13
    jne L5
    mov esi, eax
    mov eax, dword ptr [esi + 24]
    imul eax, dword ptr [esi + 20]
    mov dword ptr [ebp - 32], eax
    shl eax, 4
    push eax
    mov dword ptr [ebp - 24], esi
    call sub_100F794C
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 12], eax
    jne L5
L3:
    mov esi, 08007000Eh
    jmp L59
L4:
    push dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp - 4]
    push edi
    call sub_1009CE0B
    jmp L63
L5:
    cmp dword ptr [edi + 40], 0
    je L7
    test ebx, ebx
    je L6
    push dword ptr [ebp - 8]
    mov ecx, dword ptr [ebp - 4]
    push ebx
    call L0
    mov esi, eax
    test esi, esi
    jl L59
    mov esi, dword ptr [ebp - 24]
L6:
    test esi, esi
    je L10
    push dword ptr [ebp - 12]
    push dword ptr [ebp - 24]
    jmp L9
L7:
    test esi, esi
    je L8
    push dword ptr [ebp - 12]
    mov ecx, dword ptr [ebp - 4]
    push dword ptr [ebp - 24]
    call L0
    mov esi, eax
    test esi, esi
    jl L59
L8:
    test ebx, ebx
    je L10
    push dword ptr [ebp - 8]
    push ebx
L9:
    mov ecx, dword ptr [ebp - 4]
    call L0
    mov esi, eax
    test esi, esi
    jl L59
L10:
    mov eax, dword ptr [edi + 28]
    xor esi, esi
    cmp eax, esi
    jl L34
    xor edx, edx
    inc edx
    cmp eax, edx
    jle L21
    cmp eax, 22
    je L18
    cmp eax, 23
    je L14
    cmp eax, 24
    jne L34
    cmp dword ptr [ebp - 16], esi
    mov dword ptr [ebp - 32], esi
    jbe L58
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp + 12]
    shl eax, 4
    lea ebx, [edi + 48]
    mov edi, dword ptr [ebp - 12]
    add eax, edi
    mov dword ptr [ebp + 8], eax
    mov eax, dword ptr [ebp - 8]
    sub eax, edi
    sub ecx, edi
    mov dword ptr [ebp - 40], eax
    mov dword ptr [ebp - 36], ecx
    jmp L12
L11:
    mov eax, dword ptr [ebp - 40]
L12:
    mov ecx, dword ptr [ebp - 4]
    push ebx
    add eax, edi
    push eax
    lea eax, [ebp - 28]
    push eax
    call sub_1009A549
    mov esi, eax
    test esi, esi
    jl L59
    fld qword ptr [g_1019BE20]
    fld qword ptr [ebp - 28]
    fucompp
    fnstsw ax
    test ah, 68
    mov eax, edi
    jp L13
    mov eax, dword ptr [ebp + 8]
L13:
    mov ecx, dword ptr [ebp - 4]
    push ebx
    push eax
    mov eax, dword ptr [ebp - 36]
    add eax, edi
    push eax
    call sub_1009CAC6
    mov esi, eax
    test esi, esi
    jl L59
    inc dword ptr [ebp - 32]
    mov eax, dword ptr [ebp - 32]
    add dword ptr [ebp + 8], 16
    add edi, 16
    cmp eax, dword ptr [ebp - 16]
    jb L11
    jmp L58
L14:
    mov eax, dword ptr [edi + 36]
    mov ecx, dword ptr [eax + 4]
    cmp ecx, 14
    jne L16
    mov ecx, dword ptr [ebp - 4]
    lea ebx, [edi + 48]
    push ebx
    add eax, 16
    push eax
    lea eax, [ebp - 40]
    push eax
    call sub_1009CC42
    mov esi, eax
    test esi, esi
    jl L59
    and dword ptr [ebp - 32], 0
    cmp dword ptr [ebp + 8], 0
    jbe L58
    mov edi, dword ptr [ebp - 40]
    mov eax, dword ptr [ebp + 12]
    shl edi, 4
    add edi, dword ptr [ebp - 8]
    mov dword ptr [ebp + 12], eax
L15:
    mov ecx, dword ptr [ebp - 4]
    push ebx
    push edi
    push dword ptr [ebp + 12]
    call sub_1009CB3A
    mov esi, eax
    test esi, esi
    jl L59
    inc dword ptr [ebp - 32]
    mov eax, dword ptr [ebp - 32]
    add dword ptr [ebp + 12], 16
    add edi, 16
    cmp eax, dword ptr [ebp + 8]
    jb L15
    jmp L58
L16:
    cmp ecx, edx
    jne L61
    and dword ptr [ebp - 32], 0
    cmp dword ptr [ebp + 8], 0
    mov ebx, eax
    jbe L58
    mov eax, dword ptr [ebp + 12]
    add edi, 48
    mov dword ptr [ebp + 12], eax
L17:
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [ebp - 4]
    push edi
    add eax, 16
    push eax
    lea eax, [ebp - 40]
    push eax
    call sub_1009CCCC
    mov esi, eax
    test esi, esi
    jl L59
    mov eax, dword ptr [ebp - 40]
    mov ecx, dword ptr [ebp - 4]
    shl eax, 4
    add eax, dword ptr [ebp - 8]
    push edi
    push eax
    push dword ptr [ebp + 12]
    call sub_1009CBB0
    mov esi, eax
    test esi, esi
    jl L59
    inc dword ptr [ebp - 32]
    mov eax, dword ptr [ebp - 32]
    add dword ptr [ebp + 12], 16
    cmp eax, dword ptr [ebp + 8]
    mov ebx, dword ptr [ebx + 12]
    jb L17
    jmp L58
L18:
    mov ecx, dword ptr [ebp - 4]
    add edi, 48
    push edi
    push dword ptr [ebp - 12]
    lea eax, [ebp - 40]
    push eax
    mov dword ptr [ebp - 24], edi
    call sub_1009CD23
    mov esi, eax
    test esi, esi
    jl L59
    mov eax, dword ptr [ebp - 40]
    imul eax, dword ptr [ebp + 8]
    cmp eax, dword ptr [ebp - 16]
    jb L19
    push 01010FA70h
    push 000000BD6h
    push edi
    push dword ptr [ebp - 4]
    call sub_10099837
    add esp, 16
    jmp L61
L19:
    and dword ptr [ebp - 32], 0
    cmp dword ptr [ebp + 8], 0
    jbe L58
    mov ebx, dword ptr [ebp + 12]
    shl eax, 4
    add eax, dword ptr [ebp - 8]
    mov edi, eax
L20:
    push dword ptr [ebp - 24]
    mov ecx, dword ptr [ebp - 4]
    push edi
    push ebx
    call sub_1009CC3E
    mov esi, eax
    test esi, esi
    jl L59
    inc dword ptr [ebp - 32]
    mov eax, dword ptr [ebp - 32]
    add edi, 16
    add ebx, 16
    cmp eax, dword ptr [ebp + 8]
    jb L20
    jmp L58
L21:
    cmp ebx, esi
    je L29
    mov eax, dword ptr [ebp - 16]
    cmp eax, edx
    jne L23
    cmp dword ptr [ebp + 8], esi
    mov dword ptr [ebp - 32], esi
    jbe L58
    lea ebx, [edi + 48]
    mov edi, dword ptr [ebp + 12]
L22:
    mov ecx, dword ptr [ebp - 4]
    push ebx
    push dword ptr [ebp - 8]
    push edi
    call sub_1009CC8C
    mov esi, eax
    test esi, esi
    jl L59
    inc dword ptr [ebp - 32]
    mov eax, dword ptr [ebp - 32]
    add edi, 16
    cmp eax, dword ptr [ebp + 8]
    jb L22
    jmp L58
L23:
    cmp dword ptr [ebp + 8], eax
    je L27
    mov ecx, dword ptr [edi + 20]
    cmp ecx, dword ptr [ebx + 20]
    ja L27
    mov eax, dword ptr [edi + 24]
    cmp eax, dword ptr [ebx + 24]
    ja L27
    cmp ecx, esi
    mov dword ptr [ebp + 8], esi
    jbe L58
L24:
    xor ebx, ebx
    test eax, eax
    jbe L26
L25:
    imul eax, dword ptr [ebp + 8]
    lea ecx, [edi + 48]
    push ecx
    mov ecx, dword ptr [ebp - 40]
    mov ecx, dword ptr [ecx + 24]
    imul ecx, dword ptr [ebp + 8]
    add ecx, ebx
    shl ecx, 4
    add ecx, dword ptr [ebp - 8]
    add eax, ebx
    shl eax, 4
    add eax, dword ptr [ebp + 12]
    push ecx
    mov ecx, dword ptr [ebp - 4]
    push eax
    call sub_1009CCFB
    mov esi, eax
    test esi, esi
    jl L59
    mov eax, dword ptr [edi + 24]
    inc ebx
    cmp ebx, eax
    jb L25
L26:
    inc dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp + 8]
    cmp ecx, dword ptr [edi + 20]
    jb L24
    jmp L58
L27:
    cmp dword ptr [ebp + 8], esi
    mov dword ptr [ebp - 32], esi
    jbe L58
    mov ebx, dword ptr [ebp - 8]
    add edi, 48
    mov dword ptr [ebp - 24], edi
    mov edi, dword ptr [ebp + 12]
    sub ebx, edi
L28:
    push dword ptr [ebp - 24]
    mov ecx, dword ptr [ebp - 4]
    lea eax, [ebx + edi]
    push eax
    push edi
    call sub_1009CD47
    mov esi, eax
    test esi, esi
    jl L59
    inc dword ptr [ebp - 32]
    mov eax, dword ptr [ebp - 32]
    add edi, 16
    cmp eax, dword ptr [ebp + 8]
    jb L28
    jmp L58
L29:
    mov eax, dword ptr [edi + 32]
    cmp eax, esi
    je L61
    cmp dword ptr [eax + 4], 14
    jne L30
    add eax, 16
    cmp dword ptr [eax], 6
    je L61
    mov ecx, dword ptr [ebp - 4]
    add edi, 48
    push edi
    push eax
    push dword ptr [ebp + 12]
    call sub_1009CD91
    mov esi, eax
    test esi, esi
    jl L59
    jmp L58
L30:
    cmp eax, esi
    je L61
    cmp dword ptr [eax + 4], edx
    jne L61
    mov ebx, eax
L31:
    mov eax, dword ptr [ebx + 8]
    test eax, eax
    je L33
    cmp dword ptr [eax + 4], 14
    jne L32
    add eax, 16
    cmp dword ptr [eax], 6
    je L61
    lea ecx, [edi + 48]
    push ecx
    mov ecx, dword ptr [ebp - 4]
    push eax
    push dword ptr [ebp + 12]
    call sub_1009CDDC
    mov esi, eax
    test esi, esi
    jl L59
    add dword ptr [ebp + 12], 16
    jmp L33
L32:
    test eax, eax
    je L33
    cmp dword ptr [eax + 4], 13
    jne L33
    push dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp - 4]
    push eax
    call L0
    mov esi, eax
    test esi, esi
    jl L59
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [eax + 24]
    imul ecx, dword ptr [eax + 20]
    shl ecx, 4
    add dword ptr [ebp + 12], ecx
L33:
    mov ebx, dword ptr [ebx + 12]
    test ebx, ebx
    jne L31
    jmp L58
L34:
    cmp dword ptr [ebp - 16], esi
    mov dword ptr [ebp - 36], esi
    jbe L36
    mov edx, dword ptr [ebp - 8]
L35:
    mov ecx, dword ptr [ebp - 4]
    lea eax, [edi + 48]
    push eax
    push edx
    lea eax, [edx + 8]
    push eax
    call sub_1009A8F8
    mov esi, eax
    test esi, esi
    jl L59
    inc dword ptr [ebp - 36]
    mov eax, dword ptr [ebp - 36]
    mov dword ptr [edx], 3
    add edx, 16
    cmp eax, dword ptr [ebp - 16]
    jb L35
L36:
    and dword ptr [ebp - 36], 0
    cmp dword ptr [ebp - 32], 0
    jbe L38
    mov edx, dword ptr [ebp - 12]
    lea ebx, [edi + 48]
L37:
    mov ecx, dword ptr [ebp - 4]
    push ebx
    push edx
    lea eax, [edx + 8]
    push eax
    call sub_1009A934
    mov esi, eax
    test esi, esi
    jl L59
    inc dword ptr [ebp - 36]
    mov eax, dword ptr [ebp - 36]
    mov dword ptr [edx], 3
    add edx, 16
    cmp eax, dword ptr [ebp - 32]
    jb L37
    mov ebx, dword ptr [ebp - 40]
L38:
    test ebx, ebx
    je L39
    mov eax, dword ptr [ebp + 8]
    cmp dword ptr [ebp - 16], eax
    jne L61
L39:
    cmp dword ptr [ebp - 24], 0
    je L40
    mov eax, dword ptr [ebp + 8]
    cmp dword ptr [ebp - 32], eax
    jne L61
L40:
    and dword ptr [ebp - 32], 0
    cmp dword ptr [ebp + 8], 0
    jbe L56
    mov ecx, dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 8]
    sub eax, ecx
    mov dword ptr [ebp - 40], eax
    mov eax, dword ptr [ebp + 12]
    sub eax, ecx
    lea esi, [ecx + 8]
    mov dword ptr [ebp - 36], eax
    mov ebx, 000000BD9h
L41:
    cmp dword ptr [ebp - 8], 0
    je L42
    mov eax, dword ptr [ebp - 40]
    fld qword ptr [esi + eax]
    jmp L43
L42:
    fldz
L43:
    cmp dword ptr [ebp - 12], 0
    fst qword ptr [ebp - 20]
    je L44
    fld qword ptr [esi]
    jmp L45
L44:
    fldz
L45:
    mov eax, dword ptr [edi + 28]
    fstp qword ptr [ebp - 28]
    add eax, -4
    cmp eax, 15
    ja L60
    jmp dword ptr [eax*4 + 0x1009f675]
    fld qword ptr [g_1019BE20]
L46:
    fld st(1)
    fucompp
    fnstsw ax
    fstp st(0)
    test ah, 68
L47:
    jnp L54
L48:
    fldz
    jmp L55
    fchs
    jmp L55
    fmul qword ptr [ebp - 28]
    jmp L55
    fld qword ptr [ebp - 28]
    fld qword ptr [g_1019BE20]
    fucompp
    fnstsw ax
    test ah, 68
    jp L49
    push 010114B24h
    fstp st(0)
    push ebx
    lea eax, [edi + 48]
    push eax
    push dword ptr [ebp - 4]
    call sub_10099B9E
    fld qword ptr [ebp - 20]
    add esp, 16
L49:
    fdiv qword ptr [ebp - 28]
    jmp L55
    fstp st(0)
    fld qword ptr [ebp - 28]
    fld qword ptr [g_1019BE20]
    fucompp
    fnstsw ax
    test ah, 68
    jp L50
    push 010114B24h
    push ebx
    lea eax, [edi + 48]
    push eax
    push dword ptr [ebp - 4]
    call sub_10099BD2
    add esp, 16
L50:
    fld qword ptr [ebp - 20]
    fld qword ptr [ebp - 28]
    call sub_100F99FD
    jmp L55
    fadd qword ptr [ebp - 28]
    jmp L55
    fsub qword ptr [ebp - 28]
    jmp L55
    fcomp qword ptr [ebp - 28]
    fnstsw ax
    test ah, 5
    jmp L47
    fcomp qword ptr [ebp - 28]
    fnstsw ax
    test ah, 65
    jmp L51
    fcomp qword ptr [ebp - 28]
    fnstsw ax
    test ah, 65
    jmp L47
    fcomp qword ptr [ebp - 28]
    fnstsw ax
    test ah, 1
L51:
    je L54
    jmp L48
    fld qword ptr [ebp - 28]
    jmp L46
    fld qword ptr [ebp - 28]
    fld st(1)
    fucompp
    fstp st(0)
    jmp L53
    fld qword ptr [g_1019BE20]
    fld st(1)
    fucompp
    fnstsw ax
    fstp st(0)
    test ah, 68
    jnp L48
    jmp L52
    fld qword ptr [g_1019BE20]
    fld st(1)
    fucompp
    fnstsw ax
    fstp st(0)
    test ah, 68
    jp L54
L52:
    fld qword ptr [g_1019BE20]
    fld qword ptr [ebp - 28]
    fucompp
L53:
    fnstsw ax
    test ah, 68
    jnp L48
L54:
    fld1
L55:
    mov eax, dword ptr [ebp - 36]
    inc dword ptr [ebp - 32]
    fstp qword ptr [esi + eax]
    mov eax, dword ptr [ebp - 32]
    add esi, 16
    cmp eax, dword ptr [ebp + 8]
    jb L41
L56:
    and dword ptr [ebp - 40], 0
    cmp dword ptr [ebp + 8], 0
    jbe L58
    lea ebx, [edi + 48]
    mov edi, dword ptr [ebp + 12]
L57:
    fld qword ptr [edi + 8]
    push ebx
    push ecx
    push ecx
    mov ecx, dword ptr [ebp - 4]
    fstp qword ptr [esp]
    push edi
    call sub_1009D22D
    mov esi, eax
    test esi, esi
    jl L59
    inc dword ptr [ebp - 40]
    mov eax, dword ptr [ebp - 40]
    add edi, 16
    cmp eax, dword ptr [ebp + 8]
    jb L57
L58:
    xor esi, esi
L59:
    push dword ptr [ebp - 12]
    call sub_100F805F
    push dword ptr [ebp - 8]
    call sub_100F8067
    pop ecx
    pop ecx
    mov eax, esi
    pop ebx
    jmp L63
L60:
    fstp st(0)
L61:
    mov esi, 080004005h
    jmp L59
L62:
    mov eax, 080004005h
L63:
    pop edi
    pop esi
    leave
    ret 8
FUN_1009ee58 ENDP
END
