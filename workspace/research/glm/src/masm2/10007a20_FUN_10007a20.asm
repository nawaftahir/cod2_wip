.686
.MODEL FLAT, C
EXTRN sub_100079ED:PROC
EXTRN sub_10007A9E:PROC
EXTRN sub_10007AAB:PROC
EXTRN sub_10007AAE:PROC
EXTRN sub_10007AAF:PROC
EXTRN sub_10007AB2:PROC
EXTRN sub_10007AD9:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101CE5B0:DWORD:DWORD
.CODE
FUN_10007a20 PROC
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push esi
    push push edi
    mov mov edi, dword ptr [g_101CE5B0]
    test test edi, edi
    mov mov ebx, eax
    mov mov esi, ecx
    je L0
    mov mov eax, ebp
    call sub_100079ED
    test test al, al
    jne sub_10007A9E
    test test ebx, ebx
    je sub_10007AAF
    mov mov edi, dword ptr [ebp + 16]
    xor xor edx, edx
    test test edi, edi
    jle sub_10007AAB
    mov mov ecx, dword ptr [ebp + 20]
    fld fld dword ptr [ecx + 8]
    fmul fmul dword ptr [esi + 8]
L0:
    fld fld dword ptr [ecx + 4]
    fmul fmul dword ptr [esi + 4]
    faddp faddp st(1)
    fld fld dword ptr [esi]
    fmul fmul dword ptr [ecx]
    faddp faddp st(1)
    fadd fadd dword ptr [esi + 12]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_10007AD9
    inc inc edx
    add add ecx, 12
    cmp cmp edx, edi
    jl sub_10007AAE
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov al, 1
    pop pop ebx
    ret ret
    add add esi, 20
    dec dec ebx
    jne sub_10007AB2
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor al, al
    pop pop ebx
    ret ret
FUN_10007a20 ENDP
END
