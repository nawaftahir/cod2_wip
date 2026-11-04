.686
.MODEL FLAT, C
EXTRN sub_1008560B:PROC
EXTRN sub_10085713:PROC
EXTRN sub_10085748:PROC
EXTRN sub_10085784:PROC
EXTRN sub_10085833:PROC
EXTRN sub_10089D5E:PROC
EXTRN sub_10089E09:PROC
EXTRN sub_10089E0E:PROC
EXTRN sub_10089EE9:PROC
EXTRN sub_1008AF8B:PROC
EXTRN sub_1008B0DC:PROC
EXTRN sub_10094D50:PROC
EXTRN sub_10098A3B:PROC
EXTRN sub_10098A45:PROC
EXTRN sub_10098A46:PROC
EXTRN sub_10098A47:PROC
EXTRN sub_10098A51:PROC
EXTRN sub_10098A56:PROC
EXTRN sub_10098A5E:PROC
EXTRN sub_10098A67:PROC
EXTRN sub_10098A73:PROC
EXTRN sub_10098A7F:PROC
EXTRN sub_10098A8B:PROC
EXTRN sub_10098AA9:PROC
EXTRN sub_10098AB3:PROC
EXTRN sub_10098AE2:PROC
EXTRN sub_10098B22:PROC
EXTRN sub_10098B2B:PROC
EXTRN sub_10098B95:PROC
EXTRN sub_10098BBD:PROC
EXTRN sub_10098BD3:PROC
EXTRN sub_10098BE5:PROC
EXTRN sub_10098BE6:PROC
EXTRN sub_10098BEC:PROC
EXTRN sub_10098C9B:PROC
EXTRN sub_10098CA0:PROC
EXTRN sub_10098CA7:PROC
EXTRN sub_10098CD4:PROC
EXTRN sub_10098CD8:PROC
EXTRN sub_10098CDD:PROC
EXTRN sub_10098CE3:PROC
EXTRN sub_10098CE7:PROC
EXTRN sub_10098DF5:PROC
EXTRN sub_10098DFB:PROC
EXTRN sub_10098E07:PROC
EXTRN sub_10098E25:PROC
EXTRN sub_10098E2D:PROC
EXTRN sub_10098E32:PROC
EXTRN sub_10098E37:PROC
EXTRN sub_10098E40:PROC
EXTRN sub_10098E88:PROC
EXTRN sub_10098EE7:PROC
EXTRN sub_10098EEF:PROC
EXTRN sub_10098EF5:PROC
EXTRN sub_10098F03:PROC
EXTRN sub_10098F24:PROC
EXTRN sub_100F78B6:PROC
EXTRN sub_100F7DB7:PROC
.CODE
FUN_100984ab PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 100
    push push ebx
    push push esi
    xor xor esi, esi
    mov mov ebx, ecx
    cmp cmp dword ptr [ebx + 4], esi
    push push edi
    mov mov dword ptr [ebp - 28], esi
    jbe L0
    mov mov ecx, dword ptr [ebx + 16]
    mov mov edi, dword ptr [ebx + 4]
    mov mov eax, dword ptr [ecx]
    mov mov edx, dword ptr [eax + 4]
    test test dh, 1
    je L2
    test test dh, 12
    je L3
    add add esi, dword ptr [eax + 8]
    add add ecx, 4
    dec dec edi
    jne L1
    mov mov dword ptr [ebp - 28], esi
    mov mov eax, dword ptr [ebx + 12]
    lea lea eax, [esi + eax*2]
    shl shl eax, 2
    mov mov edi, eax
    shl shl edi, 2
    push push edi
    call sub_100F78B6
    test test eax, eax
    pop pop ecx
L0:
    mov mov dword ptr [ebp - 4], eax
