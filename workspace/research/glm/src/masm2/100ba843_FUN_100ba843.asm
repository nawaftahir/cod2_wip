.686
.MODEL FLAT, C
EXTRN sub_1008A9A2:PROC
EXTRN sub_100BA8A1:PROC
.CODE
FUN_100ba843 PROC
    mov mov edi, edi
    push push edi
    or or eax, -1
    mov mov dword ptr [ecx + 0138h], eax
    lea lea edi, [ecx + 013Ch]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    and and dword ptr [ecx + 014Ch], 0
    and and dword ptr [ecx + 0150h], 0
    call sub_1008A9A2
    test test eax, eax
    pop pop edi
    jl sub_100BA8A1
    xor xor eax, eax
    ret ret
FUN_100ba843 ENDP
END
