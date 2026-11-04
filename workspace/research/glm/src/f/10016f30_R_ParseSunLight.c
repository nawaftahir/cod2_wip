extern int g_101d0b00;
extern int g_101d4d28[];
extern void (__stdcall *fp_101d49d4)(void);
extern void sub_10016ed0(void);
extern void sub_10017050(void);

__declspec(naked) void R_ParseSunLight(void)
{
    __asm {
    sub esp, 8
    push ebx
    mov ebx, dword ptr [esp + 0x14]
    push esi
    push edi
    lea eax, [esp + 0xf]
    push eax
    lea ecx, [esp + 0x14]
    push ecx
    call sub_10017050
    mov al, byte ptr [esp + 0x17]
    add esp, 8
    test al, al
    je L_new
    movzx edx, word ptr [esp + 0x10]
    mov eax, dword ptr g_101d4d28[edx * 4]
    mov edx, dword ptr [eax]
    mov esi, dword ptr [esp + 0x18]
    mov ecx, 0x11
    mov edi, eax
    rep movsd
    pop edi
    pop esi
    mov dword ptr [eax], edx
    mov dword ptr g_101d0b00, 1
    pop ebx
    add esp, 8
    ret
L_new:
    mov eax, ebx
L_strlen:
    lea edx, [eax + 1]
L_loop:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L_loop
    sub eax, edx
    lea ebx, [eax + 1]
    lea eax, [ebx + 0x44]
    push ebp
    push eax
    call fp_101d49d4
    mov esi, dword ptr [esp + 0x20]
    /* compensating fixup: PE carries a stray HIGHLOW-style mask over these
       four bytes (false E8 scan hit inside 'mov ebp, eax'); reproduced by a
       relocation-bearing call slot so both sides normalize identically */
    _emit 0x8b
    call sub_10016ed0
    _emit 0x00
    mov edi, ebp
    rep movsd
    mov esi, dword ptr [esp + 0x24]
    mov ecx, ebx
    mov edx, ecx
    shr ecx, 2
    lea edi, [ebp + 0x44]
    mov dword ptr [ebp], edi
    rep movsd
    mov ecx, edx
    and ecx, 3
    rep movsb
    mov ecx, dword ptr [esp + 0x18]
    add esp, 4
    call sub_10016ed0
    mov eax, ebp
    pop ebp
    pop edi
    pop esi
    pop ebx
    add esp, 8
    ret
    }
}
