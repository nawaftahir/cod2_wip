.686
.MODEL FLAT, C
EXTRN sub_10062DB9:PROC
EXTRN sub_10062DD6:PROC
EXTRN sub_10062DF7:PROC
EXTRN sub_10062DF8:PROC
EXTRN sub_10062DF9:PROC
EXTRN sub_10062DFE:PROC
EXTRN sub_10062E04:PROC
EXTRN sub_10062E17:PROC
EXTRN sub_10062E1E:PROC
.CODE
FUN_10062d3b PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0130h
    mov mov eax, dword ptr [ebp + 8]
    test test eax, eax
    je L0
    mov mov ecx, dword ptr [eax]
    lea lea edx, [ebp - 0130h]
    push push edx
    push push eax
    call call dword ptr [ecx + 28]
    test test eax, eax
    jge L1
    xor xor eax, eax
    jmp sub_10062DD6
    mov mov eax, dword ptr [ebp - 108]
    and and eax, 0FFFFh
    cmp cmp eax, 0200h
    jae sub_10062DB9
    sub sub eax, 0101h
    neg neg eax
    sbb sbb eax, eax
    not not eax
    and and eax, 01010C460h
    jmp sub_10062DF7
    cmp cmp eax, 0300h
    jae sub_10062DF9
    cmp cmp dword ptr [ebp - 48], 13
    jl sub_10062DF8
    test test byte ptr [ebp - 56], 1
    je sub_10062DFE
    cmp cmp dword ptr [ebp - 52], 24
    jne sub_10062E04
    mov mov eax, 01010C450h
    jmp sub_10062E17
    mov mov eax, 01010C458h
    jmp sub_10062E1E
    mov mov eax, 01010C438h
    leave leave
    ret ret 4
FUN_10062d3b ENDP
END
