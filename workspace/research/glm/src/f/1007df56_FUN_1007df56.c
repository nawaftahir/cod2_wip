__declspec(naked) void __stdcall FUN_1007df56(int *table, int i)
{
    __asm {
        mov edi, edi
        push ebp
        mov ebp, esp
        mov eax, [ebp+0Ch]
        mov ecx, [ebp+8]
        mov eax, [ecx+eax*4]
        pop ebp
        ret 8
    }
}
