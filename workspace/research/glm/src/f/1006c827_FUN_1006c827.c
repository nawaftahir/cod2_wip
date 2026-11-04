extern void sub_100f8cc4(void);

__declspec(naked) void FUN_1006c827(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x20
    mov eax, dword ptr [ebp + 0xc]
    mov edx, dword ptr [ebp + 0x10]
    fld qword ptr [eax]
    fmul qword ptr [edx]
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    fstp qword ptr [ebp - 0x20]
    push edi
    fld qword ptr [eax]
    xor ebx, ebx
    fmul qword ptr [edx + 8]
    fstp qword ptr [ebp - 0x18]
    fld qword ptr [edx]
    fmul qword ptr [eax + 8]
    fstp qword ptr [ebp - 0x10]
    fld qword ptr [eax + 8]
    fmul qword ptr [edx + 8]
    fstp qword ptr [ebp - 8]
    fld qword ptr [ecx + 0xa0]
    fstp qword ptr [esi]
    fld qword ptr [ecx + 0xa8]
    fstp qword ptr [esi + 8]
    push ecx
    lea edi, [ebp + ebx*8 - 0x20]
    fld qword ptr [edi]
    push ecx
    fstp qword ptr [esp]
    call sub_100f8cc4
    test eax, eax
    pop ecx
    pop ecx
    je L6
    test byte ptr [ebp + 0x14], 0x40
    jne L6
    fldz
    fstp qword ptr [edi]
    fld qword ptr [esi]
    fcomp qword ptr [edi]
    fnstsw ax
    test ah, 0x41
    jne L6
    fld qword ptr [edi]
    fstp qword ptr [esi]
    fld qword ptr [esi + 8]
    fcomp qword ptr [edi]
    fnstsw ax
    test ah, 5
    jp L6
    fld qword ptr [edi]
    fstp qword ptr [esi + 8]
    inc ebx
    cmp ebx, 4
    jb L6
    jmp L6
    lea eax, [ebp + ebx*8 - 0x20]
    fld qword ptr [eax]
    fstp qword ptr [esi]
    fld qword ptr [eax]
    fstp qword ptr [esi + 8]
    pop edi
    pop esi
    pop ebx
    leave
    ret 0x10
    }
}
