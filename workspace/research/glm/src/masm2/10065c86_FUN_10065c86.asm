.686
.MODEL FLAT, C
EXTRN sub_10065332:PROC
EXTRN sub_100657AD:PROC
EXTRN sub_10066121:PROC
EXTRN sub_10066127:PROC
EXTRN sub_1006612A:PROC
EXTRN sub_10066132:PROC
EXTRN sub_10066138:PROC
EXTRN sub_1006614B:PROC
EXTRN sub_10066155:PROC
EXTRN sub_1006615A:PROC
EXTRN sub_1006616A:PROC
EXTRN sub_10066178:PROC
EXTRN sub_100661AF:PROC
EXTRN sub_100661B8:PROC
EXTRN sub_100661BC:PROC
EXTRN sub_100661C5:PROC
EXTRN sub_100661CD:PROC
EXTRN sub_100661E7:PROC
EXTRN sub_100661F0:PROC
EXTRN sub_1006621B:PROC
EXTRN sub_1006622E:PROC
EXTRN sub_1006624C:PROC
EXTRN sub_10066269:PROC
EXTRN sub_1006626A:PROC
EXTRN sub_1006628B:PROC
EXTRN sub_10066290:PROC
EXTRN sub_1006629E:PROC
EXTRN sub_100662B8:PROC
EXTRN sub_100662D6:PROC
EXTRN sub_10066309:PROC
EXTRN sub_10066330:PROC
EXTRN sub_1006634E:PROC
EXTRN sub_1006639B:PROC
EXTRN sub_1006639C:PROC
EXTRN sub_100663B0:PROC
EXTRN sub_100663B6:PROC
EXTRN sub_100663B7:PROC
EXTRN sub_100663C8:PROC
EXTRN sub_100663D0:PROC
EXTRN sub_100663D8:PROC
EXTRN sub_100663E0:PROC
EXTRN sub_100663E7:PROC
EXTRN sub_100663EE:PROC
EXTRN sub_10066405:PROC
EXTRN sub_10066425:PROC
EXTRN sub_1006642F:PROC
EXTRN sub_1006645E:PROC
EXTRN sub_100664B4:PROC
EXTRN sub_100664BF:PROC
EXTRN sub_100664CF:PROC
EXTRN sub_100664D8:PROC
EXTRN sub_100664F5:PROC
EXTRN sub_100664FF:PROC
EXTRN sub_10066510:PROC
EXTRN sub_10066514:PROC
EXTRN sub_10066515:PROC
EXTRN sub_10066518:PROC
EXTRN sub_1006651A:PROC
EXTRN sub_10066524:PROC
EXTRN sub_10066537:PROC
EXTRN sub_10066562:PROC
EXTRN sub_10066569:PROC
EXTRN sub_10066570:PROC
EXTRN sub_10066572:PROC
EXTRN sub_10066577:PROC
EXTRN sub_10066592:PROC
EXTRN sub_10066599:PROC
EXTRN sub_1006802B:PROC
EXTRN sub_1006871D:PROC
.CODE
FUN_10065c86 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 40
    push push ebx
    mov mov ebx, ecx
    xor xor edx, edx
    cmp cmp dword ptr [ebx + 64], edx
    push push esi
    push push edi
    jne sub_10066121
    cmp cmp dword ptr [ebx + 72], edx
    jne sub_1006612A
    mov mov eax, dword ptr [ebx + 100]
    cmp cmp eax, edx
    je L0
    push push 8
    lea lea edi, [ebx + 0278h]
    lea lea esi, [eax + 16]
    pop pop ecx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, dword ptr [eax + 12]
    mov mov dword ptr [ebx + 100], ecx
    mov mov dword ptr [eax + 12], edx
    jmp L1
    mov mov ecx, dword ptr [ebx + 026Ch]
    lea lea eax, [ebx + 0278h]
    push push eax
    mov mov eax, dword ptr [ebx + 0298h]
    or or eax, 4
    push push eax
    call sub_1006871D
    test test eax, eax
    jl sub_10066178
    mov mov eax, dword ptr [ebx + 0278h]
    xor xor ecx, ecx
    inc inc ecx
    cmp cmp eax, ecx
    je L24
    jle L23
    cmp cmp eax, 4
    jle L22
    cmp cmp eax, 9
    je L4
    cmp cmp eax, 10
    je L3
    cmp cmp eax, 12
    je L2
    cmp cmp eax, 13
    jne sub_10066127
    mov mov dword ptr [ebx + 64], ecx
    jmp sub_100661B8
    mov mov eax, 0118h
    jmp sub_100661C5
    xor xor eax, eax
    cmp cmp dword ptr [ebx + 76], eax
    je L15
    cmp cmp dword ptr [ebx + 80], eax
    mov mov dword ptr [ebx + 76], eax
    mov mov dword ptr [ebx + 88], eax
    mov mov eax, dword ptr [ebx + 0280h]
    je L12
    movsx movsx ecx, byte ptr [eax]
    sub sub ecx, 100
    je L10
    dec dec ecx
    je L8
    sub sub ecx, 4
    je L7
    sub sub ecx, 3
    je L6
    sub sub ecx, 4
    je L5
    sub sub ecx, 5
    jne L16
    mov mov esi, eax
    push push 6
    mov mov edi, 01010C8C8h
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L17
    mov mov eax, 0102h
    jmp sub_1006622E
    mov mov esi, eax
    push push 7
    mov mov edi, 01010C8C0h
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L18
    mov mov eax, 010Eh
