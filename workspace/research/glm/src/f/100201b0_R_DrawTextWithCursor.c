extern void (__stdcall *fp_101d4b98)(void);
extern void (__stdcall *fp_101d4ba0)(void);
extern void (__stdcall *fp_101d4bb4)(void);
extern void (__stdcall *fp_101d4b68)(void);

__declspec(naked) void R_DrawTextWithCursor(void)
{
    __asm {
    sub esp, 0x11c
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x128]
    push edi
    push ebp
    call fp_101d4b98
    add esp, 4
    test eax, eax
    jle L_no_fill
    mov ecx, eax
    mov al, byte ptr [esp + 0x130]
    mov bl, al
    mov bh, bl
    mov edx, ecx
    shr ecx, 2
    lea edi, [esp + 0x10]
    mov eax, ebx
    shl eax, 0x10
    mov ax, bx
    rep stosd
    mov ecx, edx
    and ecx, 3
    rep stosb
L_no_fill:
    lea eax, [esp + 0x10]
    push eax
    lea ecx, [esp + 0x1c]
    push ecx
    lea edx, [esp + 0x30]
    push edx
    push ebp
    call fp_101d4ba0
    add esp, 0x10
    test eax, eax
    jle L_end
    push esi
    mov esi, dword ptr [esp + 0x138]
    lea ebx, [esp + 0x2e]
    sub ebx, esi
    mov dword ptr [esp + 0x10], eax
L_loop:
    movsx edi, word ptr [ebx + esi - 2]
    push edi
    push ebp
    call fp_101d4bb4
    push eax
    call fp_101d4b68
    add esp, 0xc
    test eax, eax
    jne L_store
    mov dword ptr [esi], eax
    jmp L_next
L_store:
    movsx ecx, byte ptr [esp + edi + 0x14]
    movsx edx, word ptr [ebx + esi]
    mov eax, dword ptr [eax + ecx * 4]
    mov ecx, dword ptr [eax + edx * 4]
    mov dword ptr [esi], ecx
L_next:
    mov eax, dword ptr [esp + 0x10]
    add esi, 4
    dec eax
    mov dword ptr [esp + 0x10], eax
    jne L_loop
    pop esi
L_end:
    pop edi
    pop ebp
    pop ebx
    add esp, 0x11c
    ret
    }
}
