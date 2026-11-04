.686
.MODEL FLAT, C
EXTRN sub_1006547A:PROC
EXTRN sub_10065571:PROC
EXTRN sub_10068093:PROC
EXTRN sub_100680BC:PROC
EXTRN sub_10068130:PROC
EXTRN sub_1006ACC0:PROC
EXTRN sub_10085630:PROC
EXTRN sub_1008571C:PROC
EXTRN sub_100F7529:PROC
EXTRN sub_100F8627:PROC
EXTRN sub_100F870E:PROC
.CODE
FUN_1006ad34 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 60
    mov eax, dword ptr [ebp + 8]
    mov edx, dword ptr [eax + 8]
    push ebx
    xor ebx, ebx
    cmp byte ptr [edx], bl
    push esi
    mov esi, ecx
    push edi
    mov edi, dword ptr [ebp + 12]
    mov dword ptr [ebp - 12], esi
    mov dword ptr [ebp - 8], ebx
    mov dword ptr [ebp - 4], ebx
    mov dword ptr [ebp - 16], ebx
    mov dword ptr [ebp - 40], ebx
    mov dword ptr [ebp - 44], 1
    mov dword ptr [ebp - 32], ebx
    mov dword ptr [ebp - 36], ebx
    mov dword ptr [ebp - 24], edx
    mov dword ptr [ebp - 28], edx
    mov dword ptr [ebp - 20], edx
    jne L2
L0:
    mov eax, dword ptr [esi + 120]
    cmp eax, ebx
    je L55
    cmp dword ptr [eax + 0000000B0h], ebx
    mov eax, dword ptr [ebp - 8]
    je L60
    cmp eax, 3
    je L55
    cmp eax, 15
    je L55
    cmp eax, 18
    je L55
    cmp eax, 19
    je L55
    push 01010F410h
    jmp L61
L1:
    cmp al, 95
    je L3
    inc edx
    mov dword ptr [ebp - 20], edx
L2:
    mov al, byte ptr [edx]
    cmp al, bl
    jne L1
L3:
    mov eax, edx
    sub eax, dword ptr [ebp - 28]
    cmp eax, 15
    ja L54
    mov esi, dword ptr [ebp - 28]
    mov ecx, eax
    mov ebx, ecx
    shr ecx, 2
    lea edi, [ebp - 60]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, ebx
    and ecx, 3
    xor ebx, ebx
    cmp byte ptr [edx], bl
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov byte ptr [ebp + eax - 60], bl
    je L4
    inc edx
    mov dword ptr [ebp - 20], edx
L4:
    cmp dword ptr [ebp - 44], ebx
    mov dword ptr [ebp - 28], edx
    je L43
    cmp byte ptr [ebp - 60], bl
    lea esi, [ebp - 60]
    je L7
L5:
    movsx eax, byte ptr [esi]
    push eax
    call sub_100F8627
    test eax, eax
    pop ecx
    je L6
    inc esi
    cmp byte ptr [esi], bl
    jne L5
L6:
    cmp byte ptr [esi], bl
    je L7
    push esi
    call sub_100F7529
    pop ecx
    mov dword ptr [ebp - 4], eax
    jmp L8
L7:
    or dword ptr [ebp - 4], 0FFFFFFFFh
L8:
    cmp byte ptr [esi], bl
    je L9
    mov byte ptr [esi], bl
    inc esi
L9:
    mov al, byte ptr [esi]
    cmp al, bl
    je L12
L10:
    movsx eax, al
    push eax
    call sub_100F870E
    test eax, eax
    pop ecx
    je L11
    inc esi
    mov al, byte ptr [esi]
    cmp al, bl
    jne L10
L11:
    cmp byte ptr [esi], bl
    jne L53
L12:
    xor edi, edi
    xor edx, edx
L13:
    mov esi, dword ptr [edx + 01010E2D0h]
    lea eax, [ebp - 60]
L14:
    mov bl, byte ptr [eax]
    mov cl, bl
    cmp bl, byte ptr [esi]
    jne L16
    xor ebx, ebx
    cmp cl, bl
    je L15
    mov bl, byte ptr [eax + 1]
    mov cl, bl
    cmp bl, byte ptr [esi + 1]
    jne L16
    inc eax
    inc eax
    inc esi
    xor ebx, ebx
    inc esi
    cmp cl, bl
    jne L14
