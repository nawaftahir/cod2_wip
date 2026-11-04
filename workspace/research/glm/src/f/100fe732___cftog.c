extern int g_101a50d0;
extern void sub_100fe5a4(void);
extern void sub_100fe6ab(void);
extern void sub_10100de5(void);
extern void sub_101083c4(void);
extern void sub_101084d5(void);

__declspec(naked) void __cftog(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0x2c
    mov eax, dword ptr g_101a50d0
    push ebx
    push esi
    mov dword ptr [ebp - 4], eax
    push edi
    lea eax, [ebp - 0x1c]
    push eax
    lea eax, [ebp - 0x2c]
    push eax
    mov eax, dword ptr [ebp + 8]
    push dword ptr [eax + 4]
    push dword ptr [eax]
    call sub_101084d5
    mov esi, dword ptr [ebp - 0x28]
    mov ebx, dword ptr [ebp + 0x10]
    xor eax, eax
    dec esi
    cmp dword ptr [ebp - 0x2c], 0x2d
    sete al
    add eax, dword ptr [ebp + 0xc]
    mov edi, eax
    lea eax, [ebp - 0x2c]
    push eax
    push ebx
    push edi
    call sub_101083c4
    mov eax, dword ptr [ebp - 0x28]
    add esp, 0x1c
    dec eax
    cmp esi, eax
    setl cl
    cmp eax, -4
    jl L4
    cmp eax, ebx
    jge L4
    test cl, cl
    je L4
    mov al, byte ptr [edi]
    inc edi
    test al, al
    jne L4
    mov byte ptr [edi - 2], al
    push 1
    push ebx
    push dword ptr [ebp + 0xc]
    lea eax, [ebp - 0x2c]
    call sub_100fe6ab
    jmp L4
    push 1
    push dword ptr [ebp + 0x14]
    lea eax, [ebp - 0x2c]
    push ebx
    mov ebx, dword ptr [ebp + 0xc]
    call sub_100fe5a4
    mov ecx, dword ptr [ebp - 4]
    add esp, 0xc
    pop edi
    pop esi
    pop ebx
    call sub_10100de5
    leave
    ret
    }
}
