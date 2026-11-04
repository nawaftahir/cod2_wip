extern int g_101a50d0;
extern int g_101a55b8;
extern void sub_10100d4d(void);
extern void sub_1010245b(void);
extern void sub_10102700(void);
extern void sub_10102924(void);
extern void sub_1010296c(void);
extern void sub_10102999(void);
extern void sub_10102c81(void);

__declspec(naked) void __except2(void)
{
    __asm {
    push ebp
    mov ebp, esp
    and esp, 0xfffffff0
    sub esp, 0x80
    mov eax, dword ptr g_101a50d0
    push dword ptr [ebp + 0x28]
    mov dword ptr [esp + 0x80], eax
    lea eax, [ebp + 0x20]
    push eax
    push dword ptr [ebp + 8]
    call sub_10102700
    add esp, 0xc
    test eax, eax
    jne L0
    mov eax, dword ptr [esp + 0x40]
    fld qword ptr [ebp + 0x18]
    and eax, 0xffffffe3
    fstp qword ptr [esp + 0x30]
    or eax, 3
    mov dword ptr [esp + 0x40], eax
    lea eax, [ebp + 0x20]
    push eax
    lea eax, [ebp + 0x10]
    push eax
    push dword ptr [ebp + 0xc]
    lea eax, [ebp + 0x28]
    push dword ptr [ebp + 8]
    push eax
    lea eax, [esp + 0x14]
    push eax
    call sub_1010245b
    add esp, 0x18
    push dword ptr [ebp + 8]
    call sub_1010296c
    add esp, 4
    cmp dword ptr g_101a55b8, 0
    jne L1
    test eax, eax
    je L1
    push dword ptr [ebp + 0x28]
    fld qword ptr [ebp + 0x20]
    sub esp, 0x18
    fstp qword ptr [esp + 0x10]
    fld qword ptr [ebp + 0x18]
    fstp qword ptr [esp + 8]
    fld qword ptr [ebp + 0x10]
    fstp qword ptr [esp]
    push dword ptr [ebp + 0xc]
    push eax
    call sub_10102999
    add esp, 0x24
    jmp L2
    push eax
    call sub_10102924
    mov dword ptr [esp], 0xffff
    push dword ptr [ebp + 0x28]
    call sub_10102c81
    fld qword ptr [ebp + 0x20]
    pop ecx
    pop ecx
    mov ecx, dword ptr [esp + 0x7c]
    call sub_10100d4d
    mov esp, ebp
    pop ebp
    ret
    }
}
