.686
.MODEL FLAT, C
.CODE
FUN_10048cd0 PROC
    mov ecx, dword ptr [esp + 12]
    push ebp
    mov ebp, dword ptr [esp + 20]
    sub ebp, ecx
    test ebp, ebp
    jle L2
    mov eax, dword ptr [esp + 12]
    push esi
    xor esi, esi
    test eax, eax
    jle L1
    push ebx
    push edi
    lea esp, [esp]
L0:
    mov eax, dword ptr [esp + 20]
    mov edi, dword ptr [eax + esi*4]
    add edi, dword ptr [esp + 28]
    mov al, byte ptr [edi - 1]
    mov bl, al
    mov bh, bl
    mov ecx, ebp
    mov edx, ecx
    shr ecx, 2
    mov eax, ebx
    shl eax, 16
    mov ax, bx
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov eax, dword ptr [esp + 24]
    inc esi
    cmp esi, eax
    jl L0
    pop edi
    pop ebx
L1:
    pop esi
L2:
    pop ebp
    ret
FUN_10048cd0 ENDP
END
