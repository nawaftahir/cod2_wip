.686
.MODEL FLAT, C
EXTRN sub_100243EC:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_10678510:DWORD
.CODE
FUN_10023780 PROC
    mov edx, dword ptr [esp + 4]
    fld dword ptr [g_1019BC84]
    mov eax, dword ptr [g_10678510]
    push ebx
    mov ebx, edx
    imul edx, edx, 116
    push ebp
    imul ebx, ebx, 52
    mov ebp, dword ptr [esp + 16]
    push esi
    add edx, eax
    push edi
    mov ecx, 29
    mov esi, ebp
    mov edi, edx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    fld dword ptr [ebp + 56]
    fucompp
    fnstsw ax
    add ebx, 010678AC4h
    test ah, 68
    jp L0
    mov dword ptr [edx + 56], 03F800000h
L0:
    xor eax, eax
    mov ecx, 13
    mov edi, ebx
    rep stosd dword ptr es:[edi], eax
    cmp dword ptr [ebp], 4
    jl L1
    mov eax, dword ptr [ebp + 84]
    mov ecx, dword ptr [esp + 20]
    push 0101A5A2Ch
    mov esi, 31
    call sub_100243EC
    add esp, 4
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
L1:
    mov eax, dword ptr [esp + 28]
    pop edi
    pop esi
    pop ebp
    mov dword ptr [ebx + 4], eax
    pop ebx
    ret
FUN_10023780 ENDP
END
