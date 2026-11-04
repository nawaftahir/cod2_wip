.686
.MODEL FLAT, C
EXTRN sub_1003D972:PROC
EXTRN sub_1003DDAB:PROC
EXTRN sub_1003DDAE:PROC
EXTRN sub_1003DDAF:PROC
EXTRN EXTRN g_101D4C88:DWORD:DWORD
.CODE
FUN_1003dd70 PROC
    mov mov eax, dword ptr [g_101D4C88]
    push push edi
    xor xor edi, edi
    test test eax, eax
    jle sub_1003DDAB
    lea lea esp, [esp]
    cmp cmp dword ptr [edi*4 + 010766774h], esi
    jne sub_1003DDAE
    push push 0
    xor xor eax, eax
    call sub_1003D972
    add add esp, 4
    mov mov eax, dword ptr [g_101D4C88]
    inc inc edi
    cmp cmp edi, eax
    jl sub_1003DDAF
    pop pop edi
    ret ret
FUN_1003dd70 ENDP
END
