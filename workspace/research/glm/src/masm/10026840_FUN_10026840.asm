.686
.MODEL FLAT, C
EXTRN sub_1002661D:PROC
EXTRN g_101D4928:DWORD
.CODE
FUN_10026840 PROC
    mov cx, word ptr [g_101D4928]
    movzx eax, cx
    push edi
    xor edi, edi
    test eax, eax
    jle L3
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 24]
    push esi
L0:
    xor esi, esi
    test eax, eax
    jle L2
    mov edi, edi
L1:
    imul eax, edi
    add eax, esi
    lea ebx, [eax*4 + 18]
    mov eax, dword ptr [esp + 24]
    push ebp
    push eax
    mov eax, dword ptr [esp + 28]
    push edi
    push esi
    call sub_1002661D
    mov ecx, dword ptr [esp + 48]
    mov byte ptr [ecx + ebx + 3], al
    mov cx, word ptr [g_101D4928]
    add esp, 16
    movzx eax, cx
    inc esi
    cmp esi, eax
    jl L1
L2:
    movzx eax, cx
    inc edi
    cmp edi, eax
    jl L0
    pop esi
    pop ebp
    pop ebx
L3:
    pop edi
    ret
FUN_10026840 ENDP
END
