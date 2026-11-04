.686
.MODEL FLAT, C
EXTRN sub_100F8766:PROC
EXTRN sub_100F87B4:PROC
EXTRN sub_100F87E0:PROC
EXTRN sub_100F890E:PROC
EXTRN sub_100F892E:PROC
EXTRN sub_1010114F:PROC
EXTRN sub_101092E5:PROC
EXTRN sub_10109632:PROC
EXTRN g_101A50D0:DWORD
EXTRN g_101A50E4:DWORD
.CODE
___strgtold12 PROC
    push ebp
    mov ebp, esp
    sub esp, 92
    mov eax, dword ptr [g_101A50D0]
    push ebx
    push esi
    mov dword ptr [ebp - 4], eax
    xor eax, eax
    push edi
    mov edi, dword ptr [ebp + 16]
    lea esi, [ebp - 48]
    mov dword ptr [ebp - 52], esi
    mov dword ptr [ebp - 80], eax
    mov dword ptr [ebp - 76], 1
    mov dword ptr [ebp - 56], eax
    mov dword ptr [ebp - 68], eax
    mov dword ptr [ebp - 88], eax
    mov dword ptr [ebp - 92], eax
    mov dword ptr [ebp - 84], eax
    mov dword ptr [ebp - 60], eax
    mov dword ptr [ebp - 72], eax
    mov dword ptr [ebp - 64], edi
L0:
    mov cl, byte ptr [edi]
    cmp cl, 32
    je L1
    cmp cl, 9
    je L1
    cmp cl, 10
    je L1
    cmp cl, 13
    jne L2
L1:
    inc edi
    jmp L0
L2:
    mov bl, byte ptr [edi]
    inc edi
    cmp eax, 11
    ja L44
    jmp dword ptr [eax*4 + 0x10106924]
    cmp bl, 49
    jl L4
    cmp bl, 57
    jg L4
L3:
    push 3
    jmp L37
L4:
    cmp bl, byte ptr [g_101A50E4]
    jne L6
L5:
    push 5
    jmp L42
L6:
    movsx eax, bl
    sub eax, 43
    je L8
    dec eax
    dec eax
    je L7
    sub eax, 3
    je L16
    mov dword ptr [ebp - 52], esi
    dec edi
    jmp L33
L7:
    push 2
    pop eax
    mov dword ptr [ebp - 80], 000008000h
    jmp L2
L8:
    and dword ptr [ebp - 80], 0
    push 2
    pop eax
    jmp L2
    xor eax, eax
    inc eax
    cmp bl, 49
    mov dword ptr [ebp - 68], eax
    jl L9
    cmp bl, 57
    jle L3
L9:
    cmp bl, byte ptr [g_101A50E4]
    jne L11
L10:
    push 4
    jmp L42
L11:
    cmp bl, 43
    je L14
    cmp bl, 45
    je L14
    cmp bl, 48
    je L2
L12:
    cmp bl, 67
    jle L31
    cmp bl, 69
    jle L13
    cmp bl, 99
    jle L31
    cmp bl, 101
    jg L31
L13:
    push 6
    jmp L42
L14:
    dec edi
    push 11
    jmp L42
    cmp bl, 49
    jl L15
    cmp bl, 57
    jle L3
L15:
    cmp bl, byte ptr [g_101A50E4]
    je L5
    cmp bl, 48
    jne L39
L16:
    xor eax, eax
    inc eax
    jmp L2
    mov dword ptr [ebp - 68], 1
    jmp L20
L17:
    cmp dword ptr [ebp - 56], 25
    jae L18
    inc dword ptr [ebp - 56]
    sub bl, 48
    mov byte ptr [esi], bl
    inc esi
    jmp L19
L18:
    inc dword ptr [ebp - 60]
L19:
    mov bl, byte ptr [edi]
    inc edi
L20:
    movzx eax, bl
    push eax
    call sub_100F8766
    test eax, eax
    pop ecx
    jne L17
    cmp bl, byte ptr [g_101A50E4]
    jne L26
    jmp L10
    xor eax, eax
    inc eax
    cmp dword ptr [ebp - 56], 0
    mov dword ptr [ebp - 68], eax
    mov dword ptr [ebp - 88], eax
    jne L25
    jmp L22
L21:
    dec dword ptr [ebp - 60]
    mov bl, byte ptr [edi]
    inc edi
L22:
    cmp bl, 48
    je L21
    jmp L25
L23:
    cmp dword ptr [ebp - 56], 25
    jae L24
    inc dword ptr [ebp - 56]
    sub bl, 48
    mov byte ptr [esi], bl
    inc esi
    dec dword ptr [ebp - 60]
L24:
    mov bl, byte ptr [edi]
    inc edi
L25:
    movzx eax, bl
    push eax
    call sub_100F87B4
    test eax, eax
    pop ecx
    jne L23
L26:
    cmp bl, 43
    je L14
    cmp bl, 45
    je L14
    jmp L12
    movzx eax, bl
    push eax
    mov dword ptr [ebp - 88], 1
    call sub_100F87E0
    test eax, eax
    pop ecx
    je L39
    push 4
    jmp L37
    cmp bl, 49
    lea ecx, [edi - 2]
    mov dword ptr [ebp - 64], ecx
    jl L27
    cmp bl, 57
    jle L36
