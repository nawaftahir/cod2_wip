extern int g_1019bcb0;
extern int g_1019bd80;
extern int g_1019bd8c;
extern int g_1019bee0;
extern int g_101d1b2c;
extern int g_10696bdc;
extern int g_10696be0;
extern int g_10696be4;
extern int g_10696be8;
extern int g_10696bec;
extern int g_10696bf0;
extern int g_10696bf4;
extern int g_10696bf8;
extern int g_10696bfc;
extern int g_10696c00;
extern int g_10696c04;
extern int g_10696c08;
extern int g_10696c0c;
extern int g_10696c10;
extern int g_10696c14;
extern int g_10696c18;
extern int g_10696c1c;
extern int g_10696c20;
extern int g_10696c24;
extern int g_10696c2c;
extern int g_10696c30;
extern void sub_10017100(void);
extern void sub_1010acc0(void);

__declspec(naked) void FUN_10028cd0(void)
{
    __asm {
    mov eax, dword ptr g_10696be0
    mov eax, dword ptr [eax + 8]
    mov cl, byte ptr [eax]
    sub esp, 0x30
    test cl, cl
    push edi
    jne L0
    mov eax, dword ptr g_101d1b2c
    jmp L1
    push 6
    call sub_10017100
    add esp, 4
    mov ecx, dword ptr g_10696c2c
    mov dword ptr [esi + 4], eax
    mov edx, dword ptr [ecx + 8]
    mov eax, dword ptr g_10696c24
    mov dword ptr [esi + 0xc], edx
    mov eax, dword ptr [eax + 8]
    cmp byte ptr [eax], 0
    jne L2
    mov eax, dword ptr g_101d1b2c
    jmp L3
    push 6
    call sub_10017100
    add esp, 4
    mov ecx, dword ptr g_10696bdc
    mov edx, dword ptr g_10696c1c
    mov dword ptr [esi + 8], eax
    fld dword ptr [ecx + 8]
    fmul dword ptr g_1019bcb0
    fstp dword ptr [esi + 0x10]
    fld dword ptr [edx + 8]
    fmul dword ptr g_1019bd8c
    fstp dword ptr [esp + 0x20]
    fld dword ptr [esp + 0x20]
    call sub_1010acc0
    fstp dword ptr [esp + 0x20]
    fld dword ptr [esp + 0x20]
    mov eax, dword ptr g_10696c20
    mov ecx, dword ptr g_10696c0c
    fstp dword ptr [esi + 0x14]
    fld dword ptr [eax + 8]
    fmul dword ptr g_1019bcb0
    fstp dword ptr [esi + 0x18]
    fld dword ptr [ecx + 8]
    fmul dword ptr g_1019bd8c
    fstp dword ptr [esp + 0x20]
    fld dword ptr [esp + 0x20]
    call sub_1010acc0
    fstp dword ptr [esp + 0x20]
    fld dword ptr [esp + 0x20]
    mov edx, dword ptr g_10696c04
    mov ecx, dword ptr g_10696bf8
    fstp dword ptr [esi + 0x1c]
    mov eax, dword ptr [edx + 8]
    mov dword ptr [esi + 0x20], eax
    fld dword ptr [ecx + 8]
    fmul dword ptr g_1019bee0
    fstp dword ptr [esp + 0x20]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 0x28]
    fld dword ptr [esp + 0x20]
    fadd qword ptr [esp + 0x28]
    fistp dword ptr [esp + 0x1c]
    mov edx, dword ptr [esp + 0x1c]
    mov eax, dword ptr g_10696c00
    mov dword ptr [esi + 0x24], edx
    fld dword ptr [eax + 8]
    fmul dword ptr g_1019bee0
    fstp dword ptr [esp + 0x20]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 0x28]
    fld dword ptr [esp + 0x20]
    fadd qword ptr [esp + 0x28]
    fistp dword ptr [esp + 0x1c]
    mov ecx, dword ptr [esp + 0x1c]
    mov edx, dword ptr g_10696be4
    mov dword ptr [esi + 0x28], ecx
    fld dword ptr [edx + 8]
    fmul dword ptr g_1019bd8c
    fstp dword ptr [esp + 0x20]
    fld dword ptr [esp + 0x20]
    call sub_1010acc0
    fstp dword ptr [esp + 0x20]
    fld dword ptr [esp + 0x20]
    mov eax, dword ptr g_10696c10
    fstp dword ptr [esi + 0x2c]
    fld dword ptr [eax + 8]
    fmul dword ptr g_1019bd8c
    fstp dword ptr [esp + 0x20]
    fld dword ptr [esp + 0x20]
    call sub_1010acc0
    fstp dword ptr [esp + 0x20]
    fld dword ptr [esp + 0x20]
    mov ecx, dword ptr g_10696c08
    fstp dword ptr [esi + 0x30]
    mov edx, dword ptr [ecx + 8]
    mov dword ptr [esi + 0x34], edx
    mov eax, dword ptr g_10696bfc
    fld dword ptr [eax + 8]
    fmul dword ptr g_1019bee0
    fstp dword ptr [esp + 0x20]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 0x28]
    fld dword ptr [esp + 0x20]
    fadd qword ptr [esp + 0x28]
    fistp dword ptr [esp + 0x1c]
    mov ecx, dword ptr [esp + 0x1c]
    mov edx, dword ptr g_10696be8
    mov dword ptr [esi + 0x38], ecx
    fld dword ptr [edx + 8]
    fmul dword ptr g_1019bee0
    fstp dword ptr [esp + 0x20]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 0x28]
    fld dword ptr [esp + 0x20]
    fadd qword ptr [esp + 0x28]
    fistp dword ptr [esp + 0x1c]
    mov eax, dword ptr [esp + 0x1c]
    mov ecx, dword ptr g_10696c18
    mov dword ptr [esi + 0x3c], eax
    fld dword ptr [ecx + 8]
    fmul dword ptr g_1019bd8c
    fstp dword ptr [esp + 0x20]
    fld dword ptr [esp + 0x20]
    call sub_1010acc0
    fstp dword ptr [esp + 0x20]
    fld dword ptr [esp + 0x20]
    mov edx, dword ptr g_10696c14
    fstp dword ptr [esi + 0x40]
    fld dword ptr [edx + 8]
    fmul dword ptr g_1019bd8c
    fstp dword ptr [esp + 0x20]
    fld dword ptr [esp + 0x20]
    call sub_1010acc0
    fstp dword ptr [esp + 0x20]
    fld dword ptr [esp + 0x20]
    mov eax, dword ptr g_10696c30
    mov edx, dword ptr g_10696bf0
    fstp dword ptr [esi + 0x44]
    mov ecx, dword ptr [eax + 8]
    mov dword ptr [esi + 0x48], ecx
    fld dword ptr [edx + 8]
    fmul dword ptr g_1019bee0
    fstp dword ptr [esp + 0x20]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 0x28]
    fld dword ptr [esp + 0x20]
    fadd qword ptr [esp + 0x28]
    fistp dword ptr [esp + 0x1c]
    mov eax, dword ptr [esp + 0x1c]
    mov ecx, dword ptr g_10696bf4
    mov dword ptr [esi + 0x4c], eax
    fld dword ptr [ecx + 8]
    fmul dword ptr g_1019bee0
    fstp dword ptr [esp + 0x20]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 0x28]
    fld dword ptr [esp + 0x20]
    fadd qword ptr [esp + 0x28]
    fistp dword ptr [esp + 0x1c]
    mov edx, dword ptr [esp + 0x1c]
    mov eax, dword ptr g_10696bec
    mov dword ptr [esi + 0x50], edx
    mov edi, dword ptr [eax + 8]
    fld dword ptr [edi + 4]
    lea ecx, [esp + 0xc]
    fmul dword ptr g_1019bd8c
    lea eax, [esp + 0x10]
    lea edx, [esi + 0x54]
    mov dword ptr [esp + 0x28], ecx
    fstp dword ptr [esp + 0x18]
    mov dword ptr [esp + 0x24], eax
    push eax
    push ecx
    fld dword ptr [esp + 0x20]
    fsincos
    mov ecx, dword ptr [esp + 0x30]
    mov eax, dword ptr [esp + 0x2c]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    fld dword ptr [edi]
    fmul dword ptr g_1019bd8c
    lea ecx, [esp + 8]
    lea eax, [esp + 0x14]
    mov dword ptr [esp + 0x24], ecx
    fstp dword ptr [esp + 0x18]
    mov dword ptr [esp + 0x28], eax
    push eax
    push ecx
    fld dword ptr [esp + 0x20]
    fsincos
    mov ecx, dword ptr [esp + 0x2c]
    mov eax, dword ptr [esp + 0x30]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    test edx, edx
    je L4
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 0xc]
    fstp dword ptr [edx]
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 0x10]
    fstp dword ptr [edx + 4]
    fld dword ptr [esp + 0x14]
    fchs
    fstp dword ptr [edx + 8]
    mov byte ptr [esi], 1
    pop edi
    add esp, 0x30
    ret
    }
}
