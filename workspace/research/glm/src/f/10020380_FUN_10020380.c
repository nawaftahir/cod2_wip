/* RI queue-check callback; compiler pins the arg in EBX across the call */
extern int (__stdcall *g_riQ)(int);          /* 0x101d4b40 */
extern void FUN_1002dc80(void);

__declspec(naked) void FUN_10020380(int a)
{
    __asm {
        push ebx
        mov ebx, [esp+8]
        push ebx
        call [g_riQ]
        add esp, 4
        test eax, eax
        jnz done
        call FUN_1002dc80
    done:
        pop ebx
        ret
    }
}
