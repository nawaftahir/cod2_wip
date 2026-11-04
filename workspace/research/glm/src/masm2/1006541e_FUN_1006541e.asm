.686
.MODEL FLAT, C
EXTRN sub_1006509D:PROC
EXTRN sub_10065218:PROC
EXTRN sub_10065275:PROC
EXTRN sub_10065401:PROC
EXTRN sub_10065AF1:PROC
EXTRN sub_10065B0E:PROC
EXTRN sub_10065B16:PROC
EXTRN sub_10065B17:PROC
EXTRN sub_10065B26:PROC
EXTRN sub_10065B48:PROC
EXTRN sub_10065B59:PROC
EXTRN sub_10065B64:PROC
EXTRN sub_10065B66:PROC
EXTRN sub_10065B68:PROC
EXTRN sub_10065B6A:PROC
EXTRN sub_10065B86:PROC
EXTRN sub_10065BC2:PROC
EXTRN sub_10065BCC:PROC
EXTRN sub_10065BCE:PROC
EXTRN sub_10065BD1:PROC
EXTRN sub_10065BF3:PROC
EXTRN sub_10065BFC:PROC
EXTRN sub_10065C0C:PROC
EXTRN sub_10065C0D:PROC
EXTRN sub_10065C12:PROC
EXTRN sub_10065C1A:PROC
EXTRN sub_10065C36:PROC
EXTRN sub_10065C3C:PROC
EXTRN sub_10065C41:PROC
EXTRN sub_10065C53:PROC
EXTRN sub_10065C57:PROC
EXTRN sub_10065C69:PROC
EXTRN sub_10065C74:PROC
EXTRN sub_10065CA6:PROC
EXTRN sub_10065CFE:PROC
EXTRN sub_10065D07:PROC
EXTRN sub_10065D0C:PROC
EXTRN sub_10065D27:PROC
EXTRN sub_10065D43:PROC
EXTRN sub_10065D4D:PROC
EXTRN sub_10065D55:PROC
EXTRN sub_10065DE7:PROC
EXTRN sub_10065E19:PROC
EXTRN sub_10065E28:PROC
EXTRN sub_10065E8D:PROC
EXTRN sub_10065EC0:PROC
EXTRN sub_10065EE0:PROC
EXTRN sub_10065EEC:PROC
EXTRN sub_10065F21:PROC
EXTRN sub_10065F8B:PROC
EXTRN sub_10065F9F:PROC
EXTRN sub_10065FCC:PROC
EXTRN sub_10065FEB:PROC
EXTRN sub_10065FEE:PROC
EXTRN sub_10066013:PROC
EXTRN sub_1006601B:PROC
EXTRN sub_10066024:PROC
EXTRN sub_10066039:PROC
EXTRN sub_100660AF:PROC
EXTRN sub_100660F3:PROC
EXTRN sub_10066109:PROC
EXTRN sub_10066179:PROC
EXTRN sub_10067BB2:PROC
EXTRN sub_10067BE9:PROC
EXTRN sub_10067C47:PROC
EXTRN sub_10067D18:PROC
EXTRN sub_10067D55:PROC
EXTRN sub_10067D89:PROC
EXTRN sub_10067DBB:PROC
EXTRN sub_10067F43:PROC
EXTRN sub_100682F7:PROC
EXTRN sub_100687D1:PROC
EXTRN sub_10068847:PROC
EXTRN sub_10068BA4:PROC
EXTRN sub_10068D12:PROC
EXTRN sub_10082A30:PROC
EXTRN sub_10082AB9:PROC
EXTRN sub_10082AFA:PROC
EXTRN sub_10082C87:PROC
EXTRN sub_10082C8E:PROC
EXTRN sub_10082E1D:PROC
EXTRN sub_10082E50:PROC
EXTRN sub_10082F7D:PROC
.CODE
FUN_1006541e PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 120
    and and dword ptr [ebp - 28], 0
    and and dword ptr [ebp - 12], 0
    cmp cmp dword ptr [ebp + 12], 0
    push push ebx
    push push esi
    mov mov eax, ecx
    push push edi
