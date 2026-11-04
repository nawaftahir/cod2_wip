.686
.MODEL FLAT, C
EXTRN sub_100F8620:PROC
EXTRN sub_100F88F5:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB7A7:PROC
EXTRN sub_100FC55A:PROC
EXTRN sub_100FE59F:PROC
EXTRN sub_100FE606:PROC
EXTRN sub_100FF1D2:PROC
EXTRN sub_100FF6D3:PROC
EXTRN sub_100FF6E2:PROC
EXTRN sub_100FF730:PROC
EXTRN sub_100FF738:PROC
EXTRN sub_100FF851:PROC
EXTRN sub_101060B8:PROC
EXTRN g_1010C180:DWORD
EXTRN g_1010C184:DWORD
.CODE
__store_winword PROC
    push 56
    push 01017CF70h
    call sub_100FB61C
    mov eax, dword ptr [ebp + 12]
    xor esi, esi
    sub eax, esi
    je L1
    dec eax
    mov eax, dword ptr [ebp + 28]
    je L0
    mov eax, dword ptr [eax + 0000000A8h]
    jmp L2
L0:
    mov eax, dword ptr [eax + 0000000A4h]
    jmp L2
L1:
    mov eax, dword ptr [ebp + 28]
    mov eax, dword ptr [eax + 0000000A0h]
L2:
    mov dword ptr [ebp - 32], eax
    mov ecx, dword ptr [ebp + 28]
    cmp dword ptr [ecx + 0000000B0h], 1
    je L10
    cmp dword ptr [ebp + 12], 2
    mov eax, dword ptr [g_1010C184]
    jne L3
    mov eax, dword ptr [g_1010C180]
L3:
    mov dword ptr [ebp - 48], eax
    mov ebx, dword ptr [ebp + 16]
    mov dx, word ptr [ebx + 20]
    add dx, 00000076Ch
    mov word ptr [ebp - 72], dx
    mov dx, word ptr [ebx + 16]
    inc dx
    mov word ptr [ebp - 70], dx
    mov dx, word ptr [ebx + 12]
    mov word ptr [ebp - 66], dx
    mov dx, word ptr [ebx + 8]
    mov word ptr [ebp - 64], dx
    mov dx, word ptr [ebx + 4]
    mov word ptr [ebp - 62], dx
    mov dx, word ptr [ebx]
    mov word ptr [ebp - 60], dx
    mov word ptr [ebp - 58], si
    push esi
    push esi
    push dword ptr [ebp - 32]
    lea edx, [ebp - 72]
    push edx
    push esi
    push dword ptr [ecx + 0000000ACh]
    call eax
    mov dword ptr [ebp - 44], eax
    cmp eax, esi
    je L11
    mov dword ptr [ebp - 52], esi
    mov dword ptr [ebp - 4], esi
    add eax, 3
    and eax, 0FFFFFFFCh
    call sub_100F88F5
    mov dword ptr [ebp - 24], esp
    mov edi, esp
    mov dword ptr [ebp - 56], edi
    or dword ptr [ebp - 4], 0FFFFFFFFh
    jmp L4
    xor eax, eax
    inc eax
    ret
    mov esp, dword ptr [ebp - 24]
    call sub_101060B8
    xor edi, edi
    or dword ptr [ebp - 4], 0FFFFFFFFh
    mov ebx, dword ptr [ebp + 16]
    xor esi, esi
L4:
    cmp edi, esi
    jne L5
    push dword ptr [ebp - 44]
    call sub_100FC55A
    pop ecx
    mov edi, eax
    cmp edi, esi
    je L11
    mov dword ptr [ebp - 52], 1
L5:
    mov dword ptr [ebp - 36], edi
    push dword ptr [ebp - 44]
    push edi
    push dword ptr [ebp - 32]
    lea eax, [ebp - 72]
    push eax
    push esi
    mov eax, dword ptr [ebp + 28]
    push dword ptr [eax + 0000000ACh]
    call dword ptr [ebp - 0x30]
    dec eax
    cmp eax, esi
    jle L7
    mov esi, dword ptr [ebp + 24]
    mov ecx, dword ptr [ebp + 20]
L6:
    cmp dword ptr [esi], 0
    jbe L7
    mov edx, dword ptr [ecx]
    mov ebx, dword ptr [ebp - 36]
    mov bl, byte ptr [ebx]
    mov byte ptr [edx], bl
    inc dword ptr [ecx]
    inc dword ptr [ebp - 36]
    dec dword ptr [esi]
    dec eax
    test eax, eax
    jg L6
