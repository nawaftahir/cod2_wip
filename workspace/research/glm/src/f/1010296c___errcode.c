
__declspec(naked) void __errcode(void)
{
    __asm {
    mov al, byte ptr [esp + 4]
    test al, 0x20
    je L5
    push 5
    jmp L5
    test al, 8
    je L5
    xor eax, eax
    inc eax
    ret
    test al, 4
    je L5
    push 2
    jmp L5
    test al, 1
    je L5
    push 3
    pop eax
    ret
    movzx eax, al
    and eax, 2
    shl eax, 1
    ret
    }
}
