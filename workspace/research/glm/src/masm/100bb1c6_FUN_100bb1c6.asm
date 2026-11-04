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
.CODE
FUN_100bb1c6 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 72
    push ebx
    mov ebx, ecx
    mov ecx, dword ptr [ebx + 000000100h]
    push esi
    push edi
    mov edi, dword ptr [ecx]
    and edi, 0000FFFFFh
    mov dword ptr [ebp - 12], edi
    je L18
    mov eax, dword ptr [ecx + 4]
    test eax, eax
    je L18
    cmp dword ptr [ecx + 12], 0
    je L18
    xor edx, edx
    div edi
    and dword ptr [ebp - 4], 0
    test eax, eax
    mov dword ptr [ebp - 32], eax
    jbe L18
    mov edx, dword ptr [ebp - 32]
    mov eax, dword ptr [ebx + 20]
    mov ecx, dword ptr [ecx + 8]
    mov dword ptr [ebp - 24], edx
L0:
    mov edx, dword ptr [ecx]
    mov edx, dword ptr [eax + edx*4]
    mov edx, dword ptr [edx + 8]
    cmp edx, -1
    je L1
    mov esi, dword ptr [eax + edx*4]
    mov edi, dword ptr [ebx + 16]
    mov esi, dword ptr [esi + 4]
    mov esi, dword ptr [edi + esi*4]
    test byte ptr [esi + 4], 4
    mov edi, dword ptr [ebp - 12]
    jne L1
    mov esi, dword ptr [ebp - 4]
    inc dword ptr [ebp - 4]
    mov dword ptr [ebp + esi*4 - 72], edx
L1:
    mov edx, edi
    shl edx, 2
    add ecx, edx
    dec dword ptr [ebp - 24]
    jne L0
    xor esi, esi
    cmp dword ptr [ebp - 4], esi
    je L18
    cmp dword ptr [ebp - 4], esi
    jbe L5
L2:
    cmp dword ptr [ebp - 4], 1
    jne L3
    push 3
    pop eax
    jmp L4
L3:
    mov eax, esi
L4:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push eax
    push 0
    push dword ptr [ebx + 00000008Ch]
    mov ecx, ebx
    call sub_100861FD
    cmp eax, -1
    mov dword ptr [ebp + esi*4 - 56], eax
    je L13
    mov edx, dword ptr [ebx + 000000100h]
    mov edx, dword ptr [edx + 16]
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov edx, dword ptr [edx]
    mov ecx, dword ptr [ecx + edx*4]
    mov ecx, dword ptr [ecx + 20]
    mov dword ptr [eax + 20], ecx
    mov ecx, dword ptr [ebx + 000000100h]
    mov ecx, dword ptr [ecx + 16]
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [ebx + 20]
    mov ecx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [ecx + 24]
    inc esi
    cmp esi, dword ptr [ebp - 4]
    mov dword ptr [eax + 24], ecx
    jb L2
L5:
    xor eax, eax
    mov dword ptr [ebp - 4], eax
    mov dword ptr [ebp - 24], eax
    mov dword ptr [ebp - 16], eax
L6:
    mov ecx, dword ptr [ebx + 000000100h]
    mov ecx, dword ptr [ecx + 8]
    mov edx, dword ptr [ebp - 16]
    mov ecx, dword ptr [edx + ecx]
    mov eax, dword ptr [ebx + 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ecx + 8]
    cmp ecx, -1
    je L10
    mov eax, dword ptr [eax + ecx*4]
    mov eax, dword ptr [eax + 4]
    mov ecx, dword ptr [ebx + 16]
    mov eax, dword ptr [ecx + eax*4]
    test byte ptr [eax + 4], 4
    jne L10
    and dword ptr [ebp - 20], 0
    test edi, edi
    jbe L9
    mov eax, edx
    mov dword ptr [ebp - 8], eax
