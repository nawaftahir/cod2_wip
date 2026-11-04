extern void sub_100c9a7f(void);

__declspec(naked) void FUN_100ca416(void)
{
    __asm {
    mov edx, dword ptr [ecx + 0x100]
    mov eax, dword ptr [edx]
    push ebx
    push esi
    mov esi, dword ptr [edx + 0xc]
    push edi
    mov edi, dword ptr [edx + 0x10]
    mov edx, dword ptr [edx + 8]
    xor ebx, ebx
    push ebx
    push ebx
    push ebx
    push ebx
    and eax, 0xfffff
    push eax
    lea ebx, [edx + eax*8]
    push ebx
    lea eax, [edx + eax*4]
    push eax
    push edx
    push esi
    push edi
    push 0x5a
    call sub_100c9a7f
    pop edi
    pop esi
    pop ebx
    ret
    }
}
