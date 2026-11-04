.686
.MODEL FLAT, C
.CODE
FUN_1007e390 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 24], 0
    jbe L1
    mov eax, dword ptr [ebp + 20]
    mov ecx, dword ptr [ebp + 16]
    push esi
    mov esi, dword ptr [ebp + 24]
    sub ecx, eax
L0:
    xor edx, edx
    cmp dword ptr [ecx + eax], edx
    setne dl
    mov dword ptr [eax], edx
    add eax, 4
    dec esi
    jne L0
    pop esi
L1:
    push dword ptr [ebp + 24]
    mov eax, dword ptr [ebp + 8]
    push dword ptr [ebp + 16]
    mov ecx, dword ptr [eax]
    push dword ptr [ebp + 12]
    push eax
    call dword ptr [ecx + 0x188]
    pop ebp
    ret 20
FUN_1007e390 ENDP
END
