.686
.MODEL FLAT, C
EXTRN sub_1008642B:PROC
EXTRN sub_100864B9:PROC
EXTRN sub_10087064:PROC
EXTRN sub_100870EE:PROC
EXTRN sub_1008B2C8:PROC
EXTRN sub_1008D795:PROC
EXTRN sub_100B6684:PROC
EXTRN sub_100B767C:PROC
EXTRN sub_100B7F22:PROC
EXTRN sub_100B7F71:PROC
EXTRN sub_100B7F77:PROC
EXTRN sub_100B7F79:PROC
EXTRN sub_100B7F89:PROC
EXTRN sub_100B7FB8:PROC
EXTRN sub_100B7FFF:PROC
EXTRN sub_100B8014:PROC
EXTRN sub_100B8059:PROC
EXTRN sub_100B8071:PROC
EXTRN sub_100B8074:PROC
EXTRN sub_100B8077:PROC
EXTRN sub_100B807F:PROC
EXTRN sub_100B8091:PROC
EXTRN sub_100B80CB:PROC
EXTRN sub_100B80F8:PROC
EXTRN sub_100B80FE:PROC
EXTRN sub_100B8117:PROC
EXTRN sub_100B8124:PROC
EXTRN sub_100B8128:PROC
EXTRN sub_100B8135:PROC
EXTRN sub_100B8147:PROC
EXTRN sub_100BA8B7:PROC
EXTRN sub_100BA8EF:PROC
EXTRN sub_100BA935:PROC
EXTRN sub_100BAAAC:PROC
EXTRN sub_100BAD57:PROC
EXTRN sub_100BB344:PROC
EXTRN sub_100BB3BA:PROC
EXTRN sub_100BE2C1:PROC
EXTRN sub_100C7A74:PROC
.CODE
FUN_100b7c5d PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push ebx
    push push esi
    push push edi
    mov mov esi, ecx
    xor xor edi, edi
    cmp cmp dword ptr [esi + 92], edi
    mov mov ebx, 0FFF00000h
    je L0
    cmp cmp dword ptr [esi + 12], edi
    mov mov dword ptr [esi + 0FCh], edi
    jbe L1
    mov mov eax, dword ptr [esi + 0FCh]
    mov mov ecx, dword ptr [esi + 24]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov dword ptr [esi + 0100h], eax
    mov mov eax, dword ptr [eax]
    and and eax, ebx
    cmp cmp eax, 020800000h
    jne L2
    mov mov ecx, esi
    call sub_100BAD57
    test test eax, eax
    jl sub_100B7F22
    xor xor ecx, ecx
    test test eax, eax
    sete sete cl
    or or edi, ecx
    inc inc dword ptr [esi + 0FCh]
    mov mov eax, dword ptr [esi + 0FCh]
    cmp cmp eax, dword ptr [esi + 12]
    jb L0
    test test edi, edi
    je L3
    mov mov ecx, esi
    call sub_100BA8B7
    test test byte ptr [esi + 0CCh], 4
    jne L8
    xor xor edi, edi
    cmp cmp dword ptr [esi + 12], edi
    jbe L4
    mov mov eax, dword ptr [esi + 24]
    mov mov dword ptr [esi + 0FCh], edi
    mov mov eax, dword ptr [eax + edi*4]
    mov mov ecx, esi
    mov mov dword ptr [esi + 0100h], eax
    call sub_100B767C
    test test eax, eax
    jne L5
    mov mov ecx, esi
    call sub_100BA8EF
    inc inc edi
    cmp cmp edi, dword ptr [esi + 12]
    jb L4
    xor xor edi, edi
    cmp cmp dword ptr [esi + 12], edi
    jbe L6
    mov mov eax, dword ptr [esi + 24]
    mov mov dword ptr [esi + 0FCh], edi
    mov mov eax, dword ptr [eax + edi*4]
    mov mov dword ptr [esi + 0100h], eax
    mov mov eax, dword ptr [eax]
    and and eax, ebx
    cmp cmp eax, 050000000h
    jne L7
    mov mov ecx, esi
    call sub_100B6684
    test test eax, eax
    jl sub_100B7FB8
    inc inc edi
    cmp cmp edi, dword ptr [esi + 12]
    jb L6
    mov mov ecx, esi
    call sub_100BA935
    xor xor edi, edi
    cmp cmp dword ptr [esi + 12], edi
    jbe L9
    mov mov eax, dword ptr [esi + 24]
    mov mov dword ptr [esi + 0FCh], edi
    mov mov eax, dword ptr [eax + edi*4]
    mov mov dword ptr [esi + 0100h], eax
    mov mov eax, dword ptr [eax]
    and and eax, ebx
    cmp cmp eax, 010300000h
    je L10
    cmp cmp eax, 010500000h
    je L11
    cmp cmp eax, 010600000h
    je L12
    cmp cmp eax, 010700000h
    je L13
    cmp cmp eax, 050000000h
    jne L14
    mov mov ecx, esi
    call sub_100BE2C1
    test test eax, eax
    jl sub_100B8014
    inc inc edi
    cmp cmp edi, dword ptr [esi + 12]
    jb L9
    cmp cmp dword ptr [esi + 48], 0
    je sub_100B7FFF
