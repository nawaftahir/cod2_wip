.686
.MODEL FLAT, C
EXTRN sub_100083A9:PROC
EXTRN sub_10023AF6:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_10678510:DWORD
.CODE
FUN_10023cc0 PROC
    push ebx
    call sub_10023AF6
    mov ebx, eax
    test ebx, ebx
    jge L0
    xor eax, eax
    pop ebx
    ret
L0:
    mov eax, dword ptr [g_10678510]
    fld dword ptr [g_1019BC84]
    push ebp
    mov ebp, ebx
    imul ebp, ebp, 116
    add ebp, eax
    mov eax, dword ptr [esp + 12]
    push esi
    push edi
    mov edx, ebx
    mov esi, eax
    imul edx, edx, 52
    mov ecx, 29
    mov edi, ebp
    rep movsd dword ptr es:[edi], dword ptr [esi]
    fld dword ptr [eax + 56]
    fucompp
    fnstsw ax
    add edx, 010678AC4h
    test ah, 68
    jp L1
    mov dword ptr [ebp + 56], 03F800000h
L1:
    xor eax, eax
    mov edi, edx
    mov ecx, 13
    rep stosd dword ptr es:[edi], eax
    mov eax, dword ptr [esp + 24]
    mov ecx, dword ptr [esp + 28]
    mov dword ptr [edx + 4], eax
    mov dword ptr [edx + 8], ecx
    mov edx, dword ptr [esp + 20]
    cmp dword ptr [edx], 1
    jne L2
    call sub_100083A9
L2:
    pop edi
    pop esi
    mov eax, ebp
    pop ebp
    pop ebx
    ret
FUN_10023cc0 ENDP
END
