.686
.MODEL FLAT, C
.CODE
FUN_1006c566 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 12]
    test ecx, ecx
    jbe L0
    push edi
    mov edi, dword ptr [ebp + 8]
    or eax, 0FFFFFFFFh
    rep stosd dword ptr es:[edi], eax
    pop edi
L0:
    xor eax, eax
    pop ebp
    ret 8
FUN_1006c566 ENDP
END
