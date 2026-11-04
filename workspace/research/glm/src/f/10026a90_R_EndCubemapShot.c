extern void sub_10026920(void);

__declspec(naked) void R_EndCubemapShot(void)
{
    __asm {
    mov eax, dword ptr [esp + 0x10]
    mov ecx, dword ptr [esp + 0xc]
    mov edx, dword ptr [esp + 4]
    push ebx
    mov ebx, dword ptr [esp + 0xc]
    push eax
    push ecx
    push edx
    call sub_10026920
    add esp, 0xc
    pop ebx
    ret
    }
}
