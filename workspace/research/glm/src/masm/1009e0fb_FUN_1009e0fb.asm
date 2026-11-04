.686
.MODEL FLAT, C
EXTRN sub_10065314:PROC
EXTRN sub_1006533D:PROC
EXTRN sub_100653DB:PROC
EXTRN sub_1006541B:PROC
EXTRN sub_1006544C:PROC
EXTRN sub_100654CF:PROC
EXTRN sub_100655BE:PROC
EXTRN sub_10065622:PROC
EXTRN sub_1006567E:PROC
EXTRN sub_100656AA:PROC
EXTRN sub_100656D2:PROC
EXTRN sub_10082A92:PROC
EXTRN sub_10082B2C:PROC
EXTRN sub_10083228:PROC
EXTRN sub_100832AA:PROC
EXTRN sub_1008339F:PROC
EXTRN sub_10083488:PROC
EXTRN sub_10083626:PROC
EXTRN sub_1008368C:PROC
EXTRN sub_10083AB8:PROC
EXTRN sub_10099669:PROC
EXTRN sub_100996A0:PROC
EXTRN sub_100996EF:PROC
EXTRN sub_10099736:PROC
EXTRN sub_1009982F:PROC
EXTRN sub_100998EE:PROC
EXTRN sub_10099B8D:PROC
EXTRN sub_10099DB1:PROC
EXTRN sub_1009B428:PROC
EXTRN sub_1009B56A:PROC
EXTRN sub_1009CB4F:PROC
EXTRN sub_100F7C0D:PROC
EXTRN sub_100F7C24:PROC
EXTRN sub_100F7C67:PROC
EXTRN sub_100F7C98:PROC
EXTRN sub_100F7CD0:PROC
EXTRN sub_100F7CE7:PROC
EXTRN sub_100F7CFE:PROC
EXTRN sub_100F7D15:PROC
.CODE
FUN_1009e0fb PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000110h
    push ebx
    push esi
    mov esi, dword ptr [ebp + 32]
    xor ebx, ebx
    cmp esi, ebx
    push edi
    mov dword ptr [ebp - 4], ecx
    je L0
    mov dword ptr [esi], ebx
L0:
    mov eax, dword ptr [ebp + 36]
    cmp eax, ebx
    je L1
    mov dword ptr [eax], ebx
L1:
    or dword ptr [ebp - 12], 0FFFFFFFFh
    cmp dword ptr [ebp + 24], ebx
    mov edi, dword ptr [ebp + 12]
    mov dword ptr [ebp - 8], ebx
    je L34
L2:
    cmp dword ptr [ebp - 12], ebx
    je L18
    push dword ptr [ebp + 24]
    mov ecx, dword ptr [ebp - 4]
    push edi
    call sub_1009982F
    cmp eax, ebx
    jmp L16
L3:
    cmp dword ptr [ebp - 12], ebx
    je L17
    mov eax, dword ptr [ebp - 16]
    mov esi, dword ptr [eax + 8]
    mov eax, dword ptr [ebp + 8]
    cmp eax, dword ptr [esi + 16]
    jne L22
    xor ebx, ebx
    test byte ptr [ebp + 28], 4
    je L4
    push dword ptr [ebp + 28]
    mov ecx, dword ptr [ebp - 4]
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
    push dword ptr [esi + 24]
    call sub_1009CB4F
    mov ebx, eax
L4:
    test byte ptr [ebp + 28], 8
    je L5
    push dword ptr [ebp + 28]
    mov ecx, dword ptr [ebp - 4]
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
    push dword ptr [esi + 24]
    call sub_1009B428
    add ebx, eax
L5:
    cmp ebx, -1
    je L15
    cmp ebx, dword ptr [ebp - 12]
    jae L6
    and dword ptr [ebp - 8], 0
    mov dword ptr [ebp - 12], ebx
    cmp ebx, ebx
L6:
    jne L7
    cmp dword ptr [ebp - 8], 64
    jae L7
    mov eax, dword ptr [ebp - 8]
    inc dword ptr [ebp - 8]
    mov dword ptr [ebp + eax*4 - 000000110h], esi
L7:
    xor ecx, ecx
    cmp dword ptr [ebp - 12], ecx
    jne L15
    cmp dword ptr [esi + 44], ecx
    je L15
    cmp dword ptr [esi + 40], ecx
    jne L15
    mov eax, dword ptr [ebp + 24]
    mov eax, dword ptr [eax + 32]
    cmp eax, ecx
    je L11
    cmp dword ptr [eax + 16], 4
    jne L11
    mov ecx, dword ptr [ebp - 4]
    push eax
    push edi
    call sub_100998EE
    jmp L9
