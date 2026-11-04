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
.CODE
FUN_100aefa6 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000084h
    and dword ptr [ebp - 40], 0
    push ebx
    push esi
    push edi
    xor eax, eax
    cmp dword ptr [ebp + 12], 0
    lea edi, [ebp - 72]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov ebx, ecx
    stosd dword ptr es:[edi], eax
    jbe L38
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [ebp - 20], eax
L0:
    mov eax, dword ptr [ebp - 20]
    mov edx, dword ptr [eax]
    xor edi, edi
    cmp edx, edi
    je L37
    mov eax, dword ptr [edx]
    mov ecx, eax
    and ecx, 0000FFFFFh
    and eax, 0FFF00000h
    cmp eax, 060000000h
    mov esi, ecx
    jne L1
    xor ecx, ecx
    inc ecx
L1:
    cmp ecx, dword ptr [ebp + 20]
    jne L37
    mov eax, dword ptr [edx]
    and eax, 0FFF00000h
    cmp eax, 011000000h
    je L37
    cmp dword ptr [ebp + 20], edi
    mov dword ptr [ebp - 8], edi
    mov dword ptr [ebp - 4], edi
    jbe L6
    mov eax, dword ptr [edx + 8]
    lea eax, [eax + esi*4]
    mov dword ptr [ebp - 12], eax
L2:
    push 0
    xor edi, edi
    inc edi
    push edi
    push dword ptr [ebp - 12]
    mov ecx, ebx
    push dword ptr [ebx + 000000220h]
    push dword ptr [ebx + 00000022Ch]
    call sub_100AE91E
    mov esi, dword ptr [ebp - 4]
    shl esi, 2
    test eax, eax
    mov dword ptr [ebp - 16], eax
    mov dword ptr [ebp + esi - 84], eax
    je L4
    cmp dword ptr [eax], 050000003h
    jne L4
    push 0
    push 0
    lea edi, [ebp + esi - 000000084h]
    push edi
    lea eax, [ebp + esi - 108]
    push eax
    lea eax, [ebp + esi - 56]
    push eax
    push dword ptr [ebp - 16]
    mov ecx, ebx
    push dword ptr [ebx + 000000220h]
    push dword ptr [ebx + 00000022Ch]
    call sub_100AEA5B
    push 0
    push 1
    lea ecx, [ebp - 60]
    push ecx
    lea ecx, [ebp + esi - 96]
    push ecx
    lea eax, [ebp + esi - 120]
    push eax
    push dword ptr [ebp - 16]
    mov ecx, ebx
    push 4
    push dword ptr [ebp + 16]
    mov dword ptr [ebp - 24], eax
    call sub_100AEA7F
    cmp dword ptr [edi], 0
    je L3
    mov eax, dword ptr [ebp - 24]
    mov ecx, dword ptr [ebp - 120]
    cmp dword ptr [eax], ecx
    jne L3
    cmp dword ptr [ebp - 60], 0
    jne L5
L3:
    mov dword ptr [ebp - 8], 1
    jmp L5
L4:
    mov dword ptr [ebp - 8], edi
L5:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    add dword ptr [ebp - 12], 4
    cmp eax, dword ptr [ebp + 20]
    jb L2
    cmp dword ptr [ebp - 8], 0
    jne L37
    xor edi, edi
L6:
    cmp dword ptr [ebp + 20], edi
    mov dword ptr [ebp - 4], edi
    jbe L26
L7:
    mov eax, dword ptr [ebx + 76]
    cmp eax, dword ptr [ebx + 000000224h]
    mov dword ptr [ebp - 28], eax
    jae L15
    mov ecx, dword ptr [ebx + 000000230h]
    lea ecx, [ecx + eax*4]
    mov dword ptr [ebp - 16], ecx
