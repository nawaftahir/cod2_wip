.686
.MODEL FLAT, C
EXTRN sub_10060A0A:PROC
EXTRN sub_10061D1C:PROC
EXTRN sub_100F883A:PROC
EXTRN g_1076A838:DWORD
.CODE
FUN_10060d10 PROC
    mov eax, 000002000h
    call sub_100F883A
    push ebp
    mov ebp, dword ptr [esp + 000002008h]
    push esi
    mov esi, ecx
    test esi, esi
    je L10
    test ebp, ebp
    je L10
    mov eax, esi
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
    push 01019BBD0h
    push 1
    call sub_10061D1C
    add esp, 8
L1:
    mov al, byte ptr [esi]
    push ebx
    mov ebx, dword ptr [g_1076A838]
    xor ebx, 1
    cmp al, 92
    mov dword ptr [g_1076A838], ebx
    jne L2
    inc esi
L2:
    push edi
L3:
    mov al, byte ptr [esi]
    cmp al, 92
    lea ecx, [esp + 16]
    je L5
L4:
    test al, al
    je L8
    mov byte ptr [ecx], al
    mov al, byte ptr [esi + 1]
    inc ecx
    inc esi
    cmp al, 92
    jne L4
L5:
    mov al, byte ptr [esi + 1]
    inc esi
    mov edi, ebx
    shl edi, 13
    add edi, 010766808h
    cmp al, 92
    mov byte ptr [ecx], 0
    mov ecx, edi
    je L7
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
    mov eax, 07FFFFFFFh
    lea ecx, [esp + 16]
    mov edx, ebp
    call sub_10060A0A
    test eax, eax
    je L9
    cmp byte ptr [esi], 0
    je L8
    inc esi
    jmp L3
L8:
    pop edi
    pop ebx
    pop esi
    mov eax, 01019166Eh
    pop ebp
    add esp, 000002000h
    ret
L9:
    mov eax, edi
    pop edi
    pop ebx
    pop esi
    pop ebp
    add esp, 000002000h
    ret
L10:
    pop esi
    mov eax, 01019166Eh
    pop ebp
    add esp, 000002000h
    ret
FUN_10060d10 ENDP
END
