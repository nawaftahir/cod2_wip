extern void (__stdcall *fp_101d49dc)(void);
extern void (__stdcall *fp_101d49e0)(void);
extern void (__stdcall *fp_101d4b14)(void);
extern void sub_10025ee6(void);

__declspec(naked) void FUN_100261b0(void)
{
    __asm {
    mov eax, dword ptr [esp + 0xc]
    imul eax, ebx
    push esi
    add eax, 6
    push edi
    lea edi, [eax + eax*2]
    push edi
    call fp_101d49dc
    mov esi, eax
    xor eax, eax
    mov ecx, esi
    mov dword ptr [ecx], eax
    mov dword ptr [ecx + 4], eax
    mov dword ptr [ecx + 8], eax
    mov dword ptr [ecx + 0xc], eax
    mov word ptr [ecx + 0x10], ax
    mov eax, dword ptr [esp + 0x18]
    mov edx, eax
    sar edx, 8
    mov byte ptr [esi + 0xd], dl
    lea edx, [esi + 0x12]
    push edx
    push 3
    mov ecx, ebx
    sar ecx, 8
    push ebx
    mov byte ptr [esi + 0xc], al
    mov byte ptr [esi + 0xf], cl
    mov ecx, dword ptr [esp + 0x20]
    push eax
    mov eax, dword ptr [esp + 0x20]
    mov byte ptr [esi + 2], 2
    mov byte ptr [esi + 0xe], bl
    mov byte ptr [esi + 0x10], 0x18
    mov byte ptr [esi + 0x11], 0x20
    call sub_10025ee6
    add esp, 0x14
    test al, al
    je L1
    mov eax, dword ptr [esp + 0x18]
    push edi
    push esi
    push eax
    call fp_101d4b14
    add esp, 0xc
    push esi
    call fp_101d49e0
    add esp, 4
    pop edi
    pop esi
    ret
    }
}
