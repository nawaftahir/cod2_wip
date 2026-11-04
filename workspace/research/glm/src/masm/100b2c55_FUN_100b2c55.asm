.686
.MODEL FLAT, C
EXTRN sub_100C8D16:PROC
.CODE
FUN_100b2c55 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push edi
    mov edx, ecx
    push 8
    pop ecx
    xor eax, eax
    lea edi, [edx + 0000001F8h]
    rep stosd dword ptr es:[edi], eax
    lea edi, [edx + 000000218h]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    pop edi
    mov ecx, edx
    pop ebp
    jmp sub_100C8D16
FUN_100b2c55 ENDP
END
