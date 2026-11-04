extern void sub_100f5fc8(void);
extern void sub_100f605a(void);

__declspec(naked) void __control87(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    wait
    fnstcw word ptr [ebp - 4]
    mov ebx, dword ptr [ebp - 4]
    call sub_100f5fc8
    mov ebx, eax
    mov eax, dword ptr [ebp + 0xc]
    not eax
    and ebx, eax
    mov eax, dword ptr [ebp + 8]
    and eax, dword ptr [ebp + 0xc]
    or ebx, eax
    call sub_100f605a
    mov dword ptr [ebp + 0xc], eax
    fldcw word ptr [ebp + 0xc]
    mov eax, ebx
    pop ebx
    leave
    ret
    }
}
