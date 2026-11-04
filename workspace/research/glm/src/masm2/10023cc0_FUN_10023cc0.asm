.686
.MODEL FLAT, C
EXTRN sub_100083A9:PROC
EXTRN sub_10023AF6:PROC
EXTRN sub_10023D5D:PROC
EXTRN sub_10023DAD:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_10678510:DWORD:DWORD
.CODE
FUN_10023cc0 PROC
    push push ebx
    call sub_10023AF6
    mov mov ebx, eax
    test test ebx, ebx
    jge L0
    xor xor eax, eax
    pop pop ebx
    ret ret
    mov mov eax, dword ptr [g_10678510]
    fld fld dword ptr [g_1019BC84]
    push push ebp
L0:
    mov mov ebp, ebx
    imul imul ebp, ebp, 116
    add add ebp, eax
    mov mov eax, dword ptr [esp + 12]
    push push esi
    push push edi
    mov mov edx, ebx
    mov mov esi, eax
    imul imul edx, edx, 52
    mov mov ecx, 29
    mov mov edi, ebp
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    fld fld dword ptr [eax + 56]
    fucompp fucompp
    fnstsw fnstsw ax
    add add edx, 010678AC4h
    test test ah, 68
    jp sub_10023D5D
    mov mov dword ptr [ebp + 56], 03F800000h
    xor xor eax, eax
    mov mov edi, edx
    mov mov ecx, 13
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov eax, dword ptr [esp + 24]
    mov mov ecx, dword ptr [esp + 28]
    mov mov dword ptr [edx + 4], eax
    mov mov dword ptr [edx + 8], ecx
    mov mov edx, dword ptr [esp + 20]
    cmp cmp dword ptr [edx], 1
    jne sub_10023DAD
    call sub_100083A9
    pop pop edi
    pop pop esi
    mov mov eax, ebp
    pop pop ebp
    pop pop ebx
    ret ret
FUN_10023cc0 ENDP
END
