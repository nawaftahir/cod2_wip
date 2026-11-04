.686
.MODEL FLAT, C
EXTRN sub_10040612:PROC
EXTRN sub_100409A6:PROC
EXTRN g_1019BDB4:DWORD
EXTRN g_101CE6A8:DWORD
EXTRN g_101CE708:DWORD
.CODE
FUN_10040c00 PROC
    push ecx
    fld dword ptr [ecx + 72]
    push ebx
    fsub dword ptr [ecx + 60]
    push esi
    fld dword ptr [ecx + 76]
    lea esi, [ecx + 72]
    fsub dword ptr [ecx + 64]
    lea ebx, [ecx + 60]
    fld dword ptr [esi + 8]
    mov al, byte ptr [ecx + 88]
    fsub dword ptr [ebx + 8]
    mov dl, byte ptr [ecx + 89]
    mov byte ptr [esp + 10], al
    mov al, byte ptr [ecx + 90]
    fld st(0)
    mov cl, byte ptr [ecx + 91]
    fmul st(1)
    mov byte ptr [esp + 9], dl
    fld st(2)
    mov edx, dword ptr [g_101CE708]
    fmul st(3)
    mov byte ptr [esp + 8], al
    mov eax, dword ptr [edx + 8]
    mov byte ptr [esp + 11], cl
    faddp st(1)
    cmp eax, 2
    fld st(3)
    mov eax, dword ptr [esp + 8]
    fmul st(4)
    push ecx
    mov ecx, dword ptr [g_101CE6A8]
    mov edx, dword ptr [ecx + 8]
    faddp st(1)
    fsqrt
    fstp st(3)
    fstp st(0)
    fstp st(0)
    fmul dword ptr [g_1019BDB4]
    fstp dword ptr [esp]
    push 03F800000h
    push 0
    push 0
    push eax
    mov eax, esi
    push edx
    jne L0
    call sub_100409A6
    add esp, 24
    pop esi
    pop ebx
    pop ecx
    ret
L0:
    call sub_10040612
    add esp, 24
    pop esi
    pop ebx
    pop ecx
    ret
FUN_10040c00 ENDP
END
