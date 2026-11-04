.686
.MODEL FLAT, C
EXTRN sub_1003EE33:PROC
EXTRN sub_10040D3A:PROC
EXTRN sub_10040DE5:PROC
EXTRN sub_10059118:PROC
EXTRN EXTRN g_1019BD54:DWORD:DWORD
EXTRN EXTRN g_1072DD00:DWORD:DWORD
EXTRN EXTRN g_1072DD04:DWORD:DWORD
EXTRN EXTRN g_1072DD08:DWORD:DWORD
EXTRN EXTRN g_1072DD0C:DWORD:DWORD
EXTRN EXTRN g_1072DD10:DWORD:DWORD
EXTRN EXTRN g_1072DD14:DWORD:DWORD
EXTRN EXTRN g_1072DD18:DWORD:DWORD
EXTRN EXTRN g_1072DD1C:DWORD:DWORD
.CODE
FUN_10040df0 PROC
    fld fld dword ptr [edi + 104]
    sub sub esp, 32
    fld fld dword ptr [edi + 100]
    push push ebx
    fucompp fucompp
    push push esi
    fnstsw fnstsw ax
    test test ah, 68
    jnp L0
    lea lea esi, [edi + 72]
    lea lea ebx, [edi + 60]
    mov mov ecx, esi
    mov mov eax, ebx
    call sub_1003EE33
    test test eax, eax
    je L1
    mov mov eax, dword ptr [edi + 104]
    fld fld dword ptr [edi + 100]
    mov mov dword ptr [esp + 28], 0
    mov mov dword ptr [esp + 32], 0
    mov mov dword ptr [esp + 36], eax
    jmp L2
    fld fld dword ptr [esi]
    fsub fsub dword ptr [ebx]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esi + 4]
    fsub fsub dword ptr [ebx + 4]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esi + 8]
    lea lea esi, [esp + 12]
    fsub fsub dword ptr [ebx + 8]
    fstp fstp dword ptr [esp + 20]
    call sub_10059118
    fstp fstp st(0)
L1:
    lea lea edx, [esp + 12]
    fld fld dword ptr [edi + 104]
    lea lea eax, [esp + 24]
    fld fld dword ptr [esp + 12]
    fmul fmul st(1)
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 16]
    fmul fmul st(1)
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [esp + 20]
    fmul fmul st(1)
    fstp fstp dword ptr [esp + 32]
    fstp fstp st(0)
    call sub_10040D3A
    lea lea ecx, [esp + 24]
    mov mov esi, edi
    call sub_10040DE5
    fld fld dword ptr [esp + 24]
    mov mov edx, dword ptr [esp + 32]
    fstp fstp dword ptr [g_1072DD10]
    mov mov eax, dword ptr [esp + 36]
    mov mov ecx, dword ptr [esp + 28]
    mov mov dword ptr [g_1072DD18], edx
    mov mov dword ptr [g_1072DD1C], eax
    mov mov dword ptr [g_1072DD14], ecx
    movzx movzx ecx, byte ptr [edi + 88]
    movzx movzx edx, byte ptr [edi + 89]
    movzx movzx eax, byte ptr [edi + 90]
    mov mov dword ptr [esp + 8], ecx
    movzx movzx ecx, byte ptr [edi + 91]
    fild fild dword ptr [esp + 8]
    mov mov dword ptr [esp + 8], edx
    pop pop esi
    fmul fmul dword ptr [g_1019BD54]
    pop pop ebx
    fild fild dword ptr [esp]
    mov mov dword ptr [esp], eax
    fmul fmul dword ptr [g_1019BD54]
    fild fild dword ptr [esp]
    mov mov dword ptr [esp], ecx
    fmul fmul dword ptr [g_1019BD54]
    fstp fstp dword ptr [esp + 24]
    mov mov edx, dword ptr [esp + 24]
    fild fild dword ptr [esp]
    mov mov dword ptr [g_1072DD08], edx
    fmul fmul dword ptr [g_1019BD54]
    fstp fstp dword ptr [esp + 28]
    mov mov eax, dword ptr [esp + 28]
    fxch fxch st(1)
    mov mov dword ptr [g_1072DD0C], eax
    fstp fstp dword ptr [g_1072DD00]
    fstp fstp dword ptr [g_1072DD04]
    add add esp, 32
    ret ret
FUN_10040df0 ENDP
END
