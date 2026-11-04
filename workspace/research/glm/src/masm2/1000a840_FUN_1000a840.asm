.686
.MODEL FLAT, C
EXTRN sub_1000A8C8:PROC
EXTRN sub_1000A8CA:PROC
EXTRN sub_1000A8CD:PROC
EXTRN sub_1000A90C:PROC
EXTRN sub_1000A91D:PROC
EXTRN EXTRN g_10678514:DWORD:DWORD
.CODE
FUN_1000a840 PROC
    push push ecx
    mov mov eax, dword ptr [g_10678514]
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push edi
    xor xor edi, edi
    test test eax, eax
    jle sub_1000A8C8
    push push esi
    mov mov esi, 010678520h
    xor xor edx, edx
    test test ebx, ebx
    jle L0
    fld fld dword ptr [esi + 8]
    lea lea ecx, [ebp + 4]
    fchs fchs
    fstp fstp dword ptr [esp + 12]
    lea lea ebx, [ebx]
    fld fld dword ptr [ecx - 4]
    fmul fmul dword ptr [esi - 4]
    fld fld dword ptr [ecx + 4]
    fmul fmul dword ptr [esi + 4]
    faddp faddp st(1)
    fld fld dword ptr [esi]
    fmul fmul dword ptr [ecx]
    faddp faddp st(1)
    fadd fadd dword ptr [ecx + 8]
    fcomp fcomp dword ptr [esp + 12]
    fnstsw fnstsw ax
    test test ah, 5
    jnp sub_1000A90C
    inc inc edx
    add add ecx, 20
    cmp cmp edx, ebx
    jl sub_1000A8CA
    xor xor eax, eax
    cmp cmp eax, 2
    sete sete al
    mov mov byte ptr [edi + 010678A98h], al
    mov mov eax, dword ptr [g_10678514]
    inc inc edi
    add add esi, 44
    cmp cmp edi, eax
    jl sub_1000A8CD
    pop pop esi
    pop pop edi
    pop pop ebp
L0:
    pop pop ecx
    ret ret
    mov mov eax, 2
    jmp sub_1000A91D
FUN_1000a840 ENDP
END
