.686
.MODEL FLAT, C
EXTRN sub_1003EE33:PROC
EXTRN sub_10040D3A:PROC
EXTRN sub_10040DE5:PROC
EXTRN sub_10059118:PROC
EXTRN g_1019BD54:DWORD
EXTRN g_1072DD00:DWORD
EXTRN g_1072DD04:DWORD
EXTRN g_1072DD08:DWORD
EXTRN g_1072DD0C:DWORD
EXTRN g_1072DD10:DWORD
EXTRN g_1072DD14:DWORD
EXTRN g_1072DD18:DWORD
EXTRN g_1072DD1C:DWORD
.CODE
FUN_10040df0 PROC
    fld dword ptr [edi + 104]
    sub esp, 32
    fld dword ptr [edi + 100]
    push ebx
    fucompp
    push esi
    fnstsw ax
    test ah, 68
    jnp L0
    lea esi, [edi + 72]
    lea ebx, [edi + 60]
    mov ecx, esi
    mov eax, ebx
    call sub_1003EE33
    test eax, eax
    je L1
L0:
    mov eax, dword ptr [edi + 104]
    fld dword ptr [edi + 100]
    mov dword ptr [esp + 28], 0
    mov dword ptr [esp + 32], 0
    mov dword ptr [esp + 36], eax
    jmp L2
L1:
    fld dword ptr [esi]
    fsub dword ptr [ebx]
    fstp dword ptr [esp + 12]
    fld dword ptr [esi + 4]
    fsub dword ptr [ebx + 4]
    fstp dword ptr [esp + 16]
    fld dword ptr [esi + 8]
    lea esi, [esp + 12]
    fsub dword ptr [ebx + 8]
    fstp dword ptr [esp + 20]
    call sub_10059118
    fstp st(0)
    lea edx, [esp + 12]
    fld dword ptr [edi + 104]
    lea eax, [esp + 24]
    fld dword ptr [esp + 12]
    fmul st(1)
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 16]
    fmul st(1)
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 20]
    fmul st(1)
    fstp dword ptr [esp + 32]
    fstp st(0)
    call sub_10040D3A
    lea ecx, [esp + 24]
    mov esi, edi
    call sub_10040DE5
    fld dword ptr [esp + 24]
L2:
    mov edx, dword ptr [esp + 32]
    fstp dword ptr [g_1072DD10]
    mov eax, dword ptr [esp + 36]
    mov ecx, dword ptr [esp + 28]
    mov dword ptr [g_1072DD18], edx
    mov dword ptr [g_1072DD1C], eax
    mov dword ptr [g_1072DD14], ecx
    movzx ecx, byte ptr [edi + 88]
    movzx edx, byte ptr [edi + 89]
    movzx eax, byte ptr [edi + 90]
    mov dword ptr [esp + 8], ecx
    movzx ecx, byte ptr [edi + 91]
    fild dword ptr [esp + 8]
    mov dword ptr [esp + 8], edx
    pop esi
    fmul dword ptr [g_1019BD54]
    pop ebx
    fild dword ptr [esp]
    mov dword ptr [esp], eax
    fmul dword ptr [g_1019BD54]
    fild dword ptr [esp]
    mov dword ptr [esp], ecx
    fmul dword ptr [g_1019BD54]
    fstp dword ptr [esp + 24]
    mov edx, dword ptr [esp + 24]
    fild dword ptr [esp]
    mov dword ptr [g_1072DD08], edx
    fmul dword ptr [g_1019BD54]
    fstp dword ptr [esp + 28]
    mov eax, dword ptr [esp + 28]
    fxch st(1)
    mov dword ptr [g_1072DD0C], eax
    fstp dword ptr [g_1072DD00]
    fstp dword ptr [g_1072DD04]
    add esp, 32
    ret
FUN_10040df0 ENDP
END
