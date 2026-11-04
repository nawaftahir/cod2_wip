.686
.MODEL FLAT, C
EXTRN sub_1005F39E:PROC
EXTRN sub_1005FB01:PROC
EXTRN sub_1005FB3F:PROC
EXTRN sub_1005FF53:PROC
.CODE
FUN_10018f90 PROC
    push edi
    push 1
    push 0101958CCh
    mov ecx, esi
    mov edi, eax
    call sub_1005FB01
    add esp, 8
    test eax, eax
    jne L0
    xor al, al
    pop edi
    ret
L0:
    mov ecx, esi
    call sub_1005FF53
    test eax, eax
    mov ecx, dword ptr [esp + 8]
    mov dword ptr [ecx], eax
    jl L1
    cmp eax, edi
    jl L2
L1:
    dec edi
    push edi
    push eax
    push 0101956ACh
    call sub_1005F39E
    add esp, 12
L2:
    push 1
    push 0101958A8h
    mov ecx, esi
    call sub_1005FB3F
    add esp, 8
    test eax, eax
    setne al
    pop edi
    ret
FUN_10018f90 ENDP
END
