extern int g_1019bca4;
extern int g_1019bca8;
extern int g_1042e778;
extern void sub_1002c0b0(void);
extern void sub_1010a8a8(void);

__declspec(naked) void R_DrawStretchPic(void)
{
    __asm {
    push ecx
    mov eax, dword ptr g_1042e778
    mov edx, dword ptr [eax + 0x30000]
    mov ecx, 0x30000
    push esi
    mov esi, dword ptr [eax + 0x30004]
    sub ecx, edx
    lea ecx, [ecx + esi - 0x2000]
    cmp ecx, 0x30
    jge L0
    mov dword ptr [eax + 0x30008], 0
    pop esi
    pop ecx
    ret
L0:
    mov ecx, dword ptr [esp + 0xc]
    mov esi, dword ptr [esp + 0x30]
    push ebx
    lea ebx, [edx + eax]
    mov dword ptr [eax + 0x30008], ebx
    add edx, 0x30
    mov dword ptr [eax + 0x30000], edx
    mov eax, dword ptr [esp + 0x38]
    mov edx, dword ptr [esp + 0x14]
    mov word ptr [ebx], 0x10
    mov word ptr [ebx + 2], 0x30
    mov dword ptr [ebx + 4], eax
    mov eax, dword ptr [esp + 0x18]
    mov dword ptr [ebx + 8], ecx
    mov ecx, dword ptr [esp + 0x1c]
    mov dword ptr [ebx + 0xc], edx
    mov edx, dword ptr [esp + 0x20]
    mov dword ptr [ebx + 0x10], eax
    mov eax, dword ptr [esp + 0x24]
    mov dword ptr [ebx + 0x14], ecx
    mov ecx, dword ptr [esp + 0x28]
    mov dword ptr [ebx + 0x18], edx
    mov edx, dword ptr [esp + 0x2c]
    push edi
    lea edi, [ebx + 0x28]
    mov dword ptr [ebx + 0x1c], eax
    mov dword ptr [ebx + 0x20], ecx
    mov dword ptr [ebx + 0x24], edx
    call sub_1002c0b0
    fld dword ptr [esp + 0x34]
    fmul dword ptr g_1019bca8
    call sub_1010a8a8
    and eax, 0xffff
    mov dword ptr [esp + 0xc], eax
    fild dword ptr [esp + 0xc]
    pop edi
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 8]
    fmul dword ptr g_1019bca4
    fstp dword ptr [ebx + 0x2c]
    pop ebx
    pop esi
    pop ecx
    ret
    }
}
