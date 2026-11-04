.686
.MODEL FLAT, C
EXTRN sub_100079ED:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_101CE5B0:DWORD
.CODE
FUN_10007a20 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    push edi
    mov edi, dword ptr [g_101CE5B0]
    test edi, edi
    mov ebx, eax
    mov esi, ecx
    je L0
    mov eax, ebp
    call sub_100079ED
    test al, al
    jne L3
L0:
    test ebx, ebx
    je L5
    mov edi, dword ptr [ebp + 16]
L1:
    xor edx, edx
    test edi, edi
    jle L3
    mov ecx, dword ptr [ebp + 20]
L2:
    fld dword ptr [ecx + 8]
    fmul dword ptr [esi + 8]
    fld dword ptr [ecx + 4]
    fmul dword ptr [esi + 4]
    faddp st(1)
    fld dword ptr [esi]
    fmul dword ptr [ecx]
    faddp st(1)
    fadd dword ptr [esi + 12]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    je L4
    inc edx
    add ecx, 12
    cmp edx, edi
    jl L2
L3:
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    ret
L4:
    add esi, 20
    dec ebx
    jne L1
L5:
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    ret
FUN_10007a20 ENDP
END
