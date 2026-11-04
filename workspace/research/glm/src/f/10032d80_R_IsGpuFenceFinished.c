extern int g_101d4810;
extern int g_101d4954;
extern int g_101d4958;
extern int g_101d494c;
extern int g_101d4950;
extern void sub_10032cd0(void);

__declspec(naked) void R_IsGpuFenceFinished(void)
{
    __asm {
    mov eax, dword ptr g_101d4810
    sub esp, 8
    cmp eax, 3
    je L_gpu3
    add esp, 8
    jmp sub_10032cd0
L_gpu3:
    push ebp
    push esi
    push edi
    xor edi, edi
    mov dword ptr [esp + 0x10], edi
    _emit 0x0f
    _emit 0x31
    mov ecx, eax
    mov eax, dword ptr g_101d4954
    mov esi, edx
    cdq
    sub ecx, eax
    sbb esi, edx
    mov ebp, ecx
    mov dword ptr g_101d4954, edi
L_loop:
    mov al, byte ptr g_101d4958
    test al, al
    je L_avg
    mov eax, dword ptr g_101d494c
    mov ecx, dword ptr [eax]
    push 1
    push 0
    push 0
    push eax
    call dword ptr [ecx + 0x1c]
    cmp eax, 0x88760868
    je L_reset
    cmp eax, 1
    setne al
    test al, al
    jne L_reset
    _emit 0x0f
    _emit 0x31
    sub eax, ebp
    sbb edx, esi
    test edx, edx
    mov edi, eax
    jg L_done
    jl L_loop
    cmp edi, 0x7fffffff
    ja L_done
    jmp L_loop
L_reset:
    mov byte ptr g_101d4958, 0
L_avg:
    mov ecx, dword ptr g_101d4950
    mov eax, ecx
    sub eax, edi
    cdq
    sub eax, edx
    sar eax, 1
    neg eax
    add ecx, eax
    mov dword ptr g_101d4950, ecx
L_done:
    pop edi
    pop esi
    pop ebp
    add esp, 8
    ret
    }
}
