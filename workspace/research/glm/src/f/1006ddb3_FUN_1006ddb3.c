extern void sub_100f787f(void);
extern void sub_100f788a(void);
extern void sub_100f7895(void);
extern void sub_100f78a0(void);

__declspec(naked) void FUN_1006ddb3(void)
{
    __asm {
    mov edi, edi
    push esi
    mov esi, ecx
    mov ecx, dword ptr [esi + 8]
    test ecx, ecx
    je L1
    mov eax, dword ptr [ecx]
    push 1
    call dword ptr [eax]
    push dword ptr [esi + 0x18]
    call sub_100f787f
    push dword ptr [esi + 0x88]
    call sub_100f788a
    push dword ptr [esi + 0x90]
    call sub_100f7895
    push dword ptr [esi + 0x98]
    call sub_100f78a0
    add esp, 0x10
    pop esi
    ret
    }
}
