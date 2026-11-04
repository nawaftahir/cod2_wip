extern void sub_1008a84c(void);

__declspec(naked) void FUN_1008a84c(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 0x14]
    push esi
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + esi*4]
    mov edx, dword ptr [eax + 4]
    push edi
    mov edi, dword ptr [ecx + 0x10]
    mov edx, dword ptr [edi + edx*4]
    mov edi, dword ptr [ebp + 0xc]
    mov dword ptr [eax + 0x48], edi
    mov edx, dword ptr [edx + 0x20]
    test edx, edx
    je L3
    mov edi, dword ptr [eax + 0xc]
    push ebx
    mov ebx, dword ptr [eax + 0x10]
    lea edi, [ebx + edi*4]
    lea edx, [edx + edi*4]
    mov edi, dword ptr [edx]
    cmp edi, -1
    je L3
    mov dword ptr [eax + 0x4c], edi
    mov edi, dword ptr [edx]
    mov ebx, dword ptr [ecx + 0x14]
    mov edi, dword ptr [ebx + edi*4]
    mov dword ptr [edi + 0x50], esi
    mov dword ptr [edx], esi
    pop ebx
    mov eax, dword ptr [eax + 0x14]
    cmp eax, -1
    pop edi
    pop esi
    je L3
    push dword ptr [ebp + 0xc]
    push eax
    call sub_1008a84c
    pop ebp
    ret 8
    }
}
