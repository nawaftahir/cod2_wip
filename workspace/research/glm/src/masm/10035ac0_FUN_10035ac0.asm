.686
.MODEL FLAT, C
EXTRN sub_10035A87:PROC
EXTRN sub_10035B2F:PROC
EXTRN sub_10035B56:PROC
EXTRN sub_10059116:PROC
EXTRN fp_101D4B30:DWORD
EXTRN g_1019BDE8:DWORD
EXTRN g_101CE818:DWORD
.CODE
FUN_10035ac0 PROC
    mov eax, 1
    shl eax, cl
    mov ecx, dword ptr [esp + 4]
    mov dl, byte ptr [ecx + 5]
    sub esp, 24
    test al, dl
    jne L0
    mov edx, dword ptr [g_101CE818]
    mov al, byte ptr [edx + 8]
    test al, al
    je L1
    push 0101913C8h
    push 03F666666h
    mov eax, edi
    call sub_10035A87
    add esp, 8
    mov al, 1
    add esp, 24
    ret
L0:
    fld dword ptr [ebx]
    push esi
    fsub dword ptr [edi]
    lea esi, [esp + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [ebx + 4]
    fsub dword ptr [edi + 4]
    fstp dword ptr [esp + 8]
    fld dword ptr [ebx + 8]
    fsub dword ptr [edi + 8]
    fstp dword ptr [esp + 12]
    call sub_10059116
    fstp st(0)
    push 000002001h
    fld dword ptr [esp + 8]
    push 0
    fmul dword ptr [g_1019BDE8]
    push 010191348h
    push 010191348h
    lea eax, [esp + 32]
    fadd dword ptr [edi]
    push eax
    push ebx
    push 0
    fstp dword ptr [esp + 44]
    fld dword ptr [esp + 36]
    fmul dword ptr [g_1019BDE8]
    fadd dword ptr [edi + 4]
    fstp dword ptr [esp + 48]
    fld dword ptr [esp + 40]
    fmul dword ptr [g_1019BDE8]
    fadd dword ptr [edi + 8]
    fstp dword ptr [esp + 52]
    call dword ptr [fp_101D4B30]
    add esp, 28
    test eax, eax
    pop esi
    jne L2
    mov ecx, dword ptr [g_101CE818]
    mov al, byte ptr [ecx + 8]
    test al, al
    je L1
    push 010191408h
    push 03F800000h
    mov eax, edi
    call sub_10035B2F
    add esp, 8
L1:
    mov al, 1
    add esp, 24
    ret
L2:
    mov edx, dword ptr [g_101CE818]
    mov al, byte ptr [edx + 8]
    test al, al
    je L3
    push 0101913B8h
    push 03F8CCCCDh
    mov eax, edi
    call sub_10035B56
    add esp, 8
L3:
    xor al, al
    add esp, 24
    ret
FUN_10035ac0 ENDP
END
