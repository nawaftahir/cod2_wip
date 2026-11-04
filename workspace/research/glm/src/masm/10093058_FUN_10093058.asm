.686
.MODEL FLAT, C
EXTRN sub_100855F4:PROC
EXTRN sub_100856DF:PROC
EXTRN sub_10086BBE:PROC
EXTRN sub_10086C64:PROC
EXTRN sub_10086CBB:PROC
EXTRN sub_1008A784:PROC
EXTRN sub_1008A7B8:PROC
EXTRN sub_1008A8DE:PROC
EXTRN sub_1008A9A2:PROC
EXTRN sub_10092ADE:PROC
EXTRN sub_10092B54:PROC
EXTRN sub_10092B7D:PROC
EXTRN sub_10092CC6:PROC
EXTRN sub_10092EB8:PROC
.CODE
FUN_10093058 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 28
    mov eax, dword ptr [ebp + 12]
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    mov ebx, ecx
    add eax, eax
    mov dword ptr [ebx + 0000000BCh], esi
    xor eax, dword ptr [esi + 96]
    push edi
    and eax, 2
    xor dword ptr [esi + 96], eax
    call sub_1008A9A2
    xor ecx, ecx
    cmp dword ptr [ebx + 8], ecx
    jbe L2
L0:
    mov eax, dword ptr [ebx + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov edx, dword ptr [esi]
    cmp edx, dword ptr [eax + 4]
    jne L1
    cmp dword ptr [eax + 56], -1
    jne L1
    mov edx, dword ptr [eax + 72]
    cmp dword ptr [eax + 88], edx
    ja L1
    inc edx
    mov dword ptr [eax + 88], edx
L1:
    inc ecx
    cmp ecx, dword ptr [ebx + 8]
    jb L0
L2:
    mov ecx, dword ptr [esi + 40]
    mov edi, dword ptr [esi + 16]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    or eax, 0FFFFFFFFh
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov ecx, dword ptr [esi + 40]
    mov edi, dword ptr [esi + 20]
    shl ecx, 4
    mov edx, ecx
    shr ecx, 2
    or eax, 0FFFFFFFFh
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov ecx, dword ptr [esi + 40]
    mov edi, dword ptr [esi + 24]
    shl ecx, 4
    mov edx, ecx
    shr ecx, 2
    or eax, 0FFFFFFFFh
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    xor ecx, ecx
    cmp dword ptr [ebx + 8], ecx
    jbe L5
L3:
    mov eax, dword ptr [ebx + 20]
    mov eax, dword ptr [eax + ecx*4]
    or dword ptr [eax + 48], 0FFFFFFFFh
    mov edx, dword ptr [esi]
    cmp edx, dword ptr [eax + 4]
    jne L4
    cmp dword ptr [eax + 56], -1
    jne L4
    mov edx, dword ptr [eax + 12]
    mov eax, dword ptr [eax + 16]
    lea eax, [eax + edx*4]
    mov edx, dword ptr [esi + 24]
    mov dword ptr [edx + eax*4], ecx
L4:
    inc ecx
    cmp ecx, dword ptr [ebx + 8]
    jb L3
L5:
    mov ecx, dword ptr [esi + 40]
    mov edi, dword ptr [esi + 8]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    xor ecx, ecx
    cmp dword ptr [esi + 40], ecx
    jbe L9
    mov dword ptr [ebp + 8], ecx
L6:
    mov eax, dword ptr [esi + 24]
    push 4
    xor edx, edx
    add eax, dword ptr [ebp + 8]
    pop edi
L7:
    cmp dword ptr [eax], -1
    je L8
    inc edx
L8:
    add eax, 4
    dec edi
    jne L7
    mov eax, dword ptr [esi + 8]
    add dword ptr [ebp + 8], 16
    mov dword ptr [eax + ecx*4], edx
    inc ecx
    cmp ecx, dword ptr [esi + 40]
    jb L6
L9:
    mov ecx, dword ptr [esi + 40]
    mov edi, dword ptr [esi + 12]
    and dword ptr [ebp + 8], 0
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    cmp dword ptr [ebx + 12], 0
    jbe L19
L10:
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebp + 8]
    mov edi, dword ptr [eax + ecx*4]
    mov ecx, edi
    mov dword ptr [ebp - 8], edi
    call sub_100855F4
    test eax, eax
    je L18
    mov eax, dword ptr [edi + 16]
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [esi]
    cmp ecx, dword ptr [eax + 4]
    mov dword ptr [ebp + 12], eax
    jne L18
    mov dword ptr [ebp - 12], 2
