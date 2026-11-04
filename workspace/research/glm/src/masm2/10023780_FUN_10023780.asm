.686
.MODEL FLAT, C
EXTRN sub_10023803:PROC
EXTRN sub_1002384A:PROC
EXTRN sub_100243EC:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_10678510:DWORD:DWORD
.CODE
FUN_10023780 PROC
    mov mov edx, dword ptr [esp + 4]
    fld fld dword ptr [g_1019BC84]
    mov mov eax, dword ptr [g_10678510]
    push push ebx
    mov mov ebx, edx
    imul imul edx, edx, 116
    push push ebp
    imul imul ebx, ebx, 52
    mov mov ebp, dword ptr [esp + 16]
    push push esi
    add add edx, eax
    push push edi
    mov mov ecx, 29
    mov mov esi, ebp
    mov mov edi, edx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    fld fld dword ptr [ebp + 56]
    fucompp fucompp
    fnstsw fnstsw ax
    add add ebx, 010678AC4h
    test test ah, 68
    jp sub_10023803
    mov mov dword ptr [edx + 56], 03F800000h
    xor xor eax, eax
    mov mov ecx, 13
    mov mov edi, ebx
    rep stosd rep stosd dword ptr es:[edi], eax
    cmp cmp dword ptr [ebp], 4
    jl sub_1002384A
    mov mov eax, dword ptr [ebp + 84]
    mov mov ecx, dword ptr [esp + 20]
    push push 0101A5A2Ch
    mov mov esi, 31
    call sub_100243EC
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
    mov mov eax, dword ptr [esp + 28]
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov dword ptr [ebx + 4], eax
    pop pop ebx
    ret ret
FUN_10023780 ENDP
END
