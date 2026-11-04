.686
.MODEL FLAT, C
EXTRN sub_10086821:PROC
EXTRN sub_10086839:PROC
EXTRN sub_100A7FA3:PROC
EXTRN sub_100A8026:PROC
EXTRN sub_100A80B6:PROC
EXTRN sub_100A80C6:PROC
EXTRN sub_100A8170:PROC
EXTRN sub_100A817E:PROC
EXTRN sub_100A836C:PROC
EXTRN sub_100C3EFC:PROC
EXTRN sub_100C3F14:PROC
EXTRN sub_100C3FC1:PROC
EXTRN sub_100C3FF1:PROC
EXTRN sub_100C4009:PROC
EXTRN sub_100C413D:PROC
EXTRN sub_100C4155:PROC
EXTRN sub_100C419F:PROC
.CODE
FUN_100a88e8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0000000A8h
    push ebx
    mov ebx, ecx
    push esi
    mov esi, dword ptr [ebx + 000000100h]
    mov ecx, dword ptr [esi]
    push edi
    mov edi, ecx
    and edi, 0000FFFFFh
    test esi, esi
    mov dword ptr [ebp - 28], ebx
    mov dword ptr [ebp - 24], edi
    je L53
    test ecx, ecx
    je L53
    mov eax, dword ptr [esi + 4]
    xor edx, edx
    div edi
    and dword ptr [ebp - 20], 0
    and ecx, 0FFF00000h
    cmp ecx, 050000000h
    mov dword ptr [ebp - 8], eax
    je L52
    cmp dword ptr [esi + 12], edi
    jne L52
    mov eax, dword ptr [ebx + 0000000C8h]
    and dword ptr [ebp - 40], 0
    xor edi, edi
    and eax, 00000FFFFh
    inc edi
    cmp eax, 000000104h
    je L2
    push esi
    mov ecx, ebx
    call sub_100A7FA3
    test eax, eax
    je L2
    mov ecx, dword ptr [esi + 12]
    test ecx, ecx
    jbe L2
    mov eax, dword ptr [ebx + 20]
    mov esi, dword ptr [esi + 16]
L0:
    mov edx, dword ptr [esi]
    mov edx, dword ptr [eax + edx*4]
    cmp dword ptr [edx + 16], 3
    jne L1
    mov dword ptr [ebp - 20], edi
    mov dword ptr [ebp - 40], edi
L1:
    add esi, 4
    dec ecx
    jne L0
L2:
    and dword ptr [ebp - 16], 0
    cmp dword ptr [ebp - 8], 0
    jbe L9
    and dword ptr [ebp - 32], 0
    lea eax, [ebp - 0000000A8h]
    mov dword ptr [ebp - 4], eax
L3:
    mov edi, dword ptr [ebp - 4]
    or eax, 0FFFFFFFFh
    stosd dword ptr es:[edi], eax
    and dword ptr [ebp - 12], 0
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    or eax, 0FFFFFFFFh
    cmp dword ptr [ebp - 24], 0
    lea edi, [ebp - 120]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    jbe L7
    mov eax, dword ptr [ebp - 32]
    mov ecx, dword ptr [ebx + 000000100h]
    mov edx, dword ptr [ebx + 20]
    mov edi, dword ptr [ebx + 16]
    mov dword ptr [ebp - 36], eax
L4:
    mov esi, dword ptr [ebp - 36]
    mov eax, dword ptr [ecx + 8]
    mov eax, dword ptr [esi + eax]
    mov esi, dword ptr [edx + eax*4]
    mov ebx, dword ptr [ebp - 12]
    mov eax, dword ptr [ecx + 16]
    mov eax, dword ptr [eax + ebx*4]
    mov ebx, dword ptr [esi + 4]
    mov ebx, dword ptr [edi + ebx*4]
    test byte ptr [ebx + 5], 1
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 16]
    je L5
    mov esi, dword ptr [ebp - 16]
    lea esi, [eax + esi*4]
    mov dword ptr [ebp + esi*4 - 0000000A8h], eax
    jmp L6
L5:
    mov ebx, dword ptr [ebp - 16]
    mov esi, dword ptr [esi + 16]
    lea ebx, [eax + ebx*4]
    mov dword ptr [ebp + ebx*4 - 0000000A8h], esi
L6:
    and dword ptr [ebp + eax*4 - 120], 0
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 12]
    add dword ptr [ebp - 36], 4
    cmp eax, dword ptr [ebp - 24]
    jb L4
    mov ebx, dword ptr [ebp - 28]
L7:
    push 5
    lea eax, [ebp - 120]
    push eax
    push dword ptr [ebp - 4]
    call sub_100A8026
    test eax, eax
    jne L8
    mov dword ptr [ebp - 20], 1
L8:
    mov eax, dword ptr [ebp - 24]
    inc dword ptr [ebp - 16]
    add dword ptr [ebp - 4], 16
    shl eax, 2
    add dword ptr [ebp - 32], eax
    mov eax, dword ptr [ebp - 16]
    cmp eax, dword ptr [ebp - 8]
    jb L3
