extern int g_1019bcac;
extern int g_1019bd80;
extern int g_1019bf24;
extern int g_1019bf48;
extern int g_101d1bd0;
extern int g_101d1be0;
extern int g_101d48ac;
extern int g_1072d9d0;
extern int g_1072d9e0;
extern int g_1072ddb8;
extern int g_1072debd;
extern int g_1073055c;
extern int g_1076671c;
extern int g_10766720;
extern void sub_1002e020(void);
extern void sub_1002e850(void);
extern void sub_1003a8d0(void);
extern void sub_100f8f20(void);

__declspec(naked) void FUN_10030cd0(void)
{
    __asm {
    push ebp
    mov ebp, esp
    and esp, 0xfffffff8
    sub esp, 0x14
    mov eax, dword ptr g_1072d9d0
    test eax, eax
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    mov esi, dword ptr [edi]
    jne L0
    mov eax, dword ptr g_1072d9e0
    test eax, eax
    je L1
    call sub_1003a8d0
    mov al, byte ptr g_1072debd
    test al, al
    jne L2
    call sub_1002e020
    mov ecx, dword ptr g_1072ddb8
    sub ecx, dword ptr g_101d1be0
    mov dword ptr [esp + 0x10], ecx
    js L3
    mov eax, dword ptr [esi + 4]
    cmp ecx, eax
    mov dword ptr [esp + 0x14], eax
    jge L3
    fld qword ptr g_1019bf48
    fild dword ptr [esp + 0x10]
    fidiv dword ptr [esp + 0x14]
    call sub_100f8f20
    fcom dword ptr g_1019bf24
    fnstsw ax
    test ah, 0x41
    jne L4
    fstp st(0)
    fld dword ptr g_1019bf24
    fmul dword ptr g_1019bcac
    fstp dword ptr [esp + 0x14]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 0x18]
    fld dword ptr [esp + 0x14]
    fadd qword ptr [esp + 0x18]
    fistp dword ptr [esp + 0x10]
    fild dword ptr g_10766720
    movzx ebx, byte ptr [esp + 0x10]
    mov eax, dword ptr g_101d48ac
    push 0x3f800000
    push 0x3f800000
    push 0
    push 0
    sub esp, 8
    mov dword ptr g_1073055c, eax
    mov eax, dword ptr g_101d1bd0
    fstp dword ptr [esp + 4]
    shl ebx, 0x18
    fild dword ptr g_1076671c
    or ebx, 0xffffff
    fstp dword ptr [esp]
    push 0
    push 0
    call sub_1002e850
    add esp, 0x20
    mov eax, dword ptr [edi]
    movzx ecx, word ptr [eax + 2]
    add ecx, eax
    mov dword ptr [edi], ecx
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
    }
}
