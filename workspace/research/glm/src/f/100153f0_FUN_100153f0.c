extern int g_101d1b9c;

__declspec(naked) void FUN_100153f0(void)
{
    __asm {
    mov edx, dword ptr [esp + 8]
    push esi
    mov esi, dword ptr [esp + 8]
    fld dword ptr [esi + 0xc]
    fcomp dword ptr [edx]
    fnstsw ax
    test ah, 5
    jnp L0
    fld dword ptr [esi]
    mov ecx, dword ptr [esp + 0x10]
    fcomp dword ptr [ecx]
    fnstsw ax
    test ah, 0x41
    je L0
    fld dword ptr [esi + 0x10]
    fcomp dword ptr [edx + 4]
    fnstsw ax
    test ah, 5
    jnp L0
    fld dword ptr [esi + 4]
    fcomp dword ptr [ecx + 4]
    fnstsw ax
    test ah, 0x41
    je L0
    fld dword ptr [esi + 0x14]
    fcomp dword ptr [edx + 8]
    fnstsw ax
    test ah, 5
    jnp L0
    fld dword ptr [esi + 8]
    fcomp dword ptr [ecx + 8]
    fnstsw ax
    test ah, 0x41
    je L0
    mov eax, dword ptr [esi + 0x28]
    push ebx
    xor ebx, ebx
    cmp eax, ebx
    push ebp
    push edi
    je L1
    xor edi, edi
    cmp eax, ebx
    jle L2
    mov ebp, dword ptr [esp + 0x28]
    jmp L3
    mov edx, dword ptr [esp + 0x18]
    mov ecx, dword ptr [esp + 0x1c]
    mov eax, dword ptr [esp + 0x24]
    push ebp
    push eax
    mov eax, dword ptr [esp + 0x28]
    push eax
    push ecx
    mov ecx, dword ptr [esi + 0x2c]
    push edx
    add ecx, ebx
    push ecx
    call L4
    mov eax, dword ptr [esi + 0x28]
    add esp, 0x18
    inc edi
    add ebx, 0x30
    cmp edi, eax
    jl L5
    pop edi
    pop ebp
    pop ebx
    pop esi
    ret
    mov eax, dword ptr [esi + 0x1c]
    mov ecx, dword ptr g_101d1b9c
    mov ecx, dword ptr [ecx + 0x14]
    lea eax, [eax + eax*2]
    lea edi, [ecx + eax*4]
    cmp dword ptr [esi + 0x18], ebx
    mov dword ptr [esp + 0x18], ebx
    jle L2
    mov ebp, dword ptr [esp + 0x28]
    mov ebx, dword ptr [ebp]
    cmp ebx, dword ptr [esp + 0x24]
    jge L2
    mov eax, dword ptr [edi]
    test byte ptr [eax + 0xc], 4
    jne L6
    mov ecx, dword ptr [edi + 8]
    fld dword ptr [ecx + 0x10]
    fcomp dword ptr [edx]
    fnstsw ax
    test ah, 5
    jnp L6
    mov eax, dword ptr [esp + 0x1c]
    fld dword ptr [ecx + 4]
    fcomp dword ptr [eax]
    fnstsw ax
    test ah, 0x41
    je L6
    fld dword ptr [ecx + 0x14]
    fcomp dword ptr [edx + 4]
    fnstsw ax
    test ah, 5
    jnp L6
    mov eax, dword ptr [esp + 0x1c]
    fld dword ptr [ecx + 8]
    fcomp dword ptr [eax + 4]
    fnstsw ax
    test ah, 0x41
    je L6
    fld dword ptr [ecx + 0x18]
    fcomp dword ptr [edx + 8]
    fnstsw ax
    test ah, 5
    jnp L6
    fld dword ptr [ecx + 0xc]
    mov ecx, dword ptr [esp + 0x1c]
    fcomp dword ptr [ecx + 8]
    fnstsw ax
    test ah, 0x41
    je L6
    mov eax, dword ptr [esp + 0x20]
    mov dword ptr [eax + ebx*4], edi
    inc dword ptr [ebp]
    mov eax, dword ptr [esp + 0x18]
    mov ecx, dword ptr [esi + 0x18]
    inc eax
    add edi, 0xc
    cmp eax, ecx
    mov dword ptr [esp + 0x18], eax
    jl L7
    pop edi
    pop ebp
    pop ebx
    pop esi
    ret
    }
}
