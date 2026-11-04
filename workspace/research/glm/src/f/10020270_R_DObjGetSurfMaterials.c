extern void (__stdcall *fp_101d4b98)(void);
extern void (__stdcall *fp_101d4ba0)(void);
extern void (__stdcall *fp_101d4bb4)(void);
extern void (__stdcall *fp_101d4b68)(void);

__declspec(naked) void R_DObjGetSurfMaterials(void)
{
    __asm {
    sub esp, 0x118
    push ebp
    mov ebp, dword ptr [esp + 0x120]
    push esi
    push edi
    push ebp
    call fp_101d4b98
    add esp, 4
    test eax, eax
    jle L_no_fill
    mov ecx, eax
    mov al, byte ptr [esp + 0x12c]
    push ebx
    mov bl, al
    mov bh, bl
    mov edx, ecx
    shr ecx, 2
    lea edi, [esp + 0x10]
    mov eax, ebx
    shl eax, 0x10
    mov ax, bx
    pop ebx
    rep stosd
    mov ecx, edx
    and ecx, 3
    rep stosb
L_no_fill:
    lea eax, [esp + 0xc]
    push eax
    lea ecx, [esp + 0x18]
    push ecx
    lea edx, [esp + 0x2c]
    push edx
    push ebp
    call fp_101d4ba0
    mov edi, dword ptr [esp + 0x140]
    movsx esi, word ptr [esp + edi * 4 + 0x34]
    push esi
    push ebp
    call fp_101d4bb4
    push eax
    call fp_101d4b68
    add esp, 0x1c
    test eax, eax
    je L_end
    movsx ecx, byte ptr [esp + esi + 0xc]
    movsx edx, word ptr [esp + edi * 4 + 0x26]
    mov eax, dword ptr [eax + ecx * 4]
    mov ecx, dword ptr [esp + 0x134]
    mov dword ptr [eax + edx * 4], ecx
L_end:
    pop edi
    pop esi
    pop ebp
    add esp, 0x118
    ret
    }
}
