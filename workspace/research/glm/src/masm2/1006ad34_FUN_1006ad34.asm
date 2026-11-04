.686
.MODEL FLAT, C
EXTRN sub_1006547A:PROC
EXTRN sub_10065571:PROC
EXTRN sub_10068093:PROC
EXTRN sub_100680BC:PROC
EXTRN sub_10068130:PROC
EXTRN sub_1006ACC0:PROC
EXTRN sub_1006B26E:PROC
EXTRN sub_1006B27F:PROC
EXTRN sub_1006B286:PROC
EXTRN sub_1006B28E:PROC
EXTRN sub_1006B2A0:PROC
EXTRN sub_1006B2A7:PROC
EXTRN sub_1006B2BC:PROC
EXTRN sub_1006B2CA:PROC
EXTRN sub_1006B2CF:PROC
EXTRN sub_1006B2DD:PROC
EXTRN sub_1006B2E5:PROC
EXTRN sub_1006B2EB:PROC
EXTRN sub_1006B2F4:PROC
EXTRN sub_1006B300:PROC
EXTRN sub_1006B305:PROC
EXTRN sub_1006B370:PROC
EXTRN sub_1006B3A3:PROC
EXTRN sub_1006B3D3:PROC
EXTRN sub_1006B3E7:PROC
EXTRN sub_1006B3F6:PROC
EXTRN sub_1006B3FA:PROC
EXTRN sub_1006B403:PROC
EXTRN sub_1006B412:PROC
EXTRN sub_1006B414:PROC
EXTRN sub_1006B42A:PROC
EXTRN sub_1006B442:PROC
EXTRN sub_1006B45F:PROC
EXTRN sub_1006B47D:PROC
EXTRN sub_1006B4AA:PROC
EXTRN sub_1006B4B7:PROC
EXTRN sub_1006B4C8:PROC
EXTRN sub_1006B53E:PROC
EXTRN sub_1006B5CC:PROC
EXTRN sub_1006B5CF:PROC
EXTRN sub_1006B5D8:PROC
EXTRN sub_1006B5E1:PROC
EXTRN sub_1006B5EA:PROC
EXTRN sub_1006B5EB:PROC
EXTRN sub_1006B5F3:PROC
EXTRN sub_1006B5FC:PROC
EXTRN sub_1006B605:PROC
EXTRN sub_1006B60E:PROC
EXTRN sub_1006B617:PROC
EXTRN sub_1006B62E:PROC
EXTRN sub_1006B630:PROC
EXTRN sub_1006B662:PROC
EXTRN sub_1006B67D:PROC
EXTRN sub_1006B686:PROC
EXTRN sub_1006B690:PROC
EXTRN sub_1006B6AC:PROC
EXTRN sub_1006B751:PROC
EXTRN sub_1006B76A:PROC
EXTRN sub_1006B777:PROC
EXTRN sub_1006B77B:PROC
EXTRN sub_1006B785:PROC
EXTRN sub_10085630:PROC
EXTRN sub_1008571C:PROC
EXTRN sub_100F7529:PROC
EXTRN sub_100F8627:PROC
EXTRN sub_100F870E:PROC
.CODE
FUN_1006ad34 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 60
    mov mov eax, dword ptr [ebp + 8]
    mov mov edx, dword ptr [eax + 8]
    push push ebx
    xor xor ebx, ebx
    cmp cmp byte ptr [edx], bl
    push push esi
    mov mov esi, ecx
    push push edi
    mov mov edi, dword ptr [ebp + 12]
    mov mov dword ptr [ebp - 12], esi
    mov mov dword ptr [ebp - 8], ebx
    mov mov dword ptr [ebp - 4], ebx
    mov mov dword ptr [ebp - 16], ebx
    mov mov dword ptr [ebp - 40], ebx
    mov mov dword ptr [ebp - 44], 1
    mov mov dword ptr [ebp - 32], ebx
    mov mov dword ptr [ebp - 36], ebx
    mov mov dword ptr [ebp - 24], edx
    mov mov dword ptr [ebp - 28], edx
    mov mov dword ptr [ebp - 20], edx
    jne L0
    mov mov eax, dword ptr [esi + 120]
    cmp cmp eax, ebx
    je L32
    cmp cmp dword ptr [eax + 0B0h], ebx
    mov mov eax, dword ptr [ebp - 8]
    je L45
    cmp cmp eax, 3
    je L34
    cmp cmp eax, 15
    je L35
    cmp cmp eax, 18
    je L37
    cmp cmp eax, 19
    je L38
    push push 01010F410h
    jmp sub_1006B2A0
    cmp cmp al, 95
    je L2
    inc inc edx
    mov mov dword ptr [ebp - 20], edx
    mov mov al, byte ptr [edx]
    cmp cmp al, bl
    jne L1
    mov mov eax, edx
    sub sub eax, dword ptr [ebp - 28]
    cmp cmp eax, 15
    ja L37
    mov mov esi, dword ptr [ebp - 28]
    mov mov ecx, eax
    mov mov ebx, ecx
    shr shr ecx, 2
    lea lea edi, [ebp - 60]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, ebx
    and and ecx, 3
    xor xor ebx, ebx
    cmp cmp byte ptr [edx], bl
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov byte ptr [ebp + eax - 60], bl
    je L3
    inc inc edx
    mov mov dword ptr [ebp - 20], edx
    cmp cmp dword ptr [ebp - 44], ebx
    mov mov dword ptr [ebp - 28], edx
    je L28
    cmp cmp byte ptr [ebp - 60], bl
    lea lea esi, [ebp - 60]
    je L6
    movsx movsx eax, byte ptr [esi]
    push push eax
    call sub_100F8627
    test test eax, eax
    pop pop ecx
    je L5
    inc inc esi
    cmp cmp byte ptr [esi], bl
    jne L4
    cmp cmp byte ptr [esi], bl
    je L7
    push push esi
    call sub_100F7529
    pop pop ecx
    mov mov dword ptr [ebp - 4], eax
    jmp L8
    or or dword ptr [ebp - 4], -1
    cmp cmp byte ptr [esi], bl
    je L9
    mov mov byte ptr [esi], bl
    inc inc esi
    mov mov al, byte ptr [esi]
    cmp cmp al, bl
    je L11
    movsx movsx eax, al
    push push eax
    call sub_100F870E
    test test eax, eax
    pop pop ecx
    je L12
    inc inc esi
