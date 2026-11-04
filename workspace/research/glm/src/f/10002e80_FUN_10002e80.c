extern void sub_100f5df4(void);
extern void sub_100f78e9(void);

__declspec(naked) void FUN_10002e80(void)
{
    __asm {
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    mov esi, 1
    cmp ebx, esi
    jle L4
    nop
    mov eax, dword ptr [edi + esi*8]
    push ebp
    push eax
    call sub_100f78e9
    add esp, 8
    test eax, eax
    je L4
    inc esi
    cmp esi, ebx
    jl L4
    fld dword ptr [esp + 0x10]
    pop esi
    pop ebp
    ret
    mov esi, dword ptr [edi + esi*8 + 4]
    test esi, esi
    jne L4
    fld dword ptr [esp + 0x10]
    pop esi
    pop ebp
    ret
    push esi
    call sub_100f5df4
    add esp, 4
    pop esi
    pop ebp
    ret
    }
}
