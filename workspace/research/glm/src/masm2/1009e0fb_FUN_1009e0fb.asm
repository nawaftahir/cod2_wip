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
EXTRN sub_1009E7E1:PROC
EXTRN sub_1009E7E6:PROC
EXTRN sub_1009E826:PROC
EXTRN sub_1009E855:PROC
EXTRN sub_1009E857:PROC
EXTRN sub_1009E860:PROC
EXTRN sub_1009E86B:PROC
EXTRN sub_1009E8A2:PROC
EXTRN sub_1009E8BE:PROC
EXTRN sub_1009E8F8:PROC
EXTRN sub_1009E90D:PROC
EXTRN sub_1009E93B:PROC
EXTRN sub_1009E954:PROC
EXTRN sub_1009E969:PROC
EXTRN sub_1009E96B:PROC
EXTRN sub_1009E982:PROC
EXTRN sub_1009E9C6:PROC
EXTRN sub_1009E9D6:PROC
EXTRN sub_1009E9E9:PROC
EXTRN sub_1009EA05:PROC
EXTRN sub_1009EA08:PROC
EXTRN sub_1009EA10:PROC
EXTRN sub_1009EA1C:PROC
EXTRN sub_1009EA20:PROC
EXTRN sub_1009EA40:PROC
EXTRN sub_1009EA44:PROC
EXTRN sub_1009EA4B:PROC
EXTRN sub_1009EA57:PROC
EXTRN sub_1009EA74:PROC
EXTRN sub_1009EA76:PROC
EXTRN sub_1009EA81:PROC
EXTRN sub_1009EA9A:PROC
EXTRN sub_1009EAAA:PROC
EXTRN sub_1009EAAB:PROC
EXTRN sub_1009EAB4:PROC
EXTRN sub_1009EAB5:PROC
EXTRN sub_1009EAD0:PROC
EXTRN sub_1009EAE3:PROC
EXTRN sub_1009EAEA:PROC
EXTRN sub_1009EAEE:PROC
EXTRN sub_1009EAF3:PROC
EXTRN sub_1009EB04:PROC
EXTRN sub_1009EB07:PROC
EXTRN sub_1009EB0E:PROC
EXTRN sub_1009EB23:PROC
EXTRN sub_1009EB2E:PROC
EXTRN sub_1009EB5F:PROC
EXTRN sub_1009EB93:PROC
EXTRN sub_1009EBE2:PROC
EXTRN sub_1009EC1D:PROC
EXTRN sub_1009EC2B:PROC
EXTRN sub_1009EC36:PROC
EXTRN sub_1009EC81:PROC
EXTRN sub_1009EC96:PROC
EXTRN sub_1009ECAB:PROC
EXTRN sub_1009ECC3:PROC
EXTRN sub_1009ECCB:PROC
EXTRN sub_1009ECD1:PROC
EXTRN sub_1009ED00:PROC
EXTRN sub_1009ED0A:PROC
EXTRN sub_1009ED12:PROC
EXTRN sub_1009ED1C:PROC
EXTRN sub_1009ED27:PROC
EXTRN sub_1009ED2E:PROC
EXTRN sub_1009ED2F:PROC
EXTRN sub_1009ED35:PROC
EXTRN sub_1009ED3B:PROC
EXTRN sub_1009ED72:PROC
EXTRN sub_1009ED8A:PROC
EXTRN sub_1009ED8F:PROC
EXTRN sub_1009ED91:PROC
EXTRN sub_1009EDA1:PROC
EXTRN sub_1009EDA5:PROC
EXTRN sub_1009EDD9:PROC
EXTRN sub_1009EDDB:PROC
EXTRN sub_1009EDED:PROC
EXTRN sub_1009EE04:PROC
EXTRN sub_1009EE39:PROC
EXTRN sub_1009EE42:PROC
EXTRN sub_1009EE45:PROC
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
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0110h
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 32]
    xor xor ebx, ebx
    cmp cmp esi, ebx
    push push edi
    mov mov dword ptr [ebp - 4], ecx
    je L0
    mov mov dword ptr [esi], ebx
    mov mov eax, dword ptr [ebp + 36]
    cmp cmp eax, ebx
    je L1
    mov mov dword ptr [eax], ebx
    or or dword ptr [ebp - 12], -1
    cmp cmp dword ptr [ebp + 24], ebx
    mov mov edi, dword ptr [ebp + 12]
    mov mov dword ptr [ebp - 8], ebx
    je L26
    cmp cmp dword ptr [ebp - 12], ebx
    je L9
    push push dword ptr [ebp + 24]
    mov mov ecx, dword ptr [ebp - 4]
    push push edi
