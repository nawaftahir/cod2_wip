extern int g_1010c728;

__declspec(naked) void FUN_1009a36a(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xc]
    mov ecx, dword ptr [eax]
    sub ecx, 0
    je L9
    dec ecx
    je L9
    dec ecx
    je L9
    dec ecx
    je L9
    mov eax, 0x80004005
    jmp L9
    fld qword ptr [eax + 8]
    jmp L9
    mov eax, dword ptr [eax + 8]
    test eax, eax
    mov dword ptr [ebp + 0xc], eax
    fild dword ptr [ebp + 0xc]
    jge L9
    fadd qword ptr g_1010c728
    jmp L9
    fild dword ptr [eax + 8]
    mov eax, dword ptr [ebp + 8]
    fstp qword ptr [eax]
    jmp L9
    cmp dword ptr [eax + 8], 0
    je L9
    fld1
    jmp L9
    fldz
    mov eax, dword ptr [ebp + 8]
    fld st(0)
    fstp qword ptr [eax]
    fstp st(0)
    xor eax, eax
    pop ebp
    ret 0xc
    }
}