L8:
    mov ecx, dword ptr [eax + 8]
    cmp dword ptr [ecx + 44], 0
    je L10
    mov eax, dword ptr [eax + 12]
L9:
    test eax, eax
    jne L8
    jmp L11
L10:
    push dword ptr [edi + 8]
    push 010114C50h
    push 000000C06h
    push edi
    push dword ptr [ebp - 4]
    call sub_10099669
    add esp, 20
    mov dword ptr [esi + 40], 1
L11:
    mov eax, dword ptr [ebp - 16]
    jmp L13
L12:
    mov ecx, dword ptr [eax + 8]
    cmp dword ptr [ecx + 44], 0
    je L14
L13:
    mov eax, dword ptr [eax + 12]
    test eax, eax
    jne L12
    jmp L15
L14:
    push dword ptr [edi + 8]
    push 010114C50h
    push 000000C06h
    push edi
    push dword ptr [ebp - 4]
    call sub_100996A0
    add esp, 20
    mov dword ptr [esi + 40], 1
L15:
    mov eax, dword ptr [ebp - 16]
    mov eax, dword ptr [eax + 12]
    xor ebx, ebx
    test eax, eax
L16:
    mov dword ptr [ebp - 16], eax
    jne L3
L17:
    mov eax, dword ptr [ebp + 24]
    mov eax, dword ptr [eax + 32]
    cmp eax, ebx
    mov dword ptr [ebp + 24], eax
    jne L2
L18:
    cmp dword ptr [ebp - 12], -1
    je L33
    test byte ptr [ebp + 28], 4
    mov edi, dword ptr [ebp - 000000110h]
    je L21
    mov esi, dword ptr [edi + 24]
    xor ebx, ebx
    inc ebx
    cmp dword ptr [ebp - 8], ebx
    jbe L21
L19:
    mov eax, dword ptr [ebp + ebx*4 - 000000110h]
    mov edx, dword ptr [eax + 24]
    push dword ptr [edx + 32]
    mov ecx, dword ptr [ebp - 4]
    push dword ptr [esi + 32]
    call sub_10099DB1
    test eax, eax
    je L20
    mov ecx, dword ptr [ebp - 4]
    push 0
    push dword ptr [edx + 36]
    push dword ptr [esi + 28]
    push esi
    call sub_1009B56A
    cmp eax, -1
    je L20
    inc ebx
    cmp ebx, dword ptr [ebp - 8]
    jb L19
L20:
    cmp ebx, dword ptr [ebp - 8]
    jae L21
    mov eax, dword ptr [ebp + 12]
    push dword ptr [eax + 8]
    push 010114C2Ch
    push 000000BFBh
    push eax
    push dword ptr [ebp - 4]
    call sub_100996EF
    add esp, 20
L21:
    mov eax, dword ptr [ebp + 32]
    test eax, eax
    je L26
    test byte ptr [ebp + 28], 2
    je L25
    mov ecx, dword ptr [edi + 24]
    mov dword ptr [eax], ecx
    jmp L26
L22:
    test byte ptr [ebp + 28], 5
    je L23
    mov eax, dword ptr [ebp + 8]
    push dword ptr [eax*4 + 010114C18h]
    mov eax, dword ptr [esi + 16]
    push dword ptr [eax*4 + 010114C18h]
    push dword ptr [edi + 8]
    push 010114BECh
    push 000000BBDh
    push edi
    push dword ptr [ebp - 4]
    call sub_10099736
    add esp, 28
L23:
    mov eax, dword ptr [ebp + 32]
    cmp eax, ebx
    je L24
    mov dword ptr [eax], ebx
L24:
    mov eax, 080004005h
    jmp L75
L25:
    mov eax, dword ptr [edi + 24]
    test eax, eax
    je L26
    push eax
    call sub_10082A92
    test eax, eax
    mov ecx, dword ptr [ebp + 32]
    mov dword ptr [ecx], eax
    je L70
L26:
    xor edi, edi
    cmp dword ptr [ebp + 36], edi
    je L72
    cmp dword ptr [ebp - 8], edi
    mov dword ptr [ebp + 32], edi
    lea esi, [ebp + 32]
    jbe L32
