extern int g_1042e778;
extern void sub_1002c0b0(void);

__declspec(naked) void R_TextHeight(void)
{
    __asm {
    mov eax, dword ptr [esp + 4]
    cmp byte ptr [eax], 0
    je L_ret
    lea edx, [eax + 1]
L_strloop:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L_strloop
    mov ecx, dword ptr g_1042e778
    sub eax, edx
    push ebx
    push esi
    mov esi, dword ptr [ecx + 0x30000]
    mov ebx, eax
    mov edx, 0x30000
    push edi
    mov edi, dword ptr [ecx + 0x30004]
    sub edx, esi
    lea eax, [ebx + 0x30]
    and eax, 0xfffffffc
    lea edx, [edx + edi - 0x2000]
    cmp eax, edx
    jle L_alloc
    pop edi
    pop esi
    mov dword ptr [ecx + 0x30008], 0
    pop ebx
    ret
L_alloc:
    mov edx, dword ptr [esp + 0x18]
    push ebp
    lea ebp, [esi + ecx]
    mov dword ptr [ecx + 0x30008], ebp
    add esi, eax
    mov dword ptr [ecx + 0x30000], esi
    mov ecx, dword ptr [esp + 0x24]
    mov esi, dword ptr [esp + 0x30]
    mov word ptr [ebp + 2], ax
    mov eax, dword ptr [esp + 0x20]
    mov word ptr [ebp], 0x15
    mov dword ptr [ebp + 4], eax
    mov eax, dword ptr [esp + 0x28]
    mov dword ptr [ebp + 8], ecx
    mov ecx, dword ptr [esp + 0x2c]
    lea edi, [ebp + 0x18]
    mov dword ptr [ebp + 0xc], edx
    mov dword ptr [ebp + 0x10], eax
    mov dword ptr [ebp + 0x14], ecx
    call sub_1002c0b0
    mov edx, dword ptr [esp + 0x34]
    mov eax, dword ptr [esp + 0x18]
    mov esi, dword ptr [esp + 0x14]
    mov dword ptr [ebp + 0x1c], edx
    mov ecx, ebx
    mov edx, ecx
    shr ecx, 2
    mov dword ptr [ebp + 0x20], 0xffffffff
    mov byte ptr [ebp + 0x24], 0
    mov dword ptr [ebp + 0x28], eax
    lea edi, [ebp + 0x2c]
    rep movsd
    mov ecx, edx
    and ecx, 3
    rep movsb
    mov byte ptr [ebx + ebp + 0x2c], 0
    pop ebp
    pop edi
    pop esi
    pop ebx
L_ret:
    ret
    }
}
