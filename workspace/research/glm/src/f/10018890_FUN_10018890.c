extern void (__stdcall *fp_101d49d4)(void);
extern void sub_1005eb17(void);

__declspec(naked) void FUN_10018890(void)
{
    __asm {
    push ebx
    push esi
    push edi
    mov edi, eax
    mov esi, edi
    shl esi, 5
    lea eax, [esi + 4]
    push eax
    call fp_101d49d4
    mov ecx, dword ptr [esp + 0x14]
    mov ebx, eax
    push esi
    push ecx
    lea edx, [ebx + 4]
    push edx
    mov dword ptr [ebx], edi
    call sub_1005eb17
    add esp, 0x10
    test edi, edi
    jle L2
    lea eax, [ebx + 0x20]
    mov ecx, dword ptr [eax - 4]
    mov edx, dword ptr [eax]
    not ecx
    not edx
    mov dword ptr [eax - 4], ecx
    mov dword ptr [eax], edx
    add eax, 0x20
    dec edi
    jne L2
    pop edi
    pop esi
    mov eax, ebx
    pop ebx
    ret
    }
}