L1:
    call sub_1009982F
    cmp cmp eax, ebx
    jmp L8
    cmp cmp dword ptr [ebp - 12], ebx
    je L11
    mov mov eax, dword ptr [ebp - 16]
    mov mov esi, dword ptr [eax + 8]
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp eax, dword ptr [esi + 16]
    jne L22
    xor xor ebx, ebx
    test test byte ptr [ebp + 28], 4
    je L2
    push push dword ptr [ebp + 28]
    mov mov ecx, dword ptr [ebp - 4]
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 16]
    push push dword ptr [esi + 24]
    call sub_1009CB4F
    mov mov ebx, eax
    test test byte ptr [ebp + 28], 8
    je L3
    push push dword ptr [ebp + 28]
    mov mov ecx, dword ptr [ebp - 4]
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 16]
    push push dword ptr [esi + 24]
    call sub_1009B428
    add add ebx, eax
    cmp cmp ebx, -1
    je L13
    cmp cmp ebx, dword ptr [ebp - 12]
    jae L4
    and and dword ptr [ebp - 8], 0
    mov mov dword ptr [ebp - 12], ebx
    cmp cmp ebx, ebx
    jne L5
    cmp cmp dword ptr [ebp - 8], 64
    jae L6
    mov mov eax, dword ptr [ebp - 8]
    inc inc dword ptr [ebp - 8]
    mov mov dword ptr [ebp + eax*4 - 0110h], esi
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp - 12], ecx
    jne L18
    cmp cmp dword ptr [esi + 44], ecx
    je L19
    cmp cmp dword ptr [esi + 40], ecx
    jne L20
    mov mov eax, dword ptr [ebp + 24]
    mov mov eax, dword ptr [eax + 32]
    cmp cmp eax, ecx
    je L16
    cmp cmp dword ptr [eax + 16], 4
    jne L17
    mov mov ecx, dword ptr [ebp - 4]
    push push eax
    push push edi
    call sub_100998EE
    jmp L12
    mov mov ecx, dword ptr [eax + 8]
    cmp cmp dword ptr [ecx + 44], 0
    je L15
    mov mov eax, dword ptr [eax + 12]
    test test eax, eax
    jne L14
    jmp L19
    push push dword ptr [edi + 8]
    push push 010114C50h
    push push 0C06h
    push push edi
    push push dword ptr [ebp - 4]
    call sub_10099669
    add add esp, 20
    mov mov dword ptr [esi + 40], 1
    mov mov eax, dword ptr [ebp - 16]
    jmp L21
    mov mov ecx, dword ptr [eax + 8]
    cmp cmp dword ptr [ecx + 44], 0
    je L24
    mov mov eax, dword ptr [eax + 12]
    test test eax, eax
    jne L23
    jmp L25
    push push dword ptr [edi + 8]
    push push 010114C50h
    push push 0C06h
    push push edi
    push push dword ptr [ebp - 4]
    call sub_100996A0
    add add esp, 20
    mov mov dword ptr [esi + 40], 1
