.686
.MODEL FLAT, C
EXTRN sub_100854DA:PROC
EXTRN sub_1008AF24:PROC
EXTRN sub_1008B3F6:PROC
EXTRN sub_1008DCC7:PROC
.CODE
FUN_100949dc PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 64
    push esi
    push edi
    mov esi, ecx
    xor edi, edi
    mov dword ptr [ebp - 44], esi
    mov dword ptr [ebp - 56], edi
    call sub_1008AF24
    cmp dword ptr [esi + 12], edi
    mov dword ptr [ebp - 48], edi
    jbe L68
    push ebx
    or edi, 0FFFFFFFFh
L0:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [ebp - 48]
    mov ebx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [ebx]
    mov ecx, eax
    and ecx, 0F0000000h
    cmp ecx, 010000000h
    mov dword ptr [ebp - 40], ebx
    jb L67
    cmp ecx, 040000000h
    ja L67
    mov dword ptr [ebp - 16], eax
    mov eax, dword ptr [ebx + 4]
    and word ptr [ebp - 14], 15
    xor edx, edx
    div dword ptr [ebp - 16]
    mov ecx, ebx
    mov dword ptr [ebp - 20], eax
    call sub_100854DA
    xor ecx, ecx
    mov dword ptr [ebp - 60], eax
    mov eax, dword ptr [ebp - 16]
    inc ecx
    cmp eax, ecx
    mov dword ptr [ebp - 24], eax
    mov dword ptr [ebp - 8], ecx
    jbe L67
    shl eax, 2
    mov dword ptr [ebp - 36], eax
    add eax, 4
    mov dword ptr [ebp - 12], 4
    mov dword ptr [ebp - 32], eax
L1:
    mov eax, dword ptr [ebx + 16]
    mov ecx, dword ptr [ebp - 12]
    mov edx, dword ptr [eax + ecx]
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [esi + 16]
    mov dword ptr [ebp - 64], edx
    mov edx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edx + 4]
    mov eax, dword ptr [eax + edx*4]
    test word ptr [eax + 4], 000001020h
    jne L57
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ebp - 12], 0
    jbe L57
    mov eax, dword ptr [ebp - 36]
    mov dword ptr [ebp - 28], eax
L2:
    mov eax, dword ptr [ebx + 16]
    mov edx, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + edx*4]
    cmp eax, edi
    je L55
    mov eax, dword ptr [ecx + eax*4]
    mov edx, dword ptr [eax + 4]
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + edx*4]
    test word ptr [eax + 4], 000001020h
    jne L55
    cmp dword ptr [ebp - 20], 1
    jne L7
    mov eax, dword ptr [ebx + 8]
    mov edx, dword ptr [ebp - 12]
    mov edx, dword ptr [eax + edx]
    cmp edx, edi
    je L3
    mov edx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edx + 48]
    jmp L4
L3:
    mov edx, edi
L4:
    mov esi, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + esi*4]
    cmp eax, edi
    je L5
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 48]
    jmp L6
L5:
    mov eax, edi
L6:
    cmp edx, eax
    je L56
L7:
    cmp dword ptr [ebp - 20], 2
    jne L25
    mov eax, dword ptr [ebx + 8]
    mov edx, dword ptr [ebp - 12]
    mov edx, dword ptr [eax + edx]
    cmp edx, edi
    je L8
    mov edx, dword ptr [ecx + edx*4]
    mov esi, dword ptr [edx + 48]
    jmp L9
L8:
    mov esi, edi
L9:
    mov edx, dword ptr [ebp - 4]
    mov edx, dword ptr [eax + edx*4]
    cmp edx, edi
    mov dword ptr [ebp - 52], edx
    je L10
    mov edx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edx + 48]
    jmp L11
L10:
    mov edx, edi
L11:
    cmp esi, edx
    jne L16
    mov edx, dword ptr [ebp - 32]
    mov edx, dword ptr [eax + edx]
    cmp edx, edi
    je L12
    mov edx, dword ptr [ecx + edx*4]
    mov esi, dword ptr [edx + 48]
    jmp L13
L12:
    mov esi, edi
L13:
    mov edx, dword ptr [ebp - 28]
    mov edx, dword ptr [eax + edx]
    cmp edx, edi
    je L14
    mov edx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edx + 48]
    jmp L15
L14:
    mov edx, edi
L15:
    cmp esi, edx
    je L56
L16:
    cmp dword ptr [ebp - 60], 0
    je L55
    mov edx, dword ptr [ebp - 12]
    mov edx, dword ptr [eax + edx]
    cmp edx, edi
    je L17
    mov edx, dword ptr [ecx + edx*4]
    mov esi, dword ptr [edx + 48]
    jmp L18
L17:
    mov esi, edi
