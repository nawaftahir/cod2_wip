.686
.MODEL FLAT, C
EXTRN sub_10085669:PROC
EXTRN sub_10085F80:PROC
EXTRN sub_1008611F:PROC
EXTRN sub_10086378:PROC
EXTRN sub_1008643B:PROC
EXTRN sub_10086511:PROC
EXTRN sub_100866E5:PROC
EXTRN sub_1008B53E:PROC
EXTRN sub_100BA853:PROC
.CODE
FUN_100c5498 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 100
    push esi
    mov esi, ecx
    call sub_100BA853
    test eax, eax
    jl L32
    mov eax, dword ptr [esi + 8]
    and dword ptr [ebp - 12], 0
    test eax, eax
    push edi
    jbe L2
    mov edx, dword ptr [esi + 000000088h]
    mov ecx, dword ptr [esi + 20]
    mov edi, eax
L0:
    mov eax, dword ptr [ecx]
    cmp edx, dword ptr [eax + 4]
    jne L1
    mov eax, dword ptr [eax + 12]
    cmp eax, dword ptr [ebp - 12]
    jb L1
    inc eax
    mov dword ptr [ebp - 12], eax
L1:
    add ecx, 4
    dec edi
    jne L0
L2:
    mov ecx, dword ptr [esi + 12]
    xor eax, eax
    test ecx, ecx
    push ebx
    mov dword ptr [ebp - 68], ecx
    mov dword ptr [ebp - 28], eax
    jbe L30
L3:
    mov ecx, dword ptr [esi + 24]
    mov ebx, dword ptr [ecx + eax*4]
    mov eax, dword ptr [ebx]
    test eax, 0FFF00000h
    mov dword ptr [ebp - 64], ebx
    je L29
    and eax, 0000FFFFFh
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [ebx + 4]
    xor edx, edx
    div dword ptr [ebp - 8]
    mov ecx, dword ptr [esi + 20]
    mov dword ptr [ebp - 40], eax
    mov eax, dword ptr [ebx + 16]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 20]
    mov eax, dword ptr [eax + 24]
    mov dword ptr [ebp - 32], ecx
    mov dword ptr [ebp - 36], eax
    jmp L27
L4:
    mov eax, dword ptr [ebx]
    and eax, 0FFF00000h
    cmp eax, 074100000h
    je L28
    mov ecx, dword ptr [ebp - 24]
    mov edx, dword ptr [ebx + 8]
    mov eax, ecx
    imul eax, dword ptr [ebp - 8]
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 4]
    mov edx, dword ptr [esi + 16]
    mov eax, dword ptr [edx + eax*4]
    test byte ptr [eax + 4], 2
    mov dword ptr [ebp - 48], eax
    jne L33
    xor edx, edx
    cmp dword ptr [ebp - 40], edx
    mov dword ptr [ebp - 20], edx
    mov dword ptr [ebp - 4], edx
    jbe L9
    mov dword ptr [ebp - 16], edx
L5:
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [ebp - 16]
    mov eax, dword ptr [ecx + eax]
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 4]
    mov ecx, dword ptr [esi + 16]
    push dword ptr [ebp - 4]
    mov edi, dword ptr [ecx + eax*4]
    mov eax, dword ptr [esi]
    push ebx
    mov ecx, esi
    call dword ptr [eax + 0x9c]
    cmp eax, 1
    je L8
    mov eax, dword ptr [edi + 4]
    test al, 64
    je L8
    mov ecx, dword ptr [ebp - 48]
    mov ecx, dword ptr [ecx + 4]
    xor ecx, eax
    test cx, 0000012BFh
    jne L8
    mov edi, dword ptr [ebp - 8]
    test edi, edi
    jbe L8
    mov ecx, dword ptr [esi + 20]
    mov edx, dword ptr [ebp - 16]
L6:
    mov eax, dword ptr [ebx + 8]
    mov eax, dword ptr [edx + eax]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 92]
    cmp dword ptr [ebp - 20], eax
    jae L7
    mov dword ptr [ebp - 20], eax
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [ebp - 24], eax
L7:
    add edx, 4
    dec edi
    jne L6
L8:
    mov eax, dword ptr [ebp - 8]
    inc dword ptr [ebp - 4]
    shl eax, 2
    add dword ptr [ebp - 16], eax
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp - 40]
    jb L5
    mov ecx, dword ptr [ebp - 24]
    xor edx, edx
