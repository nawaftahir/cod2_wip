.686
.MODEL FLAT, C
EXTRN sub_10035A87:PROC
EXTRN sub_10035C69:PROC
EXTRN sub_10035C70:PROC
EXTRN sub_10035CBE:PROC
EXTRN sub_10059116:PROC
EXTRN EXTRN fp_101D4B30:DWORD:DWORD
EXTRN EXTRN g_1019BDE8:DWORD:DWORD
EXTRN EXTRN g_101CE818:DWORD:DWORD
.CODE
FUN_10035ac0 PROC
    mov mov eax, 1
    shl shl eax, cl
    mov mov ecx, dword ptr [esp + 4]
    mov mov dl, byte ptr [ecx + 5]
    sub sub esp, 24
    test test al, dl
    jne L0
    mov mov edx, dword ptr [g_101CE818]
    mov mov al, byte ptr [edx + 8]
    test test al, al
    je L3
    push push 0101913C8h
    push push 03F666666h
    mov mov eax, edi
    call sub_10035A87
    add add esp, 8
    mov mov al, 1
    add add esp, 24
    ret ret
    fld fld dword ptr [ebx]
    push push esi
    fsub fsub dword ptr [edi]
    lea lea esi, [esp + 4]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [ebx + 4]
    fsub fsub dword ptr [edi + 4]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [ebx + 8]
    fsub fsub dword ptr [edi + 8]
    fstp fstp dword ptr [esp + 12]
    call sub_10059116
    fstp fstp st(0)
    push push 02001h
    fld fld dword ptr [esp + 8]
    push push 0
    fmul fmul dword ptr [g_1019BDE8]
    push push 010191348h
    push push 010191348h
    lea lea eax, [esp + 32]
    fadd fadd dword ptr [edi]
    push push eax
    push push ebx
    push push 0
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [g_1019BDE8]
    fadd fadd dword ptr [edi + 4]
    fstp fstp dword ptr [esp + 48]
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [g_1019BDE8]
    fadd fadd dword ptr [edi + 8]
    fstp fstp dword ptr [esp + 52]
    call dword ptr [fp_101D4B30]
    add add esp, 28
    test test eax, eax
    pop pop esi
    jne sub_10035C69
    mov mov ecx, dword ptr [g_101CE818]
    mov mov al, byte ptr [ecx + 8]
    test test al, al
    je sub_10035C70
    push push 010191408h
    push push 03F800000h
    mov mov eax, edi
    call L1
    add add esp, 8
    mov mov al, 1
    add add esp, 24
    ret ret
    mov mov edx, dword ptr [g_101CE818]
    mov mov al, byte ptr [edx + 8]
    test test al, al
    je sub_10035CBE
    push push 0101913B8h
    push push 03F8CCCCDh
    mov mov eax, edi
    call L2
    add add esp, 8
    xor xor al, al
    add add esp, 24
    ret ret
FUN_10035ac0 ENDP
END