L18:
    mov edx, dword ptr [ebp - 28]
    mov edx, dword ptr [eax + edx]
    cmp edx, edi
    je L19
    mov edx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edx + 48]
    jmp L20
L19:
    mov edx, edi
L20:
    cmp esi, edx
    jne L55
    mov edx, dword ptr [ebp - 32]
    mov eax, dword ptr [eax + edx]
    cmp eax, edi
    je L21
    mov eax, dword ptr [ecx + eax*4]
    mov edx, dword ptr [eax + 48]
    jmp L22
L21:
    mov edx, edi
L22:
    mov eax, dword ptr [ebp - 52]
    cmp eax, edi
    je L23
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 48]
    jmp L24
L23:
    mov eax, edi
L24:
    cmp edx, eax
    je L56
L25:
    cmp dword ptr [ebp - 20], 3
    jne L38
    mov eax, dword ptr [ebx + 8]
    mov edx, dword ptr [ebp - 12]
    mov edx, dword ptr [eax + edx]
    cmp edx, edi
    je L26
    mov edx, dword ptr [ecx + edx*4]
    mov esi, dword ptr [edx + 48]
    jmp L27
L26:
    mov esi, edi
L27:
    mov edx, dword ptr [ebp - 4]
    mov edx, dword ptr [eax + edx*4]
    cmp edx, edi
    je L28
    mov edx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edx + 48]
    jmp L29
L28:
    mov edx, edi
L29:
    cmp esi, edx
    jne L55
    mov edx, dword ptr [ebp - 32]
    mov edx, dword ptr [eax + edx]
    cmp edx, edi
    je L30
    mov edx, dword ptr [ecx + edx*4]
    mov esi, dword ptr [edx + 48]
    jmp L31
L30:
    mov esi, edi
L31:
    mov edx, dword ptr [ebp - 28]
    mov edx, dword ptr [eax + edx]
    cmp edx, edi
    je L32
    mov edx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edx + 48]
    jmp L33
L32:
    mov edx, edi
L33:
    cmp esi, edx
    jne L55
    mov esi, dword ptr [ebp - 16]
    mov edx, dword ptr [ebp - 8]
    add esi, esi
    add edx, esi
    mov edx, dword ptr [eax + edx*4]
    cmp edx, edi
    je L34
    mov edx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edx + 48]
    mov dword ptr [ebp - 52], edx
    jmp L35
L34:
    mov dword ptr [ebp - 52], edi
L35:
    mov edx, dword ptr [ebp - 4]
    add esi, edx
    mov eax, dword ptr [eax + esi*4]
    cmp eax, edi
    je L36
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 48]
    jmp L37
L36:
    mov eax, edi
L37:
    cmp dword ptr [ebp - 52], eax
    je L56
L38:
    cmp dword ptr [ebp - 20], 4
    jne L55
    mov eax, dword ptr [ebx + 8]
    mov edx, dword ptr [ebp - 12]
    mov edx, dword ptr [eax + edx]
    cmp edx, edi
    je L39
    mov edx, dword ptr [ecx + edx*4]
    mov esi, dword ptr [edx + 48]
    jmp L40
L39:
    mov esi, edi
L40:
    mov edx, dword ptr [ebp - 4]
    mov edx, dword ptr [eax + edx*4]
    cmp edx, edi
    je L41
    mov edx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edx + 48]
    jmp L42
L41:
    mov edx, edi
L42:
    cmp esi, edx
    jne L55
    mov edx, dword ptr [ebp - 32]
    mov edx, dword ptr [eax + edx]
    cmp edx, edi
    je L43
    mov edx, dword ptr [ecx + edx*4]
    mov esi, dword ptr [edx + 48]
    jmp L44
L43:
    mov esi, edi
L44:
    mov edx, dword ptr [ebp - 28]
    mov edx, dword ptr [eax + edx]
    cmp edx, edi
    je L45
    mov edx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edx + 48]
    jmp L46
L45:
    mov edx, edi
L46:
    cmp esi, edx
    jne L55
    mov esi, dword ptr [ebp - 16]
    mov edx, dword ptr [ebp - 8]
    add esi, esi
    add edx, esi
    mov edx, dword ptr [eax + edx*4]
    cmp edx, edi
    je L47
    mov edx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edx + 48]
    mov dword ptr [ebp - 52], edx
    jmp L48
L47:
    mov dword ptr [ebp - 52], edi
L48:
    mov edx, dword ptr [ebp - 4]
    add esi, edx
    mov edx, dword ptr [eax + esi*4]
    cmp edx, edi
    je L49
    mov edx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edx + 48]
    jmp L50
L49:
    mov edx, edi