L7:
    cmp dword ptr [ebp - 52], 0
    je L8
    push edi
    call sub_100F8620
    pop ecx
L8:
    xor eax, eax
    inc eax
L9:
    lea esp, [ebp - 84]
    call sub_100FB7A7
    ret
L10:
    mov ebx, dword ptr [ebp + 16]
L11:
    mov eax, dword ptr [ebp - 32]
    mov cl, byte ptr [eax]
    test cl, cl
    je L8
    mov edi, dword ptr [ebp + 24]
    mov esi, dword ptr [ebp + 20]
    jmp L12
    mov ebx, dword ptr [ebp + 16]
L12:
    cmp dword ptr [edi], 0
    je L8
    mov byte ptr [ebp - 25], 0
    xor edx, edx
    mov dword ptr [ebp - 40], edx
    mov eax, dword ptr [ebp - 32]
L13:
    inc eax
    inc edx
    cmp byte ptr [eax], cl
    je L13
    mov dword ptr [ebp - 36], eax
    movsx ecx, cl
    cmp ecx, 100
    jg L35
    je L31
    cmp ecx, 39
    je L25
    cmp ecx, 65
    je L14
    cmp ecx, 72
    je L19
    cmp ecx, 77
    je L15
    cmp ecx, 97
    jne L54
L14:
    push 01017CF68h
    mov ebx, dword ptr [ebp - 32]
    push ebx
    call sub_100FE59F
    pop ecx
    pop ecx
    test eax, eax
    jne L22
    add ebx, 5
    jmp L23
L15:
    mov ecx, edx
    dec ecx
    je L17
    dec ecx
    je L18
    dec ecx
    je L16
    dec ecx
    jne L54
    mov byte ptr [ebp - 25], 66
    jmp L54
L16:
    mov byte ptr [ebp - 25], 98
    jmp L54
L17:
    mov dword ptr [ebp - 40], 1
L18:
    mov byte ptr [ebp - 25], 109
    jmp L54
L19:
    mov ecx, edx
    dec ecx
    je L20
    dec ecx
    je L21
    jmp L54
L20:
    mov dword ptr [ebp - 40], 1
L21:
    mov byte ptr [ebp - 25], 72
    jmp L54
L22:
    push 01017CF64h
    push ebx
    call sub_100FE606
    pop ecx
    pop ecx
    test eax, eax
    jne L24
    add ebx, 3
L23:
    mov dword ptr [ebp - 36], ebx
L24:
    mov byte ptr [ebp - 25], 112
    jmp L54
L25:
    add dword ptr [ebp - 32], edx
    test dl, 1
    je sub_100FF6D3
    mov eax, dword ptr [ebp - 32]
    jmp L29
L26:
    mov ecx, dword ptr [edi]
    test ecx, ecx
    je sub_100FF6E2
    cmp al, 39
    je L30
    movzx edx, al
    mov ebx, dword ptr [ebp + 8]
    mov ebx, dword ptr [ebx + 72]
    test byte ptr [ebx + edx*2 + 1], 000000080h
    je L27
    cmp ecx, 1
    jbe L27
    mov ecx, dword ptr [ebp - 32]
    inc ecx
    cmp byte ptr [ecx], 0
    je L55
    mov edx, dword ptr [esi]
    mov byte ptr [edx], al
    inc dword ptr [esi]
    mov eax, ecx
    dec dword ptr [edi]
    jmp L28
L27:
    mov eax, dword ptr [ebp - 32]
L28:
    mov ecx, dword ptr [esi]
    mov dl, byte ptr [eax]
    mov byte ptr [ecx], dl
    inc dword ptr [esi]
    inc eax
    mov dword ptr [ebp - 32], eax
    dec dword ptr [edi]
L29:
    mov al, byte ptr [eax]
    test al, al
    jne L26
    jmp sub_100FF730
L30:
    inc dword ptr [ebp - 32]
    jmp sub_100FF738
L31:
    mov ecx, edx
    dec ecx
    je L33
    dec ecx
    je L34
    dec ecx
    je L32
    dec ecx
    jne L54
    mov byte ptr [ebp - 25], 65
    jmp L54
L32:
    mov byte ptr [ebp - 25], 97
    jmp L54
L33:
    mov dword ptr [ebp - 40], 1
L34:
    mov byte ptr [ebp - 25], 100
    jmp L54