L4:
    mov mov eax, dword ptr [ebp - 16]
    mov mov eax, dword ptr [eax + 12]
    xor xor ebx, ebx
    test test eax, eax
    mov mov dword ptr [ebp - 16], eax
    jne L10
    mov mov eax, dword ptr [ebp + 24]
    mov mov eax, dword ptr [eax + 32]
    cmp cmp eax, ebx
    mov mov dword ptr [ebp + 24], eax
    jne L7
    cmp cmp dword ptr [ebp - 12], -1
    je L37
    test test byte ptr [ebp + 28], 4
    mov mov edi, dword ptr [ebp - 0110h]
    je L28
    mov mov esi, dword ptr [edi + 24]
    xor xor ebx, ebx
    inc inc ebx
    cmp cmp dword ptr [ebp - 8], ebx
    jbe L30
    mov mov eax, dword ptr [ebp + ebx*4 - 0110h]
    mov mov edx, dword ptr [eax + 24]
    push push dword ptr [edx + 32]
    mov mov ecx, dword ptr [ebp - 4]
    push push dword ptr [esi + 32]
    call sub_10099DB1
    test test eax, eax
    je L29
    mov mov ecx, dword ptr [ebp - 4]
    push push 0
    push push dword ptr [edx + 36]
    push push dword ptr [esi + 28]
    push push esi
    call sub_1009B56A
    cmp cmp eax, -1
    je L31
    inc inc ebx
    cmp cmp ebx, dword ptr [ebp - 8]
    jb L27
    cmp cmp ebx, dword ptr [ebp - 8]
    jae L32
    mov mov eax, dword ptr [ebp + 12]
    push push dword ptr [eax + 8]
    push push 010114C2Ch
    push push 0BFBh
    push push eax
    push push dword ptr [ebp - 4]
    call sub_100996EF
    add add esp, 20
    mov mov eax, dword ptr [ebp + 32]
    test test eax, eax
    je L35
    test test byte ptr [ebp + 28], 2
    je L34
    mov mov ecx, dword ptr [edi + 24]
    mov mov dword ptr [eax], ecx
    jmp L36
L13:
    test test byte ptr [ebp + 28], 5
    je L33
    mov mov eax, dword ptr [ebp + 8]
    push push dword ptr [eax*4 + 010114C18h]
    mov mov eax, dword ptr [esi + 16]
L16:
    push push dword ptr [eax*4 + 010114C18h]
    push push dword ptr [edi + 8]
    push push 010114BECh
    push push 0BBDh
    push push edi
    push push dword ptr [ebp - 4]
    call sub_10099736
    add add esp, 28
    mov mov eax, dword ptr [ebp + 32]
    cmp cmp eax, ebx
    je L38
    mov mov dword ptr [eax], ebx
    mov mov eax, 080004005h
    jmp sub_1009EA20
    mov mov eax, dword ptr [edi + 24]
    test test eax, eax
    je L39
    push push eax
    call sub_10082A92
    test test eax, eax
    mov mov ecx, dword ptr [ebp + 32]
    mov mov dword ptr [ecx], eax
    je sub_1009EA05
    xor xor edi, edi
    cmp cmp dword ptr [ebp + 36], edi
    je sub_1009EA1C
    cmp cmp dword ptr [ebp - 8], edi
    mov mov dword ptr [ebp + 32], edi
L23:
    lea lea esi, [ebp + 32]
    jbe L42
    push push 20
    call sub_10065314
    test test eax, eax
    je L40
    push push 010114A34h
    push push 0
    push push 0
    mov mov ecx, eax
    call sub_10082B2C
    jmp L41
    xor xor eax, eax
    test test eax, eax
    mov mov dword ptr [esi], eax
    je sub_1009EA44
    push push 64
    call sub_1006533D
    test test eax, eax
    je L43
    push push dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebp + edi*4 - 0110h]
    push push dword ptr [ecx + 36]
    mov mov ecx, eax
    push push 2
    call sub_1008368C
    jmp L44
    xor xor eax, eax
    test test eax, eax
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 8], eax
    je sub_1009EA76
    mov mov esi, dword ptr [esi]
    add add esi, 12
    inc inc edi
    cmp cmp edi, dword ptr [ebp - 8]
    jb L42
    mov mov eax, dword ptr [ebp + 32]
    mov mov ecx, dword ptr [ebp + 36]
    mov mov dword ptr [ecx], eax
    jmp sub_1009EA9A
    mov mov esi, dword ptr [ebp + 32]
    test test byte ptr [ebp + 28], 2
    jne sub_1009EAAB
    cmp cmp dword ptr [ebp + 36], ebx
    jne sub_1009EAB4
    cmp cmp dword ptr [ebp + 8], ebx
    jne sub_1009EA08
    push push 010114BE4h
    push push dword ptr [edi + 8]
    call sub_100F7C0D
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne L45
    push push 4
    jmp L46
    push push 010114844h
