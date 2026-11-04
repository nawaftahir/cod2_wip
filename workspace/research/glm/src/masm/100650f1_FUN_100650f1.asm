.686
.MODEL FLAT, C
EXTRN sub_10067C68:PROC
.CODE
FUN_100650f1 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    push esi
    mov esi, ecx
    jne L1
    cmp dword ptr [esi + 68], eax
    jne L0
    push 01010C734h
    push eax
    lea eax, [esi + 000000278h]
    push eax
    lea eax, [esi + 24]
    push eax
    call sub_10067C68
    add esp, 16
    mov dword ptr [esi + 68], 1
L0:
    xor eax, eax
L1:
    pop esi
    pop ebp
    ret 4
FUN_100650f1 ENDP
END
