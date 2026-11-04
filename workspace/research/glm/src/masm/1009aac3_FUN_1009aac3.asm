.686
.MODEL FLAT, C
.CODE
FUN_1009aac3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 16]
    dec eax
    js L1
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    lea edi, [eax + 1]
L0:
    mov ecx, esi
    call dword ptr [ebp + 0x14]
    add esi, dword ptr [ebp + 12]
    dec edi
    jne L0
    pop edi
    pop esi
L1:
    pop ebp
    ret 16
FUN_1009aac3 ENDP
END
