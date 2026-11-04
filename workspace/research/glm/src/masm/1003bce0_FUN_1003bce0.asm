.686
.MODEL FLAT, C
EXTRN sub_1003AC65:PROC
EXTRN sub_1003BC8C:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_101D1B9C:DWORD
.CODE
FUN_1003bce0 PROC
    mov ecx, dword ptr [g_101D1B9C]
    mov eax, dword ptr [ecx + 000000168h]
    sub esp, 8
    test eax, eax
    je L2
    fld dword ptr [edx + 28]
    fcomp dword ptr [ecx + 000000174h]
    fnstsw ax
    test ah, 65
    jnp L2
    fld dword ptr [edx + 28]
    fcomp dword ptr [ecx + 00000017Ch]
    fnstsw ax
    test ah, 1
    jne L0
    fld dword ptr [g_1019BC78]
    jmp L1
L0:
    fld dword ptr [edx + 28]
    fsub dword ptr [ecx + 000000174h]
    fld dword ptr [ecx + 00000017Ch]
    fsub dword ptr [ecx + 000000174h]
    fdivp st(1)
L1:
    mov eax, dword ptr [esp + 12]
    fld st(0)
    fmul dword ptr [ecx + 000000180h]
    push eax
    mov eax, dword ptr [ecx + 000000188h]
    push eax
    mov eax, dword ptr [edx + 24]
    fstp dword ptr [esp + 12]
    fmul dword ptr [ecx + 000000178h]
    fadd dword ptr [ecx + 000000170h]
    mov ecx, dword ptr [ecx + 000000184h]
    push ecx
    mov ecx, dword ptr [edx]
    push eax
    fstp dword ptr [esp + 16]
    push ecx
    call sub_1003AC65
    fst dword ptr [edx]
    mov edx, dword ptr [esp + 20]
    fmul dword ptr [esp + 24]
    add esp, 20
    push edx
    push ecx
    fstp dword ptr [esp]
    call sub_1003BC8C
    add esp, 8
L2:
    add esp, 8
    ret
FUN_1003bce0 ENDP
END