L50:
    cmp dword ptr [ebp - 52], edx
    jne L55
    mov edx, dword ptr [ebp - 16]
    mov esi, dword ptr [ebp - 8]
    lea edx, [edx + edx*2]
    add esi, edx
    mov esi, dword ptr [eax + esi*4]
    cmp esi, edi
    je L51
    mov esi, dword ptr [ecx + esi*4]
    mov esi, dword ptr [esi + 48]
    mov dword ptr [ebp - 52], esi
    jmp L52
L51:
    mov dword ptr [ebp - 52], edi
L52:
    mov esi, dword ptr [ebp - 4]
    add edx, esi
    mov eax, dword ptr [eax + edx*4]
    cmp eax, edi
    je L53
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 48]
    jmp L54
L53:
    mov eax, edi
L54:
    cmp dword ptr [ebp - 52], eax
    je L56
L55:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    add dword ptr [ebp - 28], 4
    cmp eax, dword ptr [ebp - 8]
    mov esi, dword ptr [ebp - 44]
    jb L2
    jmp L57
L56:
    push dword ptr [ebp - 64]
    mov eax, dword ptr [ebx + 16]
    mov ecx, dword ptr [ebp - 4]
    push dword ptr [eax + ecx*4]
    mov esi, dword ptr [ebp - 44]
    mov ecx, esi
    call sub_1008DCC7
    mov eax, dword ptr [ebx + 16]
    mov ecx, dword ptr [ebp - 12]
    dec dword ptr [ebp - 24]
    mov dword ptr [ecx + eax], edi
L57:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 16]
    add dword ptr [ebp - 32], 4
    add dword ptr [ebp - 12], 4
    cmp dword ptr [ebp - 8], eax
    jb L1
    cmp dword ptr [ebp - 24], eax
    jae L67
    and dword ptr [ebp - 8], 0
    test eax, eax
    jbe L62
    xor edi, edi
L58:
    mov edx, dword ptr [ebp - 8]
    mov eax, dword ptr [ebx + 16]
    shl edx, 2
    mov ecx, dword ptr [eax + edx]
    cmp ecx, -1
    je L61
    cmp dword ptr [ebp - 20], 0
    mov dword ptr [eax + edi], ecx
    jbe L60
    mov esi, dword ptr [ebp - 20]
    mov ecx, edi
L59:
    mov eax, dword ptr [ebx + 8]
    mov ebx, dword ptr [eax + edx]
    add edx, dword ptr [ebp - 36]
    mov dword ptr [eax + ecx], ebx
    add ecx, dword ptr [ebp - 36]
    dec esi
    mov ebx, dword ptr [ebp - 40]
    jne L59
L60:
    add edi, 4
L61:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp - 16]
    jb L58
L62:
    cmp dword ptr [ebp - 20], 1
    jbe L66
    mov esi, dword ptr [ebp - 24]
    mov ecx, dword ptr [ebp - 36]
    mov edi, dword ptr [ebp - 20]
    shl esi, 2
    mov dword ptr [ebp - 28], ecx
    mov dword ptr [ebp - 32], esi
    dec edi
L63:
    cmp dword ptr [ebp - 24], 0
    jbe L65
    mov eax, dword ptr [ebp - 24]
    mov edx, dword ptr [ebp - 32]
    mov dword ptr [ebp - 52], eax
L64:
    mov eax, dword ptr [ebx + 8]
    mov ebx, dword ptr [eax + ecx]
    mov dword ptr [eax + edx], ebx
    mov ebx, dword ptr [ebp - 40]
    add ecx, 4
    add edx, 4
    dec dword ptr [ebp - 52]
    jne L64
L65:
    mov ecx, dword ptr [ebp - 28]
    add ecx, dword ptr [ebp - 36]
    add dword ptr [ebp - 32], esi
    dec edi
    mov dword ptr [ebp - 28], ecx
    jne L63
L66:
    mov eax, dword ptr [ebp - 24]
    mov ecx, dword ptr [ebx]
    xor ecx, eax
    and ecx, 0000FFFFFh
    xor dword ptr [ebx], ecx
    mov ecx, eax
    imul ecx, dword ptr [ebp - 20]
    mov dword ptr [ebx + 4], ecx
    mov dword ptr [ebx + 12], eax
    mov dword ptr [ebp - 56], 1
    or edi, 0FFFFFFFFh
L67:
    inc dword ptr [ebp - 48]
    mov esi, dword ptr [ebp - 44]
    mov eax, dword ptr [ebp - 48]
    cmp eax, dword ptr [esi + 12]
    jb L0
    cmp dword ptr [ebp - 56], 0
    pop ebx
    jne L69
L68:
    xor eax, eax
    inc eax
    jmp L70
L69:
    mov ecx, esi
    call sub_1008B3F6
    xor eax, eax
L70:
    pop edi
    pop esi
    leave
    ret
FUN_100949dc ENDP
END
