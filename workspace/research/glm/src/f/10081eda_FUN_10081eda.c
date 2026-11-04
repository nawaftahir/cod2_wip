__declspec(naked) int __stdcall FUN_10081eda(void *s)
{
    __asm {
        mov edi, edi
        push ebp
        mov ebp, esp
        mov eax, [ebp+8]
        inc dword ptr [eax+4]
        mov eax, [eax+4]
        pop ebp
        ret 4
    }
}
