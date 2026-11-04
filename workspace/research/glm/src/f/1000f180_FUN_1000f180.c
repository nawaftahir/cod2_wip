extern int g_1019bcac;
extern int g_1019bd80;

__declspec(naked) void FUN_1000f180(void)
{
    __asm {
    sub esp, 0x14
    fld dword ptr [edx]
    fmul dword ptr g_1019bcac
    fstp dword ptr [esp]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 8]
    fld dword ptr [esp]
    fadd qword ptr [esp + 8]
    fistp dword ptr [esp + 4]
    mov ecx, dword ptr [esp + 4]
    lea eax, [ecx - 0xff]
    test eax, eax
    jl L0
    mov ecx, 0xff
    mov eax, ecx
    neg eax
    mov eax, 0
    setns al
    dec eax
    and eax, ecx
    mov byte ptr [esi + 2], al
    fld dword ptr [edx + 4]
    fmul dword ptr g_1019bcac
    fstp dword ptr [esp + 4]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 8]
    fld dword ptr [esp + 4]
    fadd qword ptr [esp + 8]
    fistp dword ptr [esp]
    mov ecx, dword ptr [esp]
    lea eax, [ecx - 0xff]
    test eax, eax
    jl L1
    mov ecx, 0xff
    mov eax, ecx
    neg eax
    mov eax, 0
    setns al
    dec eax
    and eax, ecx
    mov byte ptr [esi + 1], al
    fld dword ptr [edx + 8]
    fmul dword ptr g_1019bcac
    fstp dword ptr [esp + 4]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 8]
    fld dword ptr [esp + 4]
    fadd qword ptr [esp + 8]
    fistp dword ptr [esp]
    mov ecx, dword ptr [esp]
    lea eax, [ecx - 0xff]
    test eax, eax
    jl L2
    mov ecx, 0xff
    mov eax, ecx
    neg eax
    mov eax, 0
    setns al
    dec eax
    and eax, ecx
    mov byte ptr [esi], al
    fld dword ptr [edx + 0xc]
    fmul dword ptr g_1019bcac
    fstp dword ptr [esp + 4]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 8]
    fld dword ptr [esp + 4]
    fadd qword ptr [esp + 8]
    fistp dword ptr [esp]
    mov ecx, dword ptr [esp]
    lea edx, [ecx - 0xff]
    test edx, edx
    jl L3
    mov ecx, 0xff
    mov eax, ecx
    neg eax
    mov eax, 0
    setns al
    dec eax
    and eax, ecx
    mov byte ptr [esi + 3], al
    add esp, 0x14
    ret
    }
}