L1:
    mov mov al, byte ptr [esi]
    cmp cmp al, bl
L2:
    jne L10
    cmp cmp byte ptr [esi], bl
    jne L47
    xor xor edi, edi
    xor xor edx, edx
    mov mov esi, dword ptr [edx + 01010E2D0h]
    lea lea eax, [ebp - 60]
    mov mov bl, byte ptr [eax]
    mov mov cl, bl
    cmp cmp bl, byte ptr [esi]
    jne L14
    xor xor ebx, ebx
    cmp cmp cl, bl
    je L15
    mov mov bl, byte ptr [eax + 1]
    mov mov cl, bl
    cmp cmp bl, byte ptr [esi + 1]
    jne L17
    inc inc eax
    inc inc eax
    inc inc esi
    xor xor ebx, ebx
    inc inc esi
    cmp cmp cl, bl
    jne L13
    xor xor eax, eax
    jmp L18
    sbb sbb eax, eax
    sbb sbb eax, -1
    xor xor ebx, ebx
    cmp cmp eax, ebx
    je L19
    add add edx, 72
    inc inc edi
    cmp cmp edx, 05E8h
    jb L16
    cmp cmp edi, 21
    mov mov esi, dword ptr [ebp - 12]
    je sub_1006B28E
    mov mov ecx, dword ptr [esi + 56]
    lea lea eax, [edi + edi*8]
    lea lea eax, [ecx + eax*2]
    mov mov eax, dword ptr [eax*4 + 01010E2D8h]
    cmp cmp eax, -1
    je sub_1006B2A7
    cmp cmp eax, ebx
    jge L22
    cmp cmp dword ptr [ebp - 4], -1
    mov mov edx, dword ptr [ebp + 12]
    jne L21
    cmp cmp edx, ebx
    je sub_1006B2BC
    mov mov edx, dword ptr [edx + 24]
    mov mov dword ptr [ebp - 4], edx
    jmp L23
    cmp cmp edx, ebx
    je L24
    mov mov edx, dword ptr [edx + 24]
    add add dword ptr [ebp - 4], edx
    xor xor ebx, ebx
    neg neg eax
    jmp L26
    cmp cmp dword ptr [ebp + 12], ebx
