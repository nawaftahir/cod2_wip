.686
.MODEL FLAT, C
EXTRN sub_1005EDB6:PROC
EXTRN sub_1005EDD1:PROC
.CODE
FUN_1005ed70 PROC
    push ebp
    mov ebp, esp
    sub eax, 0
    je L0
    sub eax, 2
    jne sub_1005EDB6
L0:
    push ebx
    mov ebx, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp + 12]
    cmp ecx, 000001000h
    jle L1
    mov ecx, 000001000h
L1:
    add ecx, 31
    shr ecx, 5
    je sub_1005EDD1
    jmp L2
    jmp L2
    lea ecx, [ecx]
L2:
    test byte ptr [ebx], al
    add ebx, 32
    dec ecx
FUN_1005ed70 ENDP
END