L35:
    sub ecx, 104
    je L51
    sub ecx, 5
    je L48
    sub ecx, 6
    je L45
    dec ecx
    je L37
    sub ecx, 5
    jne L54
    mov ecx, edx
    dec ecx
    dec ecx
    je L36
    dec ecx
    dec ecx
    jne L54
    mov byte ptr [ebp - 25], 89
    jmp L54
L36:
    mov byte ptr [ebp - 25], 121
    jmp L54
L37:
    mov eax, dword ptr [ebp + 28]
    cmp dword ptr [ebx + 8], 11
    jg L38
    mov eax, dword ptr [eax + 000000098h]
    jmp L39
L38:
    mov eax, dword ptr [eax + 00000009Ch]
L39:
    cmp edx, 1
    jne L43
    cmp dword ptr [edi], 0
    jbe L43
    mov cl, byte ptr [eax]
    movzx edx, cl
    mov ebx, dword ptr [ebp + 8]
    mov ebx, dword ptr [ebx + 72]
    test byte ptr [ebx + edx*2 + 1], 000000080h
    je L40
    cmp dword ptr [edi], 1
    jbe L40
    inc eax
    cmp byte ptr [eax], 0
    je L55
    mov edx, dword ptr [esi]
    mov byte ptr [edx], cl
    inc dword ptr [esi]
    dec dword ptr [edi]
L40:
    mov ecx, dword ptr [esi]
    mov al, byte ptr [eax]
    mov byte ptr [ecx], al
    inc dword ptr [esi]
    dec dword ptr [edi]
    jmp L44
L41:
    cmp dword ptr [edi], 0
    jbe L44
    movzx edx, cl
    mov ebx, dword ptr [ebp + 8]
    mov ebx, dword ptr [ebx + 72]
    test byte ptr [ebx + edx*2 + 1], 000000080h
    je L42
    cmp dword ptr [edi], 1
    jbe L42
    inc eax
    cmp byte ptr [eax], 0
    je L55
    mov edx, dword ptr [esi]
    mov byte ptr [edx], cl
    inc dword ptr [esi]
    dec dword ptr [edi]
L42:
    mov ecx, dword ptr [esi]
    mov dl, byte ptr [eax]
    mov byte ptr [ecx], dl
    inc dword ptr [esi]
    inc eax
    dec dword ptr [edi]
L43:
    mov cl, byte ptr [eax]
    test cl, cl
    jne L41
L44:
    mov eax, dword ptr [ebp - 36]
    mov dword ptr [ebp - 32], eax
    jmp sub_100FF851
L45:
    mov ecx, edx
    dec ecx
    je L46
    dec ecx
    je L47
    jmp L54
L46:
    mov dword ptr [ebp - 40], 1
L47:
    mov byte ptr [ebp - 25], 83
    jmp L54
L48:
    mov ecx, edx
    dec ecx
    je L49
    dec ecx
    je L50
    jmp L54
L49:
    mov dword ptr [ebp - 40], 1
L50:
    mov byte ptr [ebp - 25], 77
    jmp L54
L51:
    mov ecx, edx
    dec ecx
    je L52
    dec ecx
    je L53
    jmp L54
L52:
    mov dword ptr [ebp - 40], 1
L53:
    mov byte ptr [ebp - 25], 73
L54:
    mov al, byte ptr [ebp - 25]
    test al, al
    je L56
    push dword ptr [ebp - 40]
    push dword ptr [ebp + 28]
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 8]
    mov ebx, edi
    mov ecx, esi
    call sub_100FF1D2
    add esp, 16
    test eax, eax
    jne L44
L55:
    xor eax, eax
    jmp L9
L56:
    mov ecx, dword ptr [ebp - 32]
    mov al, byte ptr [ecx]
    movzx edx, al
    mov ebx, dword ptr [ebp + 8]
    mov ebx, dword ptr [ebx + 72]
    test byte ptr [ebx + edx*2 + 1], 000000080h
    je L57
    cmp dword ptr [edi], 1
    jbe L57
    inc ecx
    cmp byte ptr [ecx], 0
    je L55
    mov edx, dword ptr [esi]
    mov byte ptr [edx], al
    inc dword ptr [esi]
    dec dword ptr [edi]
L57:
    mov eax, dword ptr [esi]
    mov dl, byte ptr [ecx]
    mov byte ptr [eax], dl
    inc dword ptr [esi]
    inc ecx
__store_winword ENDP
END
