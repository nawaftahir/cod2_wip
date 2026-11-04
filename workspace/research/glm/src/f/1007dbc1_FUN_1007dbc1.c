extern void sub_1007dab9(void);

__declspec(naked) void FUN_1007dbc1(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    xor edi, edi
    cmp dword ptr [esi + 0x18], edi
    jbe L3
    mov eax, dword ptr [esi + 0x14]
    mov ecx, dword ptr [eax + edi*4]
    push 0
    push dword ptr [ebp + 0xc]
    call sub_1007dab9
    test eax, eax
    jl L3
    inc edi
    cmp edi, dword ptr [esi + 0x18]
    jb L3
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 8
    }
}
