extern void sub_100f93e6(void);

__declspec(naked) void _StringVPrintfWorkerW@16(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xc]
    push ebx
    xor ebx, ebx
    test eax, eax
    jne L5
    mov ebx, 0x80070057
    jmp L5
    push esi
    push edi
    push dword ptr [ebp + 0x14]
    mov edi, dword ptr [ebp + 8]
    push dword ptr [ebp + 0x10]
    lea esi, [eax - 1]
    push esi
    push edi
    call sub_100f93e6
    add esp, 0x10
    test eax, eax
    jl L5
    cmp eax, esi
    ja L5
    jne L5
    jmp L5
    mov ebx, 0x8007007a
    and word ptr [edi + esi*2], 0
    pop edi
    pop esi
    mov eax, ebx
    pop ebx
    pop ebp
    ret 0x10
    }
}