L11:
    xor eax, eax
    cmp dword ptr [edi + 4], eax
    mov dword ptr [ebp - 4], eax
    jbe L17
L12:
    mov ecx, dword ptr [edi + 8]
    mov eax, dword ptr [ecx + eax*4]
    cmp eax, -1
    je L13
    mov ecx, dword ptr [ebx + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ecx + 56]
    cmp ecx, -1
    je L13
    mov eax, ecx
L13:
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 4]
    mov edx, dword ptr [ebx + 16]
    mov ecx, dword ptr [edx + ecx*4]
    test byte ptr [ecx + 6], 2
    je L14
    mov eax, dword ptr [eax + 72]
    mov ecx, dword ptr [ebx + 24]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [ebx + 20]
    mov eax, dword ptr [eax + ecx*4]
L14:
    mov ecx, dword ptr [esi]
    cmp ecx, dword ptr [eax + 4]
    jne L16
    mov edx, dword ptr [esi + 12]
    mov ecx, dword ptr [eax + 12]
    mov edi, dword ptr [esi + 8]
    lea ecx, [edx + ecx*4]
    mov edx, dword ptr [ebp + 12]
    mov edx, dword ptr [edx + 12]
    mov edx, dword ptr [edi + edx*4]
    cmp dword ptr [ecx], edx
    jae L15
    mov dword ptr [ecx], edx
L15:
    mov ecx, dword ptr [ebp + 12]
    mov edx, dword ptr [esi + 12]
    mov ecx, dword ptr [ecx + 12]
    mov eax, dword ptr [eax + 12]
    mov edi, dword ptr [ebp - 8]
    lea ecx, [edx + ecx*4]
    mov edx, dword ptr [esi + 8]
    mov eax, dword ptr [edx + eax*4]
    cmp dword ptr [ecx], eax
    jae L16
    mov dword ptr [ecx], eax
L16:
    mov eax, dword ptr [ebp - 4]
    add eax, dword ptr [edi + 12]
    cmp eax, dword ptr [edi + 4]
    mov dword ptr [ebp - 4], eax
    jb L12
L17:
    dec dword ptr [ebp - 12]
    jne L11
L18:
    inc dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 8]
    cmp eax, dword ptr [ebx + 12]
    jb L10
L19:
    mov ecx, dword ptr [esi + 72]
    mov edi, dword ptr [esi + 76]
    and dword ptr [ebp + 8], 0
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    cmp dword ptr [ebx + 12], 0
    jbe L27
L20:
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebp + 8]
    mov edi, dword ptr [eax + ecx*4]
    test word ptr [edi + 2], 00000FFF0h
    je L26
    and dword ptr [ebp + 12], 0
    cmp dword ptr [edi + 12], 0
    jbe L22
L21:
    push dword ptr [ebp + 8]
    mov eax, dword ptr [edi + 16]
    mov ecx, dword ptr [ebp + 12]
    push dword ptr [eax + ecx*4]
    mov ecx, ebx
    push esi
    call sub_1008A8DE
    inc dword ptr [ebp + 12]
    mov eax, dword ptr [ebp + 12]
    cmp eax, dword ptr [edi + 12]
    jb L21
L22:
    and dword ptr [ebp + 12], 0
    cmp dword ptr [edi + 4], 0
    jbe L24
L23:
    push dword ptr [ebp + 8]
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [ebp + 12]
    push dword ptr [eax + ecx*4]
    mov ecx, ebx
    push esi
    call sub_1008A784
    inc dword ptr [ebp + 12]
    mov eax, dword ptr [ebp + 12]
    cmp eax, dword ptr [edi + 4]
    jb L23
L24:
    mov ecx, edi
    call sub_100856DF
    test eax, eax
    je L26
    and dword ptr [ebp + 12], 0
    cmp dword ptr [edi + 12], 0
    jbe L26
L25:
    push dword ptr [ebp + 8]
    mov eax, dword ptr [edi + 16]
    mov ecx, dword ptr [ebp + 12]
    push dword ptr [eax + ecx*4]
    mov ecx, ebx
    push esi
    call sub_1008A7B8
    inc dword ptr [ebp + 12]
    mov eax, dword ptr [ebp + 12]
    cmp eax, dword ptr [edi + 12]
    jb L25
L26:
    inc dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 8]
    cmp eax, dword ptr [ebx + 12]
    jb L20
L27:
    xor eax, eax
    cmp dword ptr [esi + 72], eax
    mov dword ptr [ebp - 4], eax
    jbe L33
