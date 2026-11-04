extern int g_1019bcb0;
extern int g_1019bf3c;
extern void sub_1000bf60(void);
extern void sub_1000c0f0(void);
extern void sub_1000c010(void);
extern void sub_1000c250(void);
extern void sub_10021100(void);

__declspec(naked) void R_ConsoleTextWidth(void)
{
    __asm {
    sub esp, 0x42c
    mov eax, dword ptr [esp + 0x44c]
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [eax + 4]
    push esi
    mov esi, dword ptr [esp + 0x434]
    test esi, esi
    mov dword ptr [esp + 0x20], ecx
    mov ecx, dword ptr [eax + 8]
    mov dword ptr [esp + 0x24], edx
    mov edx, dword ptr [eax + 0xc]
    mov dword ptr [esp + 0x28], ecx
    mov dword ptr [esp + 0x2c], edx
    mov dword ptr [esp + 8], 0
    je L_end
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x444]
    push edi
    _emit 0x8d
    _emit 0x9b
    _emit 0x00
    _emit 0x00
    _emit 0x00
    _emit 0x00
L_loop:
    lea eax, [esp + 0x13]
    push eax
    lea ecx, [esp + 0x448]
    push ecx
    push esi
    lea eax, [esp + 0x38]
    lea ebx, [esp + 0x48]
    call sub_1000c0f0
    mov bl, byte ptr [esp + 0x1f]
    mov esi, eax
    mov al, byte ptr [esp + 0x48]
    add esp, 0xc
    test al, al
    je L_skip2
    mov edx, dword ptr [esp + 0x460]
    fld dword ptr [esp + 0x14]
    mov ecx, dword ptr [esp + 0x458]
    fadd dword ptr [esp + 0x44c]
    push edx
    mov edx, dword ptr [esp + 0x458]
    lea eax, [esp + 0x30]
    push eax
    mov eax, dword ptr [esp + 0x458]
    push ecx
    push edx
    push eax
    push ecx
    fstp dword ptr [esp]
    push ebp
    lea ecx, [esp + 0x58]
    push 0x7fffffff
    push ecx
    call sub_1000c010
    add esp, 0x24
    test bl, bl
    je L_tail
    mov edx, dword ptr [esp + 0x444]
    push ebp
    push edx
    lea eax, [esp + 0x44]
    push eax
    call sub_1000bf60
    mov dword ptr [esp + 0x2c], eax
    fild dword ptr [esp + 0x2c]
    add esp, 0xc
    fmul dword ptr [esp + 0x454]
    fadd dword ptr [esp + 0x14]
    fstp dword ptr [esp + 0x14]
L_skip2:
    test bl, bl
    je L_tail
    lea ecx, [esp + 0x28]
    push ecx
    lea edx, [esp + 0x20]
    push edx
    lea eax, [esp + 0x44c]
    push eax
    push esi
    lea edi, [esp + 0x22]
    lea ebx, [esp + 0x3c]
    lea edx, [esp + 0x28]
    call sub_1000c250
    fild dword ptr [ebp + 4]
    fld dword ptr [esp + 0x28]
    mov ecx, dword ptr [esp + 0x38]
    add esp, 0x10
    fmul st, st(1)
    push ecx
    mov esi, eax
    mov al, byte ptr [esp + 0x16]
    fmul dword ptr [esp + 0x458]
    mov edx, ebx
    push edx
    test al, al
    fstp dword ptr [esp + 0x20]
    mov ecx, dword ptr [esp + 0x20]
    fld dword ptr [esp + 0x24]
    push 0x3f800000
    fmul st, st(1)
    fmul dword ptr [esp + 0x464]
    fstp dword ptr [esp + 0x28]
    mov eax, dword ptr [esp + 0x28]
    fmul dword ptr [esp + 0x464]
    fmul dword ptr g_1019bf3c
    fadd dword ptr [esp + 0x28]
    fmul dword ptr g_1019bcb0
    fsubr dword ptr [esp + 0x45c]
    fstp dword ptr [esp + 0x30]
    fld dword ptr [esp + 0x20]
    mov edx, dword ptr [esp + 0x30]
    fadd dword ptr [esp + 0x458]
    fstp dword ptr [esp + 0x2c]
    je L_else
    push 0
    push 0
    push 0x3f800000
    jmp L_pushrest
L_else:
    push 0x3f800000
    push 0
    push 0
L_pushrest:
    push eax
    mov eax, dword ptr [esp + 0x3c]
    push ecx
    push edx
    push eax
    call sub_10021100
    fld dword ptr [esp + 0x40]
    fadd dword ptr [esp + 0x3c]
    add esp, 0x28
    fstp dword ptr [esp + 0x14]
L_tail:
    test esi, esi
    jne L_loop
    pop edi
    pop ebp
    pop ebx
L_end:
    pop esi
    add esp, 0x42c
    ret
    }
}
