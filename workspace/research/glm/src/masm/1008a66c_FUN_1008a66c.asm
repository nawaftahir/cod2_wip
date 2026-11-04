.686
.MODEL FLAT, C
EXTRN sub_100F7876:PROC
EXTRN sub_100F787E:PROC
EXTRN sub_100F7886:PROC
EXTRN sub_100F788E:PROC
EXTRN sub_100F7896:PROC
EXTRN sub_100F789E:PROC
EXTRN sub_100F78A6:PROC
EXTRN sub_100F78AE:PROC
EXTRN sub_100F78B6:PROC
EXTRN sub_100F78BE:PROC
EXTRN sub_100F78C6:PROC
EXTRN sub_100F78CE:PROC
EXTRN sub_100F78D6:PROC
EXTRN sub_100F78DE:PROC
EXTRN sub_100F78E6:PROC
EXTRN sub_100F78EE:PROC
EXTRN sub_100F78F9:PROC
.CODE
FUN_1008a66c PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push edi
    mov edi, dword ptr [ebp + 8]
    push dword ptr [edi + 8]
    call sub_100F7876
    push dword ptr [edi + 12]
    call sub_100F787E
    push dword ptr [edi + 16]
    call sub_100F7886
    push dword ptr [edi + 20]
    call sub_100F788E
    push dword ptr [edi + 24]
    call sub_100F7896
    push dword ptr [edi + 28]
    call sub_100F789E
    push dword ptr [edi + 32]
    call sub_100F78A6
    push dword ptr [edi + 48]
    call sub_100F78AE
    push dword ptr [edi + 52]
    call sub_100F78B6
    push dword ptr [edi + 56]
    call sub_100F78BE
    push dword ptr [edi + 60]
    call sub_100F78C6
    push dword ptr [edi + 64]
    call sub_100F78CE
    push dword ptr [edi + 68]
    call sub_100F78D6
    push dword ptr [edi + 76]
    call sub_100F78DE
    push dword ptr [edi + 80]
    call sub_100F78E6
    push dword ptr [edi + 84]
    call sub_100F78EE
    add esp, 64
    push dword ptr [edi + 88]
    call sub_100F78F9
    pop ecx
    push 25
    pop ecx
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    pop edi
    pop ebp
    ret 4
FUN_1008a66c ENDP
END