L2:
    jmp sub_1006624C
    mov mov esi, eax
    push push 5
    mov mov edi, 010196DBCh
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L20
    mov mov eax, 0103h
    jmp sub_1006626A
    push push 3
    mov mov edi, 01010C8BCh
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L9
    mov mov eax, 0106h
    jmp L19
    push push 6
    mov mov edi, 01010C8B4h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L11
    mov mov eax, 0107h
    jmp sub_1006629E
    push push 7
    mov mov edi, 01010C8ACh
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L13
    mov mov eax, 0108h
    jmp sub_100662B8
    mov mov esi, eax
    push push 8
    mov mov edi, 01010C8A4h
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10066155
    mov mov eax, 0104h
    jmp sub_100662D6
    push push 5
    mov mov edi, 01010C89Ch
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_10066138
    push push 5
    mov mov edi, 01010C894h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L21
    push push 6
    mov mov edi, 01010C88Ch
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_10066132
    mov mov esi, eax
    push push 6
    mov mov edi, 01010C714h
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100661AF
    mov mov eax, 0105h
    jmp sub_10066330
    mov mov esi, eax
    push push 7
    mov mov edi, 01010C884h
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100661CD
    mov mov eax, 0101h
    jmp sub_1006634E
    mov mov cl, byte ptr [eax]
    cmp cmp cl, 101
    je sub_1006614B
    cmp cmp cl, 105
    jne sub_100661E7
    push push 3
    mov mov edi, 01010C8BCh
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_1006615A
    push push 6
    mov mov edi, 01010C8B4h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_1006616A
    mov mov esi, eax
    push push 7
    mov mov edi, 01010C8ACh
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1006621B
    mov mov eax, 010Ch
    jmp sub_1006639C
    push push 5
    mov mov edi, 01010C894h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100661BC
    mov mov eax, 010Ah
    jmp sub_100663B6
    push push 6
