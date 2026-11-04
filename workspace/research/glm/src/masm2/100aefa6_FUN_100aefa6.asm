.686
.MODEL FLAT, C
EXTRN sub_1006C9B4:PROC
EXTRN sub_1008561C:PROC
EXTRN sub_10085AAC:PROC
EXTRN sub_10085BA3:PROC
EXTRN sub_10086081:PROC
EXTRN sub_100860A9:PROC
EXTRN sub_1008652E:PROC
EXTRN sub_10086582:PROC
EXTRN sub_1008B673:PROC
EXTRN sub_1008B6DC:PROC
EXTRN sub_100AE91E:PROC
EXTRN sub_100AEA5B:PROC
EXTRN sub_100AEA7F:PROC
EXTRN sub_100AF5E4:PROC
EXTRN sub_100AF5F5:PROC
EXTRN sub_100AF60A:PROC
EXTRN sub_100AF668:PROC
EXTRN sub_100AF73A:PROC
EXTRN sub_100AF74C:PROC
EXTRN sub_100AF7AC:PROC
EXTRN sub_100AF7B6:PROC
EXTRN sub_100AF7C1:PROC
EXTRN sub_100AF7D3:PROC
EXTRN sub_100AF7FC:PROC
EXTRN sub_100AF824:PROC
EXTRN sub_100AF855:PROC
EXTRN sub_100AF87D:PROC
EXTRN sub_100AF87E:PROC
EXTRN sub_100AF87F:PROC
EXTRN sub_100AF886:PROC
EXTRN sub_100AF89A:PROC
EXTRN sub_100AF90E:PROC
EXTRN sub_100AF94C:PROC
EXTRN sub_100AF9E3:PROC
EXTRN sub_100AF9EB:PROC
EXTRN sub_100AFA40:PROC
EXTRN sub_100AFA5A:PROC
EXTRN sub_100AFA93:PROC
EXTRN sub_100AFAAB:PROC
EXTRN sub_100AFAD5:PROC
EXTRN sub_100AFAD7:PROC
EXTRN sub_100AFAE3:PROC
EXTRN sub_100AFAF2:PROC
EXTRN sub_100AFAF9:PROC
EXTRN sub_100AFB32:PROC
EXTRN sub_100AFB37:PROC
EXTRN sub_100AFB58:PROC
EXTRN sub_100AFB72:PROC
EXTRN sub_100AFB8A:PROC
EXTRN sub_100AFB93:PROC
EXTRN sub_100AFBA8:PROC
.CODE
FUN_100aefa6 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 084h
    and and dword ptr [ebp - 40], 0
    push push ebx
    push push esi
    push push edi
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 12], 0
    lea lea edi, [ebp - 72]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    mov mov ebx, ecx
    stosd stosd dword ptr es:[edi], eax
    jbe L24
    mov mov eax, dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 20], eax
    mov mov eax, dword ptr [ebp - 20]
    mov mov edx, dword ptr [eax]
    xor xor edi, edi
    cmp cmp edx, edi
    je L25
    mov mov eax, dword ptr [edx]
    mov mov ecx, eax
    and and ecx, 0FFFFFh
    and and eax, 0FFF00000h
    cmp cmp eax, 060000000h
    mov mov esi, ecx
    jne L0
    xor xor ecx, ecx
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp + 20]
    jne L27
    mov mov eax, dword ptr [edx]
    and and eax, 0FFF00000h
    cmp cmp eax, 011000000h
    je L29
    cmp cmp dword ptr [ebp + 20], edi
    mov mov dword ptr [ebp - 8], edi
    mov mov dword ptr [ebp - 4], edi
    jbe L2
    mov mov eax, dword ptr [edx + 8]
    lea lea eax, [eax + esi*4]
    mov mov dword ptr [ebp - 12], eax
    push push 0
    xor xor edi, edi
    inc inc edi
    push push edi
    push push dword ptr [ebp - 12]
    mov mov ecx, ebx
    push push dword ptr [ebx + 0220h]
    push push dword ptr [ebx + 022Ch]
    call sub_100AE91E
    mov mov esi, dword ptr [ebp - 4]
    shl shl esi, 2
    test test eax, eax
    mov mov dword ptr [ebp - 16], eax
    mov mov dword ptr [ebp + esi - 84], eax
    je L3
    cmp cmp dword ptr [eax], 050000003h
    jne L4
    push push 0
    push push 0
    lea lea edi, [ebp + esi - 084h]
    push push edi
    lea lea eax, [ebp + esi - 108]
    push push eax
    lea lea eax, [ebp + esi - 56]
    push push eax
    push push dword ptr [ebp - 16]
    mov mov ecx, ebx
    push push dword ptr [ebx + 0220h]
    push push dword ptr [ebx + 022Ch]
    call sub_100AEA5B
    push push 0
    push push 1
    lea lea ecx, [ebp - 60]
    push push ecx
    lea lea ecx, [ebp + esi - 96]
    push push ecx
    lea lea eax, [ebp + esi - 120]
    push push eax
    push push dword ptr [ebp - 16]
    mov mov ecx, ebx
    push push 4
    push push dword ptr [ebp + 16]
    mov mov dword ptr [ebp - 24], eax
    call sub_100AEA7F
    cmp cmp dword ptr [edi], 0
    je L5
    mov mov eax, dword ptr [ebp - 24]
    mov mov ecx, dword ptr [ebp - 120]
    cmp cmp dword ptr [eax], ecx
    jne L6
    cmp cmp dword ptr [ebp - 60], 0
    jne L7
    mov mov dword ptr [ebp - 8], 1
    jmp L8
    mov mov dword ptr [ebp - 8], edi
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    add add dword ptr [ebp - 12], 4
    cmp cmp eax, dword ptr [ebp + 20]
    jb L1
    cmp cmp dword ptr [ebp - 8], 0
    jne sub_100AF668
    xor xor edi, edi
    cmp cmp dword ptr [ebp + 20], edi
    mov mov dword ptr [ebp - 4], edi
    jbe L20
    mov mov eax, dword ptr [ebx + 76]
    cmp cmp eax, dword ptr [ebx + 0224h]
    mov mov dword ptr [ebp - 28], eax
    jae L10
    mov mov ecx, dword ptr [ebx + 0230h]
    lea lea ecx, [ecx + eax*4]
    mov mov dword ptr [ebp - 16], ecx
    mov mov ecx, dword ptr [ebp - 16]
    mov mov esi, dword ptr [ecx]
    cmp cmp esi, edi
    mov mov dword ptr [ebp - 12], esi
    je L11
    mov mov ecx, dword ptr [ebp - 20]
    mov mov ecx, dword ptr [ecx]
    cmp cmp ecx, edi
    je L13
    cmp cmp dword ptr [esi], edi
    je L14
    mov mov edx, dword ptr [ecx]
    mov mov edi, dword ptr [ecx + 4]
    mov mov eax, edx
    and and eax, 0FFFFFh
    cmp cmp edx, 072D00003h
    mov mov dword ptr [ebp - 32], edi
    jne L9
    mov mov dword ptr [ebp - 32], 6
    xor xor edi, edi
    cmp cmp eax, dword ptr [ebp - 32]
    mov mov dword ptr [ebp - 8], eax
    jae L15
    mov mov eax, dword ptr [esi + 4]
    mov mov dword ptr [ebp - 24], eax
