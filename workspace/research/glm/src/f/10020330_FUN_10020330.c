extern int (__stdcall *g_riQ)(int);          /* 0x101d4b40 */
extern void __cdecl FUN_1002dcf0(int);

__declspec(naked) void FUN_10020330(int a)
{
    __asm {
        push esi
        mov esi, [esp+8]
        push esi
        call [g_riQ]
        add esp, 4
        test eax, eax
        jnz done
        push esi
        call FUN_1002dcf0
        add esp, 4
    done:
        pop esi
        ret
    }
}