L26:
    push push dword ptr [edi + 8]
    call sub_100F7C24
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne sub_1009E7E1
    push push 11
    cmp cmp esi, ebx
    pop pop edi
    je sub_1009EAEE
    push push 36
    call sub_100653DB
    cmp cmp eax, ebx
    je sub_1009E7E6
    push push ebx
    push push 1
    push push 1
    push push edi
    push push ebx
    jmp sub_1009E860
    xor xor eax, eax
    mov mov dword ptr [esi], eax
    cmp cmp eax, ebx
    jne sub_1009EB0E
    jmp sub_1009EB07
    push push 010114BDCh
    push push dword ptr [edi + 8]
    call sub_100F7C67
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne sub_1009E855
    cmp cmp esi, ebx
    je sub_1009EB2E
    push push 36
    call sub_1006541B
    cmp cmp eax, ebx
    je sub_1009E826
    push push ebx
    push push 4
    push push 1
    push push 11
    push push 1
    jmp sub_1009E8A2
    push push 010114BD4h
    push push dword ptr [edi + 8]
    call sub_100F7C98
    test test eax, eax
    pop pop ecx
L29:
    pop pop ecx
    jne sub_1009E8BE
    cmp cmp esi, ebx
L30:
    je sub_1009EB5F
    push push 36
    call sub_1006544C
    cmp cmp eax, ebx
    je sub_1009E857
L31:
    push push ebx
    push push 4
    push push 4
    push push 11
    push push 2
    mov mov ecx, eax
    call sub_10083228
    jmp sub_1009E86B
    push push 01011482Ch
    push push dword ptr [edi + 8]
    call sub_100F7CD0
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne sub_1009E90D
    push push 14
    jmp sub_1009E954
    push push 0101950A0h
    push push dword ptr [edi + 8]
    call sub_100F7CE7
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne sub_1009E93B
    push push 15
    jmp sub_1009E96B
    push push 0101147C0h
    push push dword ptr [edi + 8]
    call sub_100F7CFE
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne sub_1009E969
    push push 25
    jmp sub_1009E982
    push push 0101147B0h
    push push dword ptr [edi + 8]
    call sub_100F7D15
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne sub_1009E9C6
    push push 26
    mov mov edi, dword ptr [ebp + 32]
    cmp cmp edi, ebx
    pop pop esi
    je sub_1009EBE2
    push push 36
    call sub_100654CF
    cmp cmp eax, ebx
    je sub_1009E9D6
    push push ebx
    push push 1
    push push 1
    push push esi
    push push 3
    mov mov ecx, eax
    call sub_100832AA
    jmp sub_1009E9E9
    xor xor eax, eax
    mov mov dword ptr [edi], eax
    jmp sub_1009E8F8
    mov mov ebx, dword ptr [edi + 8]
    mov mov eax, ebx
    lea lea esi, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne sub_1009EA10
    sub sub eax, esi
    cmp cmp eax, 4
    push push 3
    pop pop ecx
    jb sub_1009EA40
    mov mov esi, dword ptr [ebx]
    mov mov edx, 010114858h
    cmp cmp esi, dword ptr [edx]
    jne sub_1009EA4B
    xor xor esi, esi
L35:
    add add ebx, 4
    sub sub eax, 4
    jmp sub_1009EAD0
    cmp cmp eax, ecx
    jb sub_1009EA74
    mov mov edi, 010114854h
    mov mov esi, ebx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1009EA81
    add add ebx, 3
    push push 4
    sub sub eax, 3
    jmp sub_1009EAEA
L38:
    cmp cmp eax, 4
    jb sub_1009EAAA
    mov mov edx, dword ptr [ebx]
    mov mov ecx, 01011484Ch
    cmp cmp edx, dword ptr [ecx]
    jne sub_1009EAB5
    add add ebx, 4
    push push 10
    sub sub eax, 4
    jmp sub_1009EB04
    cmp cmp eax, 5
    jb sub_1009EAE3
    push push 5
    pop pop ecx
    mov mov edi, 010114844h
    mov mov esi, ebx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1009EAF3
    add add ebx, 5
    push push 11
    sub sub eax, 5
