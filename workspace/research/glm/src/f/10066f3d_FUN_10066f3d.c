extern void sub_10063ab2(void);
extern void sub_10063b98(void);
extern void sub_10066420(void);
extern void sub_100f7879(void);

__declspec(naked) void FUN_10066f3d(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push 0x70
    mov esi, ecx
    call sub_100f7879
    test eax, eax
    pop ecx
    je L5
    mov ecx, eax
    call sub_10063ab2
    jmp L5
    xor eax, eax
    test eax, eax
    mov dword ptr [esi + 0x268], eax
    jne L5
    mov eax, 0x8007000e
    jmp L5
    push edi
    mov edi, dword ptr [ebp + 0x14]
    push 0
    push 0
    push edi
    lea ecx, [esi + 0x18]
    push ecx
    lea ecx, [esi + 0x278]
    push ecx
    push esi
    push dword ptr [ebp + 0xc]
    mov ecx, eax
    push dword ptr [ebp + 8]
    call sub_10063b98
    test eax, eax
    jl L5
    push dword ptr [ebp + 0x10]
    mov ecx, esi
    call sub_10066420
    test eax, eax
    jl L5
    mov eax, dword ptr [esi + 0x268]
    mov dword ptr [esi + 0x26c], eax
    mov dword ptr [esi + 0x270], edi
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 0x10
    }
}
