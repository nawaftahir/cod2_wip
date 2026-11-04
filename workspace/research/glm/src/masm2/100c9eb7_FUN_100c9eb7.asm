.686
.MODEL FLAT, C
EXTRN sub_100C4CE6:PROC
EXTRN sub_100C98BD:PROC
EXTRN sub_100C9EEF:PROC
EXTRN sub_100C9EFA:PROC
EXTRN sub_100C9F05:PROC
.CODE
FUN_100c9eb7 PROC
    mov mov edi, edi
    push push esi
    push push 39
    mov mov esi, ecx
    call sub_100C98BD
    test test eax, eax
    jl sub_100C9EEF
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100C9EFA
    mov mov ecx, esi
    call sub_100C4CE6
    test test eax, eax
    jl sub_100C9F05
    xor xor eax, eax
    pop pop esi
    ret ret
FUN_100c9eb7 ENDP
END