L39:
    jmp sub_1009EB23
    cmp cmp eax, 6
    jb sub_1009EC96
    push push 3
    pop pop ecx
    mov mov edi, 01011483Ch
    mov mov esi, ebx
    xor xor edx, edx
    repe cmpsw repe cmpsw word ptr [esi], word ptr es:[edi]
    jne sub_1009ECAB
    add add ebx, 6
    push push 12
    sub sub eax, 6
    pop pop esi
    cmp cmp eax, 1
    jne sub_1009EB93
    mov mov al, byte ptr [ebx]
    cmp cmp al, 49
    jl sub_1009ECC3
    cmp cmp al, 53
    jge sub_1009ECCB
    cmp cmp dword ptr [ebp + 32], 0
    je sub_1009ECD1
    push push 36
    call sub_100655BE
    test test eax, eax
    je sub_1009EC1D
    movsx movsx ecx, byte ptr [ebx]
    push push 0
    sub sub ecx, 48
    push push ecx
    push push 1
    push push esi
    push push 1
    mov mov ecx, eax
    call sub_1008339F
    jmp sub_1009EC36
    cmp cmp eax, 3
    jne sub_1009ED00
    mov mov al, byte ptr [ebx]
    cmp cmp al, 49
    jl sub_1009ED0A
    cmp cmp al, 53
    jge sub_1009ED12
    cmp cmp byte ptr [ebx + 1], 120
    jne sub_1009ED1C
    mov mov al, byte ptr [ebx + 2]
    cmp cmp al, 49
    jl sub_1009ED27
    cmp cmp al, 53
    jge sub_1009ED2F
    cmp cmp dword ptr [ebp + 32], 0
    je sub_1009ED35
    push push 36
    call sub_10065622
    test test eax, eax
    je sub_1009EC81
    movsx movsx ecx, byte ptr [ebx + 2]
    push push 0
L43:
    sub sub ecx, 48
    push push ecx
    movsx movsx ecx, byte ptr [ebx]
    sub sub ecx, 48
    push push ecx
    push push esi
    push push 2
    jmp sub_1009EC2B
    xor xor eax, eax
    mov mov ecx, dword ptr [ebp + 32]
    mov mov dword ptr [ecx], eax
    test test eax, eax
    jmp sub_1009EA57
    cmp cmp dword ptr [ebp + 8], 1
    jne sub_1009ED72
    mov mov eax, dword ptr [ebp + 12]
    mov mov esi, dword ptr [eax + 8]
    push push 5
    mov mov edi, 010114834h
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1009ED8A
    xor xor ebx, ebx
    cmp cmp dword ptr [ebp + 32], ebx
    je sub_1009ED91
    push push 64
    call sub_1006567E
    cmp cmp eax, ebx
    je sub_1009ED2E
    mov mov ecx, eax
    call sub_10083626
    mov mov esi, eax
    jmp sub_1009ED3B
    xor xor esi, esi
    cmp cmp esi, ebx
    je sub_1009EDA1
    xor xor edi, edi
    inc inc edi
    push push 36
    mov mov dword ptr [esi + 20], edi
    mov mov dword ptr [esi + 24], ebx
    mov mov dword ptr [esi + 28], 0202h
    call sub_100656AA
    cmp cmp eax, ebx
    je sub_1009ED8F
    push push 0200h
    push push edi
    push push edi
    push push 13
    push push 3
    mov mov ecx, eax
    call sub_10083488
    jmp sub_1009EDA5
    xor xor eax, eax
    cmp cmp eax, ebx
    mov mov dword ptr [esi + 32], eax
    je sub_1009EDD9
    push push 64
    call sub_100656D2
    cmp cmp eax, ebx
    je sub_1009EDDB
    push push dword ptr [ebp + 12]
    mov mov ecx, eax
    push push ebx
    push push ebx
    push push 5
    call sub_10083AB8
    jmp sub_1009EDED
    xor xor eax, eax
    cmp cmp eax, ebx
    mov mov dword ptr [esi + 36], eax
    jne sub_1009EE04
    mov mov eax, 08007000Eh
    jmp sub_1009EE39
    mov mov eax, dword ptr [ebp + 32]
    mov mov dword ptr [eax], esi
    xor xor eax, eax
    jmp sub_1009EE42
    test test byte ptr [ebp + 28], 1
    je sub_1009EE45
    mov mov eax, dword ptr [ebp + 12]
    push push dword ptr [eax + 8]
    push push 010114BB8h
    push push 0BBCh
    push push eax
    push push dword ptr [ebp - 4]
    call sub_10099B8D
    add add esp, 20
    xor xor eax, eax
    inc inc eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 32
FUN_1009e0fb ENDP
END
