.686
.MODEL FLAT, C
EXTRN sub_1005EE5E:PROC
EXTRN sub_1005EE64:PROC
EXTRN sub_1005EE6E:PROC
EXTRN EXTRN g_1019BD88:DWORD:DWORD
.CODE
FUN_1005edb0 PROC
    sub sub esp, 12
    xor xor edx, edx
    push push edi
    mov mov dword ptr [esp + 4], edx
    mov mov edi, eax
    lea lea esp, [esp]
    test test dl, 1
    mov mov dword ptr [esi + edx*4], 0
    je L0
    mov mov dword ptr [esi + edx*4], 080h
    test test dl, 2
    je L1
    or or dword ptr [esi + edx*4], 64
    test test dl, 4
    je L2
    or or dword ptr [esi + edx*4], 32
    test test dl, 8
    je L3
    or or dword ptr [esi + edx*4], 16
    test test dl, 16
    je L4
    or or dword ptr [esi + edx*4], 8
    test test dl, 32
    je L5
    or or dword ptr [esi + edx*4], 4
    test test dl, 64
    je sub_1005EE5E
    or or dword ptr [esi + edx*4], 2
    test test dl, dl
    jns sub_1005EE6E
    or or dword ptr [esi + edx*4], 1
    fild fild dword ptr [esp + 4]
    lea lea eax, [edi + 4]
    mov mov dword ptr [esp + 12], edi
    mov mov dword ptr [esp + 8], eax
    fmul fmul dword ptr [g_1019BD88]
    fstp fstp dword ptr [esp + 4]
    push push eax
    push push ecx
    fld fld dword ptr [esp + 12]
    fsincos fsincos
    mov mov ecx, dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 16]
L4:
    fstp fstp dword ptr [ecx]
    fstp fstp dword ptr [eax]
    pop pop ecx
    pop pop eax
    inc inc edx
    add add edi, 8
    cmp cmp edx, 0100h
    mov mov dword ptr [esp + 4], edx
    jl sub_1005EE64
    pop pop edi
    add add esp, 12
    ret ret
FUN_1005edb0 ENDP
END