L0:
    mov mov dword ptr [ebp - 4], eax
    jne L5
    mov mov esi, dword ptr [ebp + 16]
    test test esi, esi
    lea lea edi, [ebp - 12]
    je L3
    push push 48
    call sub_1006509D
    test test eax, eax
    je L1
    lea lea ecx, [esi + 16]
    push push ecx
    mov mov ecx, eax
    call sub_10082AB9
    jmp L4
    xor xor eax, eax
    test test eax, eax
    mov mov dword ptr [edi], eax
    je sub_10065B26
    mov mov esi, dword ptr [esi + 12]
    test test esi, esi
    lea lea edi, [eax + 12]
    jne L2
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax + 100]
    mov mov dword ptr [edi], ecx
    mov mov ecx, dword ptr [ebp - 12]
    mov mov dword ptr [eax + 100], ecx
    xor xor eax, eax
    inc inc eax
    jmp sub_10065B48
    mov mov edx, dword ptr [eax + 100]
    test test edx, edx
    je L8
L1:
    add add eax, 0278h
    push push 8
    lea lea esi, [edx + 16]
    pop pop ecx
L2:
    mov mov edi, eax
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
L4:
    cmp cmp dword ptr [eax], 1
    mov mov dword ptr [ebp - 16], eax
    jne sub_10065B68
L6:
    mov mov esi, dword ptr [ebp - 4]
    add add esi, 0280h
    push push 2
    mov mov edi, 010195544h
    pop pop ecx
    xor xor eax, eax
    mov mov dword ptr [ebp - 24], esi
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10065B86
    mov mov eax, dword ptr [edx + 12]
    mov mov ebx, dword ptr [ebp - 4]
    mov mov dword ptr [ebx + 100], eax
    and and dword ptr [edx + 12], 0
    jmp L16
    mov mov esi, dword ptr [eax + 026Ch]
    mov mov edx, dword ptr [esi]
    mov mov edi, dword ptr [esi + 4]
    cmp cmp edx, edi
    jae L13
    mov mov cl, byte ptr [edx]
    cmp cmp cl, 32
    je L10
    cmp cmp cl, 9
    jl L12
    cmp cmp cl, 13
    jg L14
    mov mov ecx, dword ptr [eax + 026Ch]
    inc inc edx
    cmp cmp edx, dword ptr [ecx + 4]
    jb L11
    cmp cmp edx, edi
    jae L15
    cmp cmp byte ptr [edx], 40
    jne sub_10065BD1
    mov mov eax, dword ptr [ebp - 4]
    lea lea edi, [eax + 0278h]
    push push edi
    push push dword ptr [eax + 0298h]
    mov mov ecx, esi
    mov mov dword ptr [ebp - 16], edi
    call sub_100687D1
    test test eax, eax
    jl sub_10065BF3
    cmp cmp dword ptr [edi], 1
    jne sub_10065BFC
    mov mov esi, dword ptr [ebp - 4]
    add add esi, 0280h
    push push 2
    mov mov edi, 010195544h
    pop pop ecx
    xor xor eax, eax
    mov mov dword ptr [ebp - 24], esi
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10065C1A
    mov mov ebx, dword ptr [ebp - 4]