L15:
    xor eax, eax
    jmp L17
L16:
    sbb eax, eax
    sbb eax, -1
    xor ebx, ebx
L17:
    cmp eax, ebx
    je L18
    add edx, 72
    inc edi
    cmp edx, 0000005E8h
    jb L13
L18:
    cmp edi, 21
    mov esi, dword ptr [ebp - 12]
    je L54
    mov ecx, dword ptr [esi + 56]
    lea eax, [edi + edi*8]
    lea eax, [ecx + eax*2]
    mov eax, dword ptr [eax*4 + 01010E2D8h]
    cmp eax, -1
    je L54
    cmp eax, ebx
    jge L21
    cmp dword ptr [ebp - 4], -1
    mov edx, dword ptr [ebp + 12]
    jne L19
    cmp edx, ebx
    je L54
    mov edx, dword ptr [edx + 24]
    mov dword ptr [ebp - 4], edx
    jmp L20
L19:
    cmp edx, ebx
    je L20
    mov edx, dword ptr [edx + 24]
    add dword ptr [ebp - 4], edx
    xor ebx, ebx
L20:
    neg eax
    jmp L22
L21:
    cmp dword ptr [ebp + 12], ebx
    jne L54
L22:
    cmp dword ptr [ebp - 4], -1
    jne L23
    cmp eax, ebx
    jne L54
    mov dword ptr [ebp - 4], ebx
    jmp L25
L23:
    mov edx, dword ptr [ebp + 12]
    cmp edx, ebx
    je L24
    cmp dword ptr [edx + 40], ebx
    jne L25
L24:
    cmp dword ptr [ebp - 4], eax
    jae L54
L25:
    lea eax, [edi + edi*8]
    shl eax, 3
    mov edx, dword ptr [eax + 01010E2D4h]
    mov eax, dword ptr [eax + 01010E314h]
    push 2
    mov dword ptr [ebp - 40], eax
    pop eax
    cmp edx, eax
    mov dword ptr [ebp - 8], edx
    jne L30
    and dword ptr [ebp - 4], 000001FFFh
    cmp dword ptr [ebp - 4], 000000800h
    jae L26
    mov dword ptr [ebp - 8], eax
    jmp L29
L26:
    cmp dword ptr [ebp - 4], 000001000h
    jae L27
    mov dword ptr [ebp - 8], 11
    jmp L29
L27:
    cmp dword ptr [ebp - 4], 000001800h
    jae L28
    mov dword ptr [ebp - 8], 12
    jmp L29
L28:
    cmp dword ptr [ebp - 4], 000002000h
    jae L29
    mov dword ptr [ebp - 8], 13
L29:
    and dword ptr [ebp - 4], 0000007FFh
    jmp L37
L30:
    cmp edx, -3
    jne L32
    mov dword ptr [ebp - 8], 4
L31:
    mov dword ptr [ebp - 4], ebx
    jmp L37
L32:
    cmp edx, -4
    jne L33
    mov dword ptr [ebp - 8], 4
    mov dword ptr [ebp - 4], eax
    jmp L37
L33:
    cmp edx, -5
    jne L34
    mov dword ptr [ebp - 8], 4
    jmp L36
L34:
    cmp edx, -6
    jne L35
    mov dword ptr [ebp - 8], 17
    jmp L31
L35:
    cmp edx, -7
    jne L37
    mov dword ptr [ebp - 8], 17
L36:
    mov dword ptr [ebp - 4], 1
L37:
    cmp ecx, 6
    mov dword ptr [ebp - 44], ebx
    jl L38
    cmp ecx, 9
    jg L38
    mov dword ptr [ebp - 32], 1
L38:
    cmp ecx, 4
    jl L39
    cmp ecx, 5
    jle L40
L39:
    cmp ecx, 13
    jl L41
    cmp ecx, 14
    jg L41
L40:
    mov dword ptr [ebp - 36], 1
L41:
    mov edx, dword ptr [ebp - 20]
L42:
    cmp byte ptr [edx], bl
    jne L2
    mov edi, dword ptr [ebp + 12]
    jmp L0
L43:
    cmp dword ptr [ebp - 32], ebx
    je L51
    push 5
    mov edi, 01010F404h
    lea esi, [ebp - 60]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L44
    mov eax, 002000000h
    jmp L50