L1:
    jne L4
    mov mov eax, 08007000Eh
    jmp sub_10098A5E
    mov mov ecx, edi
    mov mov edi, dword ptr [ebp - 4]
    mov mov edx, ecx
    shr shr ecx, 2
    or or eax, -1
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    xor xor esi, esi
    mov mov ecx, ebx
    mov mov dword ptr [ebp - 48], esi
    call sub_1008AF8B
    cmp cmp dword ptr [ebx + 4], esi
    mov mov dword ptr [ebp - 16], esi
    jbe L17
    mov mov eax, dword ptr [ebx + 16]
    mov mov eax, dword ptr [eax + esi*4]
    mov mov eax, dword ptr [eax + 4]
    test test ah, 1
    mov mov dword ptr [ebp - 24], eax
    je L16
    test test byte ptr [ebp - 23], 12
    je L18
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [ebp - 28], 0
    jbe L8
    mov mov eax, dword ptr [ebx + 8]
    xor xor edi, edi
    test test eax, eax
    jbe L6
    mov mov edx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [edx + edi*4]
    cmp cmp dword ptr [eax + 4], esi
    jne L6
    cmp cmp dword ptr [eax + 8], -1
    jne L7
    mov mov ecx, dword ptr [eax + 12]
    add add ecx, dword ptr [ebp - 8]
    mov mov esi, dword ptr [eax + 16]
    lea lea ecx, [esi + ecx*4]
    mov mov esi, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [esi + ecx*4]
    cmp cmp ecx, -1
    je L10
    test test byte ptr [ebp - 23], 8
    jne L11
    mov mov ecx, dword ptr [edx + ecx*4]
    fld fld qword ptr [ecx + 32]
    fld fld qword ptr [eax + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L12
    mov mov esi, dword ptr [ebp - 16]
    inc inc edi
    cmp cmp edi, dword ptr [ebx + 8]
    jb L5
    jmp L13
    mov mov esi, dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebx + 8]
    cmp cmp edi, eax
    je L14
    inc inc dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp - 8]
    cmp cmp ecx, dword ptr [ebp - 28]
    jb L9
    test test byte ptr [ebp - 23], 8
    jne L19
    xor xor edx, edx
    cmp cmp dword ptr [ebx + 8], edx
    jbe L25
    mov mov eax, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax + edx*4]
    cmp cmp dword ptr [eax + 4], esi
    jne L21
    mov mov ecx, dword ptr [ebp - 8]
    add add dword ptr [eax + 12], ecx
    cmp cmp dword ptr [eax + 8], -1
    mov mov ecx, dword ptr [eax + 12]
    jne L23
    mov mov edi, dword ptr [eax + 16]
    lea lea ecx, [edi + ecx*4]
    mov mov edi, dword ptr [ebp - 4]
    lea lea ecx, [edi + ecx*4]
    cmp cmp dword ptr [ecx], -1
    jne L22
    mov mov dword ptr [ecx], edx
    jmp L24
    mov mov edi, dword ptr [ebx + 116]
    mov mov dword ptr [eax + 4], edi
    mov mov ecx, dword ptr [ecx]
    mov mov dword ptr [eax + 48], ecx
    mov mov dword ptr [ebp - 48], 1
    inc inc edx
    cmp cmp edx, dword ptr [ebx + 8]
    jb L20
    jmp L26
    xor xor ecx, ecx
    cmp cmp dword ptr [ebx + 8], ecx
    jbe L27
    mov mov eax, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    cmp cmp dword ptr [eax + 4], esi
    jne L28
    mov mov edx, dword ptr [eax + 12]
    add add edx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [eax + 16]
    lea lea eax, [eax + edx*4]
    mov mov edx, dword ptr [ebp - 4]
    mov mov dword ptr [edx + eax*4], ecx
    inc inc ecx
    cmp cmp ecx, dword ptr [ebx + 8]
    jb L27
    inc inc esi
    cmp cmp esi, dword ptr [ebx + 4]
    mov mov dword ptr [ebp - 16], esi
    jb L15
    cmp cmp dword ptr [ebp - 48], 0
    je L29
    mov mov ecx, ebx
    call sub_1008B0DC
    xor xor esi, esi
    xor xor edx, edx
    cmp cmp dword ptr [ebx + 8], esi
    jbe L30
    mov mov eax, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [eax + 4]
L6:
    mov mov edi, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [edi + ecx*4]
L7:
    mov mov ecx, dword ptr [ecx + 4]
L8:
    test test ch, 1
L9:
    je L31
    test test ch, 12
    jne L32
    or or dword ptr [eax + 12], -1
    mov mov ecx, dword ptr [ebx + 120]
L10:
    mov mov dword ptr [eax + 4], ecx
    inc inc edx
    cmp cmp edx, dword ptr [ebx + 8]
    jb L30
    cmp cmp dword ptr [ebx + 12], esi
    mov mov dword ptr [ebp - 28], esi
    jbe sub_10098B22
    mov mov eax, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [ebp - 28]
    mov mov eax, dword ptr [eax + ecx*4]
    test test word ptr [eax + 2], 0FFF0h
    mov mov dword ptr [ebp - 12], eax
    je sub_10098B2B
    or or eax, -1
    lea lea edi, [ebp - 68]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    mov mov ecx, dword ptr [ebp - 12]
    stosd stosd dword ptr es:[edi], eax
    xor xor eax, eax
    lea lea edi, [ebp - 84]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    xor xor esi, esi
    lea lea eax, [ebp - 24]
    push push eax
    push push esi
    mov mov dword ptr [ebp - 8], esi
L14:
    mov mov dword ptr [ebp - 40], esi
    mov mov dword ptr [ebp - 32], esi