L5:
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [ebp - 8], 16
    jae sub_100B7F89
    mov mov ebx, dword ptr [esi + 12]
    xor xor edi, edi
    test test ebx, ebx
    mov mov dword ptr [ebp - 4], 1
    jbe sub_100B7F77
    mov mov eax, dword ptr [esi + 24]
    mov mov eax, dword ptr [eax + edi*4]
    mov mov ecx, esi
    mov mov dword ptr [esi + 0100h], eax
    call sub_100BB344
    test test eax, eax
    jl sub_100B8059
    jne sub_100B7F71
    and and dword ptr [ebp - 4], 0
    push push dword ptr [esi + 0100h]
    mov mov ecx, esi
    call sub_1008642B
    test test eax, eax
    jl sub_100B8074
    mov mov eax, dword ptr [esi + 0100h]
    and and dword ptr [eax], 0
    inc inc edi
    cmp cmp edi, ebx
    jb sub_100B7F77
    mov mov ecx, esi
    call sub_10087064
    test test eax, eax
    jl sub_100B8091
    inc inc dword ptr [ebp - 8]
    cmp cmp dword ptr [ebp - 4], 0
    je sub_100B7F79
    cmp cmp dword ptr [ebp - 8], 16
    jb sub_100B807F
    mov mov ebx, dword ptr [esi + 12]
    xor xor edi, edi
    test test ebx, ebx
    mov mov dword ptr [ebp - 4], 1
    jbe sub_100B8077
    mov mov eax, dword ptr [esi + 24]
    mov mov eax, dword ptr [eax + edi*4]
    mov mov ecx, esi
    mov mov dword ptr [esi + 0100h], eax
    call sub_100BB3BA
    test test eax, eax
    jl sub_100B80CB
    jne sub_100B8071
    mov mov eax, dword ptr [esi + 0100h]
    push push 010115C5Ch
    push push 011C9h
    push push dword ptr [eax + 60]
    push push esi
    call sub_1008B2C8
    add add esp, 16
    and and dword ptr [ebp - 4], 0
    push push dword ptr [esi + 0100h]
    mov mov ecx, esi
    call sub_100864B9
    test test eax, eax
    jl sub_100B80FE
    mov mov eax, dword ptr [esi + 0100h]
    and and dword ptr [eax], 0
    inc inc edi
    cmp cmp edi, ebx
    jb sub_100B8077
    mov mov ecx, esi
    call sub_100870EE
L9:
    test test eax, eax
    jl sub_100B8117
    cmp cmp dword ptr [ebp - 4], 0
L10:
    jne sub_100B80F8
    mov mov eax, 080004005h
L11:
    jmp sub_100B8124
    cmp cmp dword ptr [esi + 96], 0
    je sub_100B8128
    mov mov ecx, esi
    call sub_100C7A74
    test test eax, eax
    jl sub_100B8135
    mov mov ecx, esi
    call sub_100BAAAC
    mov mov ecx, esi
    call sub_1008D795
    test test eax, eax
    jl sub_100B8147
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100b7c5d ENDP
END
