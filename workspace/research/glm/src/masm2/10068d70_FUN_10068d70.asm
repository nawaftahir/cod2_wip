.686
.MODEL FLAT, C
EXTRN sub_10067C67:PROC
EXTRN sub_10068DB4:PROC
EXTRN sub_10068DB7:PROC
.CODE
FUN_10068d70 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, dword ptr [ebp + 8]
    test test eax, eax
    push push esi
    mov mov esi, ecx
    jne sub_10068DB4
    push push edi
    xor xor edi, edi
    inc inc edi
    cmp cmp dword ptr [esi + 76], eax
    jne sub_10068DB7
    push push 01010C734h
    push push eax
    lea lea eax, [esi + 16]
    push push eax
    push push dword ptr [esi]
    call sub_10067C67
    add add esp, 16
    mov mov dword ptr [esi + 76], edi
    mov mov dword ptr [esi + 80], edi
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret 4
FUN_10068d70 ENDP
END
