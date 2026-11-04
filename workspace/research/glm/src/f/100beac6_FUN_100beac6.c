extern int g_1019be20;
extern void sub_10085c65(void);
extern void sub_10085d21(void);
extern void sub_10086139(void);

__declspec(naked) void FUN_100beac6(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 0x100]
    mov edx, dword ptr [eax]
    xor ecx, ecx
    and edx, 0xfffff
    inc ecx
    cmp edx, ecx
    je L0
    mov eax, ecx
    jmp L1
    mov eax, dword ptr [eax + 8]
    mov edx, dword ptr [esi + 0x14]
    mov eax, dword ptr [eax + 4]
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [eax + 4]
    push edi
    mov edi, dword ptr [esi + 0x10]
    mov edx, dword ptr [edi + edx*4]
    test byte ptr [edx + 5], 1
    je L2
    cmp dword ptr [eax + 8], -1
    jne L2
    fld qword ptr g_1019be20
    fld qword ptr [eax + 0x20]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L2
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    xor eax, eax
    push eax
    push eax
    push eax
    mov ecx, esi
    call sub_10086139
    mov ecx, eax
    cmp ecx, -1
    mov dword ptr [ebp - 4], ecx
    jne L3
    mov eax, 0x8007000e
    jmp L4
    mov edx, dword ptr [esi + 0x100]
    mov edx, dword ptr [edx + 8]
    mov eax, dword ptr [esi + 0x14]
    mov edx, dword ptr [edx]
    mov ebx, dword ptr [eax + edx*4]
    mov edi, dword ptr [eax + ecx*4]
    push ebx
    mov ecx, edi
    call sub_10085c65
    test eax, eax
    jl L4
    push ebx
    mov ecx, edi
    call sub_10085d21
    test eax, eax
    jl L4
    xor dword ptr [edi + 0x3c], 0x80000
    cmp dword ptr [edi + 0x38], -1
    jne L5
    mov eax, dword ptr [esi + 0x100]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax]
    mov dword ptr [edi + 0x38], eax
    mov eax, dword ptr [esi + 0x100]
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [eax + 4], ecx
    xor eax, eax
    jmp L4
    mov eax, ecx
    pop edi
    pop esi
    pop ebx
    leave
    ret
    }
}