L8:
    mov mov edi, 01010C88Ch
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100661F0
    mov mov eax, 010Bh
    jmp sub_100663D0
    mov mov esi, eax
    push push 5
    mov mov edi, 01010C89Ch
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10066269
    mov mov eax, dword ptr [ebx + 0268h]
    mov mov eax, dword ptr [eax + 56]
    test test eax, eax
    jne sub_1006624C
    mov mov dword ptr [ebx + 80], 1
    mov mov eax, 0109h
    mov mov dword ptr [ebx + 88], 1
    jmp sub_10066405
    mov mov ecx, dword ptr [eax + 4]
    test test ecx, ecx
    je sub_1006628B
    cmp cmp dword ptr [eax], 0
    jne sub_10066290
    mov mov dword ptr [ebx + 80], ecx
    mov mov dword ptr [ebx + 88], 1
    mov mov eax, 0109h
    jmp sub_10066425
    mov mov eax, 010Dh
    jmp sub_1006642F
    mov mov dword ptr [ebx + 76], 1
    jmp sub_1006639B
    mov mov eax, dword ptr [ebx + 0280h]
    push push 8
    mov mov edi, 01010C87Ch
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10066309
    and and dword ptr [ebx + 88], edx
    mov mov eax, 010Fh
    jmp sub_1006645E
    cmp cmp dword ptr [ebx + 88], 0
    je sub_100663C8
    lea lea ecx, [ebp - 4]
    push push ecx
    lea lea ecx, [ebp - 8]
    push push ecx
    push push eax
    mov mov ecx, ebx
    call sub_10065332
    test test eax, eax
    je sub_100663E0
    cmp cmp dword ptr [ebx + 68], 0
    push push 8
    pop pop ecx
    lea lea esi, [ebx + 0278h]
    lea lea edi, [ebp - 40]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    jne sub_1006639B
    push push dword ptr [ebp - 4]
    lea lea eax, [ebp - 40]
    push push dword ptr [ebp - 8]
    mov mov ecx, ebx
    push push eax
    call sub_100657AD
    test test eax, eax
    je sub_100663B0
    xor xor eax, eax
    jmp sub_100663B7
    xor xor eax, eax
    inc inc eax
    test test eax, eax
    mov mov dword ptr [ebx + 68], eax
    jne sub_100663D8
    mov mov ecx, ebx
    call L14
L14:
    cmp cmp eax, -1
    je sub_100663E7
    xor xor ecx, ecx
    jmp sub_100663EE
    mov mov eax, dword ptr [ebp - 8]
    xor xor ecx, ecx
    inc inc ecx
    test test ecx, ecx
    mov mov dword ptr [ebx + 68], ecx
    je sub_100664D8
    push push 8
    pop pop ecx
    push push 01010C78Ch
    lea lea eax, [ebx + 0278h]
    push push 05EEh
    mov mov dword ptr [ebx + 72], 1
    push push eax
    mov mov edi, eax
L15:
    add add ebx, 24
    lea lea esi, [ebp - 40]
    push push ebx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    call sub_1006802B
    add add esp, 16
    mov mov eax, 0116h
    jmp sub_10066510
    mov mov eax, 0117h
    jmp sub_1006651A
    mov mov eax, 0119h
    jmp sub_10066524
    mov mov al, byte ptr [ebx + 0281h]
    test test al, al
    jne sub_100664BF
    movsx movsx eax, byte ptr [ebx + 0280h]
    jmp sub_10066537
    cmp cmp byte ptr [ebx + 0282h], 0
    jne sub_100664B4
    cmp cmp al, 61
    jne sub_10066515
    movsx movsx eax, byte ptr [ebx + 0280h]
    sub sub eax, 33
    je sub_1006651A
    sub sub eax, 27
    je sub_10066518
    dec dec eax
    je sub_10066514
    dec dec eax
    jne sub_100664CF
L18:
    mov mov eax, 0111h
    jmp sub_10066562
    mov mov eax, 0112h
L19:
    jmp sub_10066569
    mov mov eax, 0110h
    jmp sub_10066570
    mov mov eax, 0113h
    jmp sub_10066577
    mov mov bl, byte ptr [ebx + 0280h]
    cmp cmp bl, al
    jne sub_100664F5
    cmp cmp bl, 38
    je sub_10066572
    cmp cmp bl, 124
    jne sub_100664FF
    mov mov eax, 0115h
    jmp sub_10066592
    mov mov eax, 0114h
    jmp sub_10066599
    mov mov dword ptr [ebx + 0278h], 12
    or or eax, -1
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_10065c86 ENDP
END