L44:
    push 4
    mov edi, 01010F400h
    lea esi, [ebp - 60]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L45
    mov eax, 004000000h
    jmp L50
L45:
    push 3
    mov edi, 01010ECE0h
    lea esi, [ebp - 60]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L46
    mov eax, 007000000h
    jmp L50
L46:
    push 3
    mov edi, 01010F3FCh
    lea esi, [ebp - 60]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L48
L47:
    mov eax, 009000000h
    jmp L50
L48:
    push 3
    mov edi, 01010F3F8h
    lea esi, [ebp - 60]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L47
    push 3
    mov edi, 01010F3F4h
    lea esi, [ebp - 60]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L49
    push 3
    mov edi, 01010F3F0h
    lea esi, [ebp - 60]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L51
L49:
    mov eax, 00A000000h
L50:
    mov dword ptr [ebp - 16], eax
    mov dword ptr [ebp - 32], ebx
    jmp L52
L51:
    cmp dword ptr [ebp - 36], ebx
    je L53
    push 4
    mov edi, 01010EAA0h
    lea esi, [ebp - 60]
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L53
    mov dword ptr [ebp - 16], 00B000000h
    mov dword ptr [ebp - 36], ebx
L52:
    mov esi, dword ptr [ebp - 12]
    jmp L42
L53:
    mov esi, dword ptr [ebp - 12]
L54:
    mov ecx, dword ptr [esi + 120]
    cmp ecx, ebx
    je L56
    mov edi, dword ptr [ebp + 12]
    lea eax, [ebp - 4]
    push eax
    lea eax, [ebp - 16]
    push eax
    lea eax, [ebp - 8]
    push eax
    push edi
    push dword ptr [ebp - 24]
    push dword ptr [ebp + 8]
    push dword ptr [esi + 124]
    push dword ptr [esi]
    call sub_1006ACC0
    test eax, eax
    jl L62
L55:
    push 44
    call sub_1006547A
    cmp eax, ebx
    je L64
    push ebx
    push dword ptr [ebp - 40]
    mov ecx, eax
    push dword ptr [ebp - 4]
    push dword ptr [ebp - 16]
    push dword ptr [ebp - 8]
    call sub_10085630
    jmp L65
L56:
    mov ecx, dword ptr [ebp + 12]
    cmp ecx, ebx
    je L59
    mov eax, dword ptr [ecx + 40]
    cmp eax, ebx
    jne L57
    push dword ptr [ecx + 24]
    push dword ptr [ebp - 24]
    push 01010F3D4h
    push 0000007D5h
    push dword ptr [ebp + 8]
    push dword ptr [esi]
    call sub_10068093
    add esp, 24
    jmp L62
L57:
    cmp dword ptr [eax + 16], -1
    je L62
    push dword ptr [ebp - 24]
    push 01010F3B8h
L58:
    push 0000007D5h
    push dword ptr [ebp + 8]
    push dword ptr [esi]
    call sub_100680BC
    add esp, 20
    jmp L62
L59:
    push dword ptr [ebp - 24]
    push 01010F3A0h
    jmp L58
L60:
    cmp eax, 3
    je L55
    cmp eax, 5
    je L55
    cmp eax, 6
    je L55
    cmp eax, 8
    je L55
    cmp eax, 9
    je L55
    cmp eax, 4
    je L55
    cmp eax, 15
    je L55
    cmp eax, 18
    je L55
    cmp eax, 19
    je L55
    push 01010F358h
L61:
    push 0000007D5h
    push dword ptr [ebp + 8]
    push dword ptr [esi]
    call sub_10068130
    add esp, 16
L62:
    push 44
    mov dword ptr [esi + 76], 1
    call sub_10065571
    cmp eax, ebx
    je L63
    push ebx
    push ebx
    push ebx
    push ebx
    push -1
    mov ecx, eax
    call sub_1008571C
    jmp L66
L63:
    xor eax, eax
    jmp L66
L64:
    xor eax, eax
L65:
    cmp eax, ebx
    je L63
    cmp edi, ebx
    je L66
    mov ecx, dword ptr [edi + 40]
    mov dword ptr [eax + 40], ecx
    mov dword ptr [edi + 40], ebx
L66:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
FUN_1006ad34 ENDP
END
