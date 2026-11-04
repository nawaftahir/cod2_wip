__declspec(naked) int __stdcall FUN_1007df0d(int *t, int a, int b, int c)
{
    __asm {
        mov edi, edi
        push ebp
        mov ebp, esp
        mov eax, [ebp+10h]
        cmp eax, 1
        ja bad
        cmp dword ptr [ebp+14h], 1
        ja bad
        mov ecx, [ebp+0Ch]
        add ecx, eax
        add ecx, [ebp+14h]
        mov eax, [ebp+8]
        mov eax, [eax+ecx*4]
        jmp out2
    bad:
        xor eax, eax
    out2:
        pop ebp
        ret 10h
    }
}