L7:
    mov eax, dword ptr [ebx + 000000100h]
    fldz
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [ecx + eax]
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [ecx + eax*4]
    push ecx
    push ecx
    fstp qword ptr [esp]
    mov dword ptr [ebp - 28], eax
    xor eax, eax
    push eax
    push eax
    push eax
    mov ecx, ebx
    call sub_100862BF
    mov edi, eax
    cmp edi, -1
    mov dword ptr [ebp - 40], edi
    je L13
    mov eax, dword ptr [ebx + 20]
    mov esi, dword ptr [eax + edi*4]
    push dword ptr [ebp - 28]
    mov ecx, esi
    call sub_10085E09
    xor ecx, ecx
    cmp eax, ecx
    jl L19
    cmp dword ptr [esi + 56], -1
    je L8
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push ecx
    push ecx
    push ecx
    mov ecx, ebx
    call sub_100862FE
    mov edi, eax
    cmp edi, -1
    je L13
    mov eax, dword ptr [ebx + 20]
    mov edx, dword ptr [ebp - 28]
    mov edx, dword ptr [edx + 56]
    mov ecx, dword ptr [eax + edi*4]
    push dword ptr [eax + edx*4]
    mov dword ptr [ebp - 36], ecx
    call sub_10085E4C
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [ebp + eax*4 - 56]
    mov ecx, dword ptr [ebp - 36]
    mov dword ptr [esi + 56], edi
    mov edi, dword ptr [ebp - 40]
    mov dword ptr [ecx + 8], eax
L8:
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [ebp + eax*4 - 56]
    mov ecx, dword ptr [ebp - 8]
    inc dword ptr [ebp - 20]
    add dword ptr [ebp - 8], 4
    mov dword ptr [esi + 8], eax
    mov eax, dword ptr [ebx + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov dword ptr [ecx + eax], edi
    mov eax, dword ptr [ebp - 20]
    cmp eax, dword ptr [ebp - 12]
    jb L7
    mov edi, dword ptr [ebp - 12]
L9:
    inc dword ptr [ebp - 4]
L10:
    inc dword ptr [ebp - 24]
    mov eax, edi
    shl eax, 2
    add dword ptr [ebp - 16], eax
    mov eax, dword ptr [ebp - 24]
    cmp eax, dword ptr [ebp - 32]
    jb L6
    push 116
    call sub_10085A5E
    test eax, eax
    je L11
    mov ecx, eax
    call sub_100855CE
    mov edi, eax
    mov dword ptr [ebp - 16], edi
    jmp L12
L11:
    and dword ptr [ebp - 16], 0
    mov edi, dword ptr [ebp - 16]
L12:
    test edi, edi
    jne L14
L13:
    mov eax, 08007000Eh
    jmp L19
L14:
    mov eax, dword ptr [ebp - 4]
    push 0
    push dword ptr [ebp - 4]
    and eax, 0000FFFFFh
    push dword ptr [ebp - 4]
    or eax, 010000000h
    push eax
    mov ecx, edi
    call sub_10085AED
    mov esi, eax
    test esi, esi
    mov ecx, edi
    jl L16
    push dword ptr [ebx + 000000100h]
    call sub_10085651
    mov esi, eax
    test esi, esi
    jge L15
    mov ecx, edi
    jmp L16
L15:
    mov eax, dword ptr [ebp - 4]
    mov edi, dword ptr [edi + 16]
    shl eax, 2
    mov ecx, eax
    mov edx, ecx
    shr ecx, 2
    lea esi, [ebp - 56]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, eax
    mov eax, dword ptr [ebp - 16]
    mov edi, dword ptr [eax + 8]
    shr ecx, 2
    lea esi, [ebp - 72]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    push eax
    mov ecx, ebx
    call sub_1008630C
    mov esi, eax
    test esi, esi
    jge L17
    mov ecx, dword ptr [ebp - 16]
L16:
    push 1
    call sub_1006C70E
    mov eax, esi
    jmp L19
L17:
    xor eax, eax
    jmp L19
L18:
    xor eax, eax
    inc eax
L19:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100bb1c6 ENDP
END