L27:
    push 20
    call sub_10065314
    test eax, eax
    je L28
    push 010114A34h
    push 0
    push 0
    mov ecx, eax
    call sub_10082B2C
    jmp L29
L28:
    xor eax, eax
L29:
    test eax, eax
    mov dword ptr [esi], eax
    je L70
    push 64
    call sub_1006533D
    test eax, eax
    je L30
    push dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp + edi*4 - 000000110h]
    push dword ptr [ecx + 36]
    mov ecx, eax
    push 2
    call sub_1008368C
    jmp L31
L30:
    xor eax, eax
L31:
    test eax, eax
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 8], eax
    je L70
    mov esi, dword ptr [esi]
    add esi, 12
    inc edi
    cmp edi, dword ptr [ebp - 8]
    jb L27
L32:
    mov eax, dword ptr [ebp + 32]
    mov ecx, dword ptr [ebp + 36]
    mov dword ptr [ecx], eax
    jmp L72
L33:
    mov esi, dword ptr [ebp + 32]
L34:
    test byte ptr [ebp + 28], 2
    jne L73
    cmp dword ptr [ebp + 36], ebx
    jne L73
    cmp dword ptr [ebp + 8], ebx
    jne L63
    push 010114BE4h
    push dword ptr [edi + 8]
    call sub_100F7C0D
    test eax, eax
    pop ecx
    pop ecx
    jne L35
    push 4
    jmp L36
L35:
    push 010114844h
    push dword ptr [edi + 8]
    call sub_100F7C24
    test eax, eax
    pop ecx
    pop ecx
    jne L41
    push 11
L36:
    cmp esi, ebx
    pop edi
    je L72
    push 36
    call sub_100653DB
    cmp eax, ebx
    je L37
    push ebx
    push 1
    push 1
    push edi
    push ebx
    jmp L43
L37:
    xor eax, eax
L38:
    mov dword ptr [esi], eax
L39:
    cmp eax, ebx
L40:
    jne L72
    jmp L70
L41:
    push 010114BDCh
    push dword ptr [edi + 8]
    call sub_100F7C67
    test eax, eax
    pop ecx
    pop ecx
    jne L42
    cmp esi, ebx
    je L72
    push 36
    call sub_1006541B
    cmp eax, ebx
    je L37
    push ebx
    push 4
    push 1
    push 11
    push 1
    jmp L43
L42:
    push 010114BD4h
    push dword ptr [edi + 8]
    call sub_100F7C98
    test eax, eax
    pop ecx
    pop ecx
    jne L44
    cmp esi, ebx
    je L72
    push 36
    call sub_1006544C
    cmp eax, ebx
    je L37
    push ebx
    push 4
    push 4
    push 11
    push 2
L43:
    mov ecx, eax
    call sub_10083228
    jmp L38
L44:
    push 01011482Ch
    push dword ptr [edi + 8]
    call sub_100F7CD0
    test eax, eax
    pop ecx
    pop ecx
    jne L45
    push 14
    jmp L48
L45:
    push 0101950A0h
    push dword ptr [edi + 8]
    call sub_100F7CE7
    test eax, eax
    pop ecx
    pop ecx
    jne L46
    push 15
    jmp L48
L46:
    push 0101147C0h
    push dword ptr [edi + 8]
    call sub_100F7CFE
    test eax, eax
    pop ecx
    pop ecx
    jne L47
    push 25
    jmp L48
L47:
    push 0101147B0h
    push dword ptr [edi + 8]
    call sub_100F7D15
    test eax, eax
    pop ecx
    pop ecx
    jne L51
    push 26
L48:
    mov edi, dword ptr [ebp + 32]
    cmp edi, ebx
    pop esi
    je L72
    push 36
    call sub_100654CF
    cmp eax, ebx
    je L49
    push ebx
    push 1
    push 1
    push esi
    push 3
    mov ecx, eax
    call sub_100832AA
    jmp L50
L49:
    xor eax, eax
L50:
    mov dword ptr [edi], eax
    jmp L39
L51:
    mov ebx, dword ptr [edi + 8]
    mov eax, ebx
    lea esi, [eax + 1]
L52:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L52
    sub eax, esi
    cmp eax, 4
    push 3
    pop ecx
    jb L53
    mov esi, dword ptr [ebx]
    mov edx, 010114858h
    cmp esi, dword ptr [edx]
    jne L53
    xor esi, esi
    add ebx, 4
    sub eax, 4
    jmp L58
L53:
    cmp eax, ecx
    jb L54
    mov edi, 010114854h
    mov esi, ebx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L54
    add ebx, 3
    push 4
    sub eax, 3
    jmp L57
