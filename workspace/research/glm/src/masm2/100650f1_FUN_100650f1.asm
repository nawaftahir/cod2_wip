.686
.MODEL FLAT, C
EXTRN sub_10065136:PROC
EXTRN sub_10065139:PROC
EXTRN sub_10067C68:PROC
.CODE
FUN_100650f1 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, dword ptr [ebp + 8]
    test test eax, eax
    push push esi
    mov mov esi, ecx
    jne sub_10065136
    cmp cmp dword ptr [esi + 68], eax
    jne sub_10065139
    push push 01010C734h
    push push eax
    lea lea eax, [esi + 0278h]
    push push eax
    lea lea eax, [esi + 24]
    push push eax
    call sub_10067C68
    add add esp, 16
    mov mov dword ptr [esi + 68], 1
    xor xor eax, eax
    pop pop esi
    pop pop ebp
    ret ret 4
FUN_100650f1 ENDP
END
