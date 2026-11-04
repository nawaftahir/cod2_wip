.686
.MODEL FLAT, C
EXTRN sub_10060D35:PROC
EXTRN sub_1006105C:PROC
EXTRN sub_10061431:PROC
EXTRN sub_100614D0:PROC
EXTRN sub_10061507:PROC
EXTRN sub_10061527:PROC
EXTRN sub_10061531:PROC
EXTRN sub_10061566:PROC
EXTRN sub_100615A7:PROC
EXTRN sub_100615C8:PROC
EXTRN sub_10061CBA:PROC
EXTRN sub_10061D18:PROC
EXTRN sub_10061D40:PROC
EXTRN sub_10061D68:PROC
EXTRN sub_10061DB6:PROC
EXTRN sub_10061E06:PROC
EXTRN sub_100F6635:PROC
EXTRN sub_100F665D:PROC
EXTRN sub_100F6685:PROC
EXTRN sub_100F883A:PROC
.CODE
FUN_10061260 PROC
    mov mov eax, 04000h
    call sub_100F883A
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 0400Ch]
    mov mov eax, ebp
    mov mov ebx, ecx
    lea lea edx, [eax + 1]
    lea lea ebx, [ebx]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne L0
    sub sub eax, edx
    cmp cmp eax, 02000h
    jb L1
    push push 01019BB50h
    call sub_10061CBA
    add add esp, 4
    pop pop ebp
    pop pop ebx
    add add esp, 04000h
    ret ret
    xor xor edx, edx
    xor xor ecx, ecx
    push push esi
    jmp L2
    lea lea ecx, [ecx]
    mov mov esi, dword ptr [esp + 04014h]
    mov mov al, byte ptr [ecx + esi]
    test test al, al
    je L6
    cmp cmp al, 92
    je L4
    cmp cmp al, 59
    je L5
    cmp cmp al, 34
    je L7
    mov mov byte ptr [esp + edx + 12], al
    inc inc edx
    inc inc ecx
    cmp cmp ecx, 01FFFh
L1:
    jl L3
    push push 92
    push push ebx
    mov mov byte ptr [esp + edx + 20], 0
    call sub_100F6635
    add add esp, 8
    test test eax, eax
    je L8
    push push esi
    push push ebx
    push push 01019BB20h
    call sub_10061D18
    add add esp, 12
    pop pop esi
    pop pop ebp
L2:
    pop pop ebx
    add add esp, 04000h
    ret ret
    push push 59
    push push ebx
    call sub_100F665D
    add add esp, 8
    test test eax, eax
    je L9
    push push esi
    push push ebx
    push push 01019BAE8h
    call sub_10061D40
    add add esp, 12
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 04000h
    ret ret
    push push 34
    push push ebx
    call sub_100F6685
L5:
    add add esp, 8
    test test eax, eax
    je sub_10061431
    push push esi
    push push ebx
    push push 01019BAB8h
    call sub_10061D68
    add add esp, 12
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 04000h
    ret ret
    mov mov ecx, ebp
    call sub_1006105C
    mov mov al, byte ptr [esp + 12]
    test test al, al
    je sub_10061531
    push push edi
    lea lea eax, [esp + 16]
    push push eax
    push push ebx
    push push 01019BAB0h
    mov mov esi, 02000h
    lea lea edi, [esp + 0201Ch]
    call sub_10060D35
    add add esp, 12
    test test eax, eax
    jg sub_100614D0
    push push 01019BA68h
L8:
    call sub_10061DB6
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 04000h
    ret ret
    lea lea eax, [esp + 02010h]
    lea lea edx, [eax + 1]
    mov mov edi, edi
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne sub_10061507
    sub sub eax, edx
    mov mov edx, eax
    mov mov eax, ebp
    lea lea esi, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne sub_10061527
    sub sub eax, esi
    add add eax, edx
    cmp cmp eax, 0400h
    jbe sub_10061566
    mov mov ecx, dword ptr [esp + 04018h]
    push push ebp
    push push ecx
    push push ebx
    push push 01019BA20h
L9:
    call sub_10061E06
    add add esp, 16
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 04000h
    ret ret
    lea lea eax, [esp + 02010h]
    mov mov edx, eax
    lea lea ecx, [ecx]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne sub_100615A7
    sub sub eax, edx
    dec dec ebp
    mov mov edi, ebp
    lea lea esp, [esp]
    mov mov cl, byte ptr [edi + 1]
    inc inc edi
    test test cl, cl
    jne sub_100615C8
    mov mov ecx, eax
    shr shr ecx, 2
    mov mov esi, edx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
FUN_10061260 ENDP
END
