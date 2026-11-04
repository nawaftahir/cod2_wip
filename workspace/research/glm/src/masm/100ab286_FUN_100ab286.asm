.686
.MODEL FLAT, C
EXTRN sub_1006C675:PROC
EXTRN sub_1006C688:PROC
EXTRN sub_1006C696:PROC
EXTRN sub_10085476:PROC
EXTRN sub_10085635:PROC
EXTRN sub_100857E4:PROC
EXTRN sub_1008586C:PROC
EXTRN sub_10085906:PROC
EXTRN sub_10085985:PROC
EXTRN sub_10085AC5:PROC
EXTRN sub_10085B46:PROC
EXTRN sub_10085C74:PROC
EXTRN sub_10085D0C:PROC
EXTRN sub_1008620B:PROC
EXTRN sub_10086289:PROC
EXTRN sub_100862E9:PROC
EXTRN sub_100863A8:PROC
EXTRN sub_1008648C:PROC
EXTRN sub_1008655E:PROC
EXTRN sub_10086631:PROC
EXTRN sub_10086642:PROC
EXTRN sub_100867D2:PROC
EXTRN sub_10087407:PROC
EXTRN sub_100A6EA3:PROC
EXTRN sub_100A704E:PROC
EXTRN sub_100A721D:PROC
EXTRN sub_100AA0AB:PROC
.CODE
FUN_100ab286 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 48
    push ebx
    push esi
    push edi
    mov esi, ecx
    push 6
    xor eax, eax
    pop ecx
    lea edi, [ebp - 48]
    rep stosd dword ptr es:[edi], eax
    mov eax, dword ptr [esi + 12]
    test eax, eax
    mov dword ptr [ebp - 20], eax
    jbe L5
    mov ecx, dword ptr [esi + 24]
    mov dword ptr [ebp - 12], ecx
    mov dword ptr [ebp - 8], eax
L0:
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [eax]
    test eax, eax
    je L4
    mov ecx, dword ptr [eax]
    test ecx, ecx
    mov dword ptr [ebp - 4], ecx
    je L4
    mov ecx, dword ptr [eax + 4]
    and dword ptr [ebp - 16], 0
    test ecx, ecx
    mov dword ptr [ebp - 24], ecx
    jbe L4
    mov ebx, dword ptr [eax + 8]
L1:
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [ebx]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [esi + 000000080h]
    cmp dword ptr [ecx + 4], eax
    jne L3
    movzx edx, byte ptr [ecx + 109]
    cmp edx, 5
    ja L4
    cmp byte ptr [ecx + 108], 3
    jne L3
    mov edi, dword ptr [ebp - 4]
    and edi, 0FFF00000h
    push edi
    call sub_100A6EA3
    test eax, eax
    jne L2
    cmp edi, 011000000h
    je L2
    mov ecx, dword ptr [ecx + 16]
    lea eax, [ebp + edx*4 - 48]
    inc ecx
    cmp ecx, dword ptr [eax]
    jbe L3
    mov dword ptr [eax], ecx
    jmp L3
L2:
    lea eax, [ebp + edx*4 - 48]
    mov edx, dword ptr [ecx + 16]
    inc edx
    cmp edx, dword ptr [eax]
    jbe L3
    cmp dword ptr [ecx + 60], 0
    je L3
    mov dword ptr [eax], edx
L3:
    inc dword ptr [ebp - 16]
    mov eax, dword ptr [ebp - 16]
    add ebx, 4
    cmp eax, dword ptr [ebp - 24]
    jb L1
L4:
    add dword ptr [ebp - 12], 4
    dec dword ptr [ebp - 8]
    jne L0
L5:
    and dword ptr [ebp - 8], 0
    lea eax, [ebp - 48]
    mov dword ptr [ebp - 4], eax
L6:
    mov eax, dword ptr [ebp - 4]
    cmp dword ptr [eax], 0
    je L13
    push 116
    call sub_10085906
    test eax, eax
    je L7
    mov ecx, eax
    call sub_10085476
    mov edi, eax
    jmp L8
L7:
    xor edi, edi
L8:
    test edi, edi
    je L17
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax]
    push 0
    push eax
    push eax
    and eax, 0000FFFFFh
    or eax, 072100000h
    push eax
    mov ecx, edi
    call sub_10085985
    mov ebx, eax
    test ebx, ebx
    jl L36
    mov eax, dword ptr [ebp - 4]
    xor ebx, ebx
    cmp dword ptr [eax], ebx
    jbe L10
L9:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push ebx
    push 0
    push dword ptr [esi + 000000088h]
    mov ecx, esi
    call sub_10086289
    mov ecx, dword ptr [edi + 16]
    mov dword ptr [ecx + ebx*4], eax
    mov eax, dword ptr [edi + 16]
    cmp dword ptr [eax + ebx*4], -1
    je L16
    mov eax, dword ptr [ebp - 4]
    inc ebx
    cmp ebx, dword ptr [eax]
    jb L9
