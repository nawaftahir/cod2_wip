.686
.MODEL FLAT, C
EXTRN sub_10062D4A:PROC
EXTRN sub_10062D61:PROC
EXTRN sub_10062D7E:PROC
EXTRN sub_10062D8C:PROC
EXTRN sub_10062D9A:PROC
EXTRN sub_10062DAC:PROC
EXTRN sub_10062DAD:PROC
EXTRN sub_10062DAE:PROC
EXTRN sub_10062DB4:PROC
EXTRN sub_10062DB8:PROC
EXTRN sub_10062DBC:PROC
EXTRN sub_10062DC0:PROC
EXTRN sub_10062DC4:PROC
EXTRN sub_10062DD7:PROC
EXTRN sub_10062DDE:PROC
.CODE
FUN_10062c8b PROC
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
    jmp sub_10062D61
    mov mov eax, dword ptr [ebp - 100]
    and and eax, 0FFFFh
    cmp cmp eax, 0200h
    jae L4
    cmp cmp eax, 0101h
    jne L2
    mov mov eax, 01010C510h
    jmp sub_10062D7E
    cmp cmp eax, 0102h
    jne L3
    mov mov eax, 01010C508h
    jmp sub_10062D8C
    cmp cmp eax, 0103h
    jne sub_10062D4A
    mov mov eax, 01010C500h
    jmp sub_10062D9A
    sub sub eax, 0104h
    neg neg eax
    sbb sbb eax, eax
    not not eax
    and and eax, 01010C4F8h
    jmp sub_10062DAC
    cmp cmp eax, 0300h
    jae sub_10062DAE
    cmp cmp dword ptr [ebp - 32], 22
    jl sub_10062DAD
    mov mov al, byte ptr [ebp - 40]
    test test al, 1
L2:
    je sub_10062DB4
    test test al, 2
    je sub_10062DB8
    test test al, 4
    je sub_10062DBC
    test test al, 8
    je sub_10062DC0
    test test al, 16
    je sub_10062DC4
    mov mov eax, 01010C4E8h
    jmp sub_10062DD7
    mov mov eax, 01010C4F0h
    jmp sub_10062DDE
    mov mov eax, 01010C4C8h
    leave leave
    ret ret 4
FUN_10062c8b ENDP
END
