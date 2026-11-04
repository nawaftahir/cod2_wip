.686
.MODEL FLAT, C
EXTRN sub_10060D35:PROC
EXTRN sub_1006105C:PROC
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
    mov eax, 000004000h
    call sub_100F883A
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 00000400Ch]
    mov eax, ebp
    mov ebx, ecx
    lea edx, [eax + 1]
    lea ebx, [ebx]
L0:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L0
    sub eax, edx
    cmp eax, 000002000h
    jb L1
    push 01019BB50h
    call sub_10061CBA
    add esp, 4
    pop ebp
    pop ebx
    add esp, 000004000h
    ret
L1:
    xor edx, edx
    xor ecx, ecx
    push esi
    jmp L2
    lea ecx, [ecx]
L2:
    mov esi, dword ptr [esp + 000004014h]
    mov al, byte ptr [ecx + esi]
    test al, al
    je L4
    cmp al, 92
    je L3
    cmp al, 59
    je L3
    cmp al, 34
    je L3
    mov byte ptr [esp + edx + 12], al
    inc edx
L3:
    inc ecx
    cmp ecx, 000001FFFh
    jl L2
L4:
    push 92
    push ebx
    mov byte ptr [esp + edx + 20], 0
    call sub_100F6635
    add esp, 8
    test eax, eax
    je L5
    push esi
    push ebx
    push 01019BB20h
    call sub_10061D18
    add esp, 12
    pop esi
    pop ebp
    pop ebx
    add esp, 000004000h
    ret
L5:
    push 59
    push ebx
    call sub_100F665D
    add esp, 8
    test eax, eax
    je L6
    push esi
    push ebx
    push 01019BAE8h
    call sub_10061D40
    add esp, 12
    pop esi
    pop ebp
    pop ebx
    add esp, 000004000h
    ret
L6:
    push 34
    push ebx
    call sub_100F6685
    add esp, 8
    test eax, eax
    je L7
    push esi
    push ebx
    push 01019BAB8h
    call sub_10061D68
    add esp, 12
    pop esi
    pop ebp
    pop ebx
    add esp, 000004000h
    ret
L7:
    mov ecx, ebp
    call sub_1006105C
    mov al, byte ptr [esp + 12]
    test al, al
    je L14
    push edi
    lea eax, [esp + 16]
    push eax
    push ebx
    push 01019BAB0h
    mov esi, 000002000h
    lea edi, [esp + 00000201Ch]
    call sub_10060D35
    add esp, 12
    test eax, eax
    jg L8
    push 01019BA68h
    call sub_10061DB6
    add esp, 4
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 000004000h
    ret
L8:
    lea eax, [esp + 000002010h]
    lea edx, [eax + 1]
    mov edi, edi
L9:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L9
    sub eax, edx
    mov edx, eax
    mov eax, ebp
    lea esi, [eax + 1]
L10:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L10
    sub eax, esi
    add eax, edx
    cmp eax, 000000400h
    jbe L11
    mov ecx, dword ptr [esp + 000004018h]
    push ebp
    push ecx
    push ebx
    push 01019BA20h
    call sub_10061E06
    add esp, 16
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 000004000h
    ret
L11:
    lea eax, [esp + 000002010h]
    mov edx, eax
    lea ecx, [ecx]
L12:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L12
    sub eax, edx
    dec ebp
    mov edi, ebp
    lea esp, [esp]
L13:
    mov cl, byte ptr [edi + 1]
    inc edi
    test cl, cl
    jne L13
    mov ecx, eax
    shr ecx, 2
    mov esi, edx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    pop edi
L14:
    pop esi
    pop ebp
    pop ebx
FUN_10061260 ENDP
END
