.686
.MODEL FLAT, C
EXTRN sub_1002C58D:PROC
EXTRN sub_1002C591:PROC
EXTRN sub_1002C5A8:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BD80:DWORD:DWORD
EXTRN EXTRN g_1019BDB8:DWORD:DWORD
.CODE
FUN_1002c470 PROC
    sub sub esp, 24
    mov mov eax, dword ptr [esi + 16]
    cdq cdq
    sub sub eax, edx
    sar sar eax, 1
    push push ebx
    mov mov ebx, eax
    mov mov eax, dword ptr [esi + 16]
    cdq cdq
    sub sub eax, edx
    neg neg ebx
    sar sar eax, 1
    xor xor ecx, ecx
    cmp cmp ebx, eax
    push push ebp
    mov mov dword ptr [esp + 12], ebx
    jge sub_1002C58D
    mov mov ebp, dword ptr [esi + 12]
    mov mov eax, ebp
    cdq cdq
    sub sub eax, edx
    sar sar eax, 1
    mov mov ebx, eax
    mov mov eax, ebp
    cdq cdq
    sub sub eax, edx
    neg neg ebx
    sar sar eax, 1
    cmp cmp ebx, eax
    jge sub_1002C591
    mov mov eax, dword ptr [esi + 8]
    fld fld dword ptr [g_1019BC84]
    fld fld dword ptr [eax + ecx*4]
    lea lea edx, [eax + ecx*4]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L0
    mov mov dword ptr [edi + ecx*8], 0
    mov mov dword ptr [edi + ecx*8 + 4], 0
    jmp sub_1002C5A8
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [edx]
    fmul fmul dword ptr [g_1019BDB8]
    fstp fstp dword ptr [esp + 16]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 24]
    fld fld dword ptr [esp + 16]
    fadd fadd qword ptr [esp + 24]
    fistp fistp dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 20]
    mov mov ebp, dword ptr [esi + 4]
    and and eax, 03FFh
    lea lea edx, [eax + 0FFh]
    and and edx, 03FFh
    fld fld dword ptr [edx*4 + 0101D6210h]
    fmul fmul dword ptr [ebp + ecx*8]
    fstp fstp dword ptr [edi + ecx*8]
    mov mov edx, dword ptr [esi + 4]
    fld fld dword ptr [eax*4 + 0101D6210h]
    fmul fmul dword ptr [edx + ecx*8 + 4]
    fstp fstp dword ptr [edi + ecx*8 + 4]
    mov mov eax, dword ptr [esi + 12]
    cdq cdq
    sub sub eax, edx
    inc inc ecx
    inc inc ebx
    sar sar eax, 1
    cmp cmp ebx, eax
    jl sub_1002C591
    mov mov eax, dword ptr [esi + 16]
    mov mov ebx, dword ptr [esp + 12]
    cdq cdq
    sub sub eax, edx
    inc inc ebx
    sar sar eax, 1
    cmp cmp ebx, eax
    mov mov dword ptr [esp + 12], ebx
    jl sub_1002C58D
    pop pop ebp
    pop pop ebx
    add add esp, 24
    ret ret
FUN_1002c470 ENDP
END
