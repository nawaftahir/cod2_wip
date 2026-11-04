extern int g_101ae3a4;
extern int g_101ae3a8;
extern void (__stdcall *fp_101d49d4)(void);
extern void sub_10001958(void);

__declspec(naked) void FUN_10002620(void)
{
    __asm {
    push ebx
    push esi
    mov esi, dword ptr [edi]
    mov ebx, 8
    mov edx, 2
    mov eax, edi
    add esi, 0x18
    call sub_10001958
    mov dword ptr g_101ae3a4, eax
    mov eax, dword ptr [esi]
    push eax
    call fp_101d49d4
    mov edx, dword ptr g_101ae3a4
    mov dword ptr g_101ae3a8, eax
    mov ecx, dword ptr [esi + 4]
    add ecx, dword ptr [edi + 4]
    add esp, 4
    xor esi, esi
    test edx, edx
    jle L2
    mov edx, dword ptr [ecx]
    mov dword ptr [eax], edx
    mov dl, byte ptr [ecx + 4]
    mov byte ptr [eax + 4], dl
    mov dl, byte ptr [ecx + 5]
    mov byte ptr [eax + 5], dl
    mov dx, word ptr [ecx + 6]
    mov word ptr [eax + 6], dx
    mov edx, dword ptr g_101ae3a4
    inc esi
    add ecx, 8
    add eax, 8
    cmp esi, edx
    jl L2
    pop esi
    pop ebx
    ret
    }
}
