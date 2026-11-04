extern void sub_1000ca70(void);
extern void sub_1000ce80(void);
extern void sub_1000cf00(void);
extern void sub_1000cf90(void);
extern void sub_1000d090(void);
extern void sub_1000edc0(void);

__declspec(naked) void FUN_1000ee30(void)
{
    __asm {
    mov dl, byte ptr [esp + 0x10]
    push ebx
    push ebp
    test dl, 3
    push esi
    mov ebx, eax
    setne al
    test al, al
    mov esi, ecx
    push edi
    mov byte ptr [esi + 0xb], al
    lea edi, [esi + 8]
    jne L0
    mov al, byte ptr [esi + 0xa]
    mov ecx, edi
    call sub_1000d090
    jmp L1
    mov word ptr [edi], 0
    mov ebp, dword ptr [esp + 0x14]
    mov eax, dword ptr [esp + 0x18]
    mov edx, ebp
    mov ecx, ebx
    call sub_1000edc0
    movzx ecx, byte ptr [edi]
    mov eax, ebp
    sar eax, cl
    mov edx, 1
    sub edx, eax
    mov edx, 1
    jns L2
    mov edx, eax
    mov eax, dword ptr [esp + 0x18]
    sar eax, cl
    mov edi, 1
    mov word ptr [esi + 0x18], dx
    sub edi, eax
    mov edi, 1
    jns L3
    mov edi, eax
    mov eax, dword ptr [esp + 0x1c]
    sar eax, cl
    mov ecx, 1
    mov word ptr [esi + 0x1a], di
    mov ebp, 1
    sub ecx, eax
    jns L4
    mov ebp, eax
    mov eax, dword ptr [esp + 0x20]
    mov ecx, eax
    shr ecx, 1
    and ecx, 1
    test al, 4
    mov word ptr [esi + 0x1c], bp
    push 1
    je L5
    push ebx
    mov eax, edx
    call sub_1000cf90
    add esp, 8
    jmp L6
    test al, 8
    mov eax, dword ptr [esp + 0x28]
    je L7
    push ebx
    push eax
    push ecx
    mov eax, ebp
    mov ecx, edi
    call sub_1000cf00
    add esp, 0x10
    jmp L6
    push eax
    push ecx
    mov eax, edi
    mov ecx, edx
    call sub_1000ce80
    add esp, 0xc
    mov ecx, dword ptr [esp + 0x1c]
    mov edx, dword ptr [esp + 0x18]
    mov eax, dword ptr [esp + 0x14]
    push ecx
    mov ecx, dword ptr [esp + 0x24]
    push edx
    push eax
    push ecx
    push esi
    mov eax, ebx
    call sub_1000ca70
    add esp, 0x14
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
    }
}
