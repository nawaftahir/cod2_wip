.686
.MODEL FLAT, C
EXTRN sub_1006C89A:PROC
EXTRN sub_10085768:PROC
EXTRN sub_100857DB:PROC
EXTRN sub_10085BF8:PROC
EXTRN sub_10085C74:PROC
EXTRN sub_10085F35:PROC
EXTRN sub_100B98EB:PROC
EXTRN sub_100B9B06:PROC
.CODE
FUN_100bb4cc PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000274h
    and dword ptr [ebp - 68], 0
    push esi
    mov esi, ecx
    mov edx, dword ptr [esi + 000000100h]
    mov eax, dword ptr [edx]
    push edi
    xor edi, edi
    mov ecx, 0000FFFFFh
    inc edi
    and eax, ecx
    cmp eax, edi
    mov dword ptr [ebp - 12], esi
    mov dword ptr [ebp - 64], edi
    mov dword ptr [ebp - 60], 2
    mov dword ptr [ebp - 56], 3
    mov dword ptr [ebp - 32], edx
    je L0
    mov eax, edi
    jmp L56
L0:
    mov eax, dword ptr [edx + 16]
    mov eax, dword ptr [eax]
    push ebx
    mov ebx, dword ptr [esi + 20]
    mov eax, dword ptr [ebx + eax*4]
    mov eax, dword ptr [eax + 4]
    mov esi, dword ptr [esi + 16]
    mov eax, dword ptr [esi + eax*4]
    test byte ptr [eax + 4], 32
    jne L1
    mov eax, dword ptr [edx]
    mov dword ptr [ebp - 20], eax
    and dword ptr [ebp - 20], ecx
    cmp dword ptr [ebp - 20], edi
    jbe L2
L1:
    mov eax, edi
    jmp L55
L2:
    and eax, 0FFF00000h
    cmp eax, 010500000h
    jne L1
    and dword ptr [ebp - 36], 0
L3:
    and dword ptr [ebp - 28], 0
L4:
    xor ecx, ecx
    push 40
    pop ecx
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 000000084h]
    lea edi, [ebp - 0000001D4h]
    rep stosd dword ptr es:[edi], eax
    push 40
    xor ebx, ebx
    pop ecx
    lea edi, [ebp - 000000274h]
    lea esi, [ebp - 000000084h]
    rep stosd dword ptr es:[edi], eax
    mov dword ptr [ebp - 16], ebx
    mov dword ptr [ebp - 8], ebx
    mov dword ptr [ebp - 4], ebx
L5:
    cmp dword ptr [ebp - 28], 0
    je L6
    xor ecx, ecx
    inc ecx
    sub ecx, dword ptr [ebp - 4]
    jmp L7
L6:
    mov ecx, dword ptr [ebp - 4]
L7:
    mov eax, dword ptr [ebp - 32]
    mov esi, dword ptr [eax + 8]
    mov edi, dword ptr [ebp - 12]
    mov ecx, dword ptr [ecx*4 + 010119444h]
    cmp ecx, 16
    mov edi, dword ptr [edi + 20]
    lea edx, [esi + ebx*4]
    mov eax, dword ptr [edx]
    mov edi, dword ptr [edi + eax*4]
    jae L8
    mov eax, dword ptr [edi + 72]
    cmp eax, -1
    je L13
    shl ecx, 5
    mov esi, ecx
    mov ecx, dword ptr [ebp - 12]
    mov ecx, dword ptr [ecx + 24]
    mov edi, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebp - 12]
    push 0
    push dword ptr [esi + 010119450h]
    lea eax, [ebp - 000000094h]
    push eax
    lea eax, [ebp - 68]
    push eax
    push dword ptr [ebp - 20]
    push edx
    push edi
    call sub_100B98EB
    test eax, eax
    jne L13
    mov ecx, dword ptr [ebp - 12]
    push eax
    push 1
    lea eax, [ebp - 000000094h]
    push eax
    lea eax, [ebp - 000000274h]
    push eax
    lea eax, [ebp - 16]
    push eax
    lea eax, [ebp - 000000084h]
    push eax
    lea eax, [esi + 010119438h]
    push eax
    push edi
    call sub_100B9B06
    mov dword ptr [ebp - 8], eax
    jmp L12
L8:
    sub ecx, 16
    xor edi, edi
    shl ecx, 4
    lea ecx, [ebp + ecx - 0000001D4h]
