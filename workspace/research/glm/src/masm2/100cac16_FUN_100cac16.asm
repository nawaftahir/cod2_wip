.686
.MODEL FLAT, C
EXTRN sub_100C4CE6:PROC
EXTRN sub_100C98BD:PROC
EXTRN sub_100CAC4E:PROC
EXTRN sub_100CAC59:PROC
EXTRN sub_100CAC64:PROC
.CODE
FUN_100cac16 PROC
    mov mov edi, edi
    push push esi
    push push 43
    mov mov esi, ecx
    call sub_100C98BD
    test test eax, eax
    jl sub_100CAC4E
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100CAC59
    mov mov ecx, esi
    call sub_100C4CE6
    test test eax, eax
    jl sub_100CAC64
    xor xor eax, eax
    pop pop esi
    ret ret
FUN_100cac16 ENDP
END
