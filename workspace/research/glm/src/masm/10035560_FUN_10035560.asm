.686
.MODEL FLAT, C
EXTRN sub_10035235:PROC
EXTRN sub_10035536:PROC
EXTRN g_1019BC80:DWORD
EXTRN g_1019BD58:DWORD
EXTRN g_101D4848:DWORD
EXTRN g_101D4C6C:DWORD
EXTRN g_101D4C70:DWORD
EXTRN g_101D4C80:DWORD
EXTRN g_1072DDC8:DWORD
.CODE
FUN_10035560 PROC
    mov eax, dword ptr [g_1072DDC8]
    mov edx, dword ptr [eax + 60]
    fild dword ptr [eax + 60]
    sub esp, 00000099Ch
    test edx, edx
    push esi
    jge L0
    fadd dword ptr [g_1019BC80]
L0:
    fmul dword ptr [esp + 0000009A4h]
    mov esi, dword ptr [g_101D4848]
    lea eax, [ecx + ecx*4]
    shl eax, 2
    mov edx, dword ptr [eax + 0101D482Ch]
    mov eax, dword ptr [eax + 0101D4830h]
    mov dword ptr [esp + 000000990h], ecx
    lea ecx, [esp + 12]
    push ecx
    push eax
    mov eax, dword ptr [g_101D4C6C]
    push edx
    mov edx, dword ptr [g_101D4C70]
    fmul dword ptr [g_1019BD58]
    push edx
    push eax
    fstp dword ptr [esp + 24]
    mov dword ptr [esp + 0000009A8h], 11
    mov ecx, dword ptr [esp + 24]
    fld dword ptr [g_101D4C80]
    fmul dword ptr [esp + 24]
    push ecx
    push ecx
    mov dword ptr [esp + 0000009B4h], 12
    fstp dword ptr [esp]
    mov dword ptr [esp + 0000009A8h], esi
    call sub_10035235
    lea edx, [esp + 36]
    add esp, 28
    push edx
    mov dword ptr [esp + 12], eax
    call sub_10035536
    add esp, 4
    pop esi
    add esp, 00000099Ch
    ret
FUN_10035560 ENDP
END
