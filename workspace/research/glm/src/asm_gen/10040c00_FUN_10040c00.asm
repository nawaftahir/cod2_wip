; FUN_10040c00 @ 0x10040c00 — auto-synthesized
    EXTRN g_1019bdb4:DWORD
    EXTRN g_101ce6a8:DWORD
    EXTRN g_101ce708:DWORD
    sub_10040612 PROTO C
    sub_100409a6 PROTO C
.CODE
FUN_10040c00 PROC
    push ecx
    fld dword ptr [ecx + 0x48]
    push ebx
    fsub dword ptr [ecx + 0x3c]
    push esi
    fld dword ptr [ecx + 0x4c]
    lea esi, [ecx + 0x48]
    fsub dword ptr [ecx + 0x40]
    lea ebx, [ecx + 0x3c]
    fld dword ptr [esi + 8]
    mov al, byte ptr [ecx + 0x58]
    fsub dword ptr [ebx + 8]
    mov dl, byte ptr [ecx + 0x59]
    mov byte ptr [esp + 0xa], al
    mov al, byte ptr [ecx + 0x5a]
    fld st(0)
    mov cl, byte ptr [ecx + 0x5b]
    fmul st(1)
    mov byte ptr [esp + 9], dl
    fld st(2)
    mov edx, dword ptr [g_101ce708]
    fmul st(3)
    mov byte ptr [esp + 8], al
    mov eax, dword ptr [edx + 8]
    mov byte ptr [esp + 0xb], cl
    faddp st(1)
    cmp eax, 2
    fld st(3)
    mov eax, dword ptr [esp + 8]
    fmul st(4)
    push ecx
    mov ecx, dword ptr [g_101ce6a8]
    mov edx, dword ptr [ecx + 8]
    faddp st(1)
    fsqrt
    fstp st(3)
    fstp st(0)
    fstp st(0)
    fmul dword ptr [g_1019bdb4]
    fstp dword ptr [esp]
    push 0x3f800000
    push 0
    push 0
    push eax
    mov eax, esi
    push edx
    jne L0
    call sub_100409a6
    add esp, 0x18
    pop esi
    pop ebx
    pop ecx
    ret
    call sub_10040612
    add esp, 0x18
    pop esi
    pop ebx
    pop ecx
    ret
FUN_10040c00 ENDP
END