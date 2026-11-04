extern int g_1019bc88;
extern int g_1019be20;
extern int g_101a5100;
extern int g_101a5108;
extern int g_101a5120;
extern void sub_10103e17(void);

__declspec(naked) void __powhlp(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    fld qword ptr [ebp + 8]
    push esi
    fcom qword ptr g_1019be20
    xor edx, edx
    xor esi, esi
    fnstsw ax
    test ah, 5
    jp L0
    fchs
    mov eax, 0x7ff00000
    fstp qword ptr [ebp - 8]
    cmp dword ptr [ebp + 0x14], eax
    mov ecx, 0xfff00000
    jne L1
    cmp dword ptr [ebp + 0x10], edx
    jne L2
    fld qword ptr [ebp - 8]
    fcomp qword ptr g_1019bc88
    fnstsw ax
    test ah, 0x41
    je L3
    fld qword ptr [ebp - 8]
    fcomp qword ptr g_1019bc88
    fnstsw ax
    test ah, 5
    mov eax, dword ptr [ebp + 0x18]
    jnp L4
    fld qword ptr g_101a5108
    xor esi, esi
    inc esi
    jmp L5
    cmp dword ptr [ebp + 0x14], ecx
    jne L2
    cmp dword ptr [ebp + 0x10], edx
    jne L2
    fld qword ptr [ebp - 8]
    fcomp qword ptr g_1019bc88
    fnstsw ax
    test ah, 0x41
    jne L6
    fldz
    jmp L7
    fld qword ptr [ebp - 8]
    fcomp qword ptr g_1019bc88
    fnstsw ax
    test ah, 5
    mov eax, dword ptr [ebp + 0x18]
    jp L8
    fld qword ptr g_101a5100
    jmp L5
    cmp dword ptr [ebp + 0xc], eax
    jne L9
    cmp dword ptr [ebp + 8], edx
    jne L10
    fld qword ptr [ebp + 0x10]
    fcomp qword ptr g_1019be20
    fnstsw ax
    test ah, 0x41
    jne L11
    fld qword ptr g_101a5100
    jmp L7
    fld qword ptr [ebp + 0x10]
    fcomp qword ptr g_1019be20
    fnstsw ax
    test ah, 5
    mov eax, dword ptr [ebp + 0x18]
    jp L12
    fldz
    jmp L5
    fld1
    jmp L5
    cmp dword ptr [ebp + 0xc], ecx
    jne L10
    cmp dword ptr [ebp + 8], edx
    jne L10
    fld qword ptr [ebp + 0x10]
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_10103e17
    fld qword ptr [ebp + 0x10]
    pop ecx
    fcomp qword ptr g_1019be20
    pop ecx
    mov ecx, eax
    fnstsw ax
    test ah, 0x41
    jne L13
    cmp ecx, 1
    fld qword ptr g_101a5100
    jne L14
    fchs
    fstp qword ptr [ebp + 0x10]
    fld qword ptr [ebp + 0x10]
    jmp L7
    fld qword ptr [ebp + 0x10]
    fcomp qword ptr g_1019be20
    fnstsw ax
    test ah, 5
    jp L15
    cmp ecx, 1
    jne L16
    fld qword ptr g_101a5120
    jmp L17
    fldz
    fstp qword ptr [ebp + 0x10]
    fld qword ptr [ebp + 0x10]
    jmp L7
    fld1
    mov eax, dword ptr [ebp + 0x18]
    fstp qword ptr [eax]
    mov eax, esi
    pop esi
    leave
    ret
    }
}
