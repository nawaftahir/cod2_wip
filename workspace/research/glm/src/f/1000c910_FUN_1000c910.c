extern int g_101d0a74;
extern int g_101d0a78;

__declspec(naked) void FUN_1000c910(void)
{
    __asm {
    movzx eax, byte ptr [esi + 0xc]
    test eax, eax
    jl L3
    cmp eax, 1
    jle L3
    cmp eax, 4
    je L3
    mov eax, dword ptr [esi + 0x10]
    mov ecx, dword ptr g_101d0a74
    sub ecx, eax
    mov eax, dword ptr g_101d0a78
    mov dword ptr g_101d0a74, ecx
    mov ecx, dword ptr [esi + 0x14]
    sub eax, ecx
    mov dword ptr g_101d0a78, eax
    mov eax, dword ptr [esi + 4]
    test eax, eax
    je L3
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
    lea ecx, [esi + 0x10]
    mov dword ptr [esi + 4], 0
    xor eax, eax
    mov dword ptr [ecx], eax
    mov dword ptr [ecx + 4], eax
    mov dword ptr [esi], 0
    ret
    }
}