L1:
    cmp cmp dword ptr [ebp - 24], edi
L2:
    mov mov dword ptr [ebp - 36], edi
    jbe L16
    mov mov eax, dword ptr [ecx + 8]
    mov mov edx, dword ptr [ebp - 8]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [esi + 8]
    mov mov edi, dword ptr [eax]
    cmp cmp edi, edx
    je sub_100AF73A
    mov mov esi, dword ptr [ebx + 20]
    mov mov esi, dword ptr [esi + edi*4]
    cmp cmp dword ptr [esi + 56], edx
    mov mov esi, dword ptr [ebp - 12]
    je sub_100AF74C
    mov mov esi, dword ptr [esi + 4]
    inc inc dword ptr [ebp - 36]
    add add eax, 4
    cmp cmp dword ptr [ebp - 36], esi
    mov mov dword ptr [ebp - 24], esi
    mov mov esi, dword ptr [ebp - 12]
    jb L18
    xor xor edi, edi
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebp - 32]
    jb L17
    mov mov eax, dword ptr [ebp - 28]
    add add dword ptr [ebp - 16], 4
    inc inc eax
    cmp cmp eax, dword ptr [ebx + 0224h]
    mov mov dword ptr [ebp - 28], eax
    jb L12
    mov mov ecx, dword ptr [ebp - 4]
L5:
    cmp cmp ecx, 1
    jb L19
    mov mov eax, dword ptr [ebp + ecx*4 - 60]
    cmp cmp eax, dword ptr [ebp - 120]
    jbe sub_100AF7B6
    inc inc eax
    cmp cmp dword ptr [ebp + ecx*4 - 56], eax
    jne sub_100AF7C1
    mov mov esi, ecx
    mov mov ecx, dword ptr [ebx + 20]
    shl shl esi, 2
