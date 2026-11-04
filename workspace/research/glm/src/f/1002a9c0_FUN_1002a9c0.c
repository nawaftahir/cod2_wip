extern int g_1019bc84;
extern void (__stdcall *fp_101d4b54)(void);
extern void sub_1002a250(void);
extern void sub_1002a360(void);
extern void sub_10059d80(void);

__declspec(naked) void FUN_1002a9c0(void)
{
    __asm {
    mov eax, dword ptr [esp + 8]
    sub esp, 0xc
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x2c]
    mov dword ptr [ebp + 0x10], eax
    mov eax, dword ptr [esp + 0x20]
    mov ecx, dword ptr [eax]
    mov dword ptr [ebp + 4], ecx
    mov edx, dword ptr [eax + 4]
    push esi
    mov dword ptr [ebp + 8], edx
    mov eax, dword ptr [eax + 8]
    mov edx, dword ptr [esp + 0x28]
    lea esi, [ebp + 0x2c]
    push edi
    lea ebx, [esi + 0x18]
    lea edi, [esp + 0x10]
    mov dword ptr [ebp + 0xc], eax
    call sub_10059d80
    fld dword ptr g_1019bc84
    fsub dword ptr [esp + 0x10]
    mov ecx, dword ptr [esp + 0x30]
    mov eax, dword ptr [esp + 0x24]
    lea ebx, [ebp + 0x20]
    fstp dword ptr [esi + 0xc]
    lea edi, [ebp + 0x14]
    fld dword ptr g_1019bc84
    push ebx
    fsub dword ptr [esp + 0x18]
    fstp dword ptr [esi + 0x10]
    fld dword ptr g_1019bc84
    fsub dword ptr [esp + 0x1c]
    fstp dword ptr [esi + 0x14]
    mov dword ptr [ebp + 0x50], ecx
    call sub_1002a360
    fld dword ptr [esp + 0x34]
    fmul dword ptr [edi]
    mov eax, dword ptr [esp + 0x2c]
    mov edx, dword ptr [esp + 0x28]
    push edx
    fadd dword ptr [eax]
    fstp dword ptr [edi]
    fld dword ptr [esp + 0x38]
    fmul dword ptr [edi + 4]
    fadd dword ptr [eax + 4]
    fstp dword ptr [edi + 4]
    fld dword ptr [esp + 0x38]
    fmul dword ptr [edi + 8]
    fadd dword ptr [eax + 8]
    fstp dword ptr [edi + 8]
    fld dword ptr [esp + 0x38]
    fmul dword ptr [ebx]
    fadd dword ptr [eax]
    fstp dword ptr [ebx]
    fld dword ptr [esp + 0x38]
    fmul dword ptr [ebx + 4]
    fadd dword ptr [eax + 4]
    fstp dword ptr [ebx + 4]
    fld dword ptr [esp + 0x38]
    fmul dword ptr [ebx + 8]
    fadd dword ptr [eax + 8]
    fstp dword ptr [ebx + 8]
    call fp_101d4b54
    fmul dword ptr [esp + 0x38]
    mov eax, dword ptr [esp + 0x28]
    push ebx
    push edi
    fstp dword ptr [ebp]
    mov ecx, dword ptr [eax + 0xc]
    push ebp
    push ecx
    push eax
    call sub_1002a250
    add esp, 0x1c
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 0xc
    ret
    }
}