L28:
    mov ecx, dword ptr [esi + 80]
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [esi + 84]
    lea edi, [edx + ecx*4]
    mov ecx, dword ptr [esi + 76]
    mov ecx, dword ptr [ecx + eax*4]
    cmp ecx, 1
    mov dword ptr [ebp + 12], ecx
    jbe L32
    push ebx
    push ecx
    push edi
    push 0100868D1h
    call sub_10086C64
    xor eax, eax
    inc eax
    cmp dword ptr [ebp + 12], eax
    mov dword ptr [ebp + 8], eax
    mov dword ptr [ebp - 12], eax
    jbe L31
L29:
    mov edx, dword ptr [edi + eax*4]
    mov ecx, dword ptr [ebp + 8]
    mov ecx, dword ptr [edi + ecx*4 - 4]
    mov eax, ebx
    mov dword ptr [ebp - 20], edx
    call sub_10086BBE
    test eax, eax
    je L30
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ebp - 20]
    inc dword ptr [ebp + 8]
    mov dword ptr [edi + ecx*4], eax
L30:
    mov eax, dword ptr [ebp - 12]
    inc eax
    cmp eax, dword ptr [ebp + 12]
    mov dword ptr [ebp - 12], eax
    jb L29
L31:
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [esi + 76]
    mov edx, dword ptr [ebp - 4]
    push ebx
    push eax
    push edi
    push 010086899h
    mov dword ptr [ecx + edx*4], eax
    call sub_10086CBB
    mov eax, dword ptr [ebp - 4]
L32:
    inc eax
    cmp eax, dword ptr [esi + 72]
    mov dword ptr [ebp - 4], eax
    jb L28
L33:
    mov ecx, dword ptr [esi + 44]
    mov edi, dword ptr [esi + 28]
    shl ecx, 4
    mov edx, ecx
    shr ecx, 2
    or eax, 0FFFFFFFFh
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    xor eax, eax
    cmp dword ptr [esi + 44], eax
    jbe L35
L34:
    mov ecx, dword ptr [esi + 32]
    mov dword ptr [ecx + eax*4], eax
    inc eax
    cmp eax, dword ptr [esi + 44]
    jb L34
L35:
    mov eax, dword ptr [esi + 44]
    shr eax, 1
    and dword ptr [esi + 4], 0
    mov dword ptr [esi + 36], eax
    mov eax, dword ptr [ebx + 12]
    jmp L41
L36:
    mov ecx, dword ptr [ebx + 24]
    dec eax
    mov edi, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [edi]
    and ecx, 0FFF00000h
    cmp ecx, 020900000h
    mov dword ptr [ebp - 20], eax
    jne L41
    and dword ptr [ebp + 8], 0
    cmp dword ptr [edi + 12], 0
    jbe L41
L37:
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [esi + 92], edi
    mov eax, dword ptr [edi + 8]
    mov eax, dword ptr [eax + ecx*4]
    cmp eax, -1
    je L38
    mov ecx, dword ptr [ebx + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ecx + 56]
    cmp ecx, -1
    je L38
    mov eax, ecx
L38:
    push -1
    push -1
    push 0
    push eax
    push esi
    mov ecx, ebx
    call sub_10092ADE
    test eax, eax
    jl L59
    mov eax, dword ptr [edi + 12]
    add eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [edi + 8]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebx + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [ebx + 24]
    mov ecx, dword ptr [ecx + 72]
    mov ecx, dword ptr [edx + ecx*4]
    mov edx, dword ptr [ecx + 12]
    and dword ptr [ebp + 12], 0
    test edx, edx
    mov dword ptr [ebp - 8], ecx
    jbe L40
    mov ecx, dword ptr [ecx + 16]
    mov dword ptr [ebp - 12], ecx
L39:
    cmp dword ptr [ecx], eax
    je L40
    mov ecx, dword ptr [ebp - 12]
    inc dword ptr [ebp + 12]
    add ecx, 4
    cmp dword ptr [ebp + 12], edx
    mov dword ptr [ebp - 12], ecx
    jb L39
L40:
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [esi + 92], ecx
    mov ecx, dword ptr [ecx + 8]
    push -1
    shl eax, 2
    push dword ptr [eax + ecx]
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [ebp + 12], eax
    mov eax, dword ptr [edi + 16]
    push 0
    push dword ptr [eax + ecx*4]
    mov ecx, ebx
    push esi
    call sub_10092B54
    test eax, eax
    jl L59
    mov eax, dword ptr [edi + 16]
    mov ecx, dword ptr [ebp + 8]
    push -1
    push dword ptr [eax + ecx*4]
    mov eax, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [ebp + 12]
    push 0
    push dword ptr [ecx + eax]
    mov ecx, ebx
    push esi
    call sub_10092B7D
    test eax, eax
    jl L59
    inc dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 8]
    cmp eax, dword ptr [edi + 12]
    jb L37
    mov eax, dword ptr [ebp - 20]