L9:
    xor esi, esi
    cmp dword ptr [ebp - 20], esi
    je L49
    cmp dword ptr [ebp - 24], 4
    mov dword ptr [ebp - 16], esi
    mov dword ptr [ebp - 28], esi
    jne L32
    mov dword ptr [ebp - 4], 1
L10:
    xor ecx, ecx
    cmp dword ptr [ebp - 4], ecx
    je L16
    xor eax, eax
    lea edi, [ebp - 120]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 104]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    or dword ptr [ebp + esi*4 - 120], 0FFFFFFFFh
    cmp dword ptr [ebp - 8], ecx
    mov dword ptr [ebp + esi*4 - 104], ecx
    mov dword ptr [ebp - 4], ecx
    jbe L14
    mov eax, dword ptr [ebp - 8]
    lea edi, [ebp - 0000000A8h]
    mov dword ptr [ebp - 20], eax
L11:
    push 5
    lea eax, [ebp - 120]
    push eax
    push edi
    call sub_100A80B6
    test eax, eax
    je L12
    push 5
    lea eax, [ebp - 120]
    push eax
    push edi
    call sub_100A80C6
    test eax, eax
    jne L13
L12:
    mov dword ptr [ebp - 4], 1
L13:
    add edi, 16
    dec dword ptr [ebp - 20]
    jne L11
L14:
    cmp dword ptr [ebp - 40], 0
    je L15
    cmp esi, 3
    je L15
    mov dword ptr [ebp - 4], 1
L15:
    cmp dword ptr [ebp - 4], 0
    je L20
    inc esi
    cmp esi, 4
    jb L10
    xor ecx, ecx
L16:
    mov dword ptr [ebp - 4], 1
    mov dword ptr [ebp - 12], ecx
L17:
    cmp dword ptr [ebp - 4], 0
    je L30
    xor ecx, ecx
    mov dword ptr [ebp - 20], ecx
L18:
    mov edx, dword ptr [ebp - 12]
    xor esi, esi
    cmp ecx, edx
    je L27
    xor eax, eax
    lea edi, [ebp - 120]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 104]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    lea eax, [ebp - 120]
    or dword ptr [eax + edx*4], 0FFFFFFFFh
    or dword ptr [eax + ecx*4], 0FFFFFFFFh
    cmp dword ptr [ebp - 8], esi
    mov dword ptr [ebp + edx*4 - 104], esi
    mov dword ptr [ebp + ecx*4 - 104], esi
    mov dword ptr [ebp - 4], esi
    mov dword ptr [ebp - 36], esi
    jbe L24
    mov eax, dword ptr [ebp - 8]
    lea esi, [ebp - 0000000A8h]
    mov dword ptr [ebp - 32], eax
L19:
    push 5
    lea eax, [ebp - 120]
    push eax
    push esi
    call sub_100A8170
    mov edi, eax
    push 5
    lea eax, [ebp - 104]
    push eax
    push esi
    call sub_100A817E
    test edi, edi
    jne L21
    mov dword ptr [ebp - 36], 1
    jmp L22
L20:
    push 4
    push dword ptr [ebp - 8]
    lea eax, [ebp - 120]
    push eax
    mov ecx, ebx
    call sub_100C3EFC
    test eax, eax
    jl L54
    push 4
    push dword ptr [ebp - 8]
    lea eax, [ebp - 104]
    push eax
    mov ecx, ebx
    call sub_100C3F14
    jmp L50
L21:
    test eax, eax
    jne L23
L22:
    mov dword ptr [ebp - 4], 1
L23:
    add esi, 16
    dec dword ptr [ebp - 32]
    jne L19
L24:
    xor eax, eax
    cmp dword ptr [ebp - 40], eax
    je L25
    mov dword ptr [ebp - 4], 1
L25:
    cmp dword ptr [ebp - 4], eax
    je L28
    cmp dword ptr [ebp - 36], eax
    jne L27
    cmp dword ptr [ebp - 40], 0
    je L26
    cmp dword ptr [ebp - 108], 0
    je L27
L26:
    lea esi, [ebp - 120]
    lea edi, [ebp - 88]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 72]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 56]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov eax, dword ptr [ebp - 12]
    and dword ptr [ebp + eax*4 - 72], 0
    mov eax, dword ptr [ebp - 20]
    and dword ptr [ebp + eax*4 - 56], 0
    mov dword ptr [ebp - 28], 1
L27:
    mov ecx, dword ptr [ebp - 20]
    inc ecx
    cmp ecx, 4
    mov dword ptr [ebp - 20], ecx
    jb L18
    jmp L29
L28:
    mov dword ptr [ebp - 16], 1
L29:
    inc dword ptr [ebp - 12]
    cmp dword ptr [ebp - 12], 4
    jb L17
L30:
    cmp dword ptr [ebp - 16], 0
    je L31
    push 4
    push dword ptr [ebp - 8]
    lea eax, [ebp - 120]
    push eax
    mov ecx, ebx
    call sub_100C3FC1
    test eax, eax
    jl L54
    push 4
    jmp L45
