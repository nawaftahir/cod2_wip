.686
.MODEL FLAT, C
EXTRN sub_101074DC:PROC
EXTRN sub_101074E3:PROC
EXTRN sub_101074E5:PROC
EXTRN sub_101074F1:PROC
EXTRN sub_101074F6:PROC
EXTRN sub_10107501:PROC
EXTRN sub_10107540:PROC
EXTRN sub_10107547:PROC
EXTRN sub_1010754B:PROC
EXTRN sub_10107562:PROC
EXTRN sub_1010756B:PROC
EXTRN sub_10107579:PROC
EXTRN sub_10107586:PROC
EXTRN sub_10107588:PROC
EXTRN sub_1010758B:PROC
EXTRN sub_1010759A:PROC
EXTRN sub_101075AB:PROC
EXTRN sub_101075AE:PROC
EXTRN sub_101075B7:PROC
EXTRN sub_101075CC:PROC
EXTRN sub_10107655:PROC
EXTRN sub_10107659:PROC
EXTRN sub_1010765E:PROC
EXTRN sub_1010765F:PROC
EXTRN sub_10107660:PROC
EXTRN sub_10107679:PROC
EXTRN sub_1010768B:PROC
EXTRN sub_101076A5:PROC
EXTRN sub_101076AB:PROC
EXTRN EXTRN fp_1010C080:DWORD:DWORD
EXTRN EXTRN fp_1010C0D0:DWORD:DWORD
EXTRN EXTRN g_1010C080:DWORD:DWORD
EXTRN EXTRN g_101AE1E0:DWORD:DWORD
.CODE
__ValidateEH3RN PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    mov mov ebx, dword ptr [esi + 8]
    test test bl, 3
    jne L0
    mov mov eax, dword ptr fs:[24]
    mov mov dword ptr [ebp + 8], eax
    mov mov eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [eax + 8]
    cmp cmp ebx, ecx
    mov mov dword ptr [ebp - 4], ecx
    jb L1
    cmp cmp ebx, dword ptr [eax + 4]
    jae L2
    xor xor eax, eax
    jmp sub_101074F1
    push push edi
    mov mov edi, dword ptr [esi + 12]
    cmp cmp edi, -1
    jne L3
    xor xor eax, eax
    inc inc eax
L0:
    jmp sub_10107501
    xor xor edx, edx
    mov mov dword ptr [ebp + 8], edx
    mov mov eax, ebx
    mov mov ecx, dword ptr [eax]
    cmp cmp ecx, -1
    je L4
    cmp cmp ecx, edx
    jae L12
    cmp cmp dword ptr [eax + 4], 0
    je L6
    inc inc dword ptr [ebp + 8]
    inc inc edx
    add add eax, 12
    cmp cmp edx, edi
    jbe L5
    cmp cmp dword ptr [ebp + 8], 0
    je L7
    mov mov eax, dword ptr [esi - 8]
    cmp cmp eax, dword ptr [ebp - 4]
    jb L15
    cmp cmp eax, esi
    jae L16
    mov mov eax, dword ptr [g_101AE1E0]
    mov mov edi, ebx
    and and edi, 0FFFFF000h
    xor xor esi, esi
    test test eax, eax
    jle L8
    cmp cmp dword ptr [esi*4 + 0101AE1E8h], edi
    je sub_101074E3
    inc inc esi
    cmp cmp esi, eax
    jl L8
    push push 28
    lea lea eax, [ebp - 32]
    push push eax
    push push ebx
    call dword ptr [fp_1010C0D0]
    test test eax, eax
    je sub_10107579
    cmp cmp dword ptr [ebp - 8], 01000000h
    jne sub_10107586
    test test byte ptr [ebp - 12], 0CCh
    je L13
    mov mov ecx, dword ptr [ebp - 28]
    cmp cmp word ptr [ecx], 05A4Dh
    jne sub_1010759A
    mov mov eax, dword ptr [ecx + 60]
    add add eax, ecx
    cmp cmp dword ptr [eax], 04550h
    jne sub_101075AB
    cmp cmp word ptr [eax + 24], 010Bh
    jne sub_101075B7
    sub sub ebx, ecx
    cmp cmp word ptr [eax + 6], 0
    movzx movzx ecx, word ptr [eax + 20]
    lea lea ecx, [ecx + eax + 24]
    jbe sub_101075CC
    mov mov eax, dword ptr [ecx + 12]
    cmp cmp ebx, eax
    jb sub_101074DC
    mov mov edx, dword ptr [ecx + 8]
    add add edx, eax
    cmp cmp ebx, edx
    jae sub_101074E5
    test test byte ptr [ecx + 39], 080h
    jne sub_10107562
    push push 1
    push push 0101AE228h
    call dword ptr [fp_1010C080]
    test test eax, eax
    jne L9
    mov mov ecx, dword ptr [g_101AE1E0]
    test test ecx, ecx
    mov mov edx, ecx
    jle sub_10107540
    lea lea eax, [ecx*4 + 0101AE1E4h]
    cmp cmp dword ptr [eax], edi
    je sub_1010754B
    dec dec edx
    sub sub eax, 4
    test test edx, edx
    jg sub_10107547
    test test edx, edx
    jne sub_10107588
    push push 15
    pop pop ebx
    cmp cmp ecx, ebx
    jg sub_1010756B
    mov mov ebx, ecx
    xor xor edx, edx
    test test ebx, ebx
    jl sub_1010758B
    lea lea eax, [edx*4 + 0101AE1E8h]
    mov mov esi, dword ptr [eax]
    inc inc edx
    cmp cmp edx, ebx
L9:
    mov mov dword ptr [eax], edi
    mov mov edi, esi
    jle sub_1010758B
    cmp cmp ecx, 16
    jge sub_101075AE
    inc inc ecx
    mov mov dword ptr [g_101AE1E0], ecx
    push push 0
    push push 0101AE228h
    call dword ptr [fp_1010C080]
    jmp L10
    xor xor eax, eax
    jmp sub_10107660
    test test esi, esi
    jle L11
    mov mov ebx, dword ptr [g_1010C080]
    push push 1
    push push 0101AE228h
    call call ebx
    test test eax, eax
    jne L14
    cmp cmp dword ptr [esi*4 + 0101AE1E8h], edi
    je sub_1010765F
    mov mov eax, dword ptr [g_101AE1E0]
    lea lea esi, [eax - 1]
    test test esi, esi
    jl sub_10107659
    cmp cmp dword ptr [esi*4 + 0101AE1E8h], edi
    je sub_1010765E
    dec dec esi
    jns sub_10107655
    test test esi, esi
    jge sub_10107679
    cmp cmp eax, 16
    jge sub_10107679
    inc inc eax
    mov mov dword ptr [g_101AE1E0], eax
    lea lea esi, [eax - 1]
    jmp sub_1010768B
    je sub_101076A5
    xor xor ecx, ecx
L12:
    test test esi, esi
    jl sub_101076AB
    lea lea eax, [ecx*4 + 0101AE1E8h]
    mov mov edx, dword ptr [eax]
    inc inc ecx
    cmp cmp ecx, esi
    mov mov dword ptr [eax], edi
    mov mov edi, edx
    jle sub_101076AB
    push push 0
    push push 0101AE228h
    call call ebx
    jmp sub_101074F6
    or or eax, -1
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
L16:
    ret ret
__ValidateEH3RN ENDP
END
