extern void sub_10014230(void);

__declspec(naked) void FUN_10014420(void)
{
    __asm {
    push ebx
    mov ebx, edx
    push esi
    mov esi, dword ptr [edx]
    mov dword ptr [eax], esi
    mov esi, dword ptr [edx + 4]
    mov dword ptr [eax + 4], esi
    mov esi, dword ptr [edx + 8]
    mov dword ptr [eax + 8], esi
    mov edx, dword ptr [edx + 0xc]
    mov dword ptr [eax + 0xc], edx
    mov eax, dword ptr [esp + 0x1c]
    push eax
    mov eax, dword ptr [esp + 0x10]
    sub esp, 0x10
    mov edx, esp
    mov dword ptr [edx], eax
    mov eax, dword ptr [esp + 0x24]
    mov dword ptr [edx + 4], eax
    mov eax, dword ptr [esp + 0x28]
    mov dword ptr [edx + 8], eax
    mov eax, dword ptr [esp + 0x2c]
    sub ecx, ebx
    sar ecx, 4
    mov dword ptr [edx + 0xc], eax
    push ecx
    xor eax, eax
    call sub_10014230
    add esp, 0x18
    pop esi
    pop ebx
    ret
    }
}
