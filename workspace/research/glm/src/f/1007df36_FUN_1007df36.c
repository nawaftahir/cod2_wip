__declspec(naked) int __stdcall FUN_1007df36(int *t, int a, int b)
{
    __asm {
        mov edi, edi
        push ebp
        mov ebp, esp
        mov eax, [ebp+10h]
        cmp eax, 1
        jbe ok
        xor eax, eax
        jmp out2
    ok:
        mov ecx, [ebp+0Ch]
        add ecx, eax
        mov eax, [ebp+8]
        mov eax, [eax+ecx*4]
    out2:
        pop ebp
        ret 0Ch
    }
}
