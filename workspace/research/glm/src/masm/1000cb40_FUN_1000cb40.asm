.686
.MODEL FLAT, C
EXTRN sub_1000CBC5:PROC
.CODE
FUN_1000cb40 PROC
    mov cl, byte ptr [esi]
    xor edx, edx
    test cl, cl
    mov eax, 119
    je L1
    lea ecx, [ecx]
L0:
    movsx ecx, cl
    imul ecx, eax
    add edx, ecx
    mov cl, byte ptr [esi + eax - 118]
    inc eax
    test cl, cl
    jne L0
L1:
    and edx, 0000007FFh
    mov eax, edx
    mov ecx, dword ptr [eax*4 + 0101CEA68h]
    test ecx, ecx
    je sub_1000CBC5
    jmp L2
    lea esp, [esp]
    lea ecx, [ecx]
L2:
    inc eax
    and eax, 0000007FFh
FUN_1000cb40 ENDP
END