L31:
    cmp dword ptr [ebp - 28], 0
    je L47
    push 4
    push dword ptr [ebp - 8]
    lea eax, [ebp - 88]
    push eax
    mov ecx, ebx
    mov dword ptr [ebp - 16], 1
    call sub_100C3FF1
    test eax, eax
    jl L54
    push 4
    push dword ptr [ebp - 8]
    lea eax, [ebp - 72]
    push eax
    mov ecx, ebx
    call sub_100C4009
    test eax, eax
    jl L54
    push 4
    lea eax, [ebp - 56]
    jmp L46
L32:
    cmp dword ptr [ebp - 24], 3
    jne L47
    or dword ptr [ebp - 28], 0FFFFFFFFh
    xor eax, eax
L33:
    cmp dword ptr [ebp + eax*4 - 0000000A8h], -1
    jne L34
    mov dword ptr [ebp - 28], eax
L34:
    inc eax
    cmp eax, 4
    jb L33
    and dword ptr [ebp - 12], 0
L35:
    cmp dword ptr [ebp - 16], 0
    jne L44
    xor ecx, ecx
    xor esi, esi
L36:
    cmp dword ptr [ebp - 16], ecx
    jne L43
    cmp esi, dword ptr [ebp - 12]
    je L42
    mov edx, dword ptr [ebp - 28]
    cmp esi, edx
    je L42
    cmp dword ptr [ebp - 12], edx
    je L42
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 120]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    xor eax, eax
    lea edi, [ebp - 104]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov edi, dword ptr [ebp - 12]
    shl edi, 2
    lea eax, [ebp - 120]
    mov dword ptr [edi + eax], ecx
    mov dword ptr [eax + esi*4], ecx
    or dword ptr [ebp + edi - 104], 0FFFFFFFFh
    or dword ptr [ebp + esi*4 - 104], 0FFFFFFFFh
    or dword ptr [ebp + edx*4 - 104], 0FFFFFFFFh
    xor edi, edi
    cmp dword ptr [ebp - 8], ecx
    mov dword ptr [ebp - 4], ecx
    jbe L39
    lea eax, [ebp - 0000000A8h]
    mov dword ptr [ebp - 20], eax
L37:
    cmp dword ptr [ebp - 4], ecx
    jne L39
    push 5
    lea eax, [ebp - 120]
    push eax
    push dword ptr [ebp - 20]
    call sub_100A836C
    test eax, eax
    jne L38
    mov dword ptr [ebp - 4], 1
L38:
    add dword ptr [ebp - 20], 16
    inc edi
    xor ecx, ecx
    cmp edi, dword ptr [ebp - 8]
    jb L37
L39:
    cmp dword ptr [ebp - 108], ecx
    jne L41
    cmp dword ptr [ebp - 120], ecx
    je L40
    cmp dword ptr [ebp - 116], ecx
    je L40
    cmp dword ptr [ebp - 112], ecx
    jne L41
L40:
    cmp dword ptr [ebp - 40], ecx
    je L41
    mov dword ptr [ebp - 4], 1
L41:
    cmp dword ptr [ebp - 4], ecx
    jne L42
    mov dword ptr [ebp - 16], 1
L42:
    inc esi
    cmp esi, 4
    jb L36
L43:
    inc dword ptr [ebp - 12]
    cmp dword ptr [ebp - 12], 4
    jb L35
    cmp dword ptr [ebp - 16], 0
    je L47
L44:
    push 3
    push dword ptr [ebp - 8]
    lea eax, [ebp - 120]
    push eax
    mov ecx, ebx
    call sub_100C413D
    test eax, eax
    jl L54
    push 3
L45:
    lea eax, [ebp - 104]
L46:
    push dword ptr [ebp - 8]
    mov ecx, ebx
    push eax
    call sub_100C4155
    test eax, eax
    jl L54
    cmp dword ptr [ebp - 16], 0
    jne L51
L47:
    xor esi, esi
    cmp dword ptr [ebp - 24], esi
    jbe L51
L48:
    mov ecx, dword ptr [ebx + 20]
    push dword ptr [ebp - 24]
    or eax, 0FFFFFFFFh
    push dword ptr [ebp - 8]
    lea edi, [ebp - 120]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov eax, dword ptr [ebx + 000000100h]
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax + esi*4]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 16]
    and dword ptr [ebp + eax*4 - 120], 0
    lea eax, [ebp - 120]
    push eax
    mov ecx, ebx
    call sub_100C419F
    test eax, eax
    jl L54
    inc esi
    cmp esi, dword ptr [ebp - 24]
    jb L48
    jmp L51
L49:
    push dword ptr [ebx + 000000100h]
    mov ecx, ebx
    call sub_10086821
L50:
    test eax, eax
    jl L54
L51:
    mov ecx, dword ptr [ebx + 000000100h]
    xor eax, eax
    mov dword ptr [ecx], eax
    jmp L54
L52:
    push esi
    mov ecx, ebx
    call sub_10086839
    test eax, eax
    jl L54
    mov eax, dword ptr [ebx + 000000100h]
    and dword ptr [eax], 0
L53:
    xor eax, eax
L54:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100a88e8 ENDP
END
