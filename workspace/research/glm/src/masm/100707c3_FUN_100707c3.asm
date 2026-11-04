.686
.MODEL FLAT, C
EXTRN sub_1006C621:PROC
EXTRN sub_1006C730:PROC
EXTRN sub_1006C782:PROC
EXTRN sub_1006C84C:PROC
EXTRN sub_1006C8E6:PROC
EXTRN sub_1006C8FB:PROC
EXTRN sub_1006C90C:PROC
EXTRN sub_1006E19F:PROC
EXTRN sub_1006E26F:PROC
EXTRN sub_1006E504:PROC
EXTRN sub_1006E543:PROC
EXTRN sub_1006E573:PROC
EXTRN sub_1006E59D:PROC
EXTRN sub_1006E61A:PROC
EXTRN sub_1006E6D6:PROC
EXTRN sub_1006E6F9:PROC
EXTRN sub_1006E71A:PROC
EXTRN sub_100F78F0:PROC
EXTRN sub_100F7A09:PROC
EXTRN sub_100F7BB7:PROC
EXTRN sub_100F7C87:PROC
EXTRN sub_100F927F:PROC
EXTRN g_1010F780:DWORD
EXTRN g_1019BC88:DWORD
EXTRN g_1019BE20:DWORD
EXTRN g_1019BEB0:DWORD
.CODE
FUN_100707c3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 24
    push ebx
    push esi
    xor eax, eax
    push edi
    mov edi, dword ptr [ebp + 24]
    xor esi, esi
    inc eax
    cmp esi, edi
    mov ebx, ecx
    mov dword ptr [ebp - 4], esi
    mov dword ptr [ebp - 8], eax
    mov dword ptr [ebp - 12], eax
    jae L4
L0:
    lea eax, [ebp - 24]
    push eax
    mov eax, dword ptr [ebp + 16]
    push dword ptr [eax + esi*4]
    mov ecx, ebx
    call sub_1006E19F
    test eax, eax
    jl L3
    fld qword ptr [g_1019BE20]
    fld qword ptr [ebp - 24]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L1
    and dword ptr [ebp - 8], 0
L1:
    fld qword ptr [g_1019BC88]
    fld qword ptr [ebp - 24]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L2
    and dword ptr [ebp - 12], 0
L2:
    inc esi
    cmp esi, edi
    jb L0
L3:
    xor eax, eax
    inc eax
    cmp esi, edi
L4:
    jne L10
    cmp dword ptr [ebp - 8], 0
    jne L5
    cmp dword ptr [ebp - 12], 0
    je L10
L5:
    mov eax, edi
    shl eax, 2
    push eax
    call sub_100F78F0
    mov edx, eax
    test edx, edx
    pop ecx
    mov dword ptr [ebp - 4], edx
    je L27
    xor ecx, ecx
    test edi, edi
    jbe L9
L6:
    cmp dword ptr [ebp - 8], 0
    je L7
    mov eax, dword ptr [ebx + 36]
    jmp L8
L7:
    mov eax, dword ptr [ebx + 32]
L8:
    mov dword ptr [edx + ecx*4], eax
    inc ecx
    cmp ecx, edi
    jb L6
L9:
    push edi
    push dword ptr [ebp + 12]
    mov ecx, ebx
    call sub_1006C621
    mov esi, eax
    test esi, esi
    jl L33
    push 0
    push 0
    and edi, 0000FFFFFh
    push edx
    or edi, 010000000h
    jmp L30
L10:
    cmp eax, edi
    mov ecx, dword ptr [ebp + 20]
    jae L13
    mov edx, dword ptr [ecx]
L11:
    cmp edx, dword ptr [ecx + eax*4]
    jne L12
    inc eax
    cmp eax, edi
    jb L11
L12:
    cmp eax, edi
L13:
    jne L26
    lea eax, [ebp - 16]
    push eax
    push dword ptr [ecx]
    mov ecx, ebx
    call sub_1006E26F
    test eax, eax
    jl L26
    fld qword ptr [ebp - 16]
    call sub_100F927F
    mov dword ptr [ebp - 8], eax
    fild dword ptr [ebp - 8]
    fsubr qword ptr [ebp - 16]
    fabs
    fcomp qword ptr [g_1010F780]
    fnstsw ax
    test ah, 5
    jp L25
    mov eax, dword ptr [ebp - 8]
    cdq
    push 0
    xor eax, edx
    pop ecx
    sub eax, edx
    push ecx
    mov dword ptr [ebp + 24], eax
    pop edx
    je L15
L14:
    mov esi, eax
    and esi, 1
    inc ecx
    add edx, esi
    shr eax, 1
    jne L14
L15:
    mov eax, edx
    dec edx
    neg eax
    sbb eax, eax
    and eax, edx
    mov edx, ecx
    dec ecx
    neg edx
    sbb edx, edx
    and edx, ecx
    add eax, edx
    cmp dword ptr [ebp - 8], 0
    jge L16
    add eax, edi
L16:
    mov ecx, dword ptr [ebx + 8]
    test byte ptr [ecx + 108], 64
    je L17
    test byte ptr [ebx + 20], 32
    je L17
    lea ecx, [edi + 1]
    jmp L19
L17:
    mov ecx, dword ptr [ecx + 100]
    test ecx, ecx
    jne L18
    inc ecx
L18:
    imul ecx, edi
    lea ecx, [ecx + ecx + 1]
L19:
    cmp eax, ecx
    ja L26
    mov eax, edi
    shl eax, 2
    push eax
    call sub_100F7A09
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 4], eax
    je L27
    xor eax, eax
    test edi, edi
    jbe L21
L20:
    mov ecx, dword ptr [ebx + 32]
    mov edx, dword ptr [ebp - 4]
    mov dword ptr [edx + eax*4], ecx
    inc eax
    cmp eax, edi
    jb L20
