.686
.MODEL FLAT, C
.CODE
FUN_1007dd36 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push edi
    mov edi, dword ptr [ebp + 24]
    mov edx, edi
    shl edx, 2
    je L1
    mov eax, dword ptr [ebp + 20]
    mov ecx, dword ptr [ebp + 16]
    push esi
    sub ecx, eax
    mov esi, edx
L0:
    xor edx, edx
    cmp dword ptr [ecx + eax], edx
    setne dl
    mov dword ptr [ebp + 24], edx
    fild dword ptr [ebp + 24]
    fstp dword ptr [eax]
    add eax, 4
    dec esi
    jne L0
    pop esi
L1:
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax]
    push edi
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    push eax
    call dword ptr [ecx + 0x1b4]
    pop edi
    pop ebp
    ret 20
FUN_1007dd36 ENDP
END