L10:
    push dword ptr [edi + 16]
    mov eax, dword ptr [ebp - 4]
    push dword ptr [eax]
    mov ecx, esi
    push dword ptr [ebp - 8]
    push 3
    push dword ptr [esi + 12]
    push dword ptr [esi + 24]
    call sub_100AA0AB
    mov ebx, eax
    test ebx, ebx
    jl L18
    mov eax, dword ptr [ebp - 4]
    xor ebx, ebx
    cmp dword ptr [eax], ebx
    jbe L12
L11:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push ebx
    push dword ptr [ebp - 8]
    mov ecx, esi
    push dword ptr [esi + 000000080h]
    call sub_100862E9
    cmp eax, -1
    je L19
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [ebp - 8]
    and dword ptr [ecx + 60], 0
    shl edx, 8
    or edx, 3
    mov dword ptr [ecx + 108], edx
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [ecx + ebx*4], eax
    mov eax, dword ptr [ebp - 4]
    inc ebx
    cmp ebx, dword ptr [eax]
    jb L11
L12:
    push edi
    mov ecx, esi
    call sub_1008620B
    mov ebx, eax
    test ebx, ebx
    mov dword ptr [ebp - 16], ebx
    jl L36
L13:
    inc dword ptr [ebp - 8]
    add dword ptr [ebp - 4], 4
    cmp dword ptr [ebp - 8], 6
    jb L6
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ebp - 20], 0
    jbe L28
L14:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [ebp - 4]
    mov edi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [edi]
    mov edx, eax
    mov ecx, eax
    and edx, 0FFF00000h
    and ecx, 0000FFFFFh
    push edx
    mov dword ptr [ebp - 12], ecx
    call sub_100A704E
    test eax, eax
    jne L15
    cmp edx, 011000000h
    jne L27
L15:
    cmp edx, 011000000h
    mov eax, dword ptr [edi + 8]
    jne L20
    mov eax, dword ptr [eax]
    jmp L21
L16:
    push 1
    mov ecx, edi
    call sub_1006C675
L17:
    mov ebx, 08007000Eh
    jmp L36
L18:
    push 1
    mov ecx, edi
    call sub_1006C688
    jmp L36
L19:
    push 1
    mov ecx, edi
    call sub_1006C696
    mov eax, 08007000Eh
    jmp L37
L20:
    mov eax, dword ptr [eax + ecx*4]
L21:
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    test byte ptr [eax + 62], 31
    je L27
    mov eax, dword ptr [eax + 4]
    cmp eax, dword ptr [esi + 000000088h]
    jne L27
    push 116
    call sub_10085AC5
    test eax, eax
    je L22
    mov ecx, eax
    call sub_10085635
    mov ebx, eax
    jmp L23
L22:
    xor ebx, ebx
L23:
    test ebx, ebx
    je L34
    mov eax, dword ptr [ebp - 12]
    push 0
    push dword ptr [ebp - 12]
    and eax, 0000FFFFFh
    push dword ptr [ebp - 12]
    or eax, 010000000h
    push eax
    mov ecx, ebx
    call sub_10085B46
    test eax, eax
    mov dword ptr [ebp - 16], eax
    jl L35
    mov eax, dword ptr [edi]
    mov ecx, eax
    and eax, 0FFF00000h
    and ecx, 0000FFFFFh
    cmp eax, 011000000h
    jne L24
    xor ecx, ecx
L24:
    and dword ptr [ebp - 8], 0
    cmp dword ptr [ebp - 12], 0
    jbe L26
    mov eax, ecx
    shl eax, 2
    mov dword ptr [ebp - 16], eax
L25:
    mov eax, dword ptr [edi + 8]
    fldz
    mov ecx, dword ptr [ebp - 16]
    mov eax, dword ptr [ecx + eax]
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [ebp - 8]
    mov dword ptr [ebp - 24], ecx
    mov ecx, dword ptr [ebx + 8]
    push ecx
    push ecx
    mov dword ptr [ecx + edx*4], eax
    fstp qword ptr [esp]
    mov eax, dword ptr [ebp - 24]
    push dword ptr [eax + 16]
    mov ecx, esi
    push 0
    push dword ptr [esi + 000000088h]
    call sub_1008648C
    mov edx, dword ptr [ebp - 8]
    mov ecx, dword ptr [ebx + 16]
    inc dword ptr [ebp - 8]
    mov dword ptr [ecx + edx*4], eax
    mov eax, dword ptr [ebx + 16]
    mov eax, dword ptr [eax + edx*4]
    mov edx, dword ptr [ebp - 16]
    mov ecx, dword ptr [edi + 8]
    add dword ptr [ebp - 16], 4
    mov dword ptr [edx + ecx], eax
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp - 12]
    jb L25
