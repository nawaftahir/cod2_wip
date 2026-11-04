.686
.MODEL FLAT, C
EXTRN sub_1006DB82:PROC
EXTRN sub_100F789F:PROC
EXTRN sub_100F78FC:PROC
EXTRN sub_100F926E:PROC
EXTRN g_1010F780:DWORD
EXTRN g_1019BC88:DWORD
EXTRN g_1019BE20:DWORD
.CODE
FUN_10085ec2 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    mov ebx, ecx
    mov eax, dword ptr [ebx + 32]
    cmp dword ptr [ebx + 8], eax
    push esi
    jne L4
    test eax, eax
    je L0
    add eax, eax
    mov dword ptr [ebp - 4], eax
    jmp L1
L0:
    mov dword ptr [ebp - 4], 000000400h
L1:
    mov eax, dword ptr [ebp - 4]
    shl eax, 2
    push eax
    call sub_100F789F
    mov edx, eax
    test edx, edx
    pop ecx
    mov dword ptr [ebp - 8], edx
    jne L3
    mov ecx, dword ptr [ebp + 8]
    test ecx, ecx
    je L2
    push 1
    call sub_1006DB82
L2:
    or eax, 0FFFFFFFFh
    jmp L11
L3:
    mov ecx, dword ptr [ebx + 8]
    mov esi, dword ptr [ebx + 20]
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    push edi
    mov edi, edx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [ebx + 8]
    mov esi, dword ptr [ebp - 4]
    mov ecx, esi
    sub ecx, edi
    shl ecx, 2
    lea edi, [edx + edi*4]
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    push dword ptr [ebx + 20]
    call sub_100F78FC
    mov eax, dword ptr [ebp - 8]
    pop ecx
    mov dword ptr [ebx + 20], eax
    mov dword ptr [ebx + 32], esi
    pop edi
L4:
    mov esi, dword ptr [ebp + 8]
    test esi, esi
    je L10
    mov eax, dword ptr [esi + 4]
    mov ecx, dword ptr [ebx + 16]
    mov eax, dword ptr [ecx + eax*4]
    test byte ptr [eax + 5], 1
    je L10
    cmp dword ptr [esi + 8], -1
    jne L10
    fld qword ptr [g_1019BE20]
    or byte ptr [esi], 000000080h
    fld qword ptr [esi + 32]
    mov ecx, dword ptr [esi]
    fld st(1)
    fucompp
    fnstsw ax
    test ah, 68
    jnp L5
    fld qword ptr [esi + 32]
    fld qword ptr [g_1019BC88]
    fucompp
    fnstsw ax
    test ah, 68
    jp L6
L5:
    or ecx, 1
    mov dword ptr [esi], ecx
L6:
    fld qword ptr [esi + 32]
    call sub_100F926E
    mov dword ptr [ebp + 8], eax
    fild dword ptr [ebp + 8]
    fsubr qword ptr [esi + 32]
    fabs
    fcomp qword ptr [g_1010F780]
    fnstsw ax
    test ah, 5
    jp L7
    or dword ptr [esi], 2
L7:
    fcom qword ptr [esi + 32]
    fnstsw ax
    test ah, 65
    jp L8
    or dword ptr [esi], 4
L8:
    fcomp qword ptr [esi + 32]
    fnstsw ax
    test ah, 1
    jne L9
    or dword ptr [esi], 8
L9:
    fld qword ptr [esi + 32]
    fabs
    fcomp qword ptr [g_1019BC88]
    fnstsw ax
    test ah, 65
    jp L10
    or dword ptr [esi], 16
L10:
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [ebx + 20]
    mov dword ptr [ecx + eax*4], esi
    mov eax, dword ptr [ebx + 8]
    lea ecx, [eax + 1]
    mov dword ptr [ebx + 8], ecx
L11:
    pop esi
    pop ebx
    leave
    ret 4
FUN_10085ec2 ENDP
END
