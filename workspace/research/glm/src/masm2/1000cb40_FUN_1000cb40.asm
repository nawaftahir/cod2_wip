.686
.MODEL FLAT, C
EXTRN sub_1000CBB6:PROC
EXTRN sub_1000CBC5:PROC
.CODE
FUN_1000cb40 PROC
    mov mov cl, byte ptr [esi]
    xor xor edx, edx
    test test cl, cl
    mov mov eax, 119
    je L0
    lea lea ecx, [ecx]
    movsx movsx ecx, cl
    imul imul ecx, eax
    add add edx, ecx
    mov mov cl, byte ptr [esi + eax - 118]
    inc inc eax
    test test cl, cl
    jne L1
    and and edx, 07FFh
    mov mov eax, edx
    mov mov ecx, dword ptr [eax*4 + 0101CEA68h]
    test test ecx, ecx
    je sub_1000CBC5
    jmp sub_1000CBB6
    lea lea esp, [esp]
    lea lea ecx, [ecx]
    inc inc eax
    and and eax, 07FFh
FUN_1000cb40 ENDP
END