L9:
    and and dword ptr [ebp - 20], 0
    lea lea eax, [ebp - 28]
    mov mov dword ptr [ebp - 8], 1
    mov mov dword ptr [ebp - 32], eax
    mov mov eax, dword ptr [ebx + 100]
    test test eax, eax
    mov mov edi, dword ptr [ebp - 16]
    je L17
    push push 8
    lea lea esi, [eax + 16]
    pop pop ecx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, dword ptr [eax + 12]
    mov mov edi, dword ptr [ebp - 16]
    mov mov dword ptr [ebx + 100], ecx
    and and dword ptr [eax + 12], 0
    jmp L18
    mov mov ecx, dword ptr [ebx + 026Ch]
    push push edi
    push push dword ptr [ebx + 0298h]
    call sub_10068847
    test test eax, eax
    jl sub_10065C69
    mov mov ebx, dword ptr [ebp - 4]
    cmp cmp dword ptr [edi], 13
    je L31
    mov mov esi, dword ptr [ebp - 32]
    cmp cmp dword ptr [esi], 0
    jne L20
    push push 20
    call sub_10065218
    test test eax, eax
    je L19
    push push 01010C874h
    push push 0
    push push 0
L11:
    mov mov ecx, eax
    call sub_10082A30
    jmp L21
    xor xor eax, eax
    test test eax, eax
    mov mov dword ptr [esi], eax
    je sub_10065CA6
    mov mov ebx, dword ptr [ebp - 4]
    add add eax, 8
    mov mov dword ptr [ebp - 20], eax
    cmp cmp dword ptr [ebp - 8], 1
    jne L24
    cmp cmp dword ptr [edi], 1
    jne L25
    mov mov eax, dword ptr [ebp - 24]
    mov mov al, byte ptr [eax]
    cmp cmp al, 44
    je L23
    cmp cmp al, 41
    jne L26
    cmp cmp byte ptr [ebx + 0281h], 0
    jne L27
    mov mov eax, dword ptr [esi]
    add add eax, 12
    mov mov dword ptr [ebp - 32], eax
    jmp L30
    push push 48
    call sub_10065275
    test test eax, eax
    je L28
    push push edi
    mov mov ecx, eax
    call sub_10082C8E
    jmp L29
    xor xor eax, eax
    test test eax, eax
    mov mov ecx, dword ptr [ebp - 20]
    mov mov dword ptr [ecx], eax
    je sub_10065CFE
    mov mov ebx, dword ptr [ebp - 4]
    add add eax, 12
    mov mov dword ptr [ebp - 20], eax
    cmp cmp dword ptr [edi], 1
    jne L32
    cmp cmp byte ptr [ebx + 0281h], 0
    jne L33
    mov mov eax, dword ptr [ebp - 24]
    movsx movsx eax, byte ptr [eax]
    sub sub eax, 40
    je L35
    dec dec eax
    je L34
    sub sub eax, 50
    je L37
    dec dec eax
    dec dec eax
    je L36
    sub sub eax, 30
    je L38
    dec dec eax
    dec dec eax
    jne L39
    dec dec dword ptr [ebp - 8]
    jmp L40
    inc inc dword ptr [ebp - 8]
    cmp cmp dword ptr [ebp - 8], 0
    jne L22
    mov mov ecx, dword ptr [ebp + 12]
    mov mov eax, dword ptr [ebp - 28]
    xor xor edx, edx
    cmp cmp eax, edx
    je L42
    cmp cmp dword ptr [eax + 8], edx
    je L43
    mov mov ecx, dword ptr [ecx + 12]
    cmp cmp ecx, edx
    mov mov eax, dword ptr [eax + 12]
    jne L41
    cmp cmp ecx, edx
    jne sub_10065D4D
    cmp cmp eax, edx
    jne sub_10065D55
    lea lea eax, [ebp - 12]
    mov mov dword ptr [ebp + 8], eax
    mov mov eax, dword ptr [ebp + 16]
    cmp cmp eax, edx
    mov mov dword ptr [ebp - 8], edx
    mov mov dword ptr [ebp - 16], edx
    mov mov dword ptr [ebp - 24], edx
    mov mov dword ptr [ebp - 32], eax
    je sub_10065C12
    cmp cmp dword ptr [ebp - 8], 0
    lea lea ebx, [eax + 16]
    mov mov eax, dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 20], eax
    jne L45
    cmp cmp dword ptr [ebp - 16], 0
    jne L46
    mov mov ecx, dword ptr [ebx]
    xor xor eax, eax
    inc inc eax
    cmp cmp ecx, eax
    jne L44
