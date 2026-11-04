extern int g_101ce614;
extern int g_101ce7f4;
extern int g_101d1b9c;
extern void sub_10038cf0(void);
extern void sub_1005a880(void);
extern void sub_1005b340(void);

__declspec(naked) void FUN_10038fd0(void)
{
    __asm {
    sub esp, 0x28
    mov eax, dword ptr g_101ce614
    mov ecx, dword ptr [eax + 8]
    mov edx, dword ptr g_101ce7f4
    mov eax, dword ptr [edx + 8]
    push edi
    push 4
    push 0
    push 0xbc
    mov dword ptr [esp + 0x10], ecx
    mov dword ptr [esp + 0x14], eax
    call sub_10038cf0
    push 4
    push 0
    push 0xc1
    mov edi, eax
    call sub_10038cf0
    fld dword ptr [esp + 0x1c]
    fchs
    add esp, 0x18
    lea edx, [esp + 0x1c]
    fstp dword ptr [esp + 0x14]
    lea ecx, [esp + 0xc]
    mov dword ptr [esp + 0xc], 0
    mov dword ptr [esp + 0x10], 0
    mov dword ptr [esp + 0x18], 0
    call sub_1005b340
    fld dword ptr [esp + 0x24]
    fadd dword ptr [esp + 8]
    mov eax, dword ptr g_101d1b9c
    add eax, 0x1c0
    lea edx, [esp + 0xc]
    lea ecx, [esp + 0x1c]
    fstp dword ptr [esp + 0x24]
    call sub_1005b340
    mov edx, esi
    mov ecx, edi
    call sub_1005a880
    fld dword ptr [esp + 0xc]
    fadd dword ptr [esi + 0x30]
    pop edi
    fstp dword ptr [esi + 0x30]
    fld dword ptr [esp + 0xc]
    fadd dword ptr [esi + 0x34]
    fstp dword ptr [esi + 0x34]
    fld dword ptr [esp + 0x10]
    fadd dword ptr [esi + 0x38]
    fstp dword ptr [esi + 0x38]
    fld dword ptr [esp + 0x14]
    fadd dword ptr [esi + 0x3c]
    fstp dword ptr [esi + 0x3c]
    add esp, 0x28
    ret
    }
}