L8:
    mov mov eax, dword ptr [ebp + esi - 84]
    mov mov eax, dword ptr [eax + 8]
    mov mov edx, dword ptr [ebp + esi - 108]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [ecx + edx*4]
    cmp cmp dword ptr [edx + 60], edi
    jne sub_100AF7FC
    mov mov edx, dword ptr [ebp + esi - 96]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 60]
    cmp cmp eax, edi
    je L21
    cmp cmp eax, 060000h
    jne sub_100AF824
    push push 116
    call sub_10085AAC
    cmp cmp eax, edi
    je L22
    mov mov ecx, eax
    call sub_1008561C
    mov mov ecx, eax
    jmp L23
    xor xor ecx, ecx
    cmp cmp ecx, edi
    mov mov dword ptr [ebp + esi - 72], ecx
    je sub_100AF855
    mov mov edx, dword ptr [ebp + 20]
    lea lea eax, [edx - 1]
    cmp cmp dword ptr [ebp - 4], eax
    jne L28
    mov mov eax, dword ptr [ebp - 20]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [eax]
    cmp cmp eax, 072D00003h
    jne L25
    cmp cmp edx, 3
    jne sub_100AF87E
    push push edi
    push push 4
    push push 9
    push push 072A00003h
    jmp L32
    cmp cmp eax, 072C00003h
    jne L30
    cmp cmp edx, 3
    jne sub_100AF89A
    push push edi
    push push 4
    push push 6
    push push 072900003h
    jmp sub_100AF5E4
    cmp cmp edx, 1
    push push edi
    push push 4
    push push 6
    jne L31
    push push 072B00003h
    jmp sub_100AF5F5
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 20], 3
    setne setne al
    dec dec eax
    and and eax, 0200000h
    add add eax, 072300003h
    jmp sub_100AF60A
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 20], 3
    push push edi
    setne setne al
    push push edi
    push push 6
    dec dec eax
    and and eax, 0200000h
    add add eax, 072200003h
    push push eax
    call sub_10085BA3
    mov mov esi, eax
    cmp cmp esi, edi
    jl sub_100AF87F
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp + 20]
    jb L20
    cmp cmp dword ptr [ebp + 20], edi
    mov mov dword ptr [ebp - 4], edi
    jbe sub_100AF7AC
    mov mov eax, dword ptr [ebp - 4]
    and and dword ptr [ebp - 16], 0
    shl shl eax, 2
    mov mov ecx, dword ptr [ebp + eax - 84]
    mov mov edi, dword ptr [ebp + eax - 72]
    mov mov dword ptr [ebp - 24], ecx
    mov mov ecx, dword ptr [ebp + eax - 084h]
    mov mov dword ptr [ebp - 12], ecx
    mov mov ecx, dword ptr [ebp + eax - 96]
    mov mov eax, dword ptr [ebp + eax - 108]
    shl shl ecx, 2
    push push 12
    shl shl eax, 2
    pop pop esi
    mov mov dword ptr [ebp - 32], ecx
    mov mov dword ptr [ebp - 28], eax
L10:
    mov mov eax, dword ptr [ebp - 24]
    fldz fldz
    mov mov eax, dword ptr [eax + 8]
L11:
    mov mov ecx, dword ptr [edi + 8]
    mov mov edx, dword ptr [ebp - 28]
    mov mov eax, dword ptr [edx + eax]
    mov mov edx, dword ptr [ebp - 32]
    mov mov dword ptr [esi + ecx - 12], eax
    mov mov eax, dword ptr [ebp - 24]
    mov mov eax, dword ptr [eax + 8]
    mov mov eax, dword ptr [edx + eax]
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [esi + ecx], eax
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [edi + 8]
    mov mov edx, dword ptr [eax + esi - 12]
    mov mov eax, dword ptr [esi + eax]
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov eax, dword ptr [ecx + eax*4]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push 0
    push push 0
    push push dword ptr [ebx + 080h]
    mov mov ecx, ebx
    mov mov dword ptr [ebp - 8], edx
    mov mov dword ptr [ebp - 44], eax
    call sub_1008652E
    mov mov ecx, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov dword ptr [ebp - 36], ecx
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [esi + ecx], eax
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [esi + eax - 12]
    push push dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebp - 8]
    call sub_10086081
    mov mov eax, dword ptr [ebp - 44]
    mov mov eax, dword ptr [eax + 60]
    mov mov dword ptr [ebp - 44], eax
    mov mov eax, dword ptr [ebp - 60]
    mov mov ecx, dword ptr [eax]
    mov mov eax, dword ptr [eax + 8]
    and and ecx, 0FFFFFh
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ebx + 20]
    push push dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebp - 36]
    call sub_100860A9
    mov mov eax, dword ptr [ebp - 36]
    mov mov ecx, dword ptr [ebp - 16]
    mov mov dword ptr [eax + 16], ecx
    mov mov ecx, dword ptr [ebp - 44]
    mov mov dword ptr [eax + 60], ecx
    mov mov eax, dword ptr [ebp - 20]
    mov mov eax, dword ptr [eax]
    cmp cmp dword ptr [eax], 072D00003h
    jne sub_100AF87D
    mov mov ecx, dword ptr [ebp + 20]
    dec dec ecx
    cmp cmp dword ptr [ebp - 4], ecx
    jne sub_100AF886
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [edi + 8]
    mov mov eax, dword ptr [esi + eax + 12]
    mov mov dword ptr [esi + ecx + 12], eax
    inc inc dword ptr [ebp - 16]
    add add dword ptr [ebp - 28], 4
    add add dword ptr [ebp - 32], 4
    add add esi, 4
    cmp cmp esi, 24
    jb sub_100AF7D3
