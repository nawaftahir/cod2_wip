.686
.MODEL FLAT, C
EXTRN sub_1006DB82:PROC
EXTRN sub_10086075:PROC
EXTRN sub_1008609A:PROC
EXTRN sub_100860B1:PROC
EXTRN sub_100860BB:PROC
EXTRN sub_100860CE:PROC
EXTRN sub_100860D8:PROC
EXTRN sub_100860F9:PROC
EXTRN sub_10086113:PROC
EXTRN sub_1008612D:PROC
EXTRN sub_10086157:PROC
EXTRN sub_100F789F:PROC
EXTRN sub_100F78FC:PROC
EXTRN sub_100F926E:PROC
EXTRN EXTRN g_1010F780:DWORD:DWORD
EXTRN EXTRN g_1019BC88:DWORD:DWORD
EXTRN EXTRN g_1019BE20:DWORD:DWORD
.CODE
FUN_10085ec2 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push ebx
    mov mov ebx, ecx
    mov mov eax, dword ptr [ebx + 32]
    cmp cmp dword ptr [ebx + 8], eax
    push push esi
    jne L4
    test test eax, eax
    je L0
    add add eax, eax
    mov mov dword ptr [ebp - 4], eax
    jmp L1
    mov mov dword ptr [ebp - 4], 0400h
    mov mov eax, dword ptr [ebp - 4]
    shl shl eax, 2
    push push eax
    call sub_100F789F
    mov mov edx, eax
    test test edx, edx
    pop pop ecx
    mov mov dword ptr [ebp - 8], edx
L0:
    jne L3
    mov mov ecx, dword ptr [ebp + 8]
    test test ecx, ecx
    je L2
    push push 1
    call sub_1006DB82
    or or eax, -1
    jmp sub_10086075
    mov mov ecx, dword ptr [ebx + 8]
    mov mov esi, dword ptr [ebx + 20]
    shl shl ecx, 2
    mov mov eax, ecx
    shr shr ecx, 2
    push push edi
    mov mov edi, edx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [ebx + 8]
    mov mov esi, dword ptr [ebp - 4]
    mov mov ecx, esi
    sub sub ecx, edi
    shl shl ecx, 2
    lea lea edi, [edx + edi*4]
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    push push dword ptr [ebx + 20]
    call sub_100F78FC
    mov mov eax, dword ptr [ebp - 8]
    pop pop ecx
    mov mov dword ptr [ebx + 20], eax
    mov mov dword ptr [ebx + 32], esi
    pop pop edi
    mov mov esi, dword ptr [ebp + 8]
    test test esi, esi
    je sub_100860BB
    mov mov eax, dword ptr [esi + 4]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    test test byte ptr [eax + 5], 1
    je sub_100860CE
    cmp cmp dword ptr [esi + 8], -1
    jne sub_100860D8
    fld fld qword ptr [g_1019BE20]
    or or byte ptr [esi], 080h
    fld fld qword ptr [esi + 32]
    mov mov ecx, dword ptr [esi]
    fld fld st(1)
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_1008609A
    fld fld qword ptr [esi + 32]
    fld fld qword ptr [g_1019BC88]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_100860B1
    or or ecx, 1
    mov mov dword ptr [esi], ecx
    fld fld qword ptr [esi + 32]
    call sub_100F926E
    mov mov dword ptr [ebp + 8], eax
    fild fild dword ptr [ebp + 8]
    fsubr fsubr qword ptr [esi + 32]
    fabs fabs
    fcomp fcomp qword ptr [g_1010F780]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_100860F9
    or or dword ptr [esi], 2
    fcom fcom qword ptr [esi + 32]
    fnstsw fnstsw ax
    test test ah, 65
    jp sub_10086113
    or or dword ptr [esi], 4
    fcomp fcomp qword ptr [esi + 32]
    fnstsw fnstsw ax
    test test ah, 1
    jne sub_1008612D
    or or dword ptr [esi], 8
    fld fld qword ptr [esi + 32]
    fabs fabs
    fcomp fcomp qword ptr [g_1019BC88]
    fnstsw fnstsw ax
    test test ah, 65
    jp sub_10086157
    or or dword ptr [esi], 16
    mov mov eax, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov dword ptr [ecx + eax*4], esi
    mov mov eax, dword ptr [ebx + 8]
    lea lea ecx, [eax + 1]
    mov mov dword ptr [ebx + 8], ecx
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
FUN_10085ec2 ENDP
END
