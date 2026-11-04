.686
.MODEL FLAT, C
EXTRN sub_10063862:PROC
EXTRN sub_10067A18:PROC
EXTRN sub_10068261:PROC
EXTRN sub_1006828B:PROC
EXTRN sub_10068546:PROC
EXTRN sub_10068553:PROC
EXTRN sub_10068565:PROC
EXTRN sub_10068577:PROC
EXTRN sub_1006857C:PROC
EXTRN sub_10068583:PROC
EXTRN sub_1006858C:PROC
EXTRN sub_100685A1:PROC
EXTRN sub_100685AA:PROC
EXTRN sub_100685B1:PROC
EXTRN sub_100685B6:PROC
EXTRN sub_100685D7:PROC
EXTRN sub_100685E4:PROC
EXTRN sub_100685EF:PROC
EXTRN sub_1006861A:PROC
EXTRN sub_10068628:PROC
EXTRN sub_100F8573:PROC
EXTRN sub_100F8585:PROC
.CODE
FUN_1006842e PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 44
    push push ebx
    mov mov ebx, ecx
    test test byte ptr [ebx + 40], 2
    jne L0
    xor xor eax, eax
    jmp sub_10068546
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    push push edi
    lea lea edi, [esi + 1]
    cmp cmp edi, dword ptr [ebx + 4]
    jae sub_10068553
L0:
    movsx movsx eax, byte ptr [esi]
    push push eax
    call sub_100F8573
    test test eax, eax
    pop pop ecx
    je sub_10068565
    movsx movsx eax, byte ptr [edi]
    push push eax
    call sub_100F8585
    test test eax, eax
    pop pop ecx
    je sub_10068577
    lea lea edi, [esi + 2]
    cmp cmp edi, dword ptr [ebx + 4]
    jae sub_10068583
    cmp cmp byte ptr [edi], 46
    jne sub_1006858C
    lea lea eax, [ebp + 8]
    push push eax
    inc inc edi
    push push edi
    mov mov ecx, ebx
    call sub_10068261
    test test eax, eax
    je sub_100685A1
    cmp cmp dword ptr [ebp + 8], 0FFh
    ja sub_100685AA
    add add edi, eax
    cmp cmp edi, dword ptr [ebx + 4]
    jae sub_100685B1
    cmp cmp byte ptr [edi], 46
    jne sub_100685B6
    lea lea eax, [ebp + 8]
    push push eax
    inc inc edi
    push push edi
    mov mov ecx, ebx
    call sub_1006828B
    test test eax, eax
    jne sub_1006857C
    lea lea eax, [ebp + 8]
    push push eax
    push push edi
    mov mov ecx, ebx
    call sub_10067A18
    test test eax, eax
    je sub_100685D7
    and and dword ptr [ebp + 8], 0
    cmp cmp dword ptr [ebp + 8], 0FFh
    ja sub_100685E4
    add add edi, eax
    mov mov ebx, edi
    sub sub ebx, esi
    cmp cmp ebx, 32
    jae sub_100685EF
    mov mov ecx, ebx
    mov mov eax, ecx
    shr shr ecx, 2
    lea lea edi, [ebp - 44]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    lea lea eax, [ebp - 12]
    push push eax
    and and ecx, 3
    push push 1
    lea lea eax, [ebp - 44]
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    push push eax
    mov mov byte ptr [ebp + ebx - 44], 0
    call sub_10063862
    test test eax, eax
    jl sub_1006861A
    mov mov eax, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov dword ptr [eax], ecx
    mov mov eax, ebx
    jmp sub_10068628
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
FUN_1006842e ENDP
END
