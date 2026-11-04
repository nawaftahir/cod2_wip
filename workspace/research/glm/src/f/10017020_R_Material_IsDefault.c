extern int *g_matGlob;

__declspec(naked) int __cdecl R_Material_IsDefault(void *mat)
{
    __asm {
        mov eax, [esp+4]
        mov ecx, [g_matGlob]
        mov edx, [eax+3Ch]
        cmp edx, [ecx+3Ch]
        jz check2
    fail:
        xor al, al
        ret
    check2:
        mov edx, [eax+40h]
        cmp edx, [ecx+40h]
        jnz fail
        mov eax, [eax+38h]
        cmp eax, [ecx+38h]
        sete al
        ret
    }
}
