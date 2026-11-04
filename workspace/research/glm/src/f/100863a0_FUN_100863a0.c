extern void sub_100861f0(void);
extern void sub_10086240(void);
extern void sub_10086292(void);
extern void sub_100f786a(void);

__declspec(naked) void FUN_100863a0(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, ecx
    push edi
    mov edi, dword ptr [ebp + 8]
    xor ebx, ebx
    mov dword ptr [esi + 4], ebx
    mov eax, dword ptr [edi + 4]
    mov dword ptr [esi + 0x1c], eax
    shl eax, 2
    push eax
    call sub_100f786a
    cmp eax, ebx
    pop ecx
    mov dword ptr [esi + 0x10], eax
    je L0
    cmp dword ptr [edi + 4], ebx
    jbe L1
    mov eax, dword ptr [edi + 0x10]
    push dword ptr [eax + ebx*4]
    mov ecx, esi
    call sub_100861f0
    cmp eax, -1
    je L0
    inc ebx
    cmp ebx, dword ptr [edi + 4]
    jb L2
    and dword ptr [esi + 8], 0
    mov eax, dword ptr [edi + 8]
    mov dword ptr [esi + 0x20], eax
    shl eax, 2
    push eax
    call sub_100f786a
    xor ebx, ebx
    cmp eax, ebx
    pop ecx
    mov dword ptr [esi + 0x14], eax
    je L0
    cmp dword ptr [edi + 8], ebx
    jbe L3
    mov eax, dword ptr [edi + 0x14]
    push dword ptr [eax + ebx*4]
    mov ecx, esi
    call sub_10086240
    cmp eax, -1
    je L0
    inc ebx
    cmp ebx, dword ptr [edi + 8]
    jb L4
    and dword ptr [esi + 0xc], 0
    mov eax, dword ptr [edi + 0xc]
    mov dword ptr [esi + 0x24], eax
    shl eax, 2
    push eax
    call sub_100f786a
    xor ebx, ebx
    cmp eax, ebx
    pop ecx
    mov dword ptr [esi + 0x18], eax
    je L0
    cmp dword ptr [edi + 0xc], ebx
    jbe L5
    mov eax, dword ptr [edi + 0x18]
    push dword ptr [eax + ebx*4]
    mov ecx, esi
    call sub_10086292
    cmp eax, -1
    je L0
    inc ebx
    cmp ebx, dword ptr [edi + 0xc]
    jb L6
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 4
    mov eax, 0x8007000e
    jmp L7
    }
}
