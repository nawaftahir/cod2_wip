.686
.MODEL FLAT, C
.CODE
FUN_101061c8 PROC
    push push edi
    mov mov edi, dword ptr [esp + 8]
    xor xor eax, eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    pop pop edi
    ret ret
FUN_101061c8 ENDP
END
