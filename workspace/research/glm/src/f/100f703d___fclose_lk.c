extern void sub_100f6af2(void);
extern void sub_100f850e(void);
extern void sub_100fcd40(void);
extern void sub_100fcdd3(void);

__declspec(naked) void __fclose_lk(void)
{
    __asm {
    push esi
    mov esi, dword ptr [esp + 8]
    push edi
    or edi, 0xffffffff
    test byte ptr [esi + 0xc], 0x83
    je L2
    push esi
    call sub_100f6af2
    push esi
    mov edi, eax
    call sub_100fcdd3
    push dword ptr [esi + 0x10]
    call sub_100fcd40
    add esp, 0xc
    test eax, eax
    jge L2
    or edi, 0xffffffff
    jmp L2
    mov eax, dword ptr [esi + 0x1c]
    test eax, eax
    je L2
    push eax
    call sub_100f850e
    and dword ptr [esi + 0x1c], 0
    pop ecx
    and dword ptr [esi + 0xc], 0
    mov eax, edi
    pop edi
    pop esi
    ret
    }
}
