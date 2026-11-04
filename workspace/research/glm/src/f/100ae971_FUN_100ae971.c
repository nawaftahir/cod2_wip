extern void sub_100ae879(void);

__declspec(naked) void FUN_100ae971(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov eax, dword ptr [ebp + 0x1c]
    push ebx
    mov ebx, dword ptr [ebp + 0x10]
    push esi
    mov esi, dword ptr [ebx]
    and esi, 0xfffff
    push edi
    push 0
    pop edi
    mov dword ptr [eax], edi
    mov eax, dword ptr [ebp + 0x18]
    mov dword ptr [eax], edi
    mov eax, dword ptr [ebp + 0x14]
    mov dword ptr [ebp - 4], ecx
    mov dword ptr [eax], edi
    jne L0
    mov eax, 0x80004005
    jmp L1
    mov eax, dword ptr [ebx + 4]
    xor edx, edx
    div esi
    cmp dword ptr [ebp + 0x24], edi
    mov dword ptr [ebp - 8], eax
    jne L2
    cmp eax, edi
    mov dword ptr [ebp + 0x24], edi
    jbe L2
    mov dword ptr [ebp + 0x10], edi
    xor edx, edx
    cmp esi, edi
    jbe L3
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax + 0x14]
    mov eax, dword ptr [ebx + 8]
    add eax, dword ptr [ebp + 0x10]
    mov edi, dword ptr [eax]
    mov edi, dword ptr [ecx + edi*4]
    cmp dword ptr [edi + 0x10], edx
    jne L4
    inc edx
    add eax, 4
    cmp edx, esi
    jb L5
    xor edi, edi
    inc dword ptr [ebp + 0x24]
    mov eax, esi
    shl eax, 2
    add dword ptr [ebp + 0x10], eax
    mov eax, dword ptr [ebp - 8]
    cmp dword ptr [ebp + 0x24], eax
    jb L6
    cmp eax, edi
    mov dword ptr [ebp + 0x24], edi
    mov dword ptr [ebp + 0x10], edi
    jbe L7
    push dword ptr [ebp + 0x20]
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [ebp - 4]
    push esi
    lea eax, [eax + edi*4]
    push eax
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_100ae879
    test eax, eax
    je L8
    mov ecx, dword ptr [eax]
    and ecx, 0xfff00000
    cmp dword ptr [ebp + 0x20], 0
    je L9
    cmp ecx, 0x60000000
    je L10
    cmp ecx, 0x60500000
    je L10
    cmp ecx, 0x60a00000
    je L10
    cmp ecx, 0x60f00000
    je L10
    jmp L8
    cmp ecx, 0x72100000
    jne L8
    xor ecx, ecx
    cmp dword ptr [ebp + 0x24], ecx
    jne L11
    cmp dword ptr [ebp + 0x20], ecx
    mov edx, dword ptr [ebp + 0x1c]
    mov dword ptr [edx], eax
    mov edx, dword ptr [ebp + 0x18]
    mov dword ptr [ebp + 0x24], 1
    mov dword ptr [edx], edi
    jne L12
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax]
    jmp L13
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [eax + 8]
    and ecx, 0xfffff
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebp - 4]
    mov ecx, dword ptr [ecx + 0x14]
    mov eax, dword ptr [ecx + eax*4]
    movzx eax, byte ptr [eax + 0x6d]
    mov ecx, dword ptr [ebp + 0x14]
    mov dword ptr [ecx], eax
    inc dword ptr [ebp + 0x10]
    mov eax, dword ptr [ebp + 0x10]
    add edi, esi
    cmp eax, dword ptr [ebp - 8]
    jb L14
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret 0x20
    mov eax, dword ptr [ebp + 0x18]
    mov dword ptr [eax], ecx
    mov eax, dword ptr [ebp + 0x14]
    mov dword ptr [eax], ecx
    mov eax, dword ptr [ebp + 0x1c]
    mov dword ptr [eax], ecx
    xor eax, eax
    inc eax
    jmp L1
    }
}
