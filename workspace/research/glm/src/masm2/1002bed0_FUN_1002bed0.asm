.686
.MODEL FLAT, C
EXTRN sub_1002BD28:PROC
EXTRN sub_1002BDFD:PROC
EXTRN sub_1002BF43:PROC
EXTRN sub_1002BF51:PROC
EXTRN sub_1002BF68:PROC
EXTRN sub_1002BF93:PROC
EXTRN sub_1002BF96:PROC
EXTRN sub_1002BFB0:PROC
EXTRN sub_100F5C4D:PROC
EXTRN sub_100F5C72:PROC
.CODE
FUN_1002bed0 PROC
    push push ecx
    xor xor ecx, ecx
    call sub_1002BD28
    test test eax, eax
    mov mov dword ptr [esp], eax
    jne L0
    push push eax
    lea lea eax, [esp + 4]
    push push eax
    push push 01002BDA0h
    call sub_100F5C4D
    mov mov eax, dword ptr [esp]
    test test eax, eax
    jne sub_1002BF43
    xor xor ecx, ecx
    call sub_1002BDFD
    test test eax, eax
    mov mov dword ptr [esp], eax
    jne sub_1002BF51
    push push eax
    lea lea ecx, [esp + 4]
    push push ecx
    push push 01002BEB0h
    call sub_100F5C72
    mov mov eax, dword ptr [esp]
    test test eax, eax
    jne sub_1002BF68
    pop pop ecx
    ret ret
    lea lea ecx, [eax - 1]
    shr shr ecx, 20
    inc inc ecx
    mov mov eax, 1
    cmp cmp ecx, eax
    jbe sub_1002BF93
    lea lea ecx, [ecx]
    shl shl eax, 1
    cmp cmp eax, ecx
    jb sub_1002BF96
    mov mov edx, eax
    sub sub edx, ecx
    cmp cmp edx, 32
    jbe sub_1002BFB0
    sar sar eax, 1
    pop pop ecx
    ret ret
FUN_1002bed0 ENDP
END