L15:
    call sub_1008560B
    cmp cmp eax, esi
    mov mov dword ptr [ebp - 36], eax
    je sub_10098A46
    lea lea esi, [ebp - 100]
    mov mov dword ptr [ebp - 20], esi
    mov mov ecx, dword ptr [ebp - 24]
    mov mov edi, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [ecx]
    mov mov ecx, dword ptr [edi + ecx*4]
    mov mov edx, dword ptr [ebx + 120]
    cmp cmp edx, dword ptr [ecx + 4]
    jne sub_10098A3B
    cmp cmp dword ptr [ecx + 8], -1
    jne sub_10098A45
    mov mov edx, dword ptr [ebx + 108]
    not not edx
    and and edx, 4
    shr shr edx, 2
    mov mov dword ptr [esi], edx
    xor xor edx, edx
    inc inc edx
    cmp cmp eax, edx
    jbe L33
    cmp cmp dword ptr [esi], 0
    je L34
    mov mov eax, dword ptr [ebp - 24]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [edi + eax*4]
    fld fld qword ptr [eax + 32]
    fld fld qword ptr [ecx + 32]
    fucompp fucompp
L19:
    fnstsw fnstsw ax
    test test ah, 68
L20:
    jnp L35
    and and dword ptr [esi], 0
L21:
    mov mov eax, dword ptr [ebp - 36]
    inc inc edx
    cmp cmp edx, eax
    jb L33
    and and dword ptr [ebp - 16], 0
    test test eax, eax
L22:
    jbe sub_10098A7F
    mov mov ecx, dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp - 24]
    mov mov edx, dword ptr [eax + ecx*4]
    mov mov esi, dword ptr [edi + edx*4]
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp - 8], ecx
    jbe sub_10098A56
    mov mov eax, dword ptr [ebp + ecx*4 - 68]
L25:
    fld fld qword ptr [esi + 32]
    mov mov eax, dword ptr [edi + eax*4]
    fld fld qword ptr [eax + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_10098A67
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp - 8]
    jb sub_10098A51
    cmp cmp ecx, 4
    je sub_10098AA9
    cmp cmp ecx, dword ptr [ebp - 8]
    jne sub_10098A8B
    mov mov eax, dword ptr [ebp - 8]
    inc inc dword ptr [ebp - 8]
    mov mov dword ptr [ebp + eax*4 - 68], edx
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp dword ptr [eax], 0
    jne sub_10098AB3
    xor xor edx, edx
    lea lea eax, [ebp + ecx*4 - 84]
    mov mov ecx, dword ptr [ebp - 16]
    inc inc edx
    shl shl edx, cl
    or or dword ptr [eax], edx
    inc inc dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp - 16]
    cmp cmp eax, dword ptr [ebp - 36]
    jb sub_10098A73
    jmp sub_10098AE2
    mov mov dword ptr [ebp - 40], 1
    mov mov esi, dword ptr [ebp - 20]
    cmp cmp dword ptr [ebp - 40], 0
    jne sub_10098B95
    inc inc dword ptr [ebp - 32]
    mov mov ecx, dword ptr [ebp - 12]
    lea lea eax, [ebp - 24]
    push push eax
    push push dword ptr [ebp - 32]
    add add esi, 4
    mov mov dword ptr [ebp - 20], esi
    call sub_10085713
    test test eax, eax
    mov mov dword ptr [ebp - 36], eax
    jne sub_10098A47
    cmp cmp dword ptr [ebp - 40], eax
    jne sub_10098BBD
    lea lea eax, [ebp - 84]
    push push eax
    lea lea eax, [ebp - 68]
    push push eax
    push push dword ptr [ebp - 4]
    mov mov ecx, ebx
    call sub_10089E0E
    test test eax, eax
    jl sub_10098BD3
    mov mov ecx, dword ptr [ebp - 12]
    lea lea eax, [ebp - 52]
    push push eax
    xor xor esi, esi
    push push esi
    call sub_10085748
    cmp cmp eax, esi
    je sub_10098C9B
    mov mov edx, dword ptr [ebp - 52]
    mov mov edi, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [edx]
    mov mov ecx, dword ptr [edi + ecx*4]
    mov mov edi, dword ptr [ebx + 120]
    cmp cmp edi, dword ptr [ecx + 4]
    jne sub_10098BE6
    cmp cmp dword ptr [ecx + 8], -1
    jne sub_10098BEC
    push push eax
    push push edx
    lea lea eax, [ebp - 68]
    push push eax
    mov mov ecx, ebx
    call sub_10089D5E
    mov mov ecx, dword ptr [ebp - 12]
    lea lea eax, [ebp - 52]
    push push eax
