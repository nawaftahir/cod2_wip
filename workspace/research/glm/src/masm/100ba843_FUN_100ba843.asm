.686
.MODEL FLAT, C
EXTRN sub_1008A9A2:PROC
.CODE
FUN_100ba843 PROC
    mov edi, edi
    push edi
    or eax, 0FFFFFFFFh
    mov dword ptr [ecx + 000000138h], eax
    lea edi, [ecx + 00000013Ch]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    and dword ptr [ecx + 00000014Ch], 0
    and dword ptr [ecx + 000000150h], 0
    call sub_1008A9A2
    test eax, eax
    pop edi
    jl L0
    xor eax, eax
L0:
    ret
FUN_100ba843 ENDP
END