L8:
    mov ecx, dword ptr [ebp - 16]
    mov esi, dword ptr [ecx]
    cmp esi, edi
    mov dword ptr [ebp - 12], esi
    je L14
    mov ecx, dword ptr [ebp - 20]
    mov ecx, dword ptr [ecx]
    cmp ecx, edi
    je L14
    cmp dword ptr [esi], edi
    je L14
    mov edx, dword ptr [ecx]
    mov edi, dword ptr [ecx + 4]
    mov eax, edx
    and eax, 0000FFFFFh
    cmp edx, 072D00003h
    mov dword ptr [ebp - 32], edi
    jne L9
    mov dword ptr [ebp - 32], 6
L9:
    xor edi, edi
    cmp eax, dword ptr [ebp - 32]
    mov dword ptr [ebp - 8], eax
    jae L13
    mov eax, dword ptr [esi + 4]
    mov dword ptr [ebp - 24], eax
L10:
    cmp dword ptr [ebp - 24], edi
    mov dword ptr [ebp - 36], edi
    jbe L12
    mov eax, dword ptr [ecx + 8]
    mov edx, dword ptr [ebp - 8]
    mov edx, dword ptr [eax + edx*4]
    mov eax, dword ptr [esi + 8]
L11:
    mov edi, dword ptr [eax]
    cmp edi, edx
    je L42
    mov esi, dword ptr [ebx + 20]
    mov esi, dword ptr [esi + edi*4]
    cmp dword ptr [esi + 56], edx
    mov esi, dword ptr [ebp - 12]
    je L42
    mov esi, dword ptr [esi + 4]
    inc dword ptr [ebp - 36]
    add eax, 4
    cmp dword ptr [ebp - 36], esi
    mov dword ptr [ebp - 24], esi
    mov esi, dword ptr [ebp - 12]
    jb L11
    xor edi, edi
L12:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp - 32]
    jb L10
L13:
    mov eax, dword ptr [ebp - 28]
L14:
    add dword ptr [ebp - 16], 4
    inc eax
    cmp eax, dword ptr [ebx + 000000224h]
    mov dword ptr [ebp - 28], eax
    jb L8
L15:
    mov ecx, dword ptr [ebp - 4]
    cmp ecx, 1
    jb L16
    mov eax, dword ptr [ebp + ecx*4 - 60]
    cmp eax, dword ptr [ebp - 120]
    jbe L45
    inc eax
    cmp dword ptr [ebp + ecx*4 - 56], eax
    jne L45
L16:
    mov esi, ecx
    mov ecx, dword ptr [ebx + 20]
    shl esi, 2
    mov eax, dword ptr [ebp + esi - 84]
    mov eax, dword ptr [eax + 8]
    mov edx, dword ptr [ebp + esi - 108]
    mov edx, dword ptr [eax + edx*4]
    mov edx, dword ptr [ecx + edx*4]
    cmp dword ptr [edx + 60], edi
    jne L46
    mov edx, dword ptr [ebp + esi - 96]
    mov eax, dword ptr [eax + edx*4]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 60]
    cmp eax, edi
    je L17
    cmp eax, 000060000h
    jne L47
L17:
    push 116
    call sub_10085AAC
    cmp eax, edi
    je L18
    mov ecx, eax
    call sub_1008561C
    mov ecx, eax
    jmp L19
L18:
    xor ecx, ecx
L19:
    cmp ecx, edi
    mov dword ptr [ebp + esi - 72], ecx
    je L49
    mov edx, dword ptr [ebp + 20]
    lea eax, [edx - 1]
    cmp dword ptr [ebp - 4], eax
    jne L23
    mov eax, dword ptr [ebp - 20]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [eax]
    cmp eax, 072D00003h
    jne L20
    cmp edx, 3
    jne L50
    push edi
    push 4
    push 9
    push 072A00003h
    jmp L25
L20:
    cmp eax, 072C00003h
    jne L21
    cmp edx, 3
    jne L50
    push edi
    push 4
    push 6
    push 072900003h
    jmp L25
