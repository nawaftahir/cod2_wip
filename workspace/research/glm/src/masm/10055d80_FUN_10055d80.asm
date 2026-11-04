.686
.MODEL FLAT, C
.CODE
FUN_10055d80 PROC
    push ebx
    push ebp
    push esi
    push edi
    push 000000400h
    mov esi, ecx
    mov ecx, dword ptr [eax + 4]
    push 1
    push eax
    call dword ptr [ecx]
    shl esi, 9
    add esp, 12
    sub esi, 000000200h
    mov ebp, eax
    mov ebx, esi
    mov edi, 0101910F0h
    mov esi, ebp
    lea ebx, [ebx]
    xor ecx, ecx
    jmp L0
    lea esp, [esp]
    jmp L0
    lea ecx, [ecx]
L0:
    movzx edx, byte ptr [edi + ecx]
    imul edx, edx, 0000001FEh
    mov eax, 00000FE01h
    sub eax, edx
    cdq
    idiv ebx
    inc ecx
    add esi, 4
    cmp ecx, 16
    mov dword ptr [esi - 4], eax
    jl L0
    add edi, 16
FUN_10055d80 ENDP
END
