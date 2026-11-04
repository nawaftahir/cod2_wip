.686
.MODEL FLAT, C
.CODE
__trandisp1 PROC
    cmp byte ptr [edx + 14], 5
    jne L0
    mov bx, word ptr [ebp - 0000000A4h]
    or bh, 2
    and bh, 0000000FEh
    mov bl, 63
    jmp L1
L0:
    mov bx, 00000133Fh
L1:
    mov word ptr [ebp - 0000000A2h], bx
    fldcw word ptr [ebp - 0000000A2h]
    mov ebx, 0101A524Ch
    fxam
    mov dword ptr [ebp - 000000094h], edx
    wait
    fnstsw word ptr [ebp - 0000000A0h]
    mov byte ptr [ebp - 000000090h], 0
    wait
    mov cl, byte ptr [ebp - 00000009Fh]
    shl cl, 1
    sar cl, 1
    rol cl, 1
    mov al, cl
    and al, 15
    xlatb
    movsx eax, al
    and ecx, 000000404h
    mov ebx, edx
    add ebx, eax
    add ebx, 16
    jmp dword ptr [ebx]
__trandisp1 ENDP
END