L41:
    test eax, eax
    ja L36
    mov dword ptr [ebp - 8], 4
L42:
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [esi + 4], eax
    mov eax, dword ptr [ebx + 12]
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jbe L55
L43:
    dec dword ptr [ebp - 4]
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebp - 4]
    mov edi, dword ptr [eax + ecx*4]
    mov dword ptr [esi + 92], edi
    test word ptr [edi + 2], 00000FFF0h
    je L54
    and dword ptr [ebp + 8], 0
    cmp dword ptr [edi + 12], 0
    jbe L45
L44:
    mov eax, dword ptr [edi + 16]
    mov ecx, dword ptr [ebp + 8]
    push dword ptr [eax + ecx*4]
    mov ecx, ebx
    push esi
    call sub_10092EB8
    test eax, eax
    jl L59
    inc dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 8]
    cmp eax, dword ptr [edi + 12]
    jb L44
L45:
    mov ecx, dword ptr [edi]
    mov eax, dword ptr [edi + 4]
    and ecx, 0000FFFFFh
    xor edx, edx
    div ecx
    and dword ptr [ebp + 12], 0
    cmp dword ptr [edi + 4], 0
    mov dword ptr [ebp - 24], ecx
    mov dword ptr [ebp - 12], eax
    jbe L54
    jmp L47
L46:
    mov ecx, dword ptr [ebp - 24]
L47:
    and dword ptr [ebp + 8], 0
    test byte ptr [ebx + 112], 1
    je L52
    cmp dword ptr [ebp - 12], 0
    jbe L52
    mov edx, dword ptr [ebx + 20]
    mov eax, ecx
    mov ecx, dword ptr [ebp - 12]
    shl eax, 2
    mov dword ptr [ebp - 28], eax
    mov eax, dword ptr [edi + 8]
    mov dword ptr [ebp - 16], eax
    mov dword ptr [ebp - 20], ecx
L48:
    mov eax, dword ptr [eax]
    cmp eax, -1
    je L49
    mov ecx, dword ptr [edx + eax*4]
    mov ecx, dword ptr [ecx + 56]
    cmp ecx, -1
    je L49
    mov eax, ecx
L49:
    mov eax, dword ptr [edx + eax*4]
    mov ecx, dword ptr [esi]
    cmp ecx, dword ptr [eax + 4]
    jne L51
    mov eax, dword ptr [eax + 12]
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [ecx + eax*4]
    cmp eax, -1
    je L51
    test al, 1
    je L50
    dec dword ptr [ebp + 8]
    jmp L51
L50:
    inc dword ptr [ebp + 8]
L51:
    mov eax, dword ptr [ebp - 16]
    add eax, dword ptr [ebp - 28]
    dec dword ptr [ebp - 20]
    mov dword ptr [ebp - 16], eax
    jne L48
L52:
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [ebp + 12]
    mov eax, dword ptr [eax + ecx*4]
    cmp eax, -1
    je L53
    mov ecx, dword ptr [ebx + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ecx + 56]
    cmp ecx, -1
    je L53
    mov eax, ecx
L53:
    push -1
    push -1
    push dword ptr [ebp + 8]
    mov ecx, ebx
    push eax
    push esi
    call sub_10092CC6
    test eax, eax
    jl L59
    inc dword ptr [ebp + 12]
    mov eax, dword ptr [ebp + 12]
    cmp eax, dword ptr [edi + 4]
    jb L46
L54:
    cmp dword ptr [ebp - 4], 0
    ja L43
L55:
    dec dword ptr [ebp - 8]
    jne L42
    test byte ptr [esi + 96], 2
    je L58
    and dword ptr [ebp + 8], 0
    cmp dword ptr [ebx + 8], 0
    jbe L58
L56:
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ebx + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [esi]
    cmp ecx, dword ptr [eax + 4]
    jne L57
    mov ecx, dword ptr [eax + 12]
    mov edx, dword ptr [eax + 16]
    mov edi, dword ptr [esi + 20]
    shl ecx, 2
    add edx, ecx
    mov edx, dword ptr [edi + edx*4]
    mov dword ptr [eax + 16], edx
    mov edx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx + edx]
    mov dword ptr [eax + 12], ecx
L57:
    inc dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 8]
    cmp eax, dword ptr [ebx + 8]
    jb L56
L58:
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [ebx + 16]
    mov eax, dword ptr [ecx + eax*4]
    or dword ptr [eax + 8], 0FFFFFFFFh
    xor eax, eax
L59:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
FUN_10093058 ENDP
END
