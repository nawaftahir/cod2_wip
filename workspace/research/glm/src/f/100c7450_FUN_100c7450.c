extern int g_1019beb8;
extern void sub_100c387d(void);
extern void sub_100c7358(void);

__declspec(naked) void FUN_100c7450(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 0x100]
    mov eax, dword ptr [eax]
    xor edx, edx
    inc edx
    and eax, 0xfff00000
    cmp eax, 0x20500000
    push edi
    mov dword ptr [ebp - 4], edx
    mov ecx, 0xfffff
    jne L4
    mov eax, dword ptr [esi + 0x100]
    mov edi, dword ptr [eax]
    mov eax, dword ptr [eax + 8]
    and edi, ecx
    mov eax, dword ptr [eax + edi*4]
    mov edi, dword ptr [esi + 0x14]
    mov eax, dword ptr [edi + eax*4]
    mov edi, dword ptr [eax + 4]
    push ebx
    mov ebx, dword ptr [esi + 0x10]
    mov edi, dword ptr [ebx + edi*4]
    test byte ptr [edi + 5], dl
    pop ebx
    je L4
    fld qword ptr g_1019beb8
    fld qword ptr [eax + 0x20]
    fucompp
    fnstsw ax
    test ah, 0x44
    jnp L4
    mov eax, edx
    jmp L4
    mov eax, dword ptr [esi + 0x100]
    push edx
    push 2
    push 0
    push eax
    mov eax, dword ptr [eax]
    and eax, ecx
    or eax, 0x20400000
    push eax
    mov ecx, esi
    call sub_100c387d
    mov edi, eax
    test edi, edi
    je L4
    push edi
    mov ecx, esi
    call sub_100c7358
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jne L4
    and dword ptr [edi], eax
    mov eax, dword ptr [ebp - 4]
    pop edi
    pop esi
    leave
    ret
    }
}