L21:
    push edi
    push dword ptr [ebp + 12]
    mov ecx, ebx
    call sub_1006C730
    mov esi, eax
    test esi, esi
    jl L33
    push 0
    push 0
    push dword ptr [ebp - 4]
    mov eax, edi
    push dword ptr [ebp + 12]
    and eax, 0000FFFFFh
    mov dword ptr [ebp + 20], eax
    or byte ptr [ebp + 23], 16
    push dword ptr [ebp + 20]
    mov ecx, ebx
    push dword ptr [ebp + 8]
    mov dword ptr [ebp - 12], eax
    call sub_1006E504
    mov esi, eax
    xor edx, edx
    cmp esi, edx
    jl L33
    cmp dword ptr [ebp + 24], edx
    je L24
    push edi
    push dword ptr [ebp - 4]
    mov ecx, ebx
    call sub_1006C782
    mov esi, eax
    cmp esi, edx
    jl L33
    push edx
    push edx
    push dword ptr [ebp + 16]
    mov ecx, ebx
    push dword ptr [ebp - 4]
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 8]
    call sub_1006E543
    mov esi, eax
    test esi, esi
    jl L33
    mov edi, 020500000h
L22:
    test byte ptr [ebp + 24], 1
    je L23
    mov eax, dword ptr [ebp - 12]
    push 0
    push dword ptr [ebp - 4]
    or eax, edi
    push dword ptr [ebp + 12]
    mov ecx, ebx
    push dword ptr [ebp + 12]
    push eax
    push dword ptr [ebp + 8]
    call sub_1006E573
    mov esi, eax
    test esi, esi
    jl L33
L23:
    shr dword ptr [ebp + 24], 1
    je L24
    mov eax, dword ptr [ebp - 12]
    push 4
    push dword ptr [ebp - 4]
    or eax, edi
    push dword ptr [ebp - 4]
    mov ecx, ebx
    push dword ptr [ebp - 4]
    push eax
    push dword ptr [ebp + 8]
    call sub_1006E59D
    mov esi, eax
    test esi, esi
    jge L22
    jmp L33
L24:
    xor eax, eax
    cmp dword ptr [ebp - 8], eax
    jge L32
    push eax
    push eax
    push dword ptr [ebp + 12]
    mov eax, dword ptr [ebp - 12]
    push dword ptr [ebp + 12]
    or eax, 010300000h
    push eax
    jmp L31
L25:
    fld qword ptr [ebp - 16]
    fabs
    fsub qword ptr [g_1019BEB0]
    fabs
    fcomp qword ptr [g_1010F780]
    fnstsw ax
    test ah, 5
    jp L26
    push edi
    push dword ptr [ebp + 12]
    mov ecx, ebx
    call sub_1006C84C
    mov esi, eax
    test esi, esi
    jl L33
    push 4
    push 0
    push dword ptr [ebp + 16]
    and edi, 0000FFFFFh
    push dword ptr [ebp + 12]
    mov eax, edi
    or eax, 010700000h
    push eax
    push dword ptr [ebp + 8]
    mov ecx, ebx
    call sub_1006E61A
    mov esi, eax
    test esi, esi
    jl L33
    fld qword ptr [ebp - 16]
    fcomp qword ptr [g_1019BE20]
    fnstsw ax
    test ah, 1
    jne L32
    push 4
    push 0
    push dword ptr [ebp + 12]
    or edi, 010300000h
    jmp L30
L26:
    mov eax, edi
    shl eax, 3
    push eax
    call sub_100F7BB7
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 4], eax
    jne L28
L27:
    mov esi, 08007000Eh
    jmp L33
L28:
    mov edx, dword ptr [ebp - 4]
    mov ecx, edi
    xor eax, eax
    shl ecx, 2
L29:
    mov dword ptr [ebp + eax*4 - 16], edx
    inc eax
    add edx, ecx
    cmp eax, 2
    jb L29
    push edi
    push dword ptr [ebp - 16]
    mov ecx, ebx
    call sub_1006C8E6
    mov esi, eax
    test esi, esi
    jl L33
    push edi
    push dword ptr [ebp - 12]
    mov ecx, ebx
    call sub_1006C8FB
    mov esi, eax
    test esi, esi
    jl L33
    push edi
    push dword ptr [ebp + 12]
    mov ecx, ebx
    call sub_1006C90C
    mov esi, eax
    test esi, esi
    jl L33
    push 0
    push 0
    push dword ptr [ebp + 16]
    and edi, 0000FFFFFh
    push dword ptr [ebp - 16]
    mov eax, edi
    or eax, 010600000h
    push eax
    push dword ptr [ebp + 8]
    mov ecx, ebx
    call sub_1006E6D6
    mov esi, eax
    test esi, esi
    jl L33
    push 0
    push dword ptr [ebp - 16]
    mov eax, edi
    push dword ptr [ebp + 20]
    or eax, 020500000h
    push dword ptr [ebp - 12]
    mov ecx, ebx
    push eax
    push dword ptr [ebp + 8]
    call sub_1006E6F9
    mov esi, eax
    test esi, esi
    jl L33
    push 4
    push 0
    push dword ptr [ebp - 12]
    or edi, 010500000h
L30:
    push dword ptr [ebp + 12]
    push edi
L31:
    push dword ptr [ebp + 8]
    mov ecx, ebx
    call sub_1006E71A
    mov esi, eax
    test esi, esi
    jl L33
L32:
    xor esi, esi
L33:
    push dword ptr [ebp - 4]
    call sub_100F7C87
    pop ecx
    pop edi
    mov eax, esi
    pop esi
    pop ebx
    leave
    ret 20
FUN_100707c3 ENDP
END