L9:
    imul ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [ebx + 8]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 4]
    mov edi, dword ptr [eax + 12]
    mov eax, dword ptr [eax + 8]
    mov dword ptr [ebp - 48], eax
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + ecx*4]
    test byte ptr [eax + 4], 64
    mov dword ptr [ebp - 56], ecx
    mov dword ptr [ebp - 44], edi
    je L34
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 100]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov dword ptr [ebp - 20], edx
    stosd dword ptr es:[edi], eax
    xor edx, edx
    cmp dword ptr [esi + 8], edx
    stosd dword ptr es:[edi], eax
    jbe L12
    mov eax, dword ptr [esi + 20]
    mov dword ptr [ebp - 16], eax
L10:
    mov eax, dword ptr [ebp - 16]
    mov eax, dword ptr [eax]
    cmp dword ptr [eax + 4], ecx
    jne L11
    mov edi, dword ptr [ebp - 44]
    cmp dword ptr [eax + 12], edi
    jne L11
    mov edi, dword ptr [ebp - 48]
    cmp dword ptr [eax + 8], edi
    jne L11
    cmp dword ptr [eax + 56], -1
    jne L11
    mov edi, dword ptr [eax + 88]
    cmp edi, dword ptr [ebp - 28]
    jb L11
    cmp dword ptr [ebp - 20], edi
    mov eax, dword ptr [eax + 16]
    mov dword ptr [ebp + eax*4 - 100], edx
    ja L11
    inc edi
    mov dword ptr [ebp - 20], edi
L11:
    add dword ptr [ebp - 16], 4
    inc edx
    cmp edx, dword ptr [esi + 8]
    jb L10
L12:
    xor eax, eax
    mov dword ptr [ebp - 16], eax
    mov dword ptr [ebp - 4], eax
L13:
    mov edi, dword ptr [ebp - 4]
    shl edi, 2
    mov ecx, dword ptr [ebp + edi - 100]
    cmp ecx, -1
    mov dword ptr [ebp - 52], ecx
    je L14
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push dword ptr [ebp - 4]
    mov ecx, esi
    push dword ptr [ebp - 12]
    push dword ptr [esi + 000000088h]
    call sub_10086378
    cmp eax, -1
    mov dword ptr [ebp + edi - 84], eax
    je L36
    mov ecx, dword ptr [esi + 20]
    mov edi, dword ptr [ecx + eax*4]
    mov eax, dword ptr [ebp - 52]
    push dword ptr [ecx + eax*4]
    mov ecx, edi
    call sub_10085F80
    test eax, eax
    jl L31
    mov eax, dword ptr [ebp - 32]
    and dword ptr [edi + 104], 0
    or dword ptr [edi + 108], 0FFFFFFFFh
    and dword ptr [edi + 112], 0
    inc dword ptr [ebp - 16]
    mov dword ptr [edi + 20], eax
    mov eax, dword ptr [ebp - 36]
    mov dword ptr [edi + 24], eax
    mov eax, dword ptr [ebp - 16]
L14:
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], 4
    jb L13
    push eax
    push eax
    and eax, 0000FFFFFh
    or eax, 010000000h
    push eax
    mov ecx, esi
    call sub_1008643B
    cmp eax, -1
    je L36
    mov ecx, dword ptr [esi + 24]
    mov edi, dword ptr [ecx + eax*4]
    push ebx
    mov ecx, edi
    call sub_10085669
    test eax, eax
    jl L31
    xor eax, eax
    and dword ptr [ebp - 4], eax
L15:
    mov ecx, dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp + ecx - 100]
    cmp ecx, -1
    je L16
    mov edx, dword ptr [edi + 8]
    mov dword ptr [eax + edx], ecx
    mov edx, dword ptr [ebp - 4]
    mov ecx, dword ptr [edi + 16]
    mov edx, dword ptr [ebp + edx - 84]
    mov dword ptr [eax + ecx], edx
    add eax, 4
L16:
    add dword ptr [ebp - 4], 4
    cmp dword ptr [ebp - 4], 16
    jb L15
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 28]
    jmp L26