L4:
    jne sub_1006B2DD
    cmp cmp dword ptr [ebp - 4], -1
    jne L27
    cmp cmp eax, ebx
L5:
    jne sub_1006B2EB
    mov mov dword ptr [ebp - 4], ebx
    jmp L30
    mov mov edx, dword ptr [ebp + 12]
    cmp cmp edx, ebx
    je L29
    cmp cmp dword ptr [edx + 40], ebx
    jne L31
    cmp cmp dword ptr [ebp - 4], eax
    jae sub_1006B305
    lea lea eax, [edi + edi*8]
    shl shl eax, 3
    mov mov edx, dword ptr [eax + 01010E2D4h]
    mov mov eax, dword ptr [eax + 01010E314h]
    push push 2
    mov mov dword ptr [ebp - 40], eax
    pop pop eax
L9:
    cmp cmp edx, eax
    mov mov dword ptr [ebp - 8], edx
    jne L39
    and and dword ptr [ebp - 4], 01FFFh
    cmp cmp dword ptr [ebp - 4], 0800h
    jae L33
    mov mov dword ptr [ebp - 8], eax
    jmp L40
    cmp cmp dword ptr [ebp - 4], 01000h
    jae L36
    mov mov dword ptr [ebp - 8], 11
L11:
    jmp L42
    cmp cmp dword ptr [ebp - 4], 01800h
    jae L41
    mov mov dword ptr [ebp - 8], 12
    jmp L43
    cmp cmp dword ptr [ebp - 4], 02000h
    jae L44
    mov mov dword ptr [ebp - 8], 13
    and and dword ptr [ebp - 4], 07FFh
    jmp L50
    cmp cmp edx, -3
    jne L46
    mov mov dword ptr [ebp - 8], 4
    mov mov dword ptr [ebp - 4], ebx
    jmp sub_1006B26E
    cmp cmp edx, -4
    jne L48
    mov mov dword ptr [ebp - 8], 4
    mov mov dword ptr [ebp - 4], eax
    jmp sub_1006B27F
    cmp cmp edx, -5
    jne L51
    mov mov dword ptr [ebp - 8], 4
    jmp sub_1006B286
    cmp cmp edx, -6
    jne sub_1006B27F
    mov mov dword ptr [ebp - 8], 17
    jmp L49
L16:
    cmp cmp edx, -7
    jne sub_1006B2A0
    mov mov dword ptr [ebp - 8], 17
    mov mov dword ptr [ebp - 4], 1
    cmp cmp ecx, 6
    mov mov dword ptr [ebp - 44], ebx
    jl sub_1006B2CA
    cmp cmp ecx, 9
    jg sub_1006B2CF
    mov mov dword ptr [ebp - 32], 1
    cmp cmp ecx, 4
    jl sub_1006B2E5
    cmp cmp ecx, 5
    jle sub_1006B2F4
    cmp cmp ecx, 13
    jl sub_1006B300
    cmp cmp ecx, 14
    jg sub_1006B305
    mov mov dword ptr [ebp - 36], 1
    mov mov edx, dword ptr [ebp - 20]
    cmp cmp byte ptr [edx], bl
    jne L25
    mov mov edi, dword ptr [ebp + 12]
    jmp L20
    cmp cmp dword ptr [ebp - 32], ebx
    je sub_1006B3E7
    push push 5
    mov mov edi, 01010F404h
    lea lea esi, [ebp - 60]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1006B370
    mov mov eax, 02000000h
    jmp sub_1006B3FA
    push push 4
    mov mov edi, 01010F400h
    lea lea esi, [ebp - 60]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1006B3A3
    mov mov eax, 04000000h
    jmp sub_1006B412
    push push 3
    mov mov edi, 01010ECE0h
    lea lea esi, [ebp - 60]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1006B3D3
    mov mov eax, 07000000h
    jmp sub_1006B42A
    push push 3
    mov mov edi, 01010F3FCh
    lea lea esi, [ebp - 60]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1006B403
L21:
    mov mov eax, 09000000h
    jmp sub_1006B442
