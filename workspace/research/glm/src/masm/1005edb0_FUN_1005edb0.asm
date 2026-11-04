.686
.MODEL FLAT, C
EXTRN g_1019BD88:DWORD
.CODE
FUN_1005edb0 PROC
    sub esp, 12
    xor edx, edx
    push edi
    mov dword ptr [esp + 4], edx
    mov edi, eax
    lea esp, [esp]
L0:
    test dl, 1
    mov dword ptr [esi + edx*4], 0
    je L1
    mov dword ptr [esi + edx*4], 000000080h
L1:
    test dl, 2
    je L2
    or dword ptr [esi + edx*4], 64
L2:
    test dl, 4
    je L3
    or dword ptr [esi + edx*4], 32
L3:
    test dl, 8
    je L4
    or dword ptr [esi + edx*4], 16
L4:
    test dl, 16
    je L5
    or dword ptr [esi + edx*4], 8
L5:
    test dl, 32
    je L6
    or dword ptr [esi + edx*4], 4
L6:
    test dl, 64
    je L7
    or dword ptr [esi + edx*4], 2
L7:
    test dl, dl
    jns L8
    or dword ptr [esi + edx*4], 1
L8:
    fild dword ptr [esp + 4]
    lea eax, [edi + 4]
    mov dword ptr [esp + 12], edi
    mov dword ptr [esp + 8], eax
    fmul dword ptr [g_1019BD88]
    fstp dword ptr [esp + 4]
    push eax
    push ecx
    fld dword ptr [esp + 12]
    fsincos
    mov ecx, dword ptr [esp + 20]
    mov eax, dword ptr [esp + 16]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    inc edx
    add edi, 8
    cmp edx, 000000100h
    mov dword ptr [esp + 4], edx
    jl L0
    pop edi
    add esp, 12
    ret
FUN_1005edb0 ENDP
END
