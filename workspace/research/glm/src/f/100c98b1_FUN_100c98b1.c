extern void sub_100c7b3a(void);
extern void sub_100f7865(void);
extern void sub_100f786a(void);

__declspec(naked) void FUN_100c98b1(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    mov ebx, ecx
    test byte ptr [ebx + 0xcc], 1
    push edi
    je L0
    cmp dword ptr [ebx + 0x124], 0
    je L0
    mov eax, dword ptr [ebx + 0x12c]
    cmp dword ptr [ebx + 0x128], eax
    jb L1
    lea eax, [eax + eax*2]
    shl eax, 4
    push eax
    call sub_100f786a
    mov edi, eax
    test edi, edi
    pop ecx
    mov dword ptr [ebp - 4], edi
    jne L2
    mov eax, 0x8007000e
    jmp L3
    mov eax, dword ptr [ebx + 0x128]
    lea ecx, [eax + eax*2]
    shl ecx, 3
    mov eax, ecx
    push esi
    mov esi, dword ptr [ebx + 0x124]
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    push dword ptr [ebx + 0x124]
    call sub_100f7865
    mov eax, dword ptr [ebp - 4]
    shl dword ptr [ebx + 0x12c], 1
    pop ecx
    mov dword ptr [ebx + 0x124], eax
    pop esi
    mov eax, dword ptr [ebx + 0x128]
    mov ecx, dword ptr [ebx + 0x124]
    mov edx, dword ptr [ebx + 0x104]
    lea eax, [eax + eax*2]
    mov dword ptr [ecx + eax*8], edx
    mov ecx, dword ptr [ebx + 0x110]
    mov eax, dword ptr [ebx + 0x128]
    mov edx, dword ptr [ebx + 0x124]
    shl ecx, 2
    lea eax, [eax + eax*2]
    mov dword ptr [edx + eax*8 + 4], ecx
    xor ecx, ecx
    mov eax, dword ptr [ebx + 0x128]
    mov edx, dword ptr [ebx + 0x124]
    lea eax, [eax + eax*2]
    lea eax, [ecx + eax*2]
    or dword ptr [edx + eax*4 + 8], 0xffffffff
    inc ecx
    cmp ecx, 4
    jb L4
    inc dword ptr [ebx + 0x128]
    mov eax, dword ptr [ebx + 0x110]
    push dword ptr [ebp + 8]
    mov ecx, ebx
    mov dword ptr [ebx + 0x118], eax
    call sub_100c7b3a
    xor eax, eax
    pop edi
    pop ebx
    leave
    ret 4
    }
}
