extern int g_1042e778;
extern void sub_1002c0b0(void);

__declspec(naked) void R_DrawText(void)
{
    __asm {
    mov eax, dword ptr [esp + 4]
    cmp byte ptr [eax], 0
    je L_ret
    lea edx, [eax + 1]
L_loop:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L_loop
    mov ecx, dword ptr g_1042e778
    sub eax, edx
    mov edx, dword ptr [ecx + 0x30000]
    push ebx
    push esi
    mov ebx, eax
    mov esi, 0x30000
    push edi
    mov edi, dword ptr [ecx + 0x30004]
    sub esi, edx
    lea eax, [ebx + 0x34]
    and eax, 0xfffffffc
    lea esi, [esi + edi - 0x2000]
    cmp eax, esi
    jle L_alloc
    pop edi
    pop esi
    mov dword ptr [ecx + 0x30008], 0
    pop ebx
    ret
L_alloc:
    push ebp
    lea ebp, [edx + ecx]
    mov dword ptr [ecx + 0x30008], ebp
    add edx, eax
    mov dword ptr [ecx + 0x30000], edx
    mov word ptr [ebp + 2], ax
    mov eax, dword ptr [esp + 0x1c]
    mov word ptr [ebp], 0x16
    mov ecx, dword ptr [eax]
    mov dword ptr [ebp + 4], ecx
    mov edx, dword ptr [eax + 4]
    mov ecx, dword ptr [esp + 0x18]
    mov dword ptr [ebp + 8], edx
    mov eax, dword ptr [eax + 8]
    mov dword ptr [ebp + 0xc], eax
    mov eax, dword ptr [esp + 0x20]
    mov esi, dword ptr [esp + 0x28]
    mov dword ptr [ebp + 0x10], ecx
    mov edx, dword ptr [eax]
    mov dword ptr [ebp + 0x14], edx
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [ebp + 0x18], ecx
    mov edx, dword ptr [eax + 8]
    mov eax, dword ptr [esp + 0x24]
    mov dword ptr [ebp + 0x1c], edx
    mov ecx, dword ptr [eax]
    mov dword ptr [ebp + 0x20], ecx
    mov edx, dword ptr [eax + 4]
    mov dword ptr [ebp + 0x24], edx
    mov eax, dword ptr [eax + 8]
    lea edi, [ebp + 0x2c]
    mov dword ptr [ebp + 0x28], eax
    call sub_1002c0b0
    mov esi, dword ptr [esp + 0x14]
    mov ecx, ebx
    mov edx, ecx
    shr ecx, 2
    lea edi, [ebp + 0x30]
    rep movsd
    mov ecx, edx
    and ecx, 3
    rep movsb
    mov byte ptr [ebx + ebp + 0x30], 0
    pop ebp
    pop edi
    pop esi
    pop ebx
L_ret:
    ret
    }
}
