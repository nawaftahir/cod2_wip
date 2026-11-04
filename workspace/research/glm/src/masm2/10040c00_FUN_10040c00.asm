.686
.MODEL FLAT, C
EXTRN sub_10040612:PROC
EXTRN sub_100409A6:PROC
EXTRN sub_10040D0E:PROC
EXTRN EXTRN g_1019BDB4:DWORD:DWORD
EXTRN EXTRN g_101CE6A8:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
.CODE
FUN_10040c00 PROC
    push push ecx
    fld fld dword ptr [ecx + 72]
    push push ebx
    fsub fsub dword ptr [ecx + 60]
    push push esi
    fld fld dword ptr [ecx + 76]
    lea lea esi, [ecx + 72]
    fsub fsub dword ptr [ecx + 64]
    lea lea ebx, [ecx + 60]
    fld fld dword ptr [esi + 8]
    mov mov al, byte ptr [ecx + 88]
    fsub fsub dword ptr [ebx + 8]
    mov mov dl, byte ptr [ecx + 89]
    mov mov byte ptr [esp + 10], al
    mov mov al, byte ptr [ecx + 90]
    fld fld st(0)
    mov mov cl, byte ptr [ecx + 91]
    fmul fmul st(1)
    mov mov byte ptr [esp + 9], dl
    fld fld st(2)
    mov mov edx, dword ptr [g_101CE708]
    fmul fmul st(3)
    mov mov byte ptr [esp + 8], al
    mov mov eax, dword ptr [edx + 8]
    mov mov byte ptr [esp + 11], cl
    faddp faddp st(1)
    cmp cmp eax, 2
    fld fld st(3)
    mov mov eax, dword ptr [esp + 8]
    fmul fmul st(4)
    push push ecx
    mov mov ecx, dword ptr [g_101CE6A8]
    mov mov edx, dword ptr [ecx + 8]
    faddp faddp st(1)
    fsqrt fsqrt
    fstp fstp st(3)
    fstp fstp st(0)
    fstp fstp st(0)
    fmul fmul dword ptr [g_1019BDB4]
    fstp fstp dword ptr [esp]
    push push 03F800000h
    push push 0
    push push 0
    push push eax
    mov mov eax, esi
    push push edx
    jne sub_10040D0E
    call sub_100409A6
    add add esp, 24
    pop pop esi
    pop pop ebx
    pop pop ecx
    ret ret
    call sub_10040612
    add add esp, 24
    pop pop esi
    pop pop ebx
    pop pop ecx
    ret ret
FUN_10040c00 ENDP
END
