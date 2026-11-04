extern void sub_1000c0f0(void);
extern void sub_1000bf60(void);
extern void sub_1000c250(void);
extern void sub_1010a8a8(void);

__declspec(naked) void R_DrawTextInSpace(void)
{
    __asm {
    sub esp, 0x414
    push esi
    mov esi, dword ptr [esp + 0x41c]
    test esi, esi
    mov dword ptr [esp + 8], 0
    je L_tail
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x42c]
    push edi
    jmp L_loop
    _emit 0x8d
    _emit 0x9b
    _emit 0x00
    _emit 0x00
    _emit 0x00
    _emit 0x00
L_loop:
    lea eax, [esp + 0x13]
    push eax
    lea ecx, [esp + 0x430]
    push ecx
    push esi
    xor eax, eax
    lea ebx, [esp + 0x30]
    call sub_1000c0f0
    mov edx, dword ptr [esp + 0x438]
    push ebp
    mov esi, eax
    push edx
    mov eax, ebx
    push eax
    call sub_1000bf60
    mov dword ptr [esp + 0x30], eax
    fild dword ptr [esp + 0x30]
    mov al, byte ptr [esp + 0x2b]
    add esp, 0x18
    test al, al
    fadd dword ptr [esp + 0x14]
    fstp dword ptr [esp + 0x14]
    je L_check
    lea ecx, [esp + 0x18]
    push ecx
    lea edx, [esp + 0x24]
    push edx
    lea eax, [esp + 0x434]
    push eax
    push esi
    xor edi, edi
    xor ebx, ebx
    lea edx, [esp + 0x2c]
    call sub_1000c250
    fld dword ptr [esp + 0x2c]
    fadd dword ptr [esp + 0x24]
    add esp, 0x10
    mov esi, eax
    fstp dword ptr [esp + 0x14]
L_check:
    test esi, esi
    jne L_loop
    pop edi
    pop ebp
    pop ebx
L_tail:
    fld dword ptr [esp + 8]
    call sub_1010a8a8
    pop esi
    _emit 0x81
    }
}
