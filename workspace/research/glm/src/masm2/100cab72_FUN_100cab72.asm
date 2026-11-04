.686
.MODEL FLAT, C
EXTRN sub_100C4D33:PROC
EXTRN sub_100C98C2:PROC
EXTRN sub_100CABFC:PROC
EXTRN sub_100CAC20:PROC
EXTRN sub_100CAC44:PROC
EXTRN sub_100CAC4F:PROC
EXTRN sub_100CAC5A:PROC
.CODE
FUN_100cab72 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push esi
    push push 40
    mov mov esi, ecx
    call sub_100C98C2
    test test eax, eax
    jl sub_100CABFC
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 4]
    push push ecx
    lea lea ecx, [ebp - 8]
    push push ecx
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov ecx, dword ptr [ecx]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100CAC20
    mov mov ecx, dword ptr [ebp + 8]
    push push dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi]
    neg neg ecx
    sbb sbb ecx, ecx
    and and ecx, 0D000000h
    or or ecx, dword ptr [ebp - 8]
    push push 0E40000h
    push push ecx
    mov mov ecx, esi
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100CAC44
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100CAC4F
    mov mov ecx, esi
    call sub_100C4D33
    test test eax, eax
    jl sub_100CAC5A
    xor xor eax, eax
    pop pop esi
    leave leave
    ret ret 4
FUN_100cab72 ENDP
END
