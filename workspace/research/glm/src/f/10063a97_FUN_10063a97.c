extern void sub_10067704(void);
extern void sub_100822e9(void);
extern void sub_100823b5(void);

__declspec(naked) void FUN_10063a97(void)
{
    __asm {
    mov edi, edi
    push esi
    mov esi, ecx
    call sub_10067704
    lea ecx, [esi + 0x3c]
    call sub_100823b5
    lea ecx, [esi + 0x4c]
    call sub_100822e9
    xor eax, eax
    mov dword ptr [esi + 0x38], eax
    mov dword ptr [esi + 0x58], eax
    mov dword ptr [esi + 0x64], eax
    mov dword ptr [esi + 0x68], eax
    mov dword ptr [esi + 0x5c], eax
    mov dword ptr [esi + 0x60], eax
    mov dword ptr [esi + 0x6c], eax
    mov eax, esi
    pop esi
    ret
    }
}
