.686
.MODEL FLAT, C
EXTRN sub_100C4CE6:PROC
EXTRN sub_100C98BD:PROC
.CODE
FUN_100c9eb7 PROC
    mov edi, edi
    push esi
    push 39
    mov esi, ecx
    call sub_100C98BD
    test eax, eax
    jl L0
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L0
    mov ecx, esi
    call sub_100C4CE6
    test eax, eax
    jl L0
    xor eax, eax
L0:
    pop esi
    ret
FUN_100c9eb7 ENDP
END
