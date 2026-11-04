extern int g_1072d9b4;
extern int g_1072d9b8;
extern int g_1072d9e0;
extern int g_1072d9e4;
extern int g_1072d9e8;
extern void sub_1002df6f(void);
extern void sub_1002df86(void);
extern void sub_1005eb5f(void);

__declspec(naked) void FUN_100415f0(void)
{
    __asm {
    push ebp
    mov ebp, esp
    and esp, 0xfffffff8
    push ecx
    mov eax, dword ptr g_1072d9e0
    test eax, eax
    push esi
    mov esi, dword ptr [ebp + 8]
    je L3
    mov eax, dword ptr g_1072d9e8
    cmp eax, dword ptr [esi + 0x1c]
    jne L3
    movzx ecx, word ptr [esi + 0x20]
    cmp dword ptr g_1072d9e4, ecx
    je L3
    call sub_1002df6f
    movzx edx, word ptr [esi + 0x22]
    add edx, dword ptr g_1072d9e0
    cmp edx, 0x100000
    jle L3
    call sub_1002df86
    mov edx, dword ptr g_1072d9b4
    mov dword ptr g_1072d9b8, 1
    movzx eax, word ptr [esi + 0x22]
    mov ecx, dword ptr [esi + 0x24]
    shl eax, 1
    push eax
    mov eax, dword ptr g_1072d9e0
    push ecx
    lea ecx, [edx + eax*2]
    push ecx
    call sub_1005eb5f
    movzx edx, word ptr [esi + 0x22]
    mov eax, dword ptr g_1072d9e0
    add esp, 0xc
    add eax, edx
    mov dword ptr g_1072d9e0, eax
    mov eax, dword ptr [esi + 0x1c]
    mov dword ptr g_1072d9e8, eax
    movzx ecx, word ptr [esi + 0x20]
    mov dword ptr g_1072d9e4, ecx
    pop esi
    mov esp, ebp
    pop ebp
    ret
    }
}
