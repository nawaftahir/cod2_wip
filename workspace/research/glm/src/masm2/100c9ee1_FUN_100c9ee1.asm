.686
.MODEL FLAT, C
EXTRN sub_100C4CE6:PROC
EXTRN sub_100C98BD:PROC
EXTRN sub_100C9F19:PROC
EXTRN sub_100C9F24:PROC
EXTRN sub_100C9F2F:PROC
.CODE
FUN_100c9ee1 PROC
    mov mov edi, edi
    push push esi
    push push 29
    mov mov esi, ecx
    call sub_100C98BD
    test test eax, eax
    jl sub_100C9F19
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100C9F24
    mov mov ecx, esi
    call sub_100C4CE6
    test test eax, eax
    jl sub_100C9F2F
    xor xor eax, eax
    pop pop esi
    ret ret
FUN_100c9ee1 ENDP
END
