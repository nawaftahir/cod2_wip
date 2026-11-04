extern int g_1010c728;
extern int g_1010f780;
extern int g_1019be20;
extern void sub_100f916c(void);

__declspec(naked) void FUN_1009c8b6(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    mov ecx, dword ptr [esi]
    xor edx, edx
    sub ecx, edx
    je L0
    dec ecx
    je L1
    dec ecx
    je L1
    dec ecx
    mov eax, dword ptr [ebp + 0xc]
    je L2
    dec ecx
    push 4
    pop edx
    je L3
    dec ecx
    je L4
    jmp L5
    cmp dword ptr [eax], edx
    je L6
    mov ecx, dword ptr [eax]
    sub ecx, edx
    je L7
    dec ecx
    jne L5
    mov ecx, dword ptr [eax + 8]
    mov dword ptr [esi + 8], ecx
    mov eax, dword ptr [eax + 0xc]
    mov dword ptr [esi + 0xc], eax
    jmp L8
    mov dword ptr [esi], edx
    mov eax, dword ptr [eax + 8]
    jmp L9
    mov ecx, dword ptr [eax]
    sub ecx, edx
    je L10
    dec ecx
    je L11
    dec ecx
    je L12
    dec ecx
    jne L5
    fld qword ptr [eax + 8]
    jmp L13
    mov eax, dword ptr [eax + 8]
    test eax, eax
    mov dword ptr [ebp + 0xc], eax
    fild dword ptr [ebp + 0xc]
    jge L13
    fadd qword ptr g_1010c728
    jmp L13
    fild dword ptr [eax + 8]
    jmp L13
    xor ecx, ecx
    cmp dword ptr [eax + 8], edx
    setne cl
    mov dword ptr [ebp + 0xc], ecx
    fild dword ptr [ebp + 0xc]
    fstp qword ptr [esi + 8]
    jmp L8
    fsub qword ptr g_1010f780
    call sub_100f916c
    jmp L9
    mov eax, dword ptr [ecx + 8]
    jmp L9
    mov ecx, dword ptr [ebp + 0xc]
    mov eax, dword ptr [ecx]
    sub eax, edx
    je L14
    dec eax
    je L15
    dec eax
    je L15
    dec eax
    jne L5
    fld qword ptr [ecx + 8]
    fcomp qword ptr g_1019be20
    fld qword ptr [ecx + 8]
    fnstsw ax
    test ah, 1
    jne L16
    fadd qword ptr g_1010f780
    jmp L17
    xor eax, eax
    cmp dword ptr [ecx + 8], edx
    setne al
    mov dword ptr [esi + 8], eax
    jmp L8
    mov eax, dword ptr [ebp + 0xc]
    mov ecx, dword ptr [eax]
    sub ecx, edx
    je L18
    dec ecx
    je L18
    dec ecx
    je L18
    dec ecx
    je L19
    mov eax, 0x80004005
    jmp L20
    fld qword ptr [eax + 8]
    fld qword ptr g_1019be20
    fucompp
    fnstsw ax
    test ah, 0x44
    jnp L21
    xor edx, edx
    inc edx
    mov dword ptr [esi + 8], edx
    jmp L8
    xor ecx, ecx
    cmp dword ptr [eax + 8], edx
    setne cl
    mov dword ptr [esi + 8], ecx
    xor eax, eax
    pop esi
    pop ebp
    ret 0xc
    }
}
