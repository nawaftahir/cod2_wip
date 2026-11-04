.686
.MODEL FLAT, C
EXTRN sub_10035235:PROC
EXTRN sub_10035536:PROC
EXTRN EXTRN g_1019BC80:DWORD:DWORD
EXTRN EXTRN g_1019BD58:DWORD:DWORD
EXTRN EXTRN g_101D4848:DWORD:DWORD
EXTRN EXTRN g_101D4C6C:DWORD:DWORD
EXTRN EXTRN g_101D4C70:DWORD:DWORD
EXTRN EXTRN g_101D4C80:DWORD:DWORD
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
.CODE
FUN_10035560 PROC
    mov mov eax, dword ptr [g_1072DDC8]
    mov mov edx, dword ptr [eax + 60]
    fild fild dword ptr [eax + 60]
    sub sub esp, 099Ch
    test test edx, edx
    push push esi
    jge L0
    fadd fadd dword ptr [g_1019BC80]
    fmul fmul dword ptr [esp + 09A4h]
    mov mov esi, dword ptr [g_101D4848]
    lea lea eax, [ecx + ecx*4]
    shl shl eax, 2
    mov mov edx, dword ptr [eax + 0101D482Ch]
    mov mov eax, dword ptr [eax + 0101D4830h]
    mov mov dword ptr [esp + 0990h], ecx
    lea lea ecx, [esp + 12]
    push push ecx
    push push eax
    mov mov eax, dword ptr [g_101D4C6C]
    push push edx
    mov mov edx, dword ptr [g_101D4C70]
    fmul fmul dword ptr [g_1019BD58]
    push push edx
    push push eax
    fstp fstp dword ptr [esp + 24]
    mov mov dword ptr [esp + 09A8h], 11
    mov mov ecx, dword ptr [esp + 24]
    fld fld dword ptr [g_101D4C80]
    fmul fmul dword ptr [esp + 24]
    push push ecx
    push push ecx
    mov mov dword ptr [esp + 09B4h], 12
    fstp fstp dword ptr [esp]
    mov mov dword ptr [esp + 09A8h], esi
    call sub_10035235
    lea lea edx, [esp + 36]
    add add esp, 28
    push push edx
    mov mov dword ptr [esp + 12], eax
    call sub_10035536
    add add esp, 4
    pop pop esi
    add add esp, 099Ch
    ret ret
FUN_10035560 ENDP
END
