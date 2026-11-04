extern void sub_1001d320(void);

__declspec(naked) void FUN_1001d4f0(void)
{
    __asm {
    push ebx
    mov ebx, edx
    push esi
    mov esi, dword ptr [edx]
    mov dword ptr [eax], esi
    mov esi, dword ptr [edx + 4]
    mov dword ptr [eax + 4], esi
    mov edx, dword ptr [edx + 8]
    mov dword ptr [eax + 8], edx
    mov eax, dword ptr [esp + 0x18]
    push eax
    mov eax, dword ptr [esp + 0x10]
    sub esp, 0xc
    mov edx, esp
    mov dword ptr [edx], eax
    mov eax, dword ptr [esp + 0x20]
    mov dword ptr [edx + 4], eax
    mov eax, dword ptr [esp + 0x24]
    mov dword ptr [edx + 8], eax
    sub ecx, ebx
    mov eax, 0x2aaaaaab
    imul ecx
    sar edx, 1
    mov ecx, edx
    shr ecx, 0x1f
    add ecx, edx
    push ecx
    xor eax, eax
    call sub_1001d320
    add esp, 0x14
    pop esi
    pop ebx
    ret
    }
}
