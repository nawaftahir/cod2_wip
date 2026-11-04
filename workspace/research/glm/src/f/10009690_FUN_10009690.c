extern int g_101d7e9c;
extern int g_10678500;
extern void sub_100093cb(void);

__declspec(naked) void FUN_10009690(void)
{
    __asm {
    mov eax, dword ptr [ecx + 0x28]
    test eax, eax
    push esi
    mov esi, dword ptr [ecx + 0x2c]
    je L3
    push ebp
    mov ebp, eax
    mov edi, edi
    mov ecx, dword ptr g_101d7e9c
    mov eax, dword ptr [esi]
    mov edx, dword ptr [ecx + eax*4]
    cmp edx, dword ptr g_10678500
    je L3
    push edi
    mov ecx, ebx
    call sub_100093cb
    add esp, 4
    add esi, 4
    dec ebp
    jne L3
    pop ebp
    pop esi
    ret
    }
}
