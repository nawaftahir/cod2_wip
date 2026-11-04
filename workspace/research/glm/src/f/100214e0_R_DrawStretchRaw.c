extern int g_1042e778;
extern int g_1019bcac;
extern void sub_1010a8a8(void);

__declspec(naked) void R_DrawStretchRaw(void)
{
    __asm {
    mov eax, dword ptr g_1042e778
    mov ecx, dword ptr [eax + 0x30000]
    mov edx, 0x30000
    push esi
    mov esi, dword ptr [eax + 0x30004]
    sub edx, ecx
    lea edx, [edx + esi - 0x2000]
    cmp edx, 0x2c
    jge L_ok
    mov dword ptr [eax + 0x30008], 0
    pop esi
    ret
L_ok:
    lea esi, [ecx + eax]
    mov dword ptr [eax + 0x30008], esi
    add ecx, 0x2c
    mov dword ptr [eax + 0x30000], ecx
    mov eax, dword ptr [esp + 0x10]
    mov word ptr [esi], 0x12
    mov word ptr [esi + 2], 0x2c
    mov dword ptr [esi + 4], eax
    mov eax, dword ptr [esp + 8]
    mov ecx, dword ptr [eax]
    mov dword ptr [esi + 8], ecx
    mov edx, dword ptr [eax + 4]
    mov dword ptr [esi + 0xc], edx
    mov ecx, dword ptr [eax + 8]
    mov dword ptr [esi + 0x10], ecx
    mov edx, dword ptr [eax + 0xc]
    mov dword ptr [esi + 0x14], edx
    mov ecx, dword ptr [eax + 0x10]
    mov dword ptr [esi + 0x18], ecx
    mov edx, dword ptr [eax + 0x14]
    mov dword ptr [esi + 0x1c], edx
    mov ecx, dword ptr [eax + 0x18]
    push edi
    mov edi, dword ptr [esp + 0x10]
    test edi, edi
    mov dword ptr [esi + 0x20], ecx
    mov edx, dword ptr [eax + 0x1c]
    mov dword ptr [esi + 0x24], edx
    jne L_color
    pop edi
    mov dword ptr [esi + 0x28], 0xffffffff
    pop esi
    ret
L_color:
    fld dword ptr [edi + 8]
    fmul dword ptr g_1019bcac
    call sub_1010a8a8
    mov byte ptr [esi + 0x28], al
    fld dword ptr [edi + 4]
    fmul dword ptr g_1019bcac
    call sub_1010a8a8
    mov byte ptr [esi + 0x29], al
    fld dword ptr [edi]
    fmul dword ptr g_1019bcac
    call sub_1010a8a8
    mov byte ptr [esi + 0x2a], al
    fld dword ptr [edi + 0xc]
    fmul dword ptr g_1019bcac
    call sub_1010a8a8
    pop edi
    mov byte ptr [esi + 0x2b], al
    pop esi
    ret
    }
}
