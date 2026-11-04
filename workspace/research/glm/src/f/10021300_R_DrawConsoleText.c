extern int g_1042e778;
extern void sub_1002c0b0(void);

__declspec(naked) void R_DrawConsoleText(void)
{
    __asm {
    mov eax, dword ptr [esp + 4]
    cmp byte ptr [eax], 0
    jne L_str
    mov ecx, dword ptr [esp + 0x28]
    test ecx, ecx
    jl L_ret
L_str:
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
    lea eax, [ebx + 0x30]
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
    mov esi, dword ptr [esp + 0x2c]
    push ebp
    lea ebp, [edx + ecx]
    mov dword ptr [ecx + 0x30008], ebp
    add edx, eax
    mov dword ptr [ecx + 0x30000], edx
    mov ecx, dword ptr [esp + 0x24]
    mov edx, dword ptr [esp + 0x1c]
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
    mov cl, byte ptr [esp + 0x3c]
    mov eax, dword ptr [esp + 0x38]
    mov edx, dword ptr [esp + 0x34]
    mov esi, dword ptr [esp + 0x14]
    mov byte ptr [ebp + 0x24], cl
    mov dword ptr [ebp + 0x20], eax
    mov dword ptr [ebp + 0x1c], edx
    mov edx, dword ptr [esp + 0x18]
    mov ecx, ebx
    mov eax, ecx
    shr ecx, 2
    mov dword ptr [ebp + 0x28], edx
    lea edi, [ebp + 0x2c]
    rep movsd
    mov ecx, eax
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