L27:
    movsx eax, bl
    sub eax, 43
    je L41
    dec eax
    dec eax
    je L40
    sub eax, 3
    jne L45
L28:
    push 8
    jmp L42
    mov dword ptr [ebp - 92], 1
    jmp L30
L29:
    mov bl, byte ptr [edi]
    inc edi
L30:
    cmp bl, 48
    je L29
    cmp bl, 49
    jl L31
    cmp bl, 57
    jle L36
L31:
    dec edi
L32:
    mov dword ptr [ebp - 52], esi
L33:
    cmp dword ptr [ebp - 68], 0
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [eax], edi
    je L57
    push 24
    pop eax
    cmp dword ptr [ebp - 56], eax
    jbe L35
    cmp byte ptr [ebp - 25], 5
    jl L34
    inc byte ptr [ebp - 25]
L34:
    dec esi
    inc dword ptr [ebp - 60]
    mov dword ptr [ebp - 56], eax
L35:
    cmp dword ptr [ebp - 56], 0
    jbe L60
    jmp L53
    cmp bl, 49
    jl L38
    cmp bl, 57
    jg L38
L36:
    push 9
L37:
    pop eax
    dec edi
    jmp L2
L38:
    cmp bl, 48
    je L28
L39:
    mov edi, dword ptr [ebp - 64]
    jmp L32
    cmp dword ptr [ebp + 32], 0
    je L43
    movsx eax, bl
    sub eax, 43
    lea ecx, [edi - 1]
    mov dword ptr [ebp - 64], ecx
    je L41
    dec eax
    dec eax
    jne L45
L40:
    or dword ptr [ebp - 76], 0FFFFFFFFh
    push 7
    pop eax
    jmp L2
L41:
    push 7
L42:
    pop eax
    jmp L2
L43:
    push 10
    pop eax
    dec edi
L44:
    cmp eax, 10
    jne L2
    jmp L32
L45:
    mov dword ptr [ebp - 52], esi
    mov edi, ecx
    jmp L33
    mov dword ptr [ebp - 52], esi
    mov dword ptr [ebp - 92], 1
    xor esi, esi
    jmp L47
L46:
    movsx ecx, bl
    lea eax, [esi + esi*4]
    lea esi, [ecx + eax*2 - 48]
    cmp esi, 000001450h
    jg L48
    mov bl, byte ptr [edi]
    inc edi
L47:
    movzx eax, bl
    push eax
    call sub_100F890E
    test eax, eax
    pop ecx
    jne L46
    jmp L49
L48:
    mov esi, 000001451h
L49:
    mov dword ptr [ebp - 84], esi
    movzx eax, bl
    jmp L51
L50:
    mov al, byte ptr [edi]
    inc edi
    movzx eax, al
L51:
    push eax
    call sub_100F892E
    test eax, eax
    pop ecx
    jne L50
    mov esi, dword ptr [ebp - 52]
    dec edi
    jmp L33
L52:
    dec dword ptr [ebp - 56]
    inc dword ptr [ebp - 60]
L53:
    dec esi
    cmp byte ptr [esi], 0
    je L52
    lea eax, [ebp - 20]
    push eax
    push dword ptr [ebp - 56]
    lea eax, [ebp - 48]
    push eax
    call sub_101092E5
    mov eax, dword ptr [ebp - 84]
    xor ecx, ecx
    add esp, 12
    cmp dword ptr [ebp - 76], ecx
    jge L54
    neg eax
L54:
    add eax, dword ptr [ebp - 60]
    cmp dword ptr [ebp - 92], ecx
    jne L55
    add eax, dword ptr [ebp + 24]
L55:
    cmp dword ptr [ebp - 88], ecx
    jne L56
    sub eax, dword ptr [ebp + 28]
L56:
    cmp eax, 000001450h
    jg L58
    cmp eax, 0FFFFEBB0h
    jl L59
    push dword ptr [ebp + 20]
    push eax
    lea eax, [ebp - 20]
    push eax
    call sub_10109632
    mov edx, dword ptr [ebp - 20]
    mov ebx, dword ptr [ebp - 18]
    mov esi, dword ptr [ebp - 14]
    mov eax, dword ptr [ebp - 10]
    add esp, 12
    jmp L61
L57:
    mov dword ptr [ebp - 72], 4
    jmp L60
L58:
    xor ebx, ebx
    mov eax, 000007FFFh
    mov esi, 080000000h
    xor edx, edx
    mov dword ptr [ebp - 72], 2
    jmp L61
L59:
    mov dword ptr [ebp - 72], 1
L60:
    xor edx, edx
    xor eax, eax
    xor esi, esi
    xor ebx, ebx
L61:
    mov ecx, dword ptr [ebp + 8]
    or eax, dword ptr [ebp - 80]
    pop edi
    mov dword ptr [ecx + 6], esi
    mov dword ptr [ecx + 2], ebx
    mov word ptr [ecx + 10], ax
    mov eax, dword ptr [ebp - 72]
    mov word ptr [ecx], dx
    mov ecx, dword ptr [ebp - 4]
    pop esi
    pop ebx
    call sub_1010114F
    leave
    ret
___strgtold12 ENDP
END