L9:
    mov edx, dword ptr [ebp + edi*4 - 68]
    cmp edx, dword ptr [ebp - 20]
    jae L10
    add edx, ebx
    mov eax, dword ptr [esi + edx*4]
    mov dword ptr [ecx], eax
    jmp L11
L10:
    or dword ptr [ecx], 0FFFFFFFFh
L11:
    inc edi
    add ecx, 4
    cmp edi, 4
    jb L9
L12:
    cmp dword ptr [ebp - 8], 1
    je L14
    inc dword ptr [ebp - 4]
    add ebx, dword ptr [ebp - 20]
    cmp dword ptr [ebp - 4], 1
    jb L5
    jmp L14
L13:
    mov dword ptr [ebp - 8], 1
L14:
    xor ecx, ecx
    cmp dword ptr [ebp - 28], ecx
    setne cl
    cmp dword ptr [ecx*4 + 010119444h], 16
    jb L21
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ebp - 16], 0
    jbe L21
L15:
    xor edi, edi
    cmp dword ptr [ebp - 20], edi
    jbe L20
    mov eax, dword ptr [ebp - 4]
    mov edx, dword ptr [ebp + eax*4 - 000000084h]
    mov ebx, dword ptr [edx + 12]
L16:
    and dword ptr [ebp - 24], 0
    test ebx, ebx
    jbe L18
    mov eax, dword ptr [ebp - 32]
    mov eax, dword ptr [eax + 8]
    mov esi, dword ptr [eax + edi*4]
    mov ecx, dword ptr [edx + 16]
L17:
    cmp esi, dword ptr [ecx]
    je L19
    inc dword ptr [ebp - 24]
    add ecx, 4
    cmp dword ptr [ebp - 24], ebx
    jb L17
L18:
    inc edi
    cmp edi, dword ptr [ebp - 20]
    jb L16
    jmp L20
L19:
    mov dword ptr [ebp - 8], 1
L20:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp - 16]
    jb L15
L21:
    xor esi, esi
    cmp dword ptr [ebp - 8], esi
    jne L44
    cmp dword ptr [ebp - 36], esi
    jne L45
    xor eax, eax
    cmp dword ptr [ebp - 16], esi
    mov dword ptr [ebp - 24], eax
    jbe L36
L22:
    mov eax, dword ptr [ebp + eax*4 - 000000084h]
    mov eax, dword ptr [eax + 12]
    cmp eax, esi
    mov dword ptr [ebp - 4], esi
    mov dword ptr [ebp - 52], eax
    jbe L35
L23:
    mov ecx, dword ptr [ebp - 12]
    mov eax, dword ptr [ecx + 12]
    cmp eax, esi
    jbe L34
    mov ecx, dword ptr [ecx + 24]
    mov dword ptr [ebp - 44], ecx
    mov dword ptr [ebp - 48], eax
L24:
    mov ecx, dword ptr [ecx]
    cmp ecx, esi
    je L33
    cmp dword ptr [ecx], esi
    je L33
    mov edi, dword ptr [ecx + 4]
    cmp edi, esi
    mov dword ptr [ebp - 40], esi
    jbe L28
    mov eax, dword ptr [ebp - 24]
    mov eax, dword ptr [ebp + eax*4 - 000000084h]
    mov eax, dword ptr [eax + 16]
    mov edx, dword ptr [ebp - 4]
    mov esi, dword ptr [eax + edx*4]
    mov edx, dword ptr [ecx + 8]
    mov eax, edi
L25:
    mov edi, dword ptr [edx]
    cmp edi, esi
    je L26
    mov ebx, dword ptr [ebp - 12]
    mov ebx, dword ptr [ebx + 20]
    mov edi, dword ptr [ebx + edi*4]
    cmp dword ptr [edi + 56], esi
    jne L27
L26:
    mov dword ptr [ebp - 40], 1
L27:
    add edx, 4
    dec eax
    jne L25
    xor esi, esi
L28:
    cmp ecx, dword ptr [ebp - 32]
    jne L29
    xor eax, eax
    jmp L30
L29:
    mov eax, dword ptr [ebp - 40]
L30:
    cmp eax, esi
    je L33
    xor edx, edx
L31:
    cmp ecx, dword ptr [ebp + edx*4 - 000000084h]
    jne L32
    xor eax, eax
