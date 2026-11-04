extern int c_101d616c;
extern int c_101d61ac;
extern int c_101d61cc;
extern int c_101d61ec;
extern int g_101d61c8;
extern int g_101d61f0;
extern int g_101d61f4;
extern int g_101d620c;

__declspec(naked) void R_SetFog(void)
{
    __asm {
    mov al, byte ptr g_101d61c8
    test al, al
    mov edx, dword ptr [esp + 4]
    push esi
    push edi
    mov dword ptr g_101d620c, edx
    mov edi, offset c_101d61cc
    mov ecx, 8
    je L_take
    mov eax, dword ptr [esp + 0x14]
    mov esi, offset c_101d61ac
    jmp L_copy1
L_take:
    mov esi, edx
    shl esi, 5
    add esi, offset c_101d616c
    xor eax, eax
L_copy1:
    rep movsd
    mov esi, edx
    shl esi, 5
    add esi, offset c_101d616c
    test eax, eax
    mov ecx, 8
    mov edi, offset c_101d61ec
    rep movsd
    pop edi
    pop esi
    jne L_end2
    mov dword ptr g_101d61f0, eax
    mov dword ptr g_101d61f4, eax
    ret
L_end2:
    mov ecx, dword ptr [esp + 8]
    mov dword ptr g_101d61f0, ecx
    add ecx, eax
    mov dword ptr g_101d61f4, ecx
    ret
    }
}
