.686
.MODEL FLAT, C
EXTRN sub_10065332:PROC
EXTRN sub_100657AD:PROC
EXTRN sub_1006802B:PROC
EXTRN sub_1006871D:PROC
.CODE
FUN_10065c86 PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 40
    push ebx
    mov ebx, ecx
    xor edx, edx
    cmp dword ptr [ebx + 64], edx
    push esi
    push edi
    jne L43
    cmp dword ptr [ebx + 72], edx
    jne L43
    mov eax, dword ptr [ebx + 100]
    cmp eax, edx
    je L1
    push 8
    lea edi, [ebx + 000000278h]
    lea esi, [eax + 16]
    pop ecx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, dword ptr [eax + 12]
    mov dword ptr [ebx + 100], ecx
    mov dword ptr [eax + 12], edx
    jmp L2
L1:
    mov ecx, dword ptr [ebx + 00000026Ch]
    lea eax, [ebx + 000000278h]
    push eax
    mov eax, dword ptr [ebx + 000000298h]
    or eax, 4
    push eax
    call sub_1006871D
    test eax, eax
    jl L44
L2:
    mov eax, dword ptr [ebx + 000000278h]
    xor ecx, ecx
    inc ecx
    cmp eax, ecx
    je L36
    jle L35
    cmp eax, 4
    jle L34
    cmp eax, 9
    je L5
    cmp eax, 10
    je L4
    cmp eax, 12
    je L3
    cmp eax, 13
    jne L35
L3:
    mov dword ptr [ebx + 64], ecx
    jmp L44
L4:
    mov eax, 000000118h
    jmp L45
L5:
    xor eax, eax
    cmp dword ptr [ebx + 76], eax
    je L26
    cmp dword ptr [ebx + 80], eax
    mov dword ptr [ebx + 76], eax
    mov dword ptr [ebx + 88], eax
    mov eax, dword ptr [ebx + 000000280h]
    je L14
    movsx ecx, byte ptr [eax]
    sub ecx, 100
    je L13
    dec ecx
    je L12
    sub ecx, 4
    je L8
    sub ecx, 3
    je L7
    sub ecx, 4
    je L6
    sub ecx, 5
    jne L25
    mov esi, eax
    push 6
    mov edi, 01010C8C8h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L25
    mov eax, 000000102h
    jmp L45
L6:
    mov esi, eax
    push 7
    mov edi, 01010C8C0h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L25
    mov eax, 00000010Eh
    jmp L45
L7:
    mov esi, eax
    push 5
    mov edi, 010196DBCh
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L25
    mov eax, 000000103h
    jmp L45
L8:
    push 3
    mov edi, 01010C8BCh
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L9
    mov eax, 000000106h
    jmp L22
L9:
    push 6
    mov edi, 01010C8B4h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L10
    mov eax, 000000107h
    jmp L45
L10:
    push 7
    mov edi, 01010C8ACh
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L11
    mov eax, 000000108h
    jmp L45
L11:
    mov esi, eax
    push 8
    mov edi, 01010C8A4h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L25
    mov eax, 000000104h
    jmp L45
L12:
    push 5
    mov edi, 01010C89Ch
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L21
    push 5
    mov edi, 01010C894h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L17
    push 6
    mov edi, 01010C88Ch
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L19
    mov esi, eax
    push 6
    mov edi, 01010C714h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L25
    mov eax, 000000105h
    jmp L45
L13:
    mov esi, eax
    push 7
    mov edi, 01010C884h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L25
    mov eax, 000000101h
    jmp L45
L14:
    mov cl, byte ptr [eax]
    cmp cl, 101
    je L16
    cmp cl, 105
    jne L25
    push 3
    mov edi, 01010C8BCh
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L15
    push 6
    mov edi, 01010C8B4h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L15
    mov esi, eax
    push 7
    mov edi, 01010C8ACh
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L25
L15:
    mov eax, 00000010Ch
    jmp L45
L16:
    push 5
    mov edi, 01010C894h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L18
L17:
    mov eax, 00000010Ah
    jmp L45
