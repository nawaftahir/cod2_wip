.686
.MODEL FLAT, C
EXTRN g_10678514:DWORD
.CODE
FUN_1000a840 PROC
    push ecx
    mov eax, dword ptr [g_10678514]
    push ebp
    mov ebp, dword ptr [esp + 12]
    push edi
    xor edi, edi
    test eax, eax
    jle L4
    push esi
    mov esi, 010678520h
L0:
    xor edx, edx
    test ebx, ebx
    jle L2
    fld dword ptr [esi + 8]
    lea ecx, [ebp + 4]
    fchs
    fstp dword ptr [esp + 12]
    lea ebx, [ebx]
L1:
    fld dword ptr [ecx - 4]
    fmul dword ptr [esi - 4]
    fld dword ptr [ecx + 4]
    fmul dword ptr [esi + 4]
    faddp st(1)
    fld dword ptr [esi]
    fmul dword ptr [ecx]
    faddp st(1)
    fadd dword ptr [ecx + 8]
    fcomp dword ptr [esp + 12]
    fnstsw ax
    test ah, 5
    jnp L5
    inc edx
    add ecx, 20
    cmp edx, ebx
    jl L1
L2:
    xor eax, eax
L3:
    cmp eax, 2
    sete al
    mov byte ptr [edi + 010678A98h], al
    mov eax, dword ptr [g_10678514]
    inc edi
    add esi, 44
    cmp edi, eax
    jl L0
    pop esi
L4:
    pop edi
    pop ebp
    pop ecx
    ret
L5:
    mov eax, 2
    jmp L3
FUN_1000a840 ENDP
END
