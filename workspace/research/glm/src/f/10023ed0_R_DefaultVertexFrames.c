extern int g_101d4d00;
extern int g_101d1b2c;
extern int g_101da9c8;
extern int g_10678ac0;
extern void (__stdcall *fp_101d4af8)(void);
extern void sub_10024380(void);

__declspec(naked) void R_DefaultVertexFrames(void)
{
    __asm {
    mov al, byte ptr g_101d4d00
    test al, al
    je L_ret
    push esi
    mov esi, dword ptr [esp + 8]
    test esi, esi
    jne L_have_ent
    mov esi, dword ptr g_101d1b2c
    mov dword ptr [esp + 8], esi
L_have_ent:
    mov ax, word ptr [esp + 0x10]
    push ebx
    mov ebx, dword ptr g_101da9c8
    mov ecx, dword ptr [ebx + 0x18fc74]
    push ebp
    movzx ebp, ax
    add ecx, ebp
    cmp ecx, 0x2000
    jg L_end
    mov ecx, dword ptr [ebx + 0x187c70]
    cmp ecx, 0x800
    jge L_end
    shl ecx, 4
    lea edx, [ecx + ebx + 0x187c74]
    mov cx, word ptr [esp + 0x14]
    mov word ptr [edx + 8], cx
    mov dword ptr [edx + 4], esi
    mov esi, dword ptr [esp + 0x1c]
    mov word ptr [edx + 0xa], ax
    mov dword ptr [edx], 1
    mov eax, dword ptr [ebx + 0x18fc74]
    imul eax, eax, 0x44
    mov ecx, ebp
    imul ecx, ecx, 0x44
    push edi
    lea edi, [eax + ebx + 0x18fc78]
    mov eax, ecx
    shr ecx, 2
    mov dword ptr [edx + 0xc], edi
    rep movsd
    mov ecx, eax
    and ecx, 3
    rep movsb
    mov ecx, dword ptr g_10678ac0
    and ecx, 0x800007ff
    movzx esi, word ptr [esp + 0x18]
    jns L_no_sign
    dec ecx
    or ecx, 0xfffff800
    inc ecx
L_no_sign:
    mov eax, dword ptr [esp + 0x14]
    add ecx, 0x800
    push edx
    call sub_10024380
    mov edx, dword ptr [ebx + 0x187c70]
    mov ecx, dword ptr [ebx + 0x18fc74]
    add esp, 4
    inc edx
    add ecx, ebp
    mov dword ptr [ebx + 0x187c70], edx
    mov dword ptr [ebx + 0x18fc74], ecx
    inc dword ptr g_10678ac0
    pop edi
L_end:
    pop ebp
    pop ebx
    pop esi
L_ret:
    ret
    }
}
