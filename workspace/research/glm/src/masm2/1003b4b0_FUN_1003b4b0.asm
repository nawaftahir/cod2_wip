.686
.MODEL FLAT, C
EXTRN sub_1003B31C:PROC
EXTRN sub_1003B56B:PROC
EXTRN sub_1003B5D9:PROC
EXTRN EXTRN fp_101D4B30:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BDBC:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
.CODE
FUN_1003b4b0 PROC
    sub sub esp, 12
    push push 16
    push push 16
    call sub_1003B31C
    fst fst dword ptr [esi + 24]
    fld fld dword ptr [g_1019BC84]
    add add esp, 8
    fxch fxch st(1)
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_1003B56B
    mov mov ecx, dword ptr [g_101D1B9C]
    fld fld dword ptr [ecx + 01B4h]
    mov mov eax, dword ptr [g_1072DDC8]
    fmul fmul dword ptr [g_1019BDBC]
    mov mov edx, dword ptr [esi + 32]
    push push 02003h
    push push 0
    fadd fadd dword ptr [eax]
    push push 010191348h
    push push 010191348h
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [ecx + 01B8h]
    fmul fmul dword ptr [g_1019BDBC]
    fadd fadd dword ptr [eax + 4]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [ecx + 01BCh]
    lea lea ecx, [esp + 16]
    fmul fmul dword ptr [g_1019BDBC]
    push push ecx
    push push eax
    push push edx
    fadd fadd dword ptr [eax + 8]
    fstp fstp dword ptr [esp + 36]
    call dword ptr [fp_101D4B30]
    add add esp, 28
    test test eax, eax
    mov mov dword ptr [esi + 32], eax
    je sub_1003B5D9
    mov mov dword ptr [esi + 24], 0
    add add esp, 12
    ret ret
FUN_1003b4b0 ENDP
END
