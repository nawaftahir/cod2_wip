extern void sub_1004d1bb(void);
extern void sub_1004d362(void);

__declspec(naked) void FUN_1004d400(void)
{
    __asm {
    push ebx
    push esi
    mov esi, dword ptr [esp + 0xc]
    call sub_1004d1bb
    mov ebx, esi
    call sub_1004d362
    mov eax, dword ptr [esi + 0x1a0]
    push esi
    call dword ptr [eax]
    mov ecx, dword ptr [esi + 0x190]
    push esi
    call dword ptr [ecx]
    mov edx, dword ptr [esi + 0x190]
    mov eax, dword ptr [esi + 0x198]
    mov ecx, dword ptr [edx + 4]
    add esp, 8
    pop esi
    mov dword ptr [eax], ecx
    pop ebx
    ret
    }
}
