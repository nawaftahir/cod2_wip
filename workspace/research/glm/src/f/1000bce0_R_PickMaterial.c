extern int g_1076a82c;
extern int g_101ce840[];
extern int c_10193114;
extern int c_101930e4;
extern void sub_100138c0(void);
extern void sub_1000c6a0(void);

__declspec(naked) void R_PickMaterial(void)
{
    __asm {
    mov eax, dword ptr g_1076a82c
    push ebx
    push ebp
    push esi
    xor ebp, ebp
    test eax, eax
    push edi
    jle L_none
    nop
L_outer:
    mov eax, dword ptr g_101ce840[ebp * 4]
    mov edx, dword ptr [eax]
    mov edi, dword ptr [esp + 0x14]
    mov esi, 0x7fffffff
    sub edi, edx
L_inner:
    movsx eax, byte ptr [edi + edx]
    movsx ecx, byte ptr [edx]
    inc edx
    mov ebx, esi
    dec esi
    test ebx, ebx
    je L_found
    cmp eax, ecx
    je L_match
    cmp eax, 0x61
    jl L_up1
    cmp eax, 0x7a
    jg L_up1
    sub eax, 0x20
L_up1:
    cmp ecx, 0x61
    jl L_up2
    cmp ecx, 0x7a
    jg L_up2
    sub ecx, 0x20
L_up2:
    cmp eax, ecx
    jne L_diff
L_match:
    test eax, eax
    jne L_inner
L_found:
    mov eax, dword ptr g_101ce840[ebp * 4]
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
L_diff:
    xor edx, edx
    cmp eax, ecx
    setge dl
    lea edx, [edx + edx - 1]
    mov eax, edx
    test eax, eax
    je L_found
    mov eax, dword ptr g_1076a82c
    inc ebp
    cmp ebp, eax
    jl L_outer
L_none:
    cmp eax, 0x10
    jl L_load
    push offset c_10193114
    push 1
    call sub_100138c0
    add esp, 8
    pop edi
    pop esi
    pop ebp
    xor eax, eax
    pop ebx
    ret
L_load:
    mov eax, dword ptr [esp + 0x18]
    mov edi, dword ptr [esp + 0x14]
    push eax
    mov eax, edi
    call sub_1000c6a0
    mov esi, eax
    add esp, 4
    test esi, esi
    jne L_store
    push edi
    push offset c_101930e4
    push 1
    call sub_100138c0
    add esp, 0xc
L_store:
    mov eax, dword ptr g_1076a82c
    mov dword ptr g_101ce840[eax * 4], esi
    inc eax
    pop edi
    mov dword ptr g_1076a82c, eax
    mov eax, esi
    pop esi
    pop ebp
    pop ebx
    ret
    }
}
