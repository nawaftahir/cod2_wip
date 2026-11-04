.686
.MODEL FLAT, C
EXTRN sub_1010A9B0:PROC
EXTRN sub_1010A9DC:PROC
EXTRN sub_1010AA08:PROC
EXTRN sub_1010AA34:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_101D61AC:DWORD
EXTRN g_101D61B8:DWORD
EXTRN g_101D61B9:DWORD
EXTRN g_101D61BA:DWORD
EXTRN g_101D61BB:DWORD
EXTRN g_101D61BC:DWORD
EXTRN g_101D61C0:DWORD
EXTRN g_101D61C4:DWORD
EXTRN g_101D61C8:DWORD
EXTRN g_101D61CA:DWORD
EXTRN g_101D61CC:DWORD
EXTRN g_101D61D8:DWORD
EXTRN g_101D61D9:DWORD
EXTRN g_101D61DA:DWORD
EXTRN g_101D61DB:DWORD
EXTRN g_101D61DC:DWORD
EXTRN g_101D61E0:DWORD
EXTRN g_101D61E4:DWORD
EXTRN g_101D61EA:DWORD
EXTRN g_101D61EC:DWORD
EXTRN g_101D61F0:DWORD
EXTRN g_101D61F4:DWORD
EXTRN g_101D61F8:DWORD
EXTRN g_101D61F9:DWORD
EXTRN g_101D61FA:DWORD
EXTRN g_101D61FB:DWORD
EXTRN g_101D61FC:DWORD
EXTRN g_101D6200:DWORD
EXTRN g_101D6204:DWORD
EXTRN g_101D620A:DWORD
EXTRN g_101D620C:DWORD
EXTRN g_101DA9C8:DWORD
EXTRN g_10678504:DWORD
.CODE
FUN_10024080 PROC
    mov ecx, dword ptr [g_10678504]
    mov eax, dword ptr [g_101D61F4]
    sub esp, 8
    cmp ecx, eax
    push esi
    push edi
    jl L0
    mov ecx, 8
    mov esi, 0101D61ECh
    mov edi, 0101D61ACh
    rep movsd dword ptr es:[edi], dword ptr [esi]
    jmp L5
L0:
    mov esi, dword ptr [g_101D61EC]
    cmp dword ptr [g_101D61CC], esi
    je L1
    mov ecx, 8
    mov esi, 0101D61ECh
    mov edi, 0101D61ACh
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov dword ptr [g_101D61F4], 0
    jmp L5
L1:
    mov edx, dword ptr [g_101D61F0]
    sub eax, edx
    test eax, eax
    mov dword ptr [esp + 8], eax
    jg L2
    mov dword ptr [esp + 8], 1
L2:
    sub ecx, edx
    mov dword ptr [esp + 12], ecx
    fild dword ptr [esp + 12]
    fidiv dword ptr [esp + 8]
    fcom dword ptr [g_1019BC78]
    fnstsw ax
    test ah, 65
    jne L3
    fstp st(0)
    fld dword ptr [g_1019BC78]
L3:
    fld dword ptr [g_101D61FC]
    movzx eax, byte ptr [g_101D61D8]
    fsub dword ptr [g_101D61DC]
    movzx ecx, byte ptr [g_101D61F8]
    sub ecx, eax
    fmul st(1)
    mov dword ptr [esp + 12], ecx
    mov dword ptr [esp + 8], eax
    fadd dword ptr [g_101D61DC]
    fstp dword ptr [g_101D61BC]
    fld dword ptr [g_101D6200]
    fsub dword ptr [g_101D61E0]
    fmul st(1)
    fadd dword ptr [g_101D61E0]
    fstp dword ptr [g_101D61C0]
    fld dword ptr [g_101D6204]
    fsub dword ptr [g_101D61E4]
    fmul st(1)
    fadd dword ptr [g_101D61E4]
    fstp dword ptr [g_101D61C4]
    fild dword ptr [esp + 12]
    fmul st(1)
    fiadd dword ptr [esp + 8]
    call sub_1010A9B0
    movzx edx, byte ptr [g_101D61F9]
    mov byte ptr [g_101D61B8], al
    movzx eax, byte ptr [g_101D61D9]
    sub edx, eax
    mov dword ptr [esp + 12], edx
    mov dword ptr [esp + 8], eax
    fild dword ptr [esp + 12]
    fmul st(1)
    fiadd dword ptr [esp + 8]
    call sub_1010A9DC
    movzx ecx, byte ptr [g_101D61FA]
    mov byte ptr [g_101D61B9], al
    movzx eax, byte ptr [g_101D61DA]
    sub ecx, eax
    mov dword ptr [esp + 12], ecx
    mov dword ptr [esp + 8], eax
    fild dword ptr [esp + 12]
    fmul st(1)
    fiadd dword ptr [esp + 8]
    call sub_1010AA08
    movzx edx, byte ptr [g_101D61FB]
    mov byte ptr [g_101D61BA], al
    movzx eax, byte ptr [g_101D61DB]
    sub edx, eax
    mov dword ptr [esp + 12], edx
    mov dword ptr [esp + 8], eax
    fild dword ptr [esp + 12]
    fmul st(1)
    fiadd dword ptr [esp + 8]
    call sub_1010AA34
    fstp st(0)
    mov byte ptr [g_101D61BB], al
    mov al, byte ptr [g_101D620A]
    test al, al
    mov dword ptr [g_101D61AC], esi
    mov byte ptr [g_101D61C8], 1
    jne L4
    mov al, byte ptr [g_101D61EA]
    test al, al
    mov byte ptr [g_101D61CA], 0
    je L5
L4:
    mov byte ptr [g_101D61CA], 1
L5:
    mov eax, dword ptr [g_101D620C]
    test eax, eax
    je L6
    mov edi, dword ptr [g_101DA9C8]
    add edi, 000219CECh
    mov ecx, 8
    mov esi, 0101D61ACh
    rep movsd dword ptr es:[edi], dword ptr [esi]
    pop edi
    pop esi
    add esp, 8
    ret
L6:
    mov eax, dword ptr [g_101DA9C8]
    pop edi
    mov dword ptr [eax + 000219CECh], 0
    pop esi
    add esp, 8
    ret
FUN_10024080 ENDP
END
