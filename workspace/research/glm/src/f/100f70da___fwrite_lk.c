extern void sub_100f6add(void);
extern void sub_100fa320(void);
extern void sub_100fbdab(void);
extern void sub_100fcdf0(void);

__declspec(naked) void __fwrite_lk(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov eax, dword ptr [ebp + 8]
    push ebx
    push edi
    mov edi, dword ptr [ebp + 0xc]
    imul edi, dword ptr [ebp + 0x10]
    test edi, edi
    mov dword ptr [ebp + 8], eax
    mov dword ptr [ebp - 8], edi
    mov ebx, edi
    jne L0
    xor eax, eax
    jmp L1
    push esi
    mov esi, dword ptr [ebp + 0x14]
    test word ptr [esi + 0xc], 0x10c
    je L2
    mov eax, dword ptr [esi + 0x18]
    mov dword ptr [ebp - 4], eax
    jmp L3
    mov dword ptr [ebp - 4], 0x1000
    mov ecx, dword ptr [esi + 0xc]
    and ecx, 0x108
    je L4
    mov eax, dword ptr [esi + 4]
    test eax, eax
    je L4
    cmp ebx, eax
    mov edi, ebx
    jb L5
    mov edi, eax
    push edi
    push dword ptr [ebp + 8]
    push dword ptr [esi]
    call sub_100fcdf0
    sub dword ptr [esi + 4], edi
    add dword ptr [esi], edi
    add esp, 0xc
    sub ebx, edi
    add dword ptr [ebp + 8], edi
    jmp L6
    cmp ebx, dword ptr [ebp - 4]
    jb L7
    test ecx, ecx
    je L8
    push esi
    call sub_100f6add
    test eax, eax
    pop ecx
    jne L9
    cmp dword ptr [ebp - 4], 0
    mov edi, ebx
    je L10
    xor edx, edx
    mov eax, ebx
    div dword ptr [ebp - 4]
    sub edi, edx
    push edi
    push dword ptr [ebp + 8]
    push dword ptr [esi + 0x10]
    call sub_100fbdab
    add esp, 0xc
    cmp eax, -1
    je L11
    add dword ptr [ebp + 8], eax
    sub ebx, eax
    cmp eax, edi
    jb L11
    mov edi, dword ptr [ebp - 8]
    jmp L12
    mov eax, dword ptr [ebp + 8]
    movsx eax, byte ptr [eax]
    push esi
    push eax
    call sub_100fa320
    cmp eax, -1
    pop ecx
    pop ecx
    je L9
    inc dword ptr [ebp + 8]
    mov eax, dword ptr [esi + 0x18]
    dec ebx
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jg L12
    mov dword ptr [ebp - 4], 1
    test ebx, ebx
    jne L3
    mov eax, dword ptr [ebp + 0x10]
    pop esi
    pop edi
    pop ebx
    leave
    ret
    mov eax, edi
    sub eax, ebx
    xor edx, edx
    div dword ptr [ebp + 0xc]
    jmp L13
    or dword ptr [esi + 0xc], 0x20
    mov eax, dword ptr [ebp - 8]
    jmp L14
    }
}
