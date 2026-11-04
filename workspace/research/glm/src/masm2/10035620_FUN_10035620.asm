.686
.MODEL FLAT, C
EXTRN sub_1003528B:PROC
EXTRN sub_1003559D:PROC
EXTRN sub_1003573A:PROC
EXTRN sub_1003578B:PROC
EXTRN sub_1003581D:PROC
EXTRN EXTRN g_1019BC80:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BD58:DWORD:DWORD
EXTRN EXTRN g_101D1BD4:DWORD:DWORD
EXTRN EXTRN g_101D4C80:DWORD:DWORD
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
.CODE
FUN_10035620 PROC
    fld fld dword ptr [g_1019BC84]
    sub sub esp, 09A0h
    fld fld dword ptr [esp + 09A4h]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_1003573A
    mov mov eax, dword ptr [g_1072DDC8]
    mov mov ecx, dword ptr [eax + 60]
    fild fild dword ptr [eax + 60]
    test test ecx, ecx
    jge L0
    fadd fadd dword ptr [g_1019BC80]
    fmul fmul dword ptr [esp + 09A4h]
    lea lea ecx, [esi + esi*4]
    mov mov ecx, dword ptr [ecx*4 + 0101D4820h]
    lea lea eax, [edi + edi*4]
    fmul fmul dword ptr [g_1019BD58]
    shl shl eax, 2
    mov mov edx, dword ptr [eax + 0101D482Ch]
    mov mov eax, dword ptr [eax + 0101D4830h]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [g_101D4C80]
    mov mov dword ptr [esp + 098Ch], ecx
    fmul fmul dword ptr [esp + 4]
    xor xor ecx, ecx
    cmp cmp esi, 2
    mov mov dword ptr [esp + 0994h], 11
    fstp fstp dword ptr [esp]
    mov mov dword ptr [esp + 0998h], 12
    mov mov dword ptr [esp + 0990h], edi
    mov mov dword ptr [esp + 8], ecx
    jne sub_1003578B
    mov mov dword ptr [esp + 32], ecx
    mov mov ecx, dword ptr [g_101D1BD4]
    mov mov dword ptr [esp + 12], ecx
    mov mov ecx, 1
    mov mov dword ptr [esp + 16], 03F800000h
    mov mov dword ptr [esp + 20], 03F800000h
    mov mov dword ptr [esp + 24], edx
    mov mov dword ptr [esp + 28], eax
    mov mov dword ptr [esp + 8], ecx
    imul imul ecx, ecx, 098h
    lea lea ecx, [esp + ecx + 12]
    push push ecx
    push push eax
    push push edx
    push push eax
    mov mov eax, dword ptr [esp + 16]
    push push edx
    mov mov edx, dword ptr [esp + 24]
    push push edx
    push push eax
    call sub_1003528B
    mov mov ecx, dword ptr [esp + 36]
    add add esp, 28
    add add ecx, eax
    mov mov dword ptr [esp + 8], ecx
    jne sub_1003581D
    mov mov eax, esi
    add add esp, 09A0h
    ret ret
    lea lea ecx, [esp + 8]
    push push ecx
    call sub_1003559D
    add add esp, 4
    mov mov eax, edi
    add add esp, 09A0h
    ret ret
FUN_10035620 ENDP
END
