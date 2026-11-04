.686
.MODEL FLAT, C
EXTRN sub_100F8766:PROC
EXTRN sub_100F87B4:PROC
EXTRN sub_100F87E0:PROC
EXTRN sub_100F890E:PROC
EXTRN sub_100F892E:PROC
EXTRN sub_1010114F:PROC
EXTRN sub_10106937:PROC
EXTRN sub_1010699D:PROC
EXTRN sub_101069A2:PROC
EXTRN sub_101069B1:PROC
EXTRN sub_101069B6:PROC
EXTRN sub_101069B9:PROC
EXTRN sub_101069C3:PROC
EXTRN sub_101069EE:PROC
EXTRN sub_10106A02:PROC
EXTRN sub_10106A03:PROC
EXTRN sub_10106A04:PROC
EXTRN sub_10106A06:PROC
EXTRN sub_10106A16:PROC
EXTRN sub_10106A20:PROC
EXTRN sub_10106A31:PROC
EXTRN sub_10106A4A:PROC
EXTRN sub_10106A4F:PROC
EXTRN sub_10106A54:PROC
EXTRN sub_10106A61:PROC
EXTRN sub_10106A9E:PROC
EXTRN sub_10106AA4:PROC
EXTRN sub_10106ABB:PROC
EXTRN sub_10106AC2:PROC
EXTRN sub_10106AF7:PROC
EXTRN sub_10106B2D:PROC
EXTRN sub_10106B34:PROC
EXTRN sub_10106B3B:PROC
EXTRN sub_10106B4F:PROC
EXTRN sub_10106B67:PROC
EXTRN sub_10106B7D:PROC
EXTRN sub_10106B82:PROC
EXTRN sub_10106B8D:PROC
EXTRN sub_10106BBC:PROC
EXTRN sub_10106C04:PROC
EXTRN sub_10106C19:PROC
EXTRN sub_10106C29:PROC
EXTRN sub_10106C68:PROC
EXTRN sub_10106C86:PROC
EXTRN sub_10106CB3:PROC
EXTRN sub_10106CB4:PROC
EXTRN sub_10106CD3:PROC
EXTRN sub_101092E5:PROC
EXTRN sub_10109632:PROC
EXTRN EXTRN g_101A50D0:DWORD:DWORD
EXTRN EXTRN g_101A50E4:DWORD:DWORD
.CODE
___strgtold12 PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 92
    mov mov eax, dword ptr [g_101A50D0]
    push push ebx
    push push esi
    mov mov dword ptr [ebp - 4], eax
    xor xor eax, eax
    push push edi
    mov mov edi, dword ptr [ebp + 16]
    lea lea esi, [ebp - 48]
    mov mov dword ptr [ebp - 52], esi
    mov mov dword ptr [ebp - 80], eax
    mov mov dword ptr [ebp - 76], 1
    mov mov dword ptr [ebp - 56], eax
    mov mov dword ptr [ebp - 68], eax
    mov mov dword ptr [ebp - 88], eax
    mov mov dword ptr [ebp - 92], eax
    mov mov dword ptr [ebp - 84], eax
    mov mov dword ptr [ebp - 60], eax
    mov mov dword ptr [ebp - 72], eax
    mov mov dword ptr [ebp - 64], edi
    mov mov cl, byte ptr [edi]
    cmp cmp cl, 32
    je L1
    cmp cmp cl, 9
    je L2
    cmp cmp cl, 10
    je L3
    cmp cmp cl, 13
    jne L4
    inc inc edi
    jmp L0
    mov mov bl, byte ptr [edi]
    inc inc edi
    cmp cmp eax, 11
    ja L36
    jmp jmp dword ptr [eax*4 + 010106924h]
    cmp cmp bl, 49
    jl L5
    cmp cmp bl, 57
    jg L6
    push push 3
    jmp L30
    cmp cmp bl, byte ptr [g_101A50E4]
    jne L8
    push push 5
    jmp L41
    movsx movsx eax, bl
    sub sub eax, 43
    je L12
    dec dec eax
    dec dec eax
    je L10
    sub sub eax, 3
L1:
    je L17
    mov mov dword ptr [ebp - 52], esi
    dec dec edi
L3:
    jmp L29
    push push 2
    pop pop eax
L4:
    mov mov dword ptr [ebp - 80], 08000h
    jmp L7
    and and dword ptr [ebp - 80], 0
    push push 2
    pop pop eax
    jmp L9
    xor xor eax, eax
    inc inc eax
    cmp cmp bl, 49
    mov mov dword ptr [ebp - 68], eax
    jl L13
    cmp cmp bl, 57
    jle L11
    cmp cmp bl, byte ptr [g_101A50E4]
    jne L15
    push push 4
    jmp L46
    cmp cmp bl, 43
    je L18
    cmp cmp bl, 45
    je L19
    cmp cmp bl, 48
    je L12
