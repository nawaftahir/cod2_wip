extern void (__stdcall *fp_101d4aec)(void);
extern void sub_1000bc70(void);

__declspec(naked) void R_NormalizedTextScale(void)
{
    __asm {
    push ecx
    mov eax, dword ptr [esp + 0xc]
    push ebp
    push esi
    xor ebp, ebp
    xor esi, esi
    cmp eax, ebp
    jg L_no_max
    mov dword ptr [esp + 0x14], 0x7fffffff
L_no_max:
    mov eax, dword ptr [esp + 0x10]
    cmp byte ptr [eax], 0
    mov dword ptr [esp + 8], ebp
    je L_end
    push ebx
    push edi
L_loop:
    mov ecx, dword ptr [esp + 0x10]
    cmp ecx, dword ptr [esp + 0x1c]
    jge L_done
    lea edx, [esp + 0x18]
    push 0
    push edx
    call fp_101d4aec
    mov ebx, dword ptr [esp + 0x20]
    add esp, 8
    cmp eax, 0xa
    jne L_not_nl
    xor esi, esi
    jmp L_check
L_not_nl:
    cmp eax, 0x5e
    jne L_normal
    test ebx, ebx
    je L_normal
    mov cl, byte ptr [ebx]
    cmp cl, al
    je L_normal
    cmp cl, 0x30
    jl L_normal
    cmp cl, 0x39
    jg L_normal
    inc ebx
    mov dword ptr [esp + 0x18], ebx
    jmp L_check
L_normal:
    mov ecx, dword ptr [esp + 0x20]
    push ecx
    mov edi, eax
    call sub_1000bc70
    movzx edx, byte ptr [eax + 4]
    add esi, edx
    add esp, 4
    cmp ebp, esi
    jge L_skip
    mov ebp, esi
L_skip:
    inc dword ptr [esp + 0x10]
L_check:
    cmp byte ptr [ebx], 0
    jne L_loop
L_done:
    pop edi
    pop ebx
L_end:
    pop esi
    mov eax, ebp
    pop ebp
    pop ecx
    ret
    }
}
