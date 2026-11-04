.686
.MODEL FLAT, C
EXTRN sub_1003B31C:PROC
EXTRN fp_101D4B30:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_1019BDBC:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_1072DDC8:DWORD
.CODE
FUN_1003b4b0 PROC
    sub esp, 12
    push 16
    push 16
    call sub_1003B31C
    fst dword ptr [esi + 24]
    fld dword ptr [g_1019BC84]
    add esp, 8
    fxch st(1)
    fucompp
    fnstsw ax
    test ah, 68
    jnp L0
    mov ecx, dword ptr [g_101D1B9C]
    fld dword ptr [ecx + 0000001B4h]
    mov eax, dword ptr [g_1072DDC8]
    fmul dword ptr [g_1019BDBC]
    mov edx, dword ptr [esi + 32]
    push 000002003h
    push 0
    fadd dword ptr [eax]
    push 010191348h
    push 010191348h
    fstp dword ptr [esp + 16]
    fld dword ptr [ecx + 0000001B8h]
    fmul dword ptr [g_1019BDBC]
    fadd dword ptr [eax + 4]
    fstp dword ptr [esp + 20]
    fld dword ptr [ecx + 0000001BCh]
    lea ecx, [esp + 16]
    fmul dword ptr [g_1019BDBC]
    push ecx
    push eax
    push edx
    fadd dword ptr [eax + 8]
    fstp dword ptr [esp + 36]
    call dword ptr [fp_101D4B30]
    add esp, 28
    test eax, eax
    mov dword ptr [esi + 32], eax
    je L0
    mov dword ptr [esi + 24], 0
L0:
    add esp, 12
    ret
FUN_1003b4b0 ENDP
END
