.686
.MODEL FLAT, C
EXTRN sub_1002BD28:PROC
EXTRN sub_1002BDFD:PROC
EXTRN sub_100F5C4D:PROC
EXTRN sub_100F5C72:PROC
.CODE
FUN_1002bed0 PROC
    push ecx
    xor ecx, ecx
    call sub_1002BD28
    test eax, eax
    mov dword ptr [esp], eax
    jne L0
    push eax
    lea eax, [esp + 4]
    push eax
    push 01002BDA0h
    call sub_100F5C4D
    mov eax, dword ptr [esp]
    test eax, eax
    jne L0
    xor ecx, ecx
    call sub_1002BDFD
    test eax, eax
    mov dword ptr [esp], eax
    jne L0
    push eax
    lea ecx, [esp + 4]
    push ecx
    push 01002BEB0h
    call sub_100F5C72
    mov eax, dword ptr [esp]
    test eax, eax
    jne L0
    pop ecx
    ret
L0:
    lea ecx, [eax - 1]
    shr ecx, 20
    inc ecx
    mov eax, 1
    cmp ecx, eax
    jbe L2
    lea ecx, [ecx]
L1:
    shl eax, 1
    cmp eax, ecx
    jb L1
L2:
    mov edx, eax
    sub edx, ecx
    cmp edx, 32
    jbe L3
    sar eax, 1
L3:
    pop ecx
    ret
FUN_1002bed0 ENDP
END
