extern void *g_ptdBase;

void *__cdecl __initptd(void *ptd)
{
    __asm {
        mov eax, [esp+4]
        mov dword ptr [eax+54h], offset g_ptdBase
        mov dword ptr [eax+14h], 1
    }
}
