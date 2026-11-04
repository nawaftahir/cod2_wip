.686
.MODEL FLAT, C
EXTRN sub_1008615F:PROC
EXTRN sub_100861CE:PROC
EXTRN sub_100861E9:PROC
EXTRN sub_100B3356:PROC
EXTRN sub_100B335D:PROC
EXTRN sub_100B3367:PROC
EXTRN sub_100B336F:PROC
EXTRN sub_100B3377:PROC
EXTRN sub_100B337D:PROC
EXTRN sub_100B337F:PROC
EXTRN sub_100B33A0:PROC
EXTRN sub_100B33A4:PROC
EXTRN sub_100B3409:PROC
EXTRN sub_100B3419:PROC
EXTRN sub_100B341F:PROC
EXTRN sub_100B342E:PROC
EXTRN sub_100B3436:PROC
EXTRN sub_100B343E:PROC
EXTRN sub_100BA90A:PROC
EXTRN sub_100BA98A:PROC
EXTRN sub_100BE2B9:PROC
.CODE
FUN_100b3146 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push ebx
    push push esi
    mov mov esi, ecx
    or or dword ptr [esi + 0220h], -1
    or or dword ptr [esi + 0224h], -1
    push push edi
    xor xor edi, edi
    cmp cmp dword ptr [esi + 12], edi
    mov mov dword ptr [ebp - 4], edi
    mov mov ebx, 0FFF00000h
    jbe L1
    mov mov eax, dword ptr [esi + 24]
    lea lea eax, [eax + edi*4]
    mov mov dword ptr [esi + 0FCh], edi
    mov mov ecx, dword ptr [eax]
    mov mov dword ptr [esi + 0100h], ecx
    mov mov dword ptr [esi + 0FCh], edi
    mov mov eax, dword ptr [eax]
    mov mov dword ptr [esi + 0100h], eax
    mov mov eax, dword ptr [eax]
    and and eax, ebx
    cmp cmp eax, 020300000h
    je L0
    cmp cmp eax, 020200000h
    jne L2
    cmp cmp dword ptr [esi + 0220h], -1
    jne L3
    push push 4
    push push 1
    push push 0311h
    push push 01010E914h
    mov mov ecx, esi
    call sub_1008615F
    fldz fldz
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push 0
    push push 0
    push push eax
    mov mov ecx, esi
    mov mov dword ptr [ebp - 8], eax
    call sub_100861CE
    fld1 fld1
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push 1
    push push 0
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    mov mov dword ptr [esi + 0220h], eax
    call sub_100861E9
    mov mov dword ptr [esi + 0224h], eax
    inc inc edi
    cmp cmp edi, dword ptr [esi + 12]
    jb L1
    mov mov ecx, esi
    call sub_100BA90A
    test test byte ptr [esi + 0CCh], 4
    jne sub_100B3356
    xor xor edi, edi
    cmp cmp dword ptr [esi + 12], edi
    jbe sub_100B335D
    mov mov eax, dword ptr [esi + 24]
    mov mov dword ptr [esi + 0FCh], edi
    mov mov eax, dword ptr [eax + edi*4]
    mov mov dword ptr [esi + 0100h], eax
    mov mov eax, dword ptr [eax]
    mov mov ecx, eax
L1:
    and and ecx, ebx
    cmp cmp ecx, 010300000h
    je sub_100B3367
    cmp cmp ecx, 010500000h
    je sub_100B336F
    cmp cmp ecx, 010600000h
    je sub_100B3377
    cmp cmp ecx, 010700000h
    je sub_100B337F
    cmp cmp ecx, 050000000h
    je sub_100B337D
L2:
    mov mov dword ptr [ebp - 4], 1
    jmp sub_100B33A0
L3:
    and and eax, 0FFFFFh
    cmp cmp eax, 2
    jbe sub_100B33A4
    mov mov ecx, esi
    call sub_100BE2B9
    mov mov dword ptr [ebp - 4], eax
    cmp cmp dword ptr [ebp - 4], 0
    jl sub_100B3409
    inc inc edi
    cmp cmp edi, dword ptr [esi + 12]
    jb sub_100B335D
    mov mov ecx, esi
    call sub_100BA98A
    xor xor ecx, ecx
    cmp cmp dword ptr [esi + 8], ecx
    jbe sub_100B3419
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    cmp cmp dword ptr [eax + 84], -1
    jne sub_100B341F
    mov mov edx, dword ptr [eax + 4]
    mov mov edi, dword ptr [esi + 16]
    mov mov edx, dword ptr [edi + edx*4]
    test test byte ptr [edx + 5], 1
    je sub_100B342E
    cmp cmp dword ptr [esi + 0224h], ecx
    je sub_100B3436
    cmp cmp dword ptr [esi + 0220h], ecx
    je sub_100B343E
    mov mov edx, dword ptr [esi + 116]
    mov mov dword ptr [eax + 4], edx
    inc inc ecx
    cmp cmp ecx, dword ptr [esi + 8]
    jb sub_100B3419
    and and dword ptr [ebp - 4], 0
    mov mov eax, dword ptr [ebp - 4]
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100b3146 ENDP
END
