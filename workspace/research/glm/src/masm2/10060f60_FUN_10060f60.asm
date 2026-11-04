.686
.MODEL FLAT, C
EXTRN sub_1006106C:PROC
EXTRN sub_1006106F:PROC
EXTRN sub_10061073:PROC
EXTRN sub_10061074:PROC
EXTRN sub_10061090:PROC
EXTRN sub_100610AA:PROC
EXTRN sub_100610B0:PROC
EXTRN sub_100610BC:PROC
EXTRN sub_100610CA:PROC
EXTRN sub_100610DD:PROC
EXTRN sub_100610FD:PROC
EXTRN sub_1006112A:PROC
EXTRN sub_10061CFE:PROC
EXTRN sub_100F65E9:PROC
EXTRN sub_100F883A:PROC
.CODE
FUN_10060f60 PROC
    mov mov eax, 04000h
    call sub_100F883A
    push push esi
    mov mov esi, ecx
    mov mov eax, esi
    lea lea edx, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne L0
    sub sub eax, edx
    cmp cmp eax, 02000h
    jb L1
    push push 01019BB7Ch
    push push 1
    call sub_10061CFE
    add add esp, 8
    push push 92
    push push ebx
    call sub_100F65E9
    add add esp, 8
    test test eax, eax
    jne sub_10061090
    push push ebp
    push push edi
    cmp cmp byte ptr [esi], 92
    mov mov ebp, esi
    jne L2
    inc inc esi
    mov mov al, byte ptr [esi]
    cmp cmp al, 92
    lea lea ecx, [esp + 12]
    je L3
    test test al, al
    je sub_100610AA
    mov mov byte ptr [ecx], al
    mov mov al, byte ptr [esi + 1]
    inc inc ecx
    inc inc esi
    cmp cmp al, 92
    jne L3
    mov mov al, byte ptr [esi + 1]
    inc inc esi
    cmp cmp al, 92
    mov mov byte ptr [ecx], 0
    lea lea ecx, [esp + 0200Ch]
    je sub_1006106C
    lea lea ecx, [ecx]
    test test al, al
    je sub_10061073
    mov mov byte ptr [ecx], al
    mov mov al, byte ptr [esi + 1]
    inc inc ecx
    inc inc esi
    cmp cmp al, 92
    jne sub_1006106F
    mov mov byte ptr [ecx], 0
    lea lea edi, [esp + 12]
    mov mov eax, ebx
    mov mov dl, byte ptr [eax]
    mov mov cl, dl
    cmp cmp dl, byte ptr [edi]
    jne sub_100610BC
    test test cl, cl
    je sub_100610BC
    mov mov dl, byte ptr [eax + 1]
    mov mov cl, dl
    cmp cmp dl, byte ptr [edi + 1]
    jne sub_100610CA
    add add eax, 2
    add add edi, 2
    test test cl, cl
    jne sub_100610B0
    xor xor eax, eax
    jmp sub_100610DD
    sbb sbb eax, eax
    sbb sbb eax, -1
    test test eax, eax
L3:
    je sub_100610FD
    cmp cmp byte ptr [esi], 0
    jne sub_10061074
    pop pop edi
    pop pop ebp
    pop pop esi
    add add esp, 04000h
    ret ret
    mov mov edx, ebp
    mov mov eax, esi
    sub sub edx, esi
    mov mov edi, edi
    mov mov cl, byte ptr [eax]
    mov mov byte ptr [edx + eax], cl
    inc inc eax
    test test cl, cl
    jne sub_1006112A
    pop pop edi
    pop pop ebp
    pop pop esi
    add add esp, 04000h
    ret ret
FUN_10060f60 ENDP
END
