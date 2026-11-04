extern int c_101a48c0;
extern int c_101a48e0;
extern int g_101addc8;
extern void sub_100fc4b4(void);
extern void sub_10106b10(void);

__declspec(naked) void __stbuf(void)
{
    __asm {
    push esi
    mov esi, dword ptr [esp + 8]
    push dword ptr [esi + 0x10]
    call sub_10106b10
    test eax, eax
    pop ecx
    je L5
    cmp esi, c_101a48c0
    jne L5
    xor eax, eax
    jmp L5
    cmp esi, c_101a48e0
    jne L5
    xor eax, eax
    inc eax
    inc dword ptr g_101addc8
    test word ptr [esi + 0xc], 0x10c
    jne L5
    push ebx
    push edi
    lea edi, [eax*4 + 0x101addcc]
    cmp dword ptr [edi], 0
    mov ebx, 0x1000
    jne L5
    push ebx
    call sub_100fc4b4
    test eax, eax
    pop ecx
    mov dword ptr [edi], eax
    jne L5
    lea eax, [esi + 0x14]
    push 2
    mov dword ptr [esi + 8], eax
    mov dword ptr [esi], eax
    pop eax
    mov dword ptr [esi + 0x18], eax
    mov dword ptr [esi + 4], eax
    jmp L5
    mov edi, dword ptr [edi]
    mov dword ptr [esi + 8], edi
    mov dword ptr [esi], edi
    mov dword ptr [esi + 0x18], ebx
    mov dword ptr [esi + 4], ebx
    or word ptr [esi + 0xc], 0x1102
    pop edi
    xor eax, eax
    pop ebx
    inc eax
    pop esi
    ret
    xor eax, eax
    pop esi
    ret
    }
}
