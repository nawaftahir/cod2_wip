.686
.MODEL FLAT, C
EXTRN sub_10061CFE:PROC
EXTRN sub_100F65E9:PROC
EXTRN sub_100F883A:PROC
.CODE
FUN_10060f60 PROC
    mov eax, 000004000h
    call sub_100F883A
    push esi
    mov esi, ecx
    mov eax, esi
    lea edx, [eax + 1]
L0:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L0
    sub eax, edx
    cmp eax, 000002000h
    jb L1
    push 01019BB7Ch
    push 1
    call sub_10061CFE
    add esp, 8
L1:
    push 92
    push ebx
    call sub_100F65E9
    add esp, 8
    test eax, eax
    jne L15
    push ebp
    push edi
L2:
    cmp byte ptr [esi], 92
    mov ebp, esi
    jne L3
    inc esi
L3:
    mov al, byte ptr [esi]
    cmp al, 92
    lea ecx, [esp + 12]
    je L5
L4:
    test al, al
    je L14
    mov byte ptr [ecx], al
    mov al, byte ptr [esi + 1]
    inc ecx
    inc esi
    cmp al, 92
    jne L4
L5:
    mov al, byte ptr [esi + 1]
    inc esi
    cmp al, 92
    mov byte ptr [ecx], 0
    lea ecx, [esp + 00000200Ch]
    je L7
    lea ecx, [ecx]
L6:
    test al, al
    je L7
    mov byte ptr [ecx], al
    mov al, byte ptr [esi + 1]
    inc ecx
    inc esi
    cmp al, 92
    jne L6
L7:
    mov byte ptr [ecx], 0
    lea edi, [esp + 12]
    mov eax, ebx
L8:
    mov dl, byte ptr [eax]
    mov cl, dl
    cmp dl, byte ptr [edi]
    jne L10
    test cl, cl
    je L9
    mov dl, byte ptr [eax + 1]
    mov cl, dl
    cmp dl, byte ptr [edi + 1]
    jne L10
    add eax, 2
    add edi, 2
    test cl, cl
    jne L8
L9:
    xor eax, eax
    jmp L11
L10:
    sbb eax, eax
    sbb eax, -1
L11:
    test eax, eax
    je L12
    cmp byte ptr [esi], 0
    jne L2
    pop edi
    pop ebp
    pop esi
    add esp, 000004000h
    ret
L12:
    mov edx, ebp
    mov eax, esi
    sub edx, esi
    mov edi, edi
L13:
    mov cl, byte ptr [eax]
    mov byte ptr [edx + eax], cl
    inc eax
    test cl, cl
    jne L13
L14:
    pop edi
    pop ebp
L15:
    pop esi
    add esp, 000004000h
    ret
FUN_10060f60 ENDP
END
