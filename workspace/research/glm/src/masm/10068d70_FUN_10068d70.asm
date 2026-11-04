.686
.MODEL FLAT, C
EXTRN sub_10067C67:PROC
.CODE
FUN_10068d70 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    push esi
    mov esi, ecx
    jne L1
    push edi
    xor edi, edi
    inc edi
    cmp dword ptr [esi + 76], eax
    jne L0
    push 01010C734h
    push eax
    lea eax, [esi + 16]
    push eax
    push dword ptr [esi]
    call sub_10067C67
    add esp, 16
    mov dword ptr [esi + 76], edi
L0:
    mov dword ptr [esi + 80], edi
    xor eax, eax
    pop edi
L1:
    pop esi
    pop ebp
    ret 4
FUN_10068d70 ENDP
END
