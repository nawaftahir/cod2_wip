extern int g_10181c80;
extern int g_10181c88;
extern int g_10181c90;
extern int g_10181c98;
extern int g_10181ca0;
extern int g_10181ca8;
extern int g_101add90;
extern void sub_10108a06(void);

__declspec(naked) void FUN_1010428a(void)
{
    __asm {
    cmp dword ptr g_101add90, 0
    jne L0
    fst qword ptr [ebp - 0x2d0]
    mov al, byte ptr [ebp - 0x90]
    or al, al
    je L1
    cmp al, 0xff
    je L2
    cmp al, 0xfe
    je L3
    or al, al
    je L0
    movsx eax, al
    mov dword ptr [ebp - 0x8e], eax
    jmp L4
    mov ax, word ptr [ebp - 0xa4]
    and ax, 0x20
    jne L0
    wait
    fnstsw ax
    and ax, 0x20
    je L0
    mov dword ptr [ebp - 0x8e], 8
    jmp L4
    fldcw word ptr [ebp - 0xa4]
    wait
    ret
    mov ax, word ptr [ebp - 0x2ca]
    and ax, 0x7ff0
    or ax, ax
    je L5
    cmp ax, 0x7ff0
    je L6
    jmp L1
    mov ax, word ptr [ebp - 0x2ca]
    and ax, 0x7ff0
    cmp ax, 0x7ff0
    je L6
    jmp L1
    mov dword ptr [ebp - 0x8e], 4
    fld qword ptr g_10181c98
    fxch st(1)
    fscale
    fstp st(1)
    fld st(0)
    fabs
    fcomp qword ptr g_10181c88
    wait
    fnstsw ax
    sahf
    jae L4
    fmul qword ptr g_10181ca8
    jmp L4
    mov dword ptr [ebp - 0x8e], 3
    fld qword ptr g_10181c90
    fxch st(1)
    fscale
    fstp st(1)
    fld st(0)
    fabs
    fcomp qword ptr g_10181c80
    wait
    fnstsw ax
    sahf
    jbe L4
    fmul qword ptr g_10181ca0
    push esi
    push edi
    mov ebx, dword ptr [ebp - 0x94]
    inc ebx
    mov dword ptr [ebp - 0x8a], ebx
    test byte ptr [ebp - 0x2c8], 1
    jne L7
    cld
    lea esi, [ebp + 8]
    lea edi, [ebp - 0x86]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    cmp byte ptr [ebx + 0xc], 1
    je L7
    lea esi, [ebp + 0x10]
    lea edi, [ebp - 0x7e]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    fstp qword ptr [ebp - 0x76]
    lea eax, [ebp - 0x8e]
    lea ebx, [ebp - 0xa4]
    push ebx
    push eax
    mov ebx, dword ptr [ebp - 0x94]
    mov al, byte ptr [ebx + 0xe]
    movsx eax, al
    push eax
    call sub_10108a06
    add esp, 0xc
    pop edi
    pop esi
    fld qword ptr [ebp - 0x76]
    jmp L0
    }
}