L6:
    cmp cmp bl, 67
    jle L38
    cmp cmp bl, 69
    jle L20
    cmp cmp bl, 99
    jle L40
    cmp cmp bl, 101
    jg L44
    push push 6
    jmp L47
    dec dec edi
    push push 11
    jmp L48
    cmp cmp bl, 49
    jl L21
    cmp cmp bl, 57
    jle L14
    cmp cmp bl, byte ptr [g_101A50E4]
    je L16
    cmp cmp bl, 48
    jne L47
L11:
    xor xor eax, eax
    inc inc eax
    jmp L14
    mov mov dword ptr [ebp - 68], 1
    jmp L23
    cmp cmp dword ptr [ebp - 56], 25
    jae L23
    inc inc dword ptr [ebp - 56]
    sub sub bl, 48
    mov mov byte ptr [esi], bl
    inc inc esi
    jmp L24
    inc inc dword ptr [ebp - 60]
    mov mov bl, byte ptr [edi]
    inc inc edi
    movzx movzx eax, bl
    push push eax
    call sub_100F8766
    test test eax, eax
    pop pop ecx
    jne L24
    cmp cmp bl, byte ptr [g_101A50E4]
    jne L37
    jmp L22
    xor xor eax, eax
    inc inc eax
    cmp cmp dword ptr [ebp - 56], 0
    mov mov dword ptr [ebp - 68], eax
    mov mov dword ptr [ebp - 88], eax
    jne L39
    jmp L33
L13:
    dec dec dword ptr [ebp - 60]
    mov mov bl, byte ptr [edi]
    inc inc edi
    cmp cmp bl, 48
    je L34
L14:
    jmp L42
    cmp cmp dword ptr [ebp - 56], 25
    jae L43
    inc inc dword ptr [ebp - 56]
    sub sub bl, 48
    mov mov byte ptr [esi], bl
    inc inc esi
L15:
    dec dec dword ptr [ebp - 60]
    mov mov bl, byte ptr [edi]
    inc inc edi
    movzx movzx eax, bl
    push push eax
L16:
    call sub_100F87B4
    test test eax, eax
    pop pop ecx
    jne L45
    cmp cmp bl, 43
    je L26
    cmp cmp bl, 45
    je L27
    jmp L25
    movzx movzx eax, bl
    push push eax
L17:
    mov mov dword ptr [ebp - 88], 1
    call sub_100F87E0
    test test eax, eax
    pop pop ecx
    je sub_101069B6
    push push 4
L18:
    jmp sub_101069B1
L19:
    cmp cmp bl, 49
    lea lea ecx, [edi - 2]
    mov mov dword ptr [ebp - 64], ecx
    jl sub_10106937
    cmp cmp bl, 57
    jle sub_101069C3
    movsx movsx eax, bl
    sub sub eax, 43
    je sub_10106A06
    dec dec eax
    dec dec eax
    je sub_10106A02
    sub sub eax, 3
    jne sub_10106A31
    push push 8
    jmp sub_10106A20
    mov mov dword ptr [ebp - 92], 1
    jmp sub_1010699D
    mov mov bl, byte ptr [edi]
    inc inc edi
    cmp cmp bl, 48
    je sub_101069A2
    cmp cmp bl, 49
    jl sub_101069B9
    cmp cmp bl, 57
    jle sub_10106A02
L21:
    dec dec edi
    mov mov dword ptr [ebp - 52], esi
    cmp cmp dword ptr [ebp - 68], 0
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [eax], edi
    je sub_10106B34
    push push 24
    pop pop eax
    cmp cmp dword ptr [ebp - 56], eax
    jbe sub_10106A04
    cmp cmp byte ptr [ebp - 25], 5
    jl sub_10106A03
    inc inc byte ptr [ebp - 25]
    dec dec esi
    inc inc dword ptr [ebp - 60]
    mov mov dword ptr [ebp - 56], eax
    cmp cmp dword ptr [ebp - 56], 0
    jbe sub_10106B7D
    jmp sub_10106AF7
    cmp cmp bl, 49
    jl sub_10106A4A
    cmp cmp bl, 57
    jg sub_10106A4F
    push push 9
    pop pop eax
    dec dec edi
    jmp L28
    cmp cmp bl, 48
    je sub_101069EE
    mov mov edi, dword ptr [ebp - 64]
    jmp sub_10106A16
    cmp cmp dword ptr [ebp + 32], 0
    je sub_10106A9E
    movsx movsx eax, bl
    sub sub eax, 43
    lea lea ecx, [edi - 1]
    mov mov dword ptr [ebp - 64], ecx
    je sub_10106AA4
    dec dec eax
