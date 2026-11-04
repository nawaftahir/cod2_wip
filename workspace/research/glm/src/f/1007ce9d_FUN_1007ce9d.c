extern int c_10000000;
extern void sub_1006c566(void);
extern void sub_1006e308(void);
extern void sub_10070fa6(void);
extern void sub_1007b5eb(void);
extern void sub_100f7865(void);
extern void sub_100f786a(void);

__declspec(naked) void FUN_1007ce9d(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    mov eax, dword ptr [ebp + 8]
    cmp dword ptr [eax + 4], 0xd
    push esi
    mov esi, ecx
    je L0
    xor eax, eax
    jmp L1
    push ebx
    push edi
    mov edi, dword ptr [eax + 0x18]
    imul edi, dword ptr [eax + 0x14]
    mov eax, edi
    shl eax, 2
    push eax
    call sub_100f786a
    mov ebx, eax
    test ebx, ebx
    pop ecx
    jne L2
    mov dword ptr [ebp - 4], 0x8007000e
    jmp L3
    push edi
    push ebx
    mov ecx, esi
    call sub_1006c566
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L3
    push 0
    push ebx
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_1007b5eb
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L3
    push 0
    push 0
    push ebx
    mov eax, edi
    and eax, 0xfffff
    push ebx
    or eax, c_10000000
    push eax
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_1006e308
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L3
    and dword ptr [ebp - 4], 0
    test edi, edi
    jbe L4
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [ebx + eax*4]
    mov eax, dword ptr [esi + 8]
    cmp ecx, dword ptr [eax + 8]
    jae L5
    mov edx, dword ptr [eax + 0x14]
    mov ecx, dword ptr [edx + ecx*4]
    jmp L6
    xor ecx, ecx
    test ecx, ecx
    je L7
    mov eax, dword ptr [eax + 0x84]
    mov dword ptr [ecx + 4], eax
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], edi
    jb L8
    mov eax, dword ptr [esi + 8]
    push 0
    push 0
    push 1
    push 1
    push dword ptr [eax + 0x84]
    mov eax, dword ptr [ebp + 8]
    push ebx
    push dword ptr [eax + 0x10]
    mov ecx, esi
    call sub_10070fa6
    mov dword ptr [ebp - 4], eax
    push ebx
    call sub_100f7865
    cmp dword ptr [esi + 0x4c], 0
    pop ecx
    pop edi
    pop ebx
    je L9
    mov dword ptr [ebp - 4], 0x80004005
    mov eax, dword ptr [ebp - 4]
    pop esi
    leave
    ret 4
    }
}
