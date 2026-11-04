.686
.MODEL FLAT, C
EXTRN g_101D4928:DWORD
.CODE
FUN_100267e0 PROC
    mov dx, word ptr [g_101D4928]
    movzx eax, dx
    push ebp
    xor ebp, ebp
    test eax, eax
    jle L3
    push edi
L0:
    xor edi, edi
    test eax, eax
    jle L2
L1:
    imul eax, ebp
    add eax, edi
    shl eax, 2
    mov dl, byte ptr [esi + eax + 2]
    mov byte ptr [ecx + eax + 20], dl
    mov dl, byte ptr [esi + eax + 1]
    mov byte ptr [ecx + eax + 19], dl
    mov dl, byte ptr [eax + esi]
    mov byte ptr [eax + ecx + 18], dl
    mov dl, byte ptr [esi + eax + 3]
    mov byte ptr [ecx + eax + 21], dl
    mov dx, word ptr [g_101D4928]
    movzx eax, dx
    inc edi
    cmp edi, eax
    jl L1
L2:
    movzx eax, dx
    inc ebp
    cmp ebp, eax
    jl L0
    pop edi
L3:
    pop ebp
    ret
FUN_100267e0 ENDP
END