L19:
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp + 20]
    jb sub_100AF7AC
    mov mov eax, dword ptr [ebp + 20]
    mov mov ecx, dword ptr [ebp + eax*4 - 76]
    mov mov edx, dword ptr [ebp - 20]
    xor xor eax, eax
    mov mov esi, dword ptr [edx]
    mov mov esi, dword ptr [esi + 16]
    mov mov esi, dword ptr [eax + esi]
    mov mov edi, dword ptr [ecx + 16]
    mov mov dword ptr [eax + edi], esi
L20:
    add add eax, 4
    cmp cmp eax, 16
    jb sub_100AF90E
    mov mov edi, dword ptr [ebp + 20]
    xor xor eax, eax
    test test edi, edi
    jbe sub_100AF94C
    mov mov ecx, dword ptr [ebp + eax*4 - 56]
    mov mov esi, dword ptr [ebp + 16]
    cmp cmp dword ptr [esi + ecx*4], 0
    jne sub_100AFA40
    inc inc eax
    cmp cmp eax, edi
    jb sub_100AF94C
    mov mov eax, dword ptr [edx]
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax + 4]
    mov mov edx, dword ptr [ebx + 16]
    mov mov esi, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [esi + 4]
    test test cl, cl
    jns sub_100AFAAB
    test test cx, 0840h
    mov mov ecx, dword ptr [ebp + edi*4 - 60]
    je sub_100AF9E3
    cmp cmp ecx, dword ptr [eax + 12]
    je sub_100AF9EB
    test test byte ptr [esi + 5], 8
    mov mov eax, dword ptr [ebp + 20]
    push push dword ptr [ebp + eax*4 - 60]
    mov mov ecx, dword ptr [ebp - 40]
    mov mov eax, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax + ecx*4]
    je sub_100AFAE3
    push push 0101176A0h
    jmp sub_100AFAF2
    mov mov dword ptr [eax + 12], ecx
    and and dword ptr [ebp - 4], 0
    test test edi, edi
    jbe sub_100AFA5A
    mov mov ecx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [ebp + 16]
    shl shl ecx, 2
    lea lea edi, [ebp + ecx - 72]
    mov mov eax, dword ptr [edi]
    mov mov ecx, dword ptr [ebp + ecx - 56]
    mov mov dword ptr [edx + ecx*4], eax
    push push eax
    mov mov ecx, ebx
    call sub_10086582
    mov mov esi, eax
    test test esi, esi
    jl sub_100AFA93
    mov mov eax, dword ptr [ebp - 20]
    and and dword ptr [eax], 0
    and and dword ptr [edi], 0
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp + 20]
    jb sub_100AFA5A
    inc inc dword ptr [ebp - 40]
    mov mov eax, dword ptr [ebp - 40]
    add add dword ptr [ebp - 20], 4
    cmp cmp eax, dword ptr [ebp + 12]
    jb L26
    xor xor esi, esi
    xor xor edi, edi
    mov mov ecx, dword ptr [ebp + edi*4 - 72]
    test test ecx, ecx
    je sub_100AFAD7
    push push 1
    call sub_1006C9B4
    inc inc edi
    cmp cmp edi, 3
    jb sub_100AFAD5
    pop pop edi
    mov mov eax, esi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 16
    push push 010117658h
    push push 011ACh
L26:
    push push dword ptr [esi + 60]
    push push ebx
    call sub_1008B673
    add add esp, 16
    mov mov esi, 080004005h
    jmp sub_100AFAF9
    mov mov eax, dword ptr [ebx + 0C8h]
    and and eax, 0FFh
    push push eax
    push push 0101175C8h
    push push 011ADh
    push push edi
    jmp sub_100AFBA8
    push push 010117570h
L28:
    push push 011AEh
    jmp sub_100AFB8A
    push push 010117520h
    push push 011AFh
    push push edi
    jmp sub_100AFB58
    mov mov esi, 08007000Eh
    jmp sub_100AFB32
    xor xor esi, esi
    inc inc esi
    jmp sub_100AFB37
    push push 0101174F4h
    push push 012CCh
    push push 0
    jmp sub_100AFB72
    push push 0101174B0h
L31:
    push push 011A3h
    push push dword ptr [eax + 60]
    push push ebx
L32:
    call sub_1008B6DC
    add add esp, 20
    jmp sub_100AFB93
FUN_100aefa6 ENDP
END