L23:
    dec dec eax
    jne sub_10106AC2
    or or dword ptr [ebp - 76], -1
    push push 7
    pop pop eax
    jmp L31
    push push 7
    pop pop eax
    jmp L32
    push push 10
    pop pop eax
    dec dec edi
    cmp cmp eax, 10
    jne L35
    jmp sub_10106A54
L26:
    mov mov dword ptr [ebp - 52], esi
    mov mov edi, ecx
    jmp sub_10106A61
    mov mov dword ptr [ebp - 52], esi
    mov mov dword ptr [ebp - 92], 1
    xor xor esi, esi
    jmp sub_10106B2D
    movsx movsx ecx, bl
    lea lea eax, [esi + esi*4]
    lea lea esi, [ecx + eax*2 - 48]
    cmp cmp esi, 01450h
    jg sub_10106B4F
    mov mov bl, byte ptr [edi]
L30:
    inc inc edi
    movzx movzx eax, bl
    push push eax
    call sub_100F890E
    test test eax, eax
    pop pop ecx
    jne sub_10106B3B
    jmp sub_10106B67
L31:
    mov mov esi, 01451h
    mov mov dword ptr [ebp - 84], esi
L32:
    movzx movzx eax, bl
    jmp sub_10106B82
    mov mov al, byte ptr [edi]
L33:
    inc inc edi
    movzx movzx eax, al
    push push eax
L34:
    call sub_100F892E
    test test eax, eax
    pop pop ecx
    jne sub_10106B8D
    mov mov esi, dword ptr [ebp - 52]
    dec dec edi
    jmp sub_10106ABB
    dec dec dword ptr [ebp - 56]
    inc inc dword ptr [ebp - 60]
    dec dec esi
    cmp cmp byte ptr [esi], 0
    je sub_10106BBC
    lea lea eax, [ebp - 20]
    push push eax
    push push dword ptr [ebp - 56]
    lea lea eax, [ebp - 48]
L44:
    push push eax
    call sub_101092E5
    mov mov eax, dword ptr [ebp - 84]
L45:
    xor xor ecx, ecx
    add add esp, 12
    cmp cmp dword ptr [ebp - 76], ecx
    jge sub_10106C04
    neg neg eax
    add add eax, dword ptr [ebp - 60]
    cmp cmp dword ptr [ebp - 92], ecx
    jne sub_10106C19
    add add eax, dword ptr [ebp + 24]
    cmp cmp dword ptr [ebp - 88], ecx
    jne sub_10106C29
    sub sub eax, dword ptr [ebp + 28]
    cmp cmp eax, 01450h
    jg sub_10106C68
    cmp cmp eax, 0FFFFEBB0h
    jl sub_10106C86
    push push dword ptr [ebp + 20]
    push push eax
    lea lea eax, [ebp - 20]
    push push eax
    call sub_10109632
    mov mov edx, dword ptr [ebp - 20]
    mov mov ebx, dword ptr [ebp - 18]
    mov mov esi, dword ptr [ebp - 14]
    mov mov eax, dword ptr [ebp - 10]
    add add esp, 12
    jmp sub_10106CB3
    mov mov dword ptr [ebp - 72], 4
    jmp sub_10106CB4
    xor xor ebx, ebx
    mov mov eax, 07FFFh
    mov mov esi, 080000000h
    xor xor edx, edx
    mov mov dword ptr [ebp - 72], 2
    jmp sub_10106CD3
    mov mov dword ptr [ebp - 72], 1
    xor xor edx, edx
    xor xor eax, eax
    xor xor esi, esi
    xor xor ebx, ebx
    mov mov ecx, dword ptr [ebp + 8]
    or or eax, dword ptr [ebp - 80]
    pop pop edi
    mov mov dword ptr [ecx + 6], esi
    mov mov dword ptr [ecx + 2], ebx
    mov mov word ptr [ecx + 10], ax
    mov mov eax, dword ptr [ebp - 72]
    mov mov word ptr [ecx], dx
    mov mov ecx, dword ptr [ebp - 4]
    pop pop esi
    pop pop ebx
    call sub_1010114F
    leave leave
    ret ret
___strgtold12 ENDP
END
