extern int g_101addc8;
extern void sub_100fc474(void);

__declspec(naked) void __getbuf(void)
{
    __asm {
    inc dword ptr g_101addc8
    push 0x1000
    call sub_100fc474
    test eax, eax
    pop ecx
    mov ecx, dword ptr [esp + 4]
    mov dword ptr [ecx + 8], eax
    je L2
    or dword ptr [ecx + 0xc], 8
    mov dword ptr [ecx + 0x18], 0x1000
    jmp L2
    or dword ptr [ecx + 0xc], 4
    lea eax, [ecx + 0x14]
    mov dword ptr [ecx + 8], eax
    mov dword ptr [ecx + 0x18], 2
    mov eax, dword ptr [ecx + 8]
    and dword ptr [ecx + 4], 0
    mov dword ptr [ecx], eax
    ret
    }
}
