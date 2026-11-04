.686
.MODEL FLAT, C
EXTRN sub_1006C70E:PROC
EXTRN sub_100855CE:PROC
EXTRN sub_10085651:PROC
EXTRN sub_10085A5E:PROC
EXTRN sub_10085AED:PROC
EXTRN sub_10085E09:PROC
EXTRN sub_10085E4C:PROC
EXTRN sub_100861FD:PROC
EXTRN sub_100862BF:PROC
EXTRN sub_100862FE:PROC
EXTRN sub_1008630C:PROC
EXTRN sub_100BB4E8:PROC
EXTRN sub_100BB4F3:PROC
EXTRN sub_100BB4FD:PROC
EXTRN sub_100BB4FE:PROC
EXTRN sub_100BB510:PROC
EXTRN sub_100BB51C:PROC
EXTRN sub_100BB526:PROC
EXTRN sub_100BB53C:PROC
EXTRN sub_100BB545:PROC
EXTRN sub_100BB547:PROC
EXTRN sub_100BB55F:PROC
EXTRN sub_100BB574:PROC
EXTRN sub_100BB5C1:PROC
EXTRN sub_100BB5FD:PROC
EXTRN sub_100BB670:PROC
EXTRN sub_100BB675:PROC
EXTRN sub_100BB685:PROC
EXTRN sub_100BB69E:PROC
EXTRN sub_100BB718:PROC
EXTRN sub_100BB738:PROC
EXTRN sub_100BB74B:PROC
EXTRN sub_100BB760:PROC
EXTRN sub_100BB7AC:PROC
EXTRN sub_100BB7C1:PROC
EXTRN sub_100BB7C5:PROC
.CODE
FUN_100bb1c6 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 72
    push push ebx
    mov mov ebx, ecx
    mov mov ecx, dword ptr [ebx + 0100h]
    push push esi
    push push edi
    mov mov edi, dword ptr [ecx]
    and and edi, 0FFFFFh
    mov mov dword ptr [ebp - 12], edi
    je sub_100BB4E8
    mov mov eax, dword ptr [ecx + 4]
    test test eax, eax
    je sub_100BB4F3
    cmp cmp dword ptr [ecx + 12], 0
    je sub_100BB4FD
    xor xor edx, edx
    div div edi
    and and dword ptr [ebp - 4], 0
    test test eax, eax
    mov mov dword ptr [ebp - 32], eax
    jbe sub_100BB510
    mov mov edx, dword ptr [ebp - 32]
    mov mov eax, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov dword ptr [ebp - 24], edx
    mov mov edx, dword ptr [ecx]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [edx + 8]
    cmp cmp edx, -1
    je L1
    mov mov esi, dword ptr [eax + edx*4]
    mov mov edi, dword ptr [ebx + 16]
    mov mov esi, dword ptr [esi + 4]
    mov mov esi, dword ptr [edi + esi*4]
    test test byte ptr [esi + 4], 4
    mov mov edi, dword ptr [ebp - 12]
    jne L2
    mov mov esi, dword ptr [ebp - 4]
    inc inc dword ptr [ebp - 4]
    mov mov dword ptr [ebp + esi*4 - 72], edx
    mov mov edx, edi
    shl shl edx, 2
    add add ecx, edx
    dec dec dword ptr [ebp - 24]
    jne L0
    xor xor esi, esi
    cmp cmp dword ptr [ebp - 4], esi
    je sub_100BB55F
    cmp cmp dword ptr [ebp - 4], esi
    jbe L5
    cmp cmp dword ptr [ebp - 4], 1
    jne L3
    push push 3
    pop pop eax
    jmp L4
    mov mov eax, esi
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push eax
    push push 0
    push push dword ptr [ebx + 08Ch]
    mov mov ecx, ebx
    call sub_100861FD
    cmp cmp eax, -1
    mov mov dword ptr [ebp + esi*4 - 56], eax
    je sub_100BB4FE
    mov mov edx, dword ptr [ebx + 0100h]
    mov mov edx, dword ptr [edx + 16]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [edx]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov ecx, dword ptr [ecx + 20]
L0:
    mov mov dword ptr [eax + 20], ecx
    mov mov ecx, dword ptr [ebx + 0100h]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov edx, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [ecx + 24]
    inc inc esi
    cmp cmp esi, dword ptr [ebp - 4]
    mov mov dword ptr [eax + 24], ecx
    jb L5
    xor xor eax, eax
    mov mov dword ptr [ebp - 4], eax
    mov mov dword ptr [ebp - 24], eax
    mov mov dword ptr [ebp - 16], eax
    mov mov ecx, dword ptr [ebx + 0100h]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov edx, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [edx + ecx]
    mov mov eax, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ecx + 8]
    cmp cmp ecx, -1
    je sub_100BB526
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [eax + 4]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    test test byte ptr [eax + 4], 4
    jne sub_100BB53C
    and and dword ptr [ebp - 20], 0
    test test edi, edi
    jbe sub_100BB545
    mov mov eax, edx