L26:
    push ebx
    mov ecx, esi
    call sub_100863A8
    test eax, eax
    mov dword ptr [ebp - 16], eax
    jl L35
L27:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp - 20]
    jb L14
L28:
    xor edi, edi
    cmp dword ptr [ebp - 20], edi
    jbe L30
L29:
    mov eax, dword ptr [esi + 24]
    push dword ptr [eax + edi*4]
    mov ecx, esi
    call sub_10086642
    mov ebx, eax
    test ebx, ebx
    jl L36
    mov eax, dword ptr [esi + 24]
    mov eax, dword ptr [eax + edi*4]
    and dword ptr [eax], 0
    inc edi
    cmp edi, dword ptr [ebp - 20]
    jb L29
L30:
    mov eax, dword ptr [esi + 12]
    and dword ptr [ebp - 20], 0
    test eax, eax
    mov dword ptr [ebp - 16], eax
    jbe L44
L31:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [ebp - 20]
    mov edi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [edi]
    test eax, eax
    je L43
    mov ecx, eax
    and ecx, 0FFF00000h
    and eax, 0000FFFFFh
    push ecx
    mov dword ptr [ebp - 12], eax
    call sub_100A721D
    test eax, eax
    jne L32
    cmp ecx, 011000000h
    jne L42
L32:
    mov edx, dword ptr [esi + 16]
    sub ecx, 011000000h
    neg ecx
    sbb ecx, ecx
    and ecx, dword ptr [ebp - 12]
    mov eax, ecx
    mov ecx, dword ptr [edi + 8]
    shl eax, 2
    mov dword ptr [ebp - 24], eax
    mov eax, dword ptr [eax + ecx]
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 4]
    mov ecx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [ecx + 4]
    test ch, 2
    jne L33
    test cl, 16
    je L42
    cmp byte ptr [eax + 108], 1
    jne L42
L33:
    push 116
    call sub_10085C74
    test eax, eax
    je L38
    mov ecx, eax
    call sub_100857E4
    mov dword ptr [ebp - 4], eax
    jmp L39
L34:
    mov dword ptr [ebp - 16], 08007000Eh
L35:
    mov ebx, dword ptr [ebp - 16]
L36:
    mov eax, ebx
L37:
    pop edi
    pop esi
    pop ebx
    leave
    ret
L38:
    and dword ptr [ebp - 4], 0
L39:
    cmp dword ptr [ebp - 4], 0
    je L17
    mov eax, dword ptr [ebp - 12]
    mov ecx, dword ptr [ebp - 4]
    push 0
    push dword ptr [ebp - 12]
    and eax, 0000FFFFFh
    push dword ptr [ebp - 12]
    or eax, 010000000h
    push eax
    call sub_10085D0C
    mov ebx, eax
    test ebx, ebx
    jl L36
    mov ecx, dword ptr [ebp - 4]
    push edi
    call sub_1008586C
    mov ebx, eax
    test ebx, ebx
    jl L36
    and dword ptr [ebp - 8], 0
    cmp dword ptr [ebp - 12], 0
    jbe L41
    mov eax, dword ptr [edi + 8]
    mov ebx, dword ptr [ebp - 24]
L40:
    mov ecx, dword ptr [ebp - 4]
    fldz
    mov ecx, dword ptr [ecx + 8]
    mov edx, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + ebx]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push edx
    mov dword ptr [ecx + edx*4], eax
    push 0
    push dword ptr [esi + 000000088h]
    mov ecx, esi
    call sub_10086631
    mov ecx, dword ptr [ebp - 4]
    mov ecx, dword ptr [ecx + 16]
    mov edx, dword ptr [ebp - 8]
    mov dword ptr [ecx + edx*4], eax
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [ebx + ecx], eax
    mov eax, dword ptr [edi + 8]
    cmp dword ptr [eax + ebx], -1
    je L17
    inc dword ptr [ebp - 8]
    mov ecx, dword ptr [ebp - 8]
    add ebx, 4
    cmp ecx, dword ptr [ebp - 12]
    jb L40
L41:
    push dword ptr [ebp - 4]
    mov ecx, esi
    call sub_1008655E
L42:
    push edi
    mov ecx, esi
    call sub_100867D2
    and dword ptr [edi], 0
L43:
    inc dword ptr [ebp - 20]
    mov eax, dword ptr [ebp - 20]
    cmp eax, dword ptr [ebp - 16]
    jb L31
L44:
    mov ecx, esi
    call sub_10087407
    mov ebx, eax
    jmp L36
FUN_100ab286 ENDP
END