L17:
    mov ecx, dword ptr [esi + 24]
    mov edi, dword ptr [ecx + eax*4]
    test word ptr [edi + 2], 00000FFF0h
    je L25
    mov eax, dword ptr [edi + 16]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov eax, dword ptr [ecx + 20]
    mov ecx, dword ptr [ecx + 24]
    jmp L20
L18:
    cmp eax, dword ptr [ebp - 32]
    jne L19
    cmp ecx, dword ptr [ebp - 36]
    je L21
L19:
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 24]
    mov eax, dword ptr [eax + 20]
L20:
    cmp eax, -1
    jne L18
L21:
    cmp eax, dword ptr [ebp - 32]
    jne L25
    cmp ecx, dword ptr [ebp - 36]
    jne L25
    mov eax, dword ptr [esi]
    push 0
    push edi
    mov ecx, esi
    call dword ptr [eax + 0x20]
    test eax, eax
    je L25
    and dword ptr [ebp - 16], 0
    cmp dword ptr [edi + 4], 0
    jbe L25
L22:
    mov ebx, dword ptr [ebp - 16]
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [esi + 20]
    mov edx, dword ptr [ebp - 56]
    shl ebx, 2
    add eax, ebx
    mov dword ptr [ebp - 52], eax
    mov eax, dword ptr [eax]
    mov eax, dword ptr [ecx + eax*4]
    cmp dword ptr [eax + 4], edx
    mov dword ptr [ebp - 60], eax
    jne L24
    mov edx, dword ptr [ebp - 44]
    cmp dword ptr [eax + 12], edx
    jne L24
    mov edx, dword ptr [ebp - 48]
    cmp dword ptr [eax + 8], edx
    jne L24
    cmp dword ptr [eax + 56], -1
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [ebp + eax*4 - 84]
    jne L23
    mov ecx, dword ptr [ebp - 52]
    mov dword ptr [ecx], eax
    jmp L24
L23:
    mov ecx, dword ptr [ecx + eax*4]
    fldz
    push ecx
    push ecx
    fstp qword ptr [esp]
    push dword ptr [ecx + 16]
    mov dword ptr [ebp - 52], ecx
    push dword ptr [ecx + 12]
    mov ecx, esi
    push dword ptr [esi + 000000088h]
    call sub_10086511
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [ebx + ecx], eax
    mov eax, dword ptr [edi + 8]
    cmp dword ptr [ebx + eax], -1
    je L36
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ebx + eax]
    mov ebx, dword ptr [ecx + eax*4]
    push dword ptr [ebp - 52]
    mov ecx, ebx
    call sub_1008611F
    test eax, eax
    jl L31
    mov eax, dword ptr [ebp - 60]
    mov ecx, dword ptr [eax + 16]
    mov ecx, dword ptr [ebp + ecx*4 - 84]
    mov dword ptr [ebx + 56], ecx
    mov eax, dword ptr [eax + 60]
    mov dword ptr [ebx + 60], eax
L24:
    inc dword ptr [ebp - 16]
    mov eax, dword ptr [ebp - 16]
    cmp eax, dword ptr [edi + 4]
    jb L22
    mov ebx, dword ptr [ebp - 64]
L25:
    mov eax, dword ptr [ebp - 4]
    inc eax
L26:
    cmp eax, dword ptr [ebp - 20]
    mov dword ptr [ebp - 4], eax
    jb L17
L27:
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 24]
    push ecx
    mov ecx, esi
    push ebx
    call dword ptr [eax + 0x20]
    test eax, eax
    jne L4
L28:
    push ebx
    mov ecx, esi
    call sub_100866E5
    test eax, eax
    jl L31
    and dword ptr [ebx], 0
L29:
    mov eax, dword ptr [ebp - 28]
    inc eax
    cmp eax, dword ptr [ebp - 68]
    mov dword ptr [ebp - 28], eax
    jb L3
L30:
    xor eax, eax
L31:
    pop ebx
    pop edi
L32:
    pop esi
    leave
    ret
L33:
    push 01011A508h
    push 0
    jmp L35
L34:
    push 01011A4C8h
    push edx
L35:
    push dword ptr [ebx + 60]
    push esi
    call sub_1008B53E
    add esp, 16
    mov eax, 080004005h
    jmp L31
L36:
    mov eax, 08007000Eh
    jmp L31
FUN_100c5498 ENDP
END
