.686
.MODEL FLAT, C
EXTRN sub_10024298:PROC
EXTRN sub_100243E2:PROC
EXTRN sub_100243F9:PROC
EXTRN sub_10024430:PROC
EXTRN sub_1010A9B0:PROC
EXTRN sub_1010A9DC:PROC
EXTRN sub_1010AA08:PROC
EXTRN sub_1010AA34:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_101D61AC:DWORD:DWORD
EXTRN EXTRN g_101D61B8:DWORD:DWORD
EXTRN EXTRN g_101D61B9:DWORD:DWORD
EXTRN EXTRN g_101D61BA:DWORD:DWORD
EXTRN EXTRN g_101D61BB:DWORD:DWORD
EXTRN EXTRN g_101D61BC:DWORD:DWORD
EXTRN EXTRN g_101D61C0:DWORD:DWORD
EXTRN EXTRN g_101D61C4:DWORD:DWORD
EXTRN EXTRN g_101D61C8:DWORD:DWORD
EXTRN EXTRN g_101D61CA:DWORD:DWORD
EXTRN EXTRN g_101D61CC:DWORD:DWORD
EXTRN EXTRN g_101D61D8:DWORD:DWORD
EXTRN EXTRN g_101D61D9:DWORD:DWORD
EXTRN EXTRN g_101D61DA:DWORD:DWORD
EXTRN EXTRN g_101D61DB:DWORD:DWORD
EXTRN EXTRN g_101D61DC:DWORD:DWORD
EXTRN EXTRN g_101D61E0:DWORD:DWORD
EXTRN EXTRN g_101D61E4:DWORD:DWORD
EXTRN EXTRN g_101D61EA:DWORD:DWORD
EXTRN EXTRN g_101D61EC:DWORD:DWORD
EXTRN EXTRN g_101D61F0:DWORD:DWORD
EXTRN EXTRN g_101D61F4:DWORD:DWORD
EXTRN EXTRN g_101D61F8:DWORD:DWORD
EXTRN EXTRN g_101D61F9:DWORD:DWORD
EXTRN EXTRN g_101D61FA:DWORD:DWORD
EXTRN EXTRN g_101D61FB:DWORD:DWORD
EXTRN EXTRN g_101D61FC:DWORD:DWORD
EXTRN EXTRN g_101D6200:DWORD:DWORD
EXTRN EXTRN g_101D6204:DWORD:DWORD
EXTRN EXTRN g_101D620A:DWORD:DWORD
EXTRN EXTRN g_101D620C:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
EXTRN EXTRN g_10678504:DWORD:DWORD
.CODE
FUN_10024080 PROC
    mov mov ecx, dword ptr [g_10678504]
    mov mov eax, dword ptr [g_101D61F4]
    sub sub esp, 8
    cmp cmp ecx, eax
    push push esi
    push push edi
    jl L0
    mov mov ecx, 8
    mov mov esi, 0101D61ECh
    mov mov edi, 0101D61ACh
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    jmp L4
    mov mov esi, dword ptr [g_101D61EC]
    cmp cmp dword ptr [g_101D61CC], esi
    je L1
    mov mov ecx, 8
    mov mov esi, 0101D61ECh
    mov mov edi, 0101D61ACh
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov dword ptr [g_101D61F4], 0
    jmp sub_10024298
    mov mov edx, dword ptr [g_101D61F0]
    sub sub eax, edx
    test test eax, eax
    mov mov dword ptr [esp + 8], eax
    jg L2
    mov mov dword ptr [esp + 8], 1
    sub sub ecx, edx
    mov mov dword ptr [esp + 12], ecx
    fild fild dword ptr [esp + 12]
    fidiv fidiv dword ptr [esp + 8]
    fcom fcom dword ptr [g_1019BC78]
    fnstsw fnstsw ax
    test test ah, 65
    jne L3
    fstp fstp st(0)
    fld fld dword ptr [g_1019BC78]
    fld fld dword ptr [g_101D61FC]
    movzx movzx eax, byte ptr [g_101D61D8]
    fsub fsub dword ptr [g_101D61DC]
    movzx movzx ecx, byte ptr [g_101D61F8]
    sub sub ecx, eax
    fmul fmul st(1)
    mov mov dword ptr [esp + 12], ecx
    mov mov dword ptr [esp + 8], eax
    fadd fadd dword ptr [g_101D61DC]
    fstp fstp dword ptr [g_101D61BC]
    fld fld dword ptr [g_101D6200]
    fsub fsub dword ptr [g_101D61E0]
    fmul fmul st(1)
    fadd fadd dword ptr [g_101D61E0]
    fstp fstp dword ptr [g_101D61C0]
    fld fld dword ptr [g_101D6204]
    fsub fsub dword ptr [g_101D61E4]
    fmul fmul st(1)
    fadd fadd dword ptr [g_101D61E4]
    fstp fstp dword ptr [g_101D61C4]
    fild fild dword ptr [esp + 12]
    fmul fmul st(1)
    fiadd fiadd dword ptr [esp + 8]
    call sub_1010A9B0
    movzx movzx edx, byte ptr [g_101D61F9]
    mov mov byte ptr [g_101D61B8], al
    movzx movzx eax, byte ptr [g_101D61D9]
    sub sub edx, eax
    mov mov dword ptr [esp + 12], edx
    mov mov dword ptr [esp + 8], eax
    fild fild dword ptr [esp + 12]
    fmul fmul st(1)
    fiadd fiadd dword ptr [esp + 8]
    call sub_1010A9DC
    movzx movzx ecx, byte ptr [g_101D61FA]
    mov mov byte ptr [g_101D61B9], al
    movzx movzx eax, byte ptr [g_101D61DA]
    sub sub ecx, eax
    mov mov dword ptr [esp + 12], ecx
    mov mov dword ptr [esp + 8], eax
    fild fild dword ptr [esp + 12]
    fmul fmul st(1)
    fiadd fiadd dword ptr [esp + 8]
    call sub_1010AA08
    movzx movzx edx, byte ptr [g_101D61FB]
    mov mov byte ptr [g_101D61BA], al
    movzx movzx eax, byte ptr [g_101D61DB]
    sub sub edx, eax
    mov mov dword ptr [esp + 12], edx
    mov mov dword ptr [esp + 8], eax
    fild fild dword ptr [esp + 12]
    fmul fmul st(1)
    fiadd fiadd dword ptr [esp + 8]
    call sub_1010AA34
    fstp fstp st(0)
    mov mov byte ptr [g_101D61BB], al
    mov mov al, byte ptr [g_101D620A]
    test test al, al
    mov mov dword ptr [g_101D61AC], esi
    mov mov byte ptr [g_101D61C8], 1
    jne sub_100243E2
    mov mov al, byte ptr [g_101D61EA]
    test test al, al
    mov mov byte ptr [g_101D61CA], 0
    je sub_100243F9
    mov mov byte ptr [g_101D61CA], 1
    mov mov eax, dword ptr [g_101D620C]
    test test eax, eax
    je sub_10024430
    mov mov edi, dword ptr [g_101DA9C8]
    add add edi, 0219CECh
    mov mov ecx, 8
    mov mov esi, 0101D61ACh
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    pop pop edi
    pop pop esi
    add add esp, 8
    ret ret
    mov mov eax, dword ptr [g_101DA9C8]
    pop pop edi
    mov mov dword ptr [eax + 0219CECh], 0
    pop pop esi
    add add esp, 8
    ret ret
FUN_10024080 ENDP
END
