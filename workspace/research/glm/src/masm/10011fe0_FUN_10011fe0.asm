.686
.MODEL FLAT, C
EXTRN sub_10011F20:PROC
EXTRN sub_10012040:PROC
.CODE
FUN_10011fe0 PROC
    sub esp, 000000200h
    push esi
    lea ecx, [esp + 4]
    call sub_10011F20
    xor esi, esi
    test ebx, ebx
    jle sub_10012040
    jmp L0
    lea esp, [esp]
    nop
L0:
    movzx eax, byte ptr [esi + edi]
    movzx ecx, word ptr [esp + eax*2 + 4]
    imul ecx, ecx, 0000000FFh
    mov eax, 080008001h
    imul ecx
    add edx, ecx
    sar edx, 15
    mov ecx, edx
    shr ecx, 31
    add ecx, edx
    mov byte ptr [esi + edi], cl
    inc esi
    cmp esi, ebx
    jl L0
FUN_10011fe0 ENDP
END
