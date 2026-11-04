.686
.MODEL FLAT, C
EXTRN sub_1006C66B:PROC
EXTRN sub_100854F1:PROC
EXTRN sub_10085565:PROC
EXTRN sub_10085981:PROC
EXTRN sub_100859FE:PROC
EXTRN sub_10085D05:PROC
EXTRN sub_1008634E:PROC
EXTRN sub_100B9A11:PROC
EXTRN sub_100BEAE6:PROC
EXTRN sub_100BEAF0:PROC
EXTRN sub_100BEB25:PROC
EXTRN sub_100BEB2B:PROC
EXTRN sub_100BEB5A:PROC
EXTRN sub_100BEB69:PROC
EXTRN sub_100BEB84:PROC
EXTRN sub_100BEC02:PROC
EXTRN sub_100BEC52:PROC
EXTRN sub_100BEC5A:PROC
EXTRN sub_100BEC70:PROC
EXTRN sub_100BECA7:PROC
EXTRN sub_100BECCA:PROC
EXTRN sub_100BECCF:PROC
EXTRN sub_100BECD6:PROC
EXTRN EXTRN g_1019BC88:DWORD:DWORD
EXTRN EXTRN g_1019BE20:DWORD:DWORD
.CODE
FUN_100be86c PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0108h
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ebx, dword ptr [eax]
    push push edi
    xor xor ecx, ecx
    inc inc ecx
    push push ecx
    mov mov dword ptr [ebp - 36], ecx
    and and ebx, 0FFFFFh
    push push ebx
    lea lea ecx, [ebp - 40]
    push push ecx
    lea lea ecx, [ebp - 0C8h]
    push push ecx
    lea lea ecx, [ebp - 8]
    push push ecx
    lea lea ecx, [ebp - 0108h]
    push push ecx
    push push 010118AD8h
    xor xor edi, edi
    push push eax
    mov mov ecx, esi
    mov mov dword ptr [ebp - 24], esi
    mov mov dword ptr [ebp - 8], edi
    mov mov dword ptr [ebp - 40], edi
    mov mov dword ptr [ebp - 32], 2
    mov mov dword ptr [ebp - 28], 3
    call sub_100B9A11
    cmp cmp eax, edi
    jne sub_100BEB2B
    cmp cmp ebx, edi
    mov mov dword ptr [ebp - 8], edi
    mov mov dword ptr [ebp - 12], edi
    mov mov dword ptr [ebp - 16], edi
    mov mov dword ptr [ebp - 4], edi
    jbe L3
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ebp - 0B8h]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [ebp - 0A8h]
    mov mov edi, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [esi + 16]
    mov mov eax, dword ptr [ecx + 4]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [eax + 4]
    and and eax, 0100h
    mov mov dword ptr [ebp - 20], eax
    cmp cmp dword ptr [ebp - 20], 0
    je L4
    mov mov eax, dword ptr [edi + 4]
    mov mov eax, dword ptr [edx + eax*4]
    test test byte ptr [eax + 5], 1
    je L5
    cmp cmp dword ptr [ecx + 8], -1
    jne L6
    cmp cmp dword ptr [edi + 8], -1
    jne L7
    fld fld qword ptr [g_1019BC88]
    fld fld qword ptr [ecx + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L0
    fld fld qword ptr [g_1019BE20]
    fld fld qword ptr [edi + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L2
    mov mov dword ptr [ebp - 8], 1
    jmp L8
    fld fld qword ptr [g_1019BC88]
    fld fld qword ptr [edi + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L9
    fld fld qword ptr [g_1019BE20]
    fld fld qword ptr [ecx + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L10
    mov mov dword ptr [ebp - 12], 1
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp - 4], ebx
    jb L1
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp - 8], ecx
    je sub_100BEAF0
    cmp cmp dword ptr [ebp - 12], ecx
    je sub_100BEAE6
    xor xor eax, eax
    inc inc eax
    jmp sub_100BEC02
    mov mov eax, ebx
    and and eax, 0FFFFFh
    or or eax, 073500000h
    mov mov dword ptr [ebp - 16], eax
    cmp cmp dword ptr [ebp - 12], ecx
    je sub_100BEB25
    mov mov eax, ebx
    and and eax, 0FFFFFh
    or or eax, 073600000h
    mov mov dword ptr [ebp - 16], eax
    xor xor edi, edi
    push push 116
    call sub_10085981
    cmp cmp eax, edi
    je sub_100BEB5A
    mov mov ecx, eax
    call sub_100854F1
    mov mov dword ptr [ebp - 4], eax
    jmp sub_100BEB69
    mov mov dword ptr [ebp - 4], edi
    mov mov ecx, dword ptr [ebp - 4]
    cmp cmp ecx, edi
    jne sub_100BEB84
    mov mov eax, 08007000Eh
    jmp sub_100BEC52
    push push edi
    push push ebx
    lea lea eax, [ebx + ebx]
    push push eax
    push push dword ptr [ebp - 16]
    call sub_100859FE
    cmp cmp eax, edi
    jl sub_100BEC5A
    push push dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ebp - 4]
    call sub_10085565
    cmp cmp eax, edi
    jl sub_100BEC70
    mov mov edx, dword ptr [esi + 0100h]
    fldz fldz
    mov mov esi, dword ptr [edx + 16]
    mov mov edx, dword ptr [ebp - 4]
    mov mov edi, dword ptr [edx + 16]
    mov mov eax, ebx
    shl shl eax, 2
    mov mov ecx, eax
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
L2:
    mov mov ecx, eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov edi, dword ptr [eax + 8]
    mov mov eax, ecx
    shr shr ecx, 2
    lea lea esi, [ebp - 0C8h]
L5:
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov esi, dword ptr [ebp - 24]
L7:
    push push ecx
    push push ecx
    mov mov ecx, esi
    fstp fstp qword ptr [esp]
    push push 0
    push push 0
    push push dword ptr [esi + 120]
    call sub_1008634E
    cmp cmp eax, -1
    jne sub_100BECA7
    mov mov esi, 08007000Eh
    jmp sub_100BECD6
    test test ebx, ebx
    jbe sub_100BECCA
    mov mov ecx, ebx
    shl shl ecx, 2
    mov mov edx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [edx + 8]
    mov mov dword ptr [ecx + edx], eax
    add add ecx, 4
    dec dec ebx
    jne sub_100BECCF
    push push dword ptr [ebp - 4]
    mov mov ecx, dword ptr [esi + 0100h]
    call sub_10085D05
    mov mov esi, eax
    mov mov ecx, dword ptr [ebp - 4]
    push push 1
    call sub_1006C66B
L10:
    mov mov eax, esi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100be86c ENDP
END