L17:
    push push 2
    mov mov edi, 01010C870h
    lea lea esi, [ebx + 8]
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L45
    mov mov dword ptr [ebp - 24], ebx
    mov mov dword ptr [ebp - 8], eax
    jmp sub_10065C36
    push push 01010C844h
    push push 05EBh
    push push dword ptr [ebp + 8]
    add add ebx, 24
    push push ebx
    call sub_10067F43
    add add esp, 16
    jmp sub_10065DE7
    cmp cmp dword ptr [ebx], eax
    jne L47
    push push 3
    mov mov edi, 01010C840h
    lea lea esi, [ebx + 8]
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L48
    mov mov dword ptr [ebp - 24], ebx
    mov mov dword ptr [ebp - 16], eax
    jmp sub_10065C74
    cmp cmp dword ptr [ebx], 9
    jne sub_10065B16
    mov mov ecx, dword ptr [ebp - 28]
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [ebp + 16], ecx
    mov mov edi, dword ptr [ebx + 8]
    mov mov esi, dword ptr [eax + 24]
    mov mov dl, byte ptr [esi]
    mov mov cl, dl
    cmp cmp dl, byte ptr [edi]
    jne L50
    test test cl, cl
    je L50
    mov mov dl, byte ptr [esi + 1]
    mov mov cl, dl
    cmp cmp dl, byte ptr [edi + 1]
    jne L52
    inc inc esi
    inc inc esi
    inc inc edi
    inc inc edi
    test test cl, cl
    jne L49
    xor xor ecx, ecx
    jmp sub_10065AF1
    sbb sbb ecx, ecx
    sbb sbb ecx, -1
    test test ecx, ecx
L19:
    je sub_10065B0E
    mov mov ecx, dword ptr [ebp + 16]
    mov mov eax, dword ptr [eax + 12]
    test test eax, eax
L20:
    mov mov ecx, dword ptr [ecx + 12]
    mov mov dword ptr [ebp + 16], ecx
    jne L51
    test test eax, eax
L21:
    je sub_10065B64
    mov mov eax, dword ptr [ebp + 16]
    mov mov esi, dword ptr [eax + 8]
    jmp sub_10065B66
    push push 48
    call sub_10065401
    test test eax, eax
    je sub_10065B59
    lea lea ecx, [esi + 16]
    push push ecx
    mov mov ecx, eax
    call sub_10082E1D
    jmp sub_10065B68
    xor xor eax, eax
    test test eax, eax
    mov mov ecx, dword ptr [ebp + 8]
    mov mov dword ptr [ecx], eax
    je sub_10065E8D
    mov mov esi, dword ptr [esi + 12]
    add add eax, 12
    mov mov dword ptr [ebp + 8], eax
    test test esi, esi
    jne sub_10065B6A
    jmp sub_10065BCC
    push push 48
    call L0
    test test eax, eax
    je sub_10065BC2
    push push ebx
    mov mov ecx, eax
    call sub_10082E50
    jmp sub_10065BCE
    xor xor eax, eax
    test test eax, eax
L24:
    mov mov ecx, dword ptr [ebp + 8]
    mov mov dword ptr [ecx], eax
L25:
    je sub_10065EC0
    add add eax, 12
    mov mov dword ptr [ebp + 8], eax
    cmp cmp dword ptr [ebp - 8], 0
    jne sub_10065C0C
    cmp cmp dword ptr [ebp - 16], 0
