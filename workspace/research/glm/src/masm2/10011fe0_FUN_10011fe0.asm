.686
.MODEL FLAT, C
EXTRN sub_10011F20:PROC
EXTRN sub_10012040:PROC
EXTRN sub_1001204A:PROC
.CODE
FUN_10011fe0 PROC
    sub sub esp, 0200h
    push push esi
    lea lea ecx, [esp + 4]
    call sub_10011F20
    xor xor esi, esi
    test test ebx, ebx
    jle sub_10012040
    jmp L0
    lea lea esp, [esp]
    nop nop
    movzx movzx eax, byte ptr [esi + edi]
    movzx movzx ecx, word ptr [esp + eax*2 + 4]
    imul imul ecx, ecx, 0FFh
    mov mov eax, 080008001h
    imul imul ecx
    add add edx, ecx
L0:
    sar sar edx, 15
    mov mov ecx, edx
    shr shr ecx, 31
    add add ecx, edx
    mov mov byte ptr [esi + edi], cl
    inc inc esi
    cmp cmp esi, ebx
    jl sub_1001204A
FUN_10011fe0 ENDP
END