L32:
    inc edx
    cmp edx, dword ptr [ebp - 16]
    jb L31
    cmp eax, esi
    je L33
    mov dword ptr [ebp - 8], 1
L33:
    mov ecx, dword ptr [ebp - 44]
    add ecx, 4
    dec dword ptr [ebp - 48]
    mov dword ptr [ebp - 44], ecx
    jne L24
L34:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp - 52]
    jb L23
L35:
    mov eax, dword ptr [ebp - 24]
    inc eax
    cmp eax, dword ptr [ebp - 16]
    mov dword ptr [ebp - 24], eax
    jb L22
L36:
    mov dword ptr [ebp - 4], esi
L37:
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [ebp + eax*4 - 0000001D4h]
    cmp eax, -1
    je L43
    xor edi, edi
    cmp dword ptr [ebp - 16], edi
    jbe L43
    mov ecx, dword ptr [ebp - 12]
    mov ecx, dword ptr [ecx + 20]
    mov ebx, dword ptr [ecx + eax*4]
L38:
    mov ecx, dword ptr [ebp + edi*4 - 000000084h]
    mov edx, dword ptr [ecx + 12]
    test edx, edx
    jbe L42
    mov ecx, dword ptr [ecx + 16]
L39:
    mov esi, dword ptr [ecx]
    cmp eax, esi
    je L40
    cmp dword ptr [ebx + 56], esi
    jne L41
L40:
    mov dword ptr [ebp - 8], 1
L41:
    add ecx, 4
    dec edx
    jne L39
L42:
    inc edi
    cmp edi, dword ptr [ebp - 16]
    jb L38
L43:
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], 40
    jb L37
    cmp dword ptr [ebp - 8], 0
    je L45
L44:
    inc dword ptr [ebp - 28]
    cmp dword ptr [ebp - 28], 1
    jb L4
    cmp dword ptr [ebp - 8], 0
    je L45
    inc dword ptr [ebp - 36]
    cmp dword ptr [ebp - 36], 1
    jb L3
    jmp L49
L45:
    mov eax, dword ptr [ebp - 32]
    mov ecx, dword ptr [ebp - 16]
    mov dword ptr [ebp + ecx*4 - 000000084h], eax
    xor eax, eax
L46:
    mov ecx, dword ptr [ebp + eax - 0000001D4h]
    cmp ecx, -1
    jne L47
    mov ecx, dword ptr [ebp + eax - 000000274h]
    cmp ecx, -1
    je L48
L47:
    mov dword ptr [ebp + eax - 000000134h], ecx
L48:
    add eax, 4
    cmp eax, 0000000A0h
    jb L46
    and dword ptr [ebp - 8], 0
L49:
    mov eax, dword ptr [ebp - 8]
    test eax, eax
    jne L55
    push 116
    call sub_10085BF8
    test eax, eax
    je L50
    mov ecx, eax
    call sub_10085768
    mov ebx, eax
    jmp L51
L50:
    xor ebx, ebx
L51:
    test ebx, ebx
    jne L52
    mov eax, 08007000Eh
    jmp L55
L52:
    push 0
    push 1
    push 2
    push 070D00001h
    mov ecx, ebx
    call sub_10085C74
    mov esi, eax
    test esi, esi
    mov ecx, ebx
    jl L54
    mov eax, dword ptr [ebp - 12]
    push dword ptr [eax + 000000100h]
    call sub_100857DB
    mov esi, eax
    test esi, esi
    jl L53
    mov edx, dword ptr [ebp - 12]
    mov eax, dword ptr [edx + 000000100h]
    mov ecx, dword ptr [eax + 12]
    mov esi, dword ptr [eax + 16]
    mov edi, dword ptr [ebx + 16]
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [ebx + 8]
    lea esi, [ebp - 000000124h]
    movsd dword ptr es:[edi], dword ptr [esi]
    mov edi, dword ptr [ebx + 8]
    add edi, 4
    lea esi, [ebp - 000000134h]
    movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, dword ptr [edx + 000000100h]
    push ebx
    call sub_10085F35
    mov esi, eax
L53:
    mov ecx, ebx
L54:
    push 1
    call sub_1006C89A
    mov eax, esi
L55:
    pop ebx
L56:
    pop edi
    pop esi
    leave
    ret
FUN_100bb4cc ENDP
END