L27:
    je sub_10065D43
    mov mov ecx, dword ptr [ebp - 20]
    mov mov esi, dword ptr [ecx]
    xor xor edi, edi
    xor xor eax, eax
    inc inc edi
    jmp sub_10065C53
    test test eax, eax
    je sub_10065C3C
    cmp cmp eax, dword ptr [esi + 40]
    je sub_10065C41
    inc inc edi
    mov mov ecx, dword ptr [ebp - 4]
    push push 0
    push push dword ptr [esi + 44]
    push push dword ptr [esi + 40]
    call L6
    add add edi, eax
    mov mov eax, dword ptr [esi + 40]
    add add eax, dword ptr [esi + 44]
    mov mov esi, dword ptr [esi + 12]
L30:
    test test esi, esi
    jne sub_10065C57
    mov mov ecx, dword ptr [ebp - 4]
    push push 1
    inc inc edi
    push push edi
    call sub_10082AFA
    mov mov edi, eax
    test test edi, edi
    je sub_10065F21
    mov mov ecx, dword ptr [ebp - 20]
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 8], eax
    mov mov dword ptr [ebp + 16], 1
    sete sete bl
    dec dec bl
    and and bl, 0FBh
    add add bl, 39
    mov mov byte ptr [edi], bl
    mov mov esi, dword ptr [ecx]
    cmp cmp esi, eax
    je sub_10065D27
    test test eax, eax
    je sub_10065D07
    cmp cmp eax, dword ptr [esi + 40]
    je sub_10065D0C
    mov mov eax, dword ptr [ebp + 16]
    inc inc dword ptr [ebp + 16]
    mov mov byte ptr [edi + eax], 32
    mov mov eax, dword ptr [ebp + 16]
    mov mov ecx, dword ptr [ebp - 4]
    add add eax, edi
    push push eax
    push push dword ptr [esi + 44]
    push push dword ptr [esi + 40]
    call L7
    add add dword ptr [ebp + 16], eax
    mov mov eax, dword ptr [esi + 44]
    add add eax, dword ptr [esi + 40]
    mov mov esi, dword ptr [esi + 12]
    test test esi, esi
L33:
    jne sub_10065D27
    mov mov esi, dword ptr [ebp + 16]
    lea lea ecx, [ebp - 120]
L35:
    mov mov byte ptr [edi + esi], bl
    call sub_10067BB2
L37:
    mov mov ebx, dword ptr [ebp - 4]
    lea lea eax, [ebx + 24]
    push push eax
    mov mov eax, dword ptr [ebp - 24]
    push push ebx
    push push dword ptr [eax + 20]
    inc inc esi
    push push dword ptr [eax + 16]
    lea lea ecx, [ebp - 120]
L40:
    push push esi
    push push edi
    call sub_10067BE9
    test test eax, eax
    lea lea ecx, [ebp - 120]
    jl sub_10065F8B
    lea lea eax, [ebp - 64]
    push push eax
    push push dword ptr [ebx + 0298h]
    call sub_10068BA4
    test test eax, eax
    jl sub_10065F9F
    push push 48
    call L9
    test test eax, eax
    je sub_10065E19
    lea lea ecx, [ebp - 64]
    push push ecx
    mov mov ecx, eax
L41:
    call sub_10082F7D
    jmp sub_10065E28
    xor xor eax, eax