L4:
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [ebx + 0100h]
    fldz fldz
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ecx + eax]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    mov mov dword ptr [ebp - 28], eax
    xor xor eax, eax
    push push eax
    push push eax
    push push eax
    mov mov ecx, ebx
    call sub_100862BF
    mov mov edi, eax
    cmp cmp edi, -1
    mov mov dword ptr [ebp - 40], edi
    je sub_100BB5C1
    mov mov eax, dword ptr [ebx + 20]
    mov mov esi, dword ptr [eax + edi*4]
    push push dword ptr [ebp - 28]
    mov mov ecx, esi
    call sub_10085E09
    xor xor ecx, ecx
    cmp cmp eax, ecx
L5:
    jl sub_100BB675
    cmp cmp dword ptr [esi + 56], -1
    je sub_100BB574
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push ecx
    push push ecx
    push push ecx
    mov mov ecx, ebx
    call sub_100862FE
    mov mov edi, eax
    cmp cmp edi, -1
    je sub_100BB5FD
    mov mov eax, dword ptr [ebx + 20]
    mov mov edx, dword ptr [ebp - 28]
    mov mov edx, dword ptr [edx + 56]
    mov mov ecx, dword ptr [eax + edi*4]
    push push dword ptr [eax + edx*4]
    mov mov dword ptr [ebp - 36], ecx
    call sub_10085E4C
    mov mov eax, dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp + eax*4 - 56]
    mov mov ecx, dword ptr [ebp - 36]
    mov mov dword ptr [esi + 56], edi
    mov mov edi, dword ptr [ebp - 40]
    mov mov dword ptr [ecx + 8], eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp + eax*4 - 56]
    mov mov ecx, dword ptr [ebp - 8]
    inc inc dword ptr [ebp - 20]
    add add dword ptr [ebp - 8], 4
    mov mov dword ptr [esi + 8], eax
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov eax, dword ptr [eax + 8]
    mov mov dword ptr [ecx + eax], edi
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp eax, dword ptr [ebp - 12]
    jb sub_100BB547
    mov mov edi, dword ptr [ebp - 12]
    inc inc dword ptr [ebp - 4]
    inc inc dword ptr [ebp - 24]
    mov mov eax, edi
    shl shl eax, 2
    add add dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [ebp - 24]
    cmp cmp eax, dword ptr [ebp - 32]
    jb sub_100BB51C
    push push 116
    call sub_10085A5E
    test test eax, eax
    je sub_100BB670
    mov mov ecx, eax
    call sub_100855CE
    mov mov edi, eax
    mov mov dword ptr [ebp - 16], edi
    jmp sub_100BB685
    and and dword ptr [ebp - 16], 0
    mov mov edi, dword ptr [ebp - 16]
    test test edi, edi
    jne sub_100BB69E
    mov mov eax, 08007000Eh
    jmp sub_100BB738
    mov mov eax, dword ptr [ebp - 4]
    push push 0
    push push dword ptr [ebp - 4]
    and and eax, 0FFFFFh
    push push dword ptr [ebp - 4]
    or or eax, 010000000h
    push push eax
    mov mov ecx, edi
    call sub_10085AED
    mov mov esi, eax
    test test esi, esi
    mov mov ecx, edi
    jl sub_100BB74B
    push push dword ptr [ebx + 0100h]
    call sub_10085651
    mov mov esi, eax
    test test esi, esi
    jge sub_100BB718
    mov mov ecx, edi
    jmp sub_100BB760
    mov mov eax, dword ptr [ebp - 4]
    mov mov edi, dword ptr [edi + 16]
    shl shl eax, 2
    mov mov ecx, eax
    mov mov edx, ecx
    shr shr ecx, 2
    lea lea esi, [ebp - 56]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, eax
    mov mov eax, dword ptr [ebp - 16]
    mov mov edi, dword ptr [eax + 8]
    shr shr ecx, 2
    lea lea esi, [ebp - 72]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    push push eax
    mov mov ecx, ebx
    call sub_1008630C
    mov mov esi, eax
    test test esi, esi
    jge sub_100BB7AC
    mov mov ecx, dword ptr [ebp - 16]
    push push 1
    call sub_1006C70E
    mov mov eax, esi
    jmp sub_100BB7C1
    xor xor eax, eax
    jmp sub_100BB7C5
    xor xor eax, eax
    inc inc eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100bb1c6 ENDP
END
