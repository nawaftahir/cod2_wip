.686
.MODEL FLAT, C
.CODE
FUN_1007da98 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ecx + 20]
    test edx, edx
    je L0
    mov ax, word ptr [ecx + 8]
    neg ax
    push esi
    movzx esi, word ptr [ecx + 12]
    push esi
    mov esi, dword ptr [ecx]
    mov esi, dword ptr [esi + 8]
    push dword ptr [ecx + 32]
    sbb eax, eax
    and eax, 3
    inc eax
    imul eax, dword ptr [ebp + 12]
    shl eax, 2
    add esi, edx
    add esi, eax
    movzx eax, word ptr [ecx + 10]
    add eax, dword ptr [ebp + 12]
    push esi
    push eax
    push dword ptr [ebp + 8]
    call dword ptr [ecx + 0x1c]
    test eax, eax
    pop esi
    jl L1
L0:
    xor eax, eax
L1:
    pop ebp
    ret 8
FUN_1007da98 ENDP
END
