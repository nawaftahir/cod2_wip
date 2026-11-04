extern void sub_1006ac63(void);
extern void sub_100f7883(void);

__declspec(naked) void FUN_1006b285(void)
{
    __asm {
    mov edi, edi
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 8]
    test eax, eax
    je L2
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    and dword ptr [esi + 8], 0
    push dword ptr [esi + 0x58]
    call sub_100f7883
    pop ecx
    mov ecx, dword ptr [esi + 0x78]
    test ecx, ecx
    pop esi
    je L2
    push 1
    call sub_1006ac63
    ret
    }
}
