extern void sub_100f7893(void);
extern void sub_100f78a8(void);
extern void sub_100f78d0(void);
extern void sub_100f78e5(void);
extern void sub_100f78ee(void);

__declspec(naked) void FUN_1007d8da(void)
{
    __asm {
    mov edi, edi
    push ebx
    push esi
    mov esi, ecx
    xor ebx, ebx
    cmp dword ptr [esi + 0x38], ebx
    push edi
    je L9
    mov eax, dword ptr [esi + 0x18]
    cmp word ptr [eax + 0xa], bx
    jbe L9
    mov eax, dword ptr [esi + 0x38]
    mov edi, dword ptr [eax + ebx*4]
    test edi, edi
    je L9
    mov ecx, edi
    call L9
    push edi
    call sub_100f7893
    pop ecx
    mov eax, dword ptr [esi + 0x18]
    movzx eax, word ptr [eax + 0xa]
    inc ebx
    cmp ebx, eax
    jb L9
    push dword ptr [esi + 0x38]
    call sub_100f78a8
    pop ecx
    xor edi, edi
    cmp dword ptr [esi + 0x3c], edi
    je L9
    mov eax, dword ptr [esi + 0x18]
    cmp word ptr [eax + 8], di
    jbe L9
    mov eax, dword ptr [esi + 0x3c]
    mov ebx, dword ptr [eax + edi*4]
    test ebx, ebx
    je L9
    mov ecx, ebx
    call L9
    push ebx
    call sub_100f78d0
    pop ecx
    mov eax, dword ptr [esi + 0x18]
    movzx eax, word ptr [eax + 8]
    inc edi
    cmp edi, eax
    jb L9
    push dword ptr [esi + 0x3c]
    call sub_100f78e5
    pop ecx
    push dword ptr [esi + 0x40]
    call sub_100f78ee
    pop ecx
    pop edi
    pop esi
    pop ebx
    ret
    }
}