L21:
    cmp edx, 1
    push edi
    push 4
    push 6
    jne L22
    push 072B00003h
    jmp L25
L22:
    xor eax, eax
    cmp dword ptr [ebp + 20], 3
    setne al
    dec eax
    and eax, 000200000h
    add eax, 072300003h
    jmp L24
L23:
    xor eax, eax
    cmp dword ptr [ebp + 20], 3
    push edi
    setne al
    push edi
    push 6
    dec eax
    and eax, 000200000h
    add eax, 072200003h
L24:
    push eax
L25:
    call sub_10085BA3
    mov esi, eax
    cmp esi, edi
    jl L39
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp + 20]
    jb L7
L26:
    cmp dword ptr [ebp + 20], edi
    mov dword ptr [ebp - 4], edi
    jbe L30
L27:
    mov eax, dword ptr [ebp - 4]
    and dword ptr [ebp - 16], 0
    shl eax, 2
    mov ecx, dword ptr [ebp + eax - 84]
    mov edi, dword ptr [ebp + eax - 72]
    mov dword ptr [ebp - 24], ecx
    mov ecx, dword ptr [ebp + eax - 000000084h]
    mov dword ptr [ebp - 12], ecx
    mov ecx, dword ptr [ebp + eax - 96]
    mov eax, dword ptr [ebp + eax - 108]
    shl ecx, 2
    push 12
    shl eax, 2
    pop esi
    mov dword ptr [ebp - 32], ecx
    mov dword ptr [ebp - 28], eax
L28:
    mov eax, dword ptr [ebp - 24]
    fldz
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [edi + 8]
    mov edx, dword ptr [ebp - 28]
    mov eax, dword ptr [edx + eax]
    mov edx, dword ptr [ebp - 32]
    mov dword ptr [esi + ecx - 12], eax
    mov eax, dword ptr [ebp - 24]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [edx + eax]
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [esi + ecx], eax
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [edi + 8]
    mov edx, dword ptr [eax + esi - 12]
    mov eax, dword ptr [esi + eax]
    mov edx, dword ptr [ecx + edx*4]
    mov eax, dword ptr [ecx + eax*4]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 0
    push 0
    push dword ptr [ebx + 000000080h]
    mov ecx, ebx
    mov dword ptr [ebp - 8], edx
    mov dword ptr [ebp - 44], eax
    call sub_1008652E
    mov ecx, dword ptr [ebx + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov dword ptr [ebp - 36], ecx
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [esi + ecx], eax
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [esi + eax - 12]
    push dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebp - 8]
    call sub_10086081
    mov eax, dword ptr [ebp - 44]
    mov eax, dword ptr [eax + 60]
    mov dword ptr [ebp - 44], eax
    mov eax, dword ptr [ebp - 60]
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [eax + 8]
    and ecx, 0000FFFFFh
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebx + 20]
    push dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebp - 36]
    call sub_100860A9
    mov eax, dword ptr [ebp - 36]
    mov ecx, dword ptr [ebp - 16]
    mov dword ptr [eax + 16], ecx
    mov ecx, dword ptr [ebp - 44]
    mov dword ptr [eax + 60], ecx
    mov eax, dword ptr [ebp - 20]
    mov eax, dword ptr [eax]
    cmp dword ptr [eax], 072D00003h
    jne L29
    mov ecx, dword ptr [ebp + 20]
    dec ecx
    cmp dword ptr [ebp - 4], ecx
    jne L29
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [edi + 8]
    mov eax, dword ptr [esi + eax + 12]
    mov dword ptr [esi + ecx + 12], eax
L29:
    inc dword ptr [ebp - 16]
    add dword ptr [ebp - 28], 4
    add dword ptr [ebp - 32], 4
    add esi, 4
    cmp esi, 24
    jb L28
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp + 20]
    jb L27
