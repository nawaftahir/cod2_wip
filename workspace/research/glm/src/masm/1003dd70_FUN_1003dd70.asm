.686
.MODEL FLAT, C
EXTRN sub_1003D972:PROC
EXTRN g_101D4C88:DWORD
.CODE
FUN_1003dd70 PROC
    mov eax, dword ptr [g_101D4C88]
    push edi
    xor edi, edi
    test eax, eax
    jle L2
    lea esp, [esp]
L0:
    cmp dword ptr [edi*4 + 010766774h], esi
    jne L1
    push 0
    xor eax, eax
    call sub_1003D972
    add esp, 4
L1:
    mov eax, dword ptr [g_101D4C88]
    inc edi
    cmp edi, eax
    jl L0
L2:
    pop edi
    ret
FUN_1003dd70 ENDP
END