L18:
    push 6
    mov edi, 01010C88Ch
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L20
L19:
    mov eax, 00000010Bh
    jmp L45
L20:
    mov esi, eax
    push 5
    mov edi, 01010C89Ch
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L25
    mov eax, dword ptr [ebx + 000000268h]
    mov eax, dword ptr [eax + 56]
    test eax, eax
    jne L23
    mov dword ptr [ebx + 80], 1
L21:
    mov eax, 000000109h
L22:
    mov dword ptr [ebx + 88], 1
    jmp L45
L23:
    mov ecx, dword ptr [eax + 4]
    test ecx, ecx
    je L24
    cmp dword ptr [eax], 0
    jne L24
    mov dword ptr [ebx + 80], ecx
    mov dword ptr [ebx + 88], 1
    mov eax, 000000109h
    jmp L45
L24:
    mov eax, 00000010Dh
    jmp L45
L25:
    mov dword ptr [ebx + 76], 1
    jmp L33
L26:
    mov eax, dword ptr [ebx + 000000280h]
    push 8
    mov edi, 01010C87Ch
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L27
    and dword ptr [ebx + 88], edx
    mov eax, 00000010Fh
    jmp L45
L27:
    cmp dword ptr [ebx + 88], 0
    je L33
    lea ecx, [ebp - 4]
    push ecx
    lea ecx, [ebp - 8]
    push ecx
    push eax
    mov ecx, ebx
    call sub_10065332
    test eax, eax
    je L33
    cmp dword ptr [ebx + 68], 0
    push 8
    pop ecx
    lea esi, [ebx + 000000278h]
    lea edi, [ebp - 40]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    jne L28
    push dword ptr [ebp - 4]
    lea eax, [ebp - 40]
    push dword ptr [ebp - 8]
    mov ecx, ebx
    push eax
    call sub_100657AD
    test eax, eax
    je L28
    xor eax, eax
    jmp L29
L28:
    xor eax, eax
    inc eax
L29:
    test eax, eax
    mov dword ptr [ebx + 68], eax
    jne L30
    mov ecx, ebx
    call L0
    cmp eax, -1
    je L31
    xor ecx, ecx
    jmp L32
L30:
    mov eax, dword ptr [ebp - 8]
L31:
    xor ecx, ecx
    inc ecx
L32:
    test ecx, ecx
    mov dword ptr [ebx + 68], ecx
    je L45
    push 8
    pop ecx
    push 01010C78Ch
    lea eax, [ebx + 000000278h]
    push 0000005EEh
    mov dword ptr [ebx + 72], 1
    push eax
    mov edi, eax
    add ebx, 24
    lea esi, [ebp - 40]
    push ebx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    call sub_1006802B
    add esp, 16
L33:
    mov eax, 000000116h
    jmp L45
L34:
    mov eax, 000000117h
    jmp L45
L35:
    mov eax, 000000119h
    jmp L45
L36:
    mov al, byte ptr [ebx + 000000281h]
    test al, al
    jne L37
    movsx eax, byte ptr [ebx + 000000280h]
    jmp L45
L37:
    cmp byte ptr [ebx + 000000282h], 0
    jne L35
    cmp al, 61
    jne L41
    movsx eax, byte ptr [ebx + 000000280h]
    sub eax, 33
    je L40
    sub eax, 27
    je L39
    dec eax
    je L38
    dec eax
    jne L35
    mov eax, 000000111h
    jmp L45
L38:
    mov eax, 000000112h
    jmp L45
L39:
    mov eax, 000000110h
    jmp L45
L40:
    mov eax, 000000113h
    jmp L45
L41:
    mov bl, byte ptr [ebx + 000000280h]
    cmp bl, al
    jne L35
    cmp bl, 38
    je L42
    cmp bl, 124
    jne L35
    mov eax, 000000115h
    jmp L45
L42:
    mov eax, 000000114h
    jmp L45
L43:
    mov dword ptr [ebx + 000000278h], 12
L44:
    or eax, 0FFFFFFFFh
L45:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_10065c86 ENDP
END