L30:
    mov eax, dword ptr [ebp + 20]
    mov ecx, dword ptr [ebp + eax*4 - 76]
    mov edx, dword ptr [ebp - 20]
    xor eax, eax
L31:
    mov esi, dword ptr [edx]
    mov esi, dword ptr [esi + 16]
    mov esi, dword ptr [eax + esi]
    mov edi, dword ptr [ecx + 16]
    mov dword ptr [eax + edi], esi
    add eax, 4
    cmp eax, 16
    jb L31
    mov edi, dword ptr [ebp + 20]
    xor eax, eax
    test edi, edi
    jbe L33
L32:
    mov ecx, dword ptr [ebp + eax*4 - 56]
    mov esi, dword ptr [ebp + 16]
    cmp dword ptr [esi + ecx*4], 0
    jne L44
    inc eax
    cmp eax, edi
    jb L32
L33:
    mov eax, dword ptr [edx]
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 4]
    mov edx, dword ptr [ebx + 16]
    mov esi, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [esi + 4]
    test cl, cl
    jns L51
    test cx, 000000840h
    mov ecx, dword ptr [ebp + edi*4 - 60]
    je L34
    cmp ecx, dword ptr [eax + 12]
    je L35
    test byte ptr [esi + 5], 8
    mov eax, dword ptr [ebp + 20]
    push dword ptr [ebp + eax*4 - 60]
    mov ecx, dword ptr [ebp - 40]
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + ecx*4]
    je L52
    push 0101176A0h
    jmp L53
L34:
    mov dword ptr [eax + 12], ecx
L35:
    and dword ptr [ebp - 4], 0
    test edi, edi
    jbe L37
L36:
    mov ecx, dword ptr [ebp - 4]
    mov edx, dword ptr [ebp + 16]
    shl ecx, 2
    lea edi, [ebp + ecx - 72]
    mov eax, dword ptr [edi]
    mov ecx, dword ptr [ebp + ecx - 56]
    mov dword ptr [edx + ecx*4], eax
    push eax
    mov ecx, ebx
    call sub_10086582
    mov esi, eax
    test esi, esi
    jl L39
    mov eax, dword ptr [ebp - 20]
    and dword ptr [eax], 0
    and dword ptr [edi], 0
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp + 20]
    jb L36
L37:
    inc dword ptr [ebp - 40]
    mov eax, dword ptr [ebp - 40]
    add dword ptr [ebp - 20], 4
    cmp eax, dword ptr [ebp + 12]
    jb L0
L38:
    xor esi, esi
L39:
    xor edi, edi
L40:
    mov ecx, dword ptr [ebp + edi*4 - 72]
    test ecx, ecx
    je L41
    push 1
    call sub_1006C9B4
L41:
    inc edi
    cmp edi, 3
    jb L40
    pop edi
    mov eax, esi
    pop esi
    pop ebx
    leave
    ret 16
L42:
    push 010117658h
    push 0000011ACh
    push dword ptr [esi + 60]
L43:
    push ebx
    call sub_1008B673
    add esp, 16
L44:
    mov esi, 080004005h
    jmp L39
L45:
    mov eax, dword ptr [ebx + 0000000C8h]
    and eax, 0000000FFh
    push eax
    push 0101175C8h
    push 0000011ADh
    push edi
    jmp L54
L46:
    push 010117570h
    push 0000011AEh
    jmp L48
L47:
    push 010117520h
    push 0000011AFh
L48:
    push edi
    jmp L43
L49:
    mov esi, 08007000Eh
    jmp L39
L50:
    xor esi, esi
    inc esi
    jmp L39
L51:
    push 0101174F4h
    push 0000012CCh
    push 0
    jmp L43
L52:
    push 0101174B0h
L53:
    push 0000011A3h
    push dword ptr [eax + 60]
L54:
    push ebx
    call sub_1008B6DC
    add esp, 20
    jmp L44
FUN_100aefa6 ENDP
END
