extern void sub_10041155(void);
extern void sub_1004127f(void);

__declspec(naked) void FUN_10041390(void)
{
    __asm {
    push ebp
    mov ebp, esp
    and esp, 0xfffffff8
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    jl L1
    call sub_10041155
    mov esp, ebp
    pop ebp
    ret
    push eax
    call sub_1004127f
    add esp, 4
    mov esp, ebp
    pop ebp
    ret
    }
}
