.686
.MODEL FLAT, C
.CODE
__trandisp1 PROC
    cmp cmp byte ptr [edx + 14], 5
    jne L0
    mov mov bx, word ptr [ebp - 0A4h]
    or or bh, 2
    and and bh, 0FEh
    mov mov bl, 63
    jmp L1
    mov mov bx, 0133Fh
    mov mov word ptr [ebp - 0A2h], bx
    fldcw fldcw word ptr [ebp - 0A2h]
    mov mov ebx, 0101A524Ch
    fxam fxam
    mov mov dword ptr [ebp - 094h], edx
    wait wait
    fnstsw fnstsw word ptr [ebp - 0A0h]
    mov mov byte ptr [ebp - 090h], 0
    wait wait
    mov mov cl, byte ptr [ebp - 09Fh]
    shl shl cl, 1
    sar sar cl, 1
    rol rol cl, 1
    mov mov al, cl
    and and al, 15
    xlatb xlatb
    movsx movsx eax, al
    and and ecx, 0404h
    mov mov ebx, edx
    add add ebx, eax
    add add ebx, 16
    jmp jmp dword ptr [ebx]
__trandisp1 ENDP
END
