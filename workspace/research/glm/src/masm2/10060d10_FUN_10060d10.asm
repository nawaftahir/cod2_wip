.686
.MODEL FLAT, C
EXTRN sub_10060A0A:PROC
EXTRN sub_10060E01:PROC
EXTRN sub_10060E10:PROC
EXTRN sub_10060E18:PROC
EXTRN sub_10060E3D:PROC
EXTRN sub_10060E4B:PROC
EXTRN sub_10060E4F:PROC
EXTRN sub_10060E53:PROC
EXTRN sub_10060E99:PROC
EXTRN sub_10060EA4:PROC
EXTRN sub_10061D1C:PROC
EXTRN sub_100F883A:PROC
EXTRN EXTRN g_1076A838:DWORD:DWORD
.CODE
FUN_10060d10 PROC
    mov mov eax, 02000h
    call sub_100F883A
    push push ebp
    mov mov ebp, dword ptr [esp + 02008h]
    push push esi
    mov mov esi, ecx
    test test esi, esi
    je sub_10060E10
    test test ebp, ebp
    je sub_10060E18
    mov mov eax, esi
    lea lea edx, [eax + 1]
    lea lea ebx, [ebx]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne L0
    sub sub eax, edx
    cmp cmp eax, 02000h
    jb L1
    push push 01019BBD0h
    push push 1
    call sub_10061D1C
    add add esp, 8
    mov mov al, byte ptr [esi]
    push push ebx
    mov mov ebx, dword ptr [g_1076A838]
    xor xor ebx, 1
    cmp cmp al, 92
    mov mov dword ptr [g_1076A838], ebx
    jne L2
    inc inc esi
    push push edi
L0:
    mov mov al, byte ptr [esi]
    cmp cmp al, 92
    lea lea ecx, [esp + 16]
    je sub_10060E01
    test test al, al
    je sub_10060E4B
    mov mov byte ptr [ecx], al
    mov mov al, byte ptr [esi + 1]
    inc inc ecx
    inc inc esi
    cmp cmp al, 92
    jne sub_10060E01
    mov mov al, byte ptr [esi + 1]
    inc inc esi
    mov mov edi, ebx
    shl shl edi, 13
    add add edi, 010766808h
L1:
    cmp cmp al, 92
    mov mov byte ptr [ecx], 0
    mov mov ecx, edi
    je sub_10060E4F
    test test al, al
    je sub_10060E53
    mov mov byte ptr [ecx], al
    mov mov al, byte ptr [esi + 1]
    inc inc ecx
    inc inc esi
    cmp cmp al, 92
    jne sub_10060E4F
    mov mov byte ptr [ecx], 0
    mov mov eax, 07FFFFFFFh
    lea lea ecx, [esp + 16]
    mov mov edx, ebp
    call sub_10060A0A
    test test eax, eax
    je sub_10060EA4
    cmp cmp byte ptr [esi], 0
    je sub_10060E99
    inc inc esi
    jmp sub_10060E3D
    pop pop edi
    pop pop ebx
    pop pop esi
    mov mov eax, 01019166Eh
    pop pop ebp
    add add esp, 02000h
    ret ret
    mov mov eax, edi
    pop pop edi
    pop pop ebx
    pop pop esi
    pop pop ebp
    add add esp, 02000h
    ret ret
    pop pop esi
    mov mov eax, 01019166Eh
    pop pop ebp
    add add esp, 02000h
    ret ret
FUN_10060d10 ENDP
END