L43:
    test test eax, eax
    mov mov ecx, dword ptr [ebp - 20]
    mov mov dword ptr [ecx], eax
    lea lea ecx, [ebp - 120]
    je sub_10065FCC
    and and dword ptr [ebp - 16], 0
    and and dword ptr [ebp - 8], 0
    add add eax, 12
    mov mov dword ptr [ebp + 8], eax
    call sub_10067C47
    mov mov eax, dword ptr [ebp - 32]
    mov mov eax, dword ptr [eax + 12]
    test test eax, eax
    mov mov dword ptr [ebp - 32], eax
    jne sub_10065C0D
    mov mov ebx, dword ptr [ebp - 4]
    xor xor edx, edx
    cmp cmp dword ptr [ebp - 12], edx
    lea lea eax, [ebp - 12]
    mov mov dword ptr [ebp + 8], eax
    je sub_10065FEE
    mov mov eax, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 12]
    test test ecx, ecx
    mov mov dword ptr [ebp + 12], eax
    je sub_10065EE0
    mov mov eax, dword ptr [ecx + 12]
    mov mov dword ptr [ebp - 28], eax
    jmp sub_10065EEC
    and and dword ptr [ebp - 28], 0
    mov mov eax, ecx
    neg neg eax
    sbb sbb eax, eax
    lea lea edx, [ecx + 16]
    and and eax, edx
    mov mov edx, dword ptr [ebp - 28]
    mov mov ebx, edx
    neg neg ebx
    sbb sbb ebx, ebx
    lea lea esi, [edx + 16]
    and and ebx, esi
    test test ecx, ecx
    je sub_10066013
    test test edx, edx
    je sub_1006601B
    cmp cmp dword ptr [eax], 1
    jne sub_10066024
    lea lea esi, [eax + 8]
    push push 3
    mov mov edi, 01010C83Ch
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10066039
    mov mov eax, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebp - 4]
    add add eax, 16
    mov mov eax, dword ptr [eax + 28]
    add add eax, dword ptr [ebx + 28]
    push push 1
    push push eax
    mov mov dword ptr [ebp - 32], eax
    call sub_10082C87
    test test eax, eax
    mov mov dword ptr [ebp + 16], eax
    je sub_100660AF
    mov mov eax, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [eax + 44]
    mov mov esi, dword ptr [eax + 40]
    mov mov edi, dword ptr [ebp + 16]
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    add add eax, 16
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [ebx + 28]
    mov mov edi, dword ptr [eax + 28]
    mov mov esi, dword ptr [ebx + 24]
    add add edi, dword ptr [ebp + 16]
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    lea lea ecx, [ebp - 120]
    call sub_10067D18
    mov mov eax, dword ptr [ebp - 4]
    lea lea ecx, [eax + 24]
    push push ecx
    push push eax
    mov mov eax, dword ptr [ebp + 12]
    push push dword ptr [eax + 36]
    add add eax, 16
    push push dword ptr [eax + 16]
    lea lea ecx, [ebp - 120]
    push push dword ptr [ebp - 32]
    push push dword ptr [ebp + 16]
    call sub_10067D55
    test test eax, eax
    lea lea ecx, [ebp - 120]
    jl sub_100660F3
    mov mov esi, dword ptr [ebp + 12]
    lea lea eax, [esi + 16]
    push push eax
    mov mov eax, dword ptr [ebp - 4]
    push push dword ptr [eax + 0298h]
    call sub_10068D12
    test test eax, eax
    jl sub_10066109
    mov mov eax, dword ptr [ebp - 28]
    mov mov ecx, dword ptr [eax + 12]
    mov mov dword ptr [esi + 12], ecx
    and and dword ptr [eax + 12], 0
    lea lea ecx, [ebp - 120]
    call sub_10067D89
    mov mov eax, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax]
    add add eax, 12
    cmp cmp dword ptr [eax], 0
    mov mov dword ptr [ebp + 8], eax
    jne sub_10065FEB
    mov mov ebx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebx + 100]
    mov mov ecx, dword ptr [ebp + 8]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [ebp - 12]
    mov mov dword ptr [ebx + 100], eax
    jmp sub_10065B17
    lea lea ecx, [ebp - 120]
    call sub_10067DBB
    jmp sub_10066179
    mov mov eax, dword ptr [ebp + 8]
    push push dword ptr [eax + 8]
    add add ebx, 24
L49:
    push push 01010C810h
    push push 05ECh
    push push eax
    push push ebx
L50:
    call sub_100682F7
    add add esp, 20
    xor xor eax, eax
    pop pop edi
L51:
    pop pop esi
    pop pop ebx
    leave leave
L52:
    ret ret 12
FUN_1006541e ENDP
END
