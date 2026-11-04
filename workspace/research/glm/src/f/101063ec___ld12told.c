extern void sub_10106180(void);

__declspec(naked) void __ld12told(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0x10
    mov eax, dword ptr [ebp + 8]
    and dword ptr [ebp - 4], 0
    xor ecx, ecx
    mov cx, word ptr [eax + 0xa]
    push esi
    push edi
    push 0x40
    mov esi, ecx
    and ecx, 0x8000
    mov edi, ecx
    mov ecx, dword ptr [eax + 6]
    mov dword ptr [ebp - 0x10], ecx
    mov ecx, dword ptr [eax + 2]
    movzx eax, word ptr [eax]
    shl eax, 0x10
    mov dword ptr [ebp - 8], eax
    lea eax, [ebp - 0x10]
    push eax
    and esi, 0x7fff
    mov dword ptr [ebp - 0xc], ecx
    call sub_10106180
    test eax, eax
    pop ecx
    pop ecx
    je L3
    mov ecx, 0x80000000
    inc esi
    jmp L3
    mov ecx, dword ptr [ebp - 0x10]
    cmp si, 0x7fff
    jne L3
    mov dword ptr [ebp - 4], 1
    mov eax, dword ptr [ebp + 0xc]
    or edi, esi
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [ebp - 0xc]
    mov word ptr [eax + 8], di
    pop edi
    mov dword ptr [eax], ecx
    mov eax, dword ptr [ebp - 4]
    pop esi
    leave
    ret
    }
}
