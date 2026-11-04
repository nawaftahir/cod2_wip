.686
.MODEL FLAT, C
EXTRN sub_1003528B:PROC
EXTRN sub_1003559D:PROC
EXTRN g_1019BC80:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_1019BD58:DWORD
EXTRN g_101D1BD4:DWORD
EXTRN g_101D4C80:DWORD
EXTRN g_1072DDC8:DWORD
.CODE
FUN_10035620 PROC
    fld dword ptr [g_1019BC84]
    sub esp, 0000009A0h
    fld dword ptr [esp + 0000009A4h]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L2
    mov eax, dword ptr [g_1072DDC8]
    mov ecx, dword ptr [eax + 60]
    fild dword ptr [eax + 60]
    test ecx, ecx
    jge L0
    fadd dword ptr [g_1019BC80]
L0:
    fmul dword ptr [esp + 0000009A4h]
    lea ecx, [esi + esi*4]
    mov ecx, dword ptr [ecx*4 + 0101D4820h]
    lea eax, [edi + edi*4]
    fmul dword ptr [g_1019BD58]
    shl eax, 2
    mov edx, dword ptr [eax + 0101D482Ch]
    mov eax, dword ptr [eax + 0101D4830h]
    fstp dword ptr [esp + 4]
    fld dword ptr [g_101D4C80]
    mov dword ptr [esp + 00000098Ch], ecx
    fmul dword ptr [esp + 4]
    xor ecx, ecx
    cmp esi, 2
    mov dword ptr [esp + 000000994h], 11
    fstp dword ptr [esp]
    mov dword ptr [esp + 000000998h], 12
    mov dword ptr [esp + 000000990h], edi
    mov dword ptr [esp + 8], ecx
    jne L1
    mov dword ptr [esp + 32], ecx
    mov ecx, dword ptr [g_101D1BD4]
    mov dword ptr [esp + 12], ecx
    mov ecx, 1
    mov dword ptr [esp + 16], 03F800000h
    mov dword ptr [esp + 20], 03F800000h
    mov dword ptr [esp + 24], edx
    mov dword ptr [esp + 28], eax
    mov dword ptr [esp + 8], ecx
L1:
    imul ecx, ecx, 000000098h
    lea ecx, [esp + ecx + 12]
    push ecx
    push eax
    push edx
    push eax
    mov eax, dword ptr [esp + 16]
    push edx
    mov edx, dword ptr [esp + 24]
    push edx
    push eax
    call sub_1003528B
    mov ecx, dword ptr [esp + 36]
    add esp, 28
    add ecx, eax
    mov dword ptr [esp + 8], ecx
    jne L3
L2:
    mov eax, esi
    add esp, 0000009A0h
    ret
L3:
    lea ecx, [esp + 8]
    push ecx
    call sub_1003559D
    add esp, 4
    mov eax, edi
    add esp, 0000009A0h
    ret
FUN_10035620 ENDP
END
