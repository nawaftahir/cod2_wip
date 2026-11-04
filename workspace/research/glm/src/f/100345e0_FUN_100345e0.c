extern int g_1019bcac;
extern int g_1072d9d0;
extern int g_1072d9e0;
extern int g_1072ddc8;
extern int g_1072debd;
extern int g_10764558;
extern void sub_1002e380(void);
extern void sub_10032a50(void);
extern void sub_1003a8d0(void);
extern void sub_1010a8a8(void);

__declspec(naked) void FUN_100345e0(void)
{
    __asm {
    sub esp, 0x1c
    push ebx
    push esi
    mov esi, eax
    test esi, esi
    push edi
    je L0
    mov al, byte ptr g_1072debd
    test al, al
    je L1
    call sub_1002e380
    test esi, esi
    jle L2
    mov edi, dword ptr [esp + 0x2c]
    add edi, 0x10
    mov ebx, esi
    nop
    lea eax, [edi - 4]
    test eax, eax
    jne L3
    mov dword ptr [esp + 0xc], 0xffffffff
    jmp L4
    fld dword ptr [edi + 4]
    fmul dword ptr g_1019bcac
    call sub_1010a8a8
    fld dword ptr [edi]
    fmul dword ptr g_1019bcac
    mov byte ptr [esp + 0xc], al
    call sub_1010a8a8
    fld dword ptr [edi - 4]
    fmul dword ptr g_1019bcac
    mov byte ptr [esp + 0xd], al
    call sub_1010a8a8
    fld dword ptr [edi + 8]
    fmul dword ptr g_1019bcac
    mov byte ptr [esp + 0xe], al
    call sub_1010a8a8
    mov byte ptr [esp + 0xf], al
    fld dword ptr [edi + 0xc]
    mov eax, dword ptr g_1072ddc8
    fchs
    mov ecx, dword ptr [esp + 0xc]
    fld st(0)
    push ecx
    fld st(0)
    mov ecx, dword ptr g_10764558
    fmul dword ptr [eax + 0x18]
    lea edx, [esp + 0x14]
    push edx
    push ecx
    fstp dword ptr [esp + 0x28]
    lea edx, [edi + 0x10]
    push edx
    fld st(0)
    lea esi, [esp + 0x2c]
    fmul dword ptr [eax + 0x1c]
    fstp dword ptr [esp + 0x30]
    fmul dword ptr [eax + 0x20]
    fstp dword ptr [esp + 0x34]
    fld st(0)
    fmul dword ptr [eax + 0x24]
    fstp dword ptr [esp + 0x20]
    fld st(0)
    fmul dword ptr [eax + 0x28]
    fstp dword ptr [esp + 0x24]
    fmul dword ptr [eax + 0x2c]
    lea eax, [edi - 0x10]
    fstp dword ptr [esp + 0x28]
    call sub_10032a50
    add esp, 0x10
    add edi, 0x80
    dec ebx
    jne L5
    mov eax, dword ptr g_1072d9d0
    test eax, eax
    jne L6
    mov eax, dword ptr g_1072d9e0
    test eax, eax
    je L0
    call sub_1003a8d0
    pop edi
    pop esi
    pop ebx
    add esp, 0x1c
    ret
    }
}