L54:
    cmp eax, 4
    jb L55
    mov edx, dword ptr [ebx]
    mov ecx, 01011484Ch
    cmp edx, dword ptr [ecx]
    jne L55
    add ebx, 4
    push 10
    sub eax, 4
    jmp L57
L55:
    cmp eax, 5
    jb L56
    push 5
    pop ecx
    mov edi, 010114844h
    mov esi, ebx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L56
    add ebx, 5
    push 11
    sub eax, 5
    jmp L57
L56:
    cmp eax, 6
    jb L73
    push 3
    pop ecx
    mov edi, 01011483Ch
    mov esi, ebx
    xor edx, edx
    repe cmpsw word ptr [esi], word ptr es:[edi]
    jne L73
    add ebx, 6
    push 12
    sub eax, 6
L57:
    pop esi
L58:
    cmp eax, 1
    jne L60
    mov al, byte ptr [ebx]
    cmp al, 49
    jl L73
    cmp al, 53
    jge L73
    cmp dword ptr [ebp + 32], 0
    je L72
    push 36
    call sub_100655BE
    test eax, eax
    je L61
    movsx ecx, byte ptr [ebx]
    push 0
    sub ecx, 48
    push ecx
    push 1
    push esi
    push 1
L59:
    mov ecx, eax
    call sub_1008339F
    jmp L62
L60:
    cmp eax, 3
    jne L73
    mov al, byte ptr [ebx]
    cmp al, 49
    jl L73
    cmp al, 53
    jge L73
    cmp byte ptr [ebx + 1], 120
    jne L73
    mov al, byte ptr [ebx + 2]
    cmp al, 49
    jl L73
    cmp al, 53
    jge L73
    cmp dword ptr [ebp + 32], 0
    je L72
    push 36
    call sub_10065622
    test eax, eax
    je L61
    movsx ecx, byte ptr [ebx + 2]
    push 0
    sub ecx, 48
    push ecx
    movsx ecx, byte ptr [ebx]
    sub ecx, 48
    push ecx
    push esi
    push 2
    jmp L59
L61:
    xor eax, eax
L62:
    mov ecx, dword ptr [ebp + 32]
    mov dword ptr [ecx], eax
    test eax, eax
    jmp L40
L63:
    cmp dword ptr [ebp + 8], 1
    jne L73
    mov eax, dword ptr [ebp + 12]
    mov esi, dword ptr [eax + 8]
    push 5
    mov edi, 010114834h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L73
    xor ebx, ebx
    cmp dword ptr [ebp + 32], ebx
    je L72
    push 64
    call sub_1006567E
    cmp eax, ebx
    je L64
    mov ecx, eax
    call sub_10083626
    mov esi, eax
    jmp L65
L64:
    xor esi, esi
L65:
    cmp esi, ebx
    je L70
    xor edi, edi
    inc edi
    push 36
    mov dword ptr [esi + 20], edi
    mov dword ptr [esi + 24], ebx
    mov dword ptr [esi + 28], 000000202h
    call sub_100656AA
    cmp eax, ebx
    je L66
    push 000000200h
    push edi
    push edi
    push 13
    push 3
    mov ecx, eax
    call sub_10083488
    jmp L67
L66:
    xor eax, eax
L67:
    cmp eax, ebx
    mov dword ptr [esi + 32], eax
    je L70
    push 64
    call sub_100656D2
    cmp eax, ebx
    je L68
    push dword ptr [ebp + 12]
    mov ecx, eax
    push ebx
    push ebx
    push 5
    call sub_10083AB8
    jmp L69
L68:
    xor eax, eax
L69:
    cmp eax, ebx
    mov dword ptr [esi + 36], eax
    jne L71
L70:
    mov eax, 08007000Eh
    jmp L75
L71:
    mov eax, dword ptr [ebp + 32]
    mov dword ptr [eax], esi
L72:
    xor eax, eax
    jmp L75
L73:
    test byte ptr [ebp + 28], 1
    je L74
    mov eax, dword ptr [ebp + 12]
    push dword ptr [eax + 8]
    push 010114BB8h
    push 000000BBCh
    push eax
    push dword ptr [ebp - 4]
    call sub_10099B8D
    add esp, 20
L74:
    xor eax, eax
    inc eax
L75:
    pop edi
    pop esi
    pop ebx
    leave
    ret 32
FUN_1009e0fb ENDP
END