L22:
    push push 3
    mov mov edi, 01010F3F8h
    lea lea esi, [ebp - 60]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_1006B414
    push push 3
    mov mov edi, 01010F3F4h
    lea lea esi, [ebp - 60]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_1006B45F
    push push 3
    mov mov edi, 01010F3F0h
    lea lea esi, [ebp - 60]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1006B47D
    mov mov eax, 0A000000h
    mov mov dword ptr [ebp - 16], eax
    mov mov dword ptr [ebp - 32], ebx
    jmp sub_1006B4AA
    cmp cmp dword ptr [ebp - 36], ebx
    je sub_1006B4B7
    push push 4
    mov mov edi, 01010EAA0h
    lea lea esi, [ebp - 60]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
L27:
    jne sub_1006B4C8
    mov mov dword ptr [ebp - 16], 0B000000h
    mov mov dword ptr [ebp - 36], ebx
    mov mov esi, dword ptr [ebp - 12]
    jmp sub_1006B3F6
    mov mov esi, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [esi + 120]
    cmp cmp ecx, ebx
    je sub_1006B53E
    mov mov edi, dword ptr [ebp + 12]
    lea lea eax, [ebp - 4]
    push push eax
    lea lea eax, [ebp - 16]
    push push eax
    lea lea eax, [ebp - 8]
    push push eax
    push push edi
L31:
    push push dword ptr [ebp - 24]
    push push dword ptr [ebp + 8]
    push push dword ptr [esi + 124]
    push push dword ptr [esi]
    call sub_1006ACC0
    test test eax, eax
    jl sub_1006B62E
    push push 44
    call sub_1006547A
    cmp cmp eax, ebx
    je sub_1006B662
    push push ebx
    push push dword ptr [ebp - 40]
    mov mov ecx, eax
    push push dword ptr [ebp - 4]
    push push dword ptr [ebp - 16]
    push push dword ptr [ebp - 8]
    call sub_10085630
    jmp sub_1006B67D
    mov mov ecx, dword ptr [ebp + 12]
    cmp cmp ecx, ebx
    je sub_1006B5EB
    mov mov eax, dword ptr [ecx + 40]
    cmp cmp eax, ebx
    jne sub_1006B5CC
    push push dword ptr [ecx + 24]
    push push dword ptr [ebp - 24]
    push push 01010F3D4h
    push push 07D5h
    push push dword ptr [ebp + 8]
    push push dword ptr [esi]
    call sub_10068093
    add add esp, 24
    jmp sub_1006B686
    cmp cmp dword ptr [eax + 16], -1
    je sub_1006B690
    push push dword ptr [ebp - 24]
    push push 01010F3B8h
    push push 07D5h
    push push dword ptr [ebp + 8]
    push push dword ptr [esi]
L36:
    call sub_100680BC
    add add esp, 20
    jmp sub_1006B6AC
    push push dword ptr [ebp - 24]
L39:
    push push 01010F3A0h
    jmp sub_1006B630
    cmp cmp eax, 3
    je sub_1006B5CF
    cmp cmp eax, 5
    je sub_1006B5D8
    cmp cmp eax, 6
    je sub_1006B5E1
    cmp cmp eax, 8
    je sub_1006B5EA
    cmp cmp eax, 9
    je sub_1006B5F3
    cmp cmp eax, 4
    je sub_1006B5FC
    cmp cmp eax, 15
    je sub_1006B605
    cmp cmp eax, 18
    je sub_1006B60E
    cmp cmp eax, 19
    je sub_1006B617
    push push 01010F358h
    push push 07D5h
L45:
    push push dword ptr [ebp + 8]
    push push dword ptr [esi]
    call sub_10068130
    add add esp, 16
    push push 44
    mov mov dword ptr [esi + 76], 1
    call sub_10065571
    cmp cmp eax, ebx
    je sub_1006B751
    push push ebx
    push push ebx
    push push ebx
    push push ebx
    push push -1
    mov mov ecx, eax
    call sub_1008571C
    jmp sub_1006B777
    xor xor eax, eax
    jmp sub_1006B77B
    xor xor eax, eax
    cmp cmp eax, ebx
    je sub_1006B76A
    cmp cmp edi, ebx
L49:
    je sub_1006B785
    mov mov ecx, dword ptr [edi + 40]
    mov mov dword ptr [eax + 40], ecx
    mov mov dword ptr [edi + 40], ebx
    pop pop edi
    pop pop esi
L51:
    pop pop ebx
    leave leave
    ret ret 8
FUN_1006ad34 ENDP
END