L30:
    inc inc esi
    push push esi
    call sub_10085784
    test test eax, eax
    jne sub_10098BE5
    jmp sub_10098CD8
    and and dword ptr [ebp - 40], 0
    lea lea eax, [ebp - 44]
    push push eax
    push push 0
    jmp sub_10098CD4
    mov mov esi, dword ptr [ebp - 44]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [esi]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebx + 120]
    cmp cmp ecx, dword ptr [eax + 4]
    jne sub_10098CDD
    cmp cmp dword ptr [eax + 8], -1
    jne sub_10098CE3
    mov mov eax, dword ptr [ebp - 16]
    xor xor edx, edx
    test test eax, eax
    jbe sub_10098CA0
    mov mov ecx, eax
    lea lea edi, [ebp - 68]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    xor xor esi, esi
    inc inc esi
    mov mov ecx, edx
    shl shl esi, cl
    inc inc edx
    cmp cmp edx, eax
    mov mov dword ptr [ebp + edx*4 - 88], esi
    jb sub_10098CA7
    push push 4
    pop pop edx
    cmp cmp eax, edx
    jae sub_10098CE7
    sub sub edx, eax
    shl shl edx, 2
    lea lea edi, [ebp + eax*4 - 84]
    lea lea esi, [ebp + eax*4 - 68]
    mov mov ecx, edx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    shr shr ecx, 2
    or or eax, -1
    mov mov edi, esi
    rep stosd rep stosd dword ptr es:[edi], eax
    lea lea eax, [ebp - 84]
    push push eax
    lea lea eax, [ebp - 68]
    push push eax
    push push dword ptr [ebp - 4]
    mov mov ecx, ebx
    call sub_10089EE9
    push push dword ptr [ebp - 16]
    lea lea eax, [ebp - 68]
    push push dword ptr [ebp - 44]
    mov mov ecx, ebx
    push push eax
    call sub_10089E09
    inc inc dword ptr [ebp - 40]
    lea lea eax, [ebp - 44]
    push push eax
    push push dword ptr [ebp - 40]
    mov mov ecx, dword ptr [ebp - 12]
    call sub_10085833
    test test eax, eax
    mov mov dword ptr [ebp - 16], eax
    jne sub_10098CE7
    inc inc dword ptr [ebp - 28]
    mov mov eax, dword ptr [ebp - 28]
    cmp cmp eax, dword ptr [ebx + 12]
    jb sub_10098B22
    xor xor edx, edx
    cmp cmp dword ptr [ebx + 8], edx
    mov mov dword ptr [ebp - 52], edx
    jbe sub_10098E07
    mov mov eax, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [eax + 4]
    mov mov esi, dword ptr [ebx + 16]
    mov mov edi, dword ptr [esi + ecx*4]
    mov mov esi, dword ptr [ebx + 120]
    cmp cmp esi, ecx
    jne sub_10098DF5
    cmp cmp dword ptr [eax + 12], -1
    jne sub_10098DFB
    mov mov ecx, dword ptr [ebx + 116]
    mov mov dword ptr [eax + 4], ecx
    jmp sub_10098E25
    mov mov ecx, dword ptr [edi + 4]
    test test ch, 1
    je sub_10098E2D
    test test cl, 64
    je sub_10098E32
    test test ch, 8
    jne sub_10098E37
    cmp cmp dword ptr [eax + 8], -1
    mov mov dword ptr [eax + 4], esi
    je sub_10098E40
    mov mov dword ptr [ebp - 52], 1
    inc inc edx
    cmp cmp edx, dword ptr [ebx + 8]
    jb sub_10098E07
    mov mov eax, dword ptr [ebx + 120]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    or or dword ptr [eax + 4], 64
    xor xor esi, esi
    cmp cmp dword ptr [ebp - 52], esi
    je sub_10098E88
    mov mov eax, dword ptr [ebx + 120]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    or or byte ptr [eax + 5], 4
    mov mov eax, dword ptr [ebx + 120]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov dword ptr [eax + 8], esi
    xor xor edx, edx
    cmp cmp dword ptr [ebx + 8], esi
    jbe sub_10098EE7
    mov mov eax, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [ebx + 120]
    cmp cmp ecx, dword ptr [eax + 4]
    jne sub_10098EEF
    cmp cmp dword ptr [eax + 8], -1
    jne sub_10098EF5
    mov mov edi, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [edi + ecx*4]
    mov mov eax, dword ptr [eax + 12]
    cmp cmp dword ptr [ecx + 8], eax
    ja sub_10098F03
    inc inc eax
    mov mov dword ptr [ecx + 8], eax
    inc inc edx
    cmp cmp edx, dword ptr [ebx + 8]
    jb sub_10098EE7
    cmp cmp dword ptr [ebp - 48], esi
    je sub_10098F24
    mov mov ecx, ebx
    call sub_10094D50
    push push dword ptr [ebp - 4]
    mov mov dword ptr [ebx + 0DCh], 1
    call sub_100F7DB7
    pop pop ecx
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100984ab ENDP
END
