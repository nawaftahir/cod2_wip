.686
.MODEL FLAT, C
EXTRN g_1019BC84:DWORD
EXTRN g_1019BD80:DWORD
EXTRN g_1019BDB8:DWORD
.CODE
FUN_1002c470 PROC
    sub esp, 24
    mov eax, dword ptr [esi + 16]
    cdq
    sub eax, edx
    sar eax, 1
    push ebx
    mov ebx, eax
    mov eax, dword ptr [esi + 16]
    cdq
    sub eax, edx
    neg ebx
    sar eax, 1
    xor ecx, ecx
    cmp ebx, eax
    push ebp
    mov dword ptr [esp + 12], ebx
    jge L5
L0:
    mov ebp, dword ptr [esi + 12]
    mov eax, ebp
    cdq
    sub eax, edx
    sar eax, 1
    mov ebx, eax
    mov eax, ebp
    cdq
    sub eax, edx
    neg ebx
    sar eax, 1
    cmp ebx, eax
    jge L4
L1:
    mov eax, dword ptr [esi + 8]
    fld dword ptr [g_1019BC84]
    fld dword ptr [eax + ecx*4]
    lea edx, [eax + ecx*4]
    fucompp
    fnstsw ax
    test ah, 68
    jp L2
    mov dword ptr [edi + ecx*8], 0
    mov dword ptr [edi + ecx*8 + 4], 0
    jmp L3
L2:
    fld dword ptr [esp + 36]
    fmul dword ptr [edx]
    fmul dword ptr [g_1019BDB8]
    fstp dword ptr [esp + 16]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 24]
    fld dword ptr [esp + 16]
    fadd qword ptr [esp + 24]
    fistp dword ptr [esp + 20]
    mov eax, dword ptr [esp + 20]
    mov ebp, dword ptr [esi + 4]
    and eax, 0000003FFh
    lea edx, [eax + 0000000FFh]
    and edx, 0000003FFh
    fld dword ptr [edx*4 + 0101D6210h]
    fmul dword ptr [ebp + ecx*8]
    fstp dword ptr [edi + ecx*8]
    mov edx, dword ptr [esi + 4]
    fld dword ptr [eax*4 + 0101D6210h]
    fmul dword ptr [edx + ecx*8 + 4]
    fstp dword ptr [edi + ecx*8 + 4]
L3:
    mov eax, dword ptr [esi + 12]
    cdq
    sub eax, edx
    inc ecx
    inc ebx
    sar eax, 1
    cmp ebx, eax
    jl L1
L4:
    mov eax, dword ptr [esi + 16]
    mov ebx, dword ptr [esp + 12]
    cdq
    sub eax, edx
    inc ebx
    sar eax, 1
    cmp ebx, eax
    mov dword ptr [esp + 12], ebx
    jl L0
L5:
    pop ebp
    pop ebx
    add esp, 24
    ret
FUN_1002c470 ENDP
END
