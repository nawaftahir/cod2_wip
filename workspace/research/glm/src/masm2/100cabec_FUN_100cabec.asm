.686
.MODEL FLAT, C
EXTRN sub_100C4CE6:PROC
EXTRN sub_100C98BD:PROC
EXTRN sub_100CAC24:PROC
EXTRN sub_100CAC2F:PROC
EXTRN sub_100CAC3A:PROC
.CODE
FUN_100cabec PROC
    mov mov edi, edi
    push push esi
    push push 42
    mov mov esi, ecx
    call sub_100C98BD
    test test eax, eax
    jl sub_100CAC24
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100CAC2F
    mov mov ecx, esi
    call sub_100C4CE6
    test test eax, eax
    jl sub_100CAC3A
    xor xor eax, eax
    pop pop esi
    ret ret
FUN_100cabec ENDP
END
