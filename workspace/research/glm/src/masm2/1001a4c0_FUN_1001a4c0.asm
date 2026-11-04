.686
.MODEL FLAT, C
EXTRN sub_100182F6:PROC
EXTRN sub_1001A7C8:PROC
EXTRN sub_1001A7DC:PROC
EXTRN sub_1001A837:PROC
EXTRN sub_1001A871:PROC
EXTRN sub_1001A990:PROC
EXTRN sub_1001A99E:PROC
EXTRN sub_1001A9D9:PROC
EXTRN sub_1005F41A:PROC
EXTRN sub_1005F4C4:PROC
EXTRN sub_1005F4F6:PROC
EXTRN sub_1005F51E:PROC
EXTRN sub_1005F5F6:PROC
EXTRN sub_10060C68:PROC
EXTRN sub_10060C80:PROC
EXTRN sub_10060CA6:PROC
EXTRN sub_10061DBD:PROC
EXTRN sub_10062C53:PROC
EXTRN sub_100EFF90:PROC
EXTRN sub_100F00B8:PROC
EXTRN sub_100F6281:PROC
EXTRN sub_100F6290:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
.CODE
FUN_1001a4c0 PROC
    sub sub esp, 124
    mov mov eax, dword ptr [esp + 084h]
    push push ebx
    xor xor ebx, ebx
    push push ebp
    push push esi
    cmp cmp eax, ebx
    mov mov eax, dword ptr [esp + 094h]
    push push edi
    mov mov dword ptr [esp + 28], 0101948ECh
    mov mov dword ptr [esp + 44], 01019520Ch
    mov mov dword ptr [esp + 48], 01019166Eh
    mov mov dword ptr [esp + 52], ebx
    mov mov dword ptr [esp + 56], ebx
    lea lea edi, [esp + 60]
    mov mov esi, 16
    mov mov ecx, 10
    cdq cdq
    jne L0
    idiv idiv ecx
    push push edx
    push push eax
    push push 010195200h
    call sub_10060C68
    mov mov dword ptr [esp + 44], 0101951F8h
    jmp L1
    idiv idiv ecx
    push push edx
    push push eax
    push push 0101951ECh
    call sub_10060C80
    mov mov dword ptr [esp + 44], 0101951E4h
    mov mov ebp, dword ptr [esp + 09Ch]
    add add esp, 12
    push push ebp
    push push 0101951CCh
    mov mov esi, 64
    lea lea edi, [esp + 84]
    call sub_10060CA6
    lea lea edx, [esp + 44]
    push push edx
    lea lea eax, [esp + 52]
    push push eax
    push push ebp
    call sub_100182F6
    add add esp, 20
    test test al, al
    jne L2
    mov mov ecx, edi
    push push ecx
    push push 0101951ACh
    call sub_1005F41A
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor eax, eax
    pop pop ebx
    add add esp, 124
    ret ret
    lea lea edx, [esp + 20]
    push push edx
    lea lea eax, [esp + 28]
    push push eax
    mov mov eax, dword ptr [esp + 40]
    lea lea ecx, [esp + 24]
    push push ecx
L1:
    push push ebx
    lea lea edx, [esp + 76]
    push push edx
    push push eax
    mov mov eax, dword ptr [esp + 60]
    lea lea ecx, [esp + 52]
    push push ecx
    mov mov ecx, dword ptr [esp + 68]
    lea lea edx, [esp + 72]
    push push edx
    push push eax
    push push ecx
    call sub_10062C53
    mov mov esi, eax
    fnclex fnclex
    push push 030000h
    push push 020000h
    call sub_100F6281
    push push 08001Fh
    push push 08001Fh
    call sub_100F6290
    mov mov eax, dword ptr [esp + 40]
    add add esp, 16
    cmp cmp eax, ebx
    je L3
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx + 12]
    push push eax
    lea lea eax, [esp + 80]
    push push eax
    push push 01019518Ch
    call sub_10061DBD
    mov mov eax, dword ptr [esp + 36]
    mov mov ecx, dword ptr [eax]
    add add esp, 12
    push push eax
    call call dword ptr [ecx + 8]
    cmp cmp esi, ebx
    jge L4
    push push esi
    call sub_100EFF90
    push push eax
    lea lea edx, [esp + 80]
    push push edx
    push push 010195170h
    call sub_1005F4C4
    add add esp, 12
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor eax, eax
    pop pop ebx
    add add esp, 124
    ret ret
    mov mov eax, dword ptr [esp + 16]
    cmp cmp eax, ebx
    jne sub_1001A7DC
    mov mov eax, dword ptr [esp + 20]
    cmp cmp eax, ebx
    je sub_1001A7C8
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    lea lea edx, [esp + 76]
    push push edx
    push push 010195148h
    call sub_1005F4F6
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor eax, eax
    pop pop ebx
    add add esp, 124
    ret ret
    cmp cmp dword ptr [esp + 20], ebx
    mov mov ecx, dword ptr [eax]
    push push eax
    jne sub_1001A837
    call call dword ptr [ecx + 8]
    lea lea edx, [esp + 76]
    push push edx
    push push 010195120h
    call sub_1005F51E
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor eax, eax
    pop pop ebx
    add add esp, 124
    ret ret
    call call dword ptr [ecx + 16]
    mov mov ebx, eax
    mov mov eax, ebp
    lea lea esi, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne sub_1001A871
    sub sub eax, esi
    lea lea esi, [eax + 1]
    lea lea edx, [esi + ebx + 16]
    push push edx
    call dword ptr [fp_101D49D4]
    mov mov ebp, eax
    mov mov ecx, esi
    mov mov esi, dword ptr [esp + 094h]
    mov mov edx, ecx
    shr shr ecx, 2
    lea lea eax, [ebp + 16]
    mov mov dword ptr [ebp + 4], eax
    lea lea edi, [ebx + ebp + 16]
    mov mov dword ptr [ebp], edi
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov eax, dword ptr [esp + 20]
    mov mov ecx, dword ptr [eax]
    add add esp, 4
    push push eax
    call call dword ptr [ecx + 12]
    mov mov edi, dword ptr [ebp + 4]
    mov mov ecx, ebx
    mov mov edx, ecx
    shr shr ecx, 2
    mov mov esi, eax
    mov mov al, byte ptr [esp + 094h]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov cl, byte ptr [esp + 098h]
    mov mov byte ptr [ebp + 11], cl
    lea lea ecx, [ebp + 12]
    push push ecx
    mov mov ecx, dword ptr [ebp + 4]
    shr shr bx, 2
    mov mov word ptr [ebp + 8], bx
    mov mov byte ptr [ebp + 10], al
    test test al, al
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push ecx
    push push eax
    jne sub_1001A990
    call call dword ptr [edx + 016Ch]
    jmp sub_1001A99E
    call call dword ptr [edx + 01A8h]
    test test eax, eax
    jge sub_1001A9D9
    push push eax
    call sub_100F00B8
    mov mov edx, dword ptr [esp + 32]
    push push eax
    push push edx
    lea lea eax, [esp + 68]
    push push eax
    lea lea ecx, [esp + 88]
    push push ecx
    push push 0101950F4h
    call sub_1005F5F6
    add add esp, 20
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor eax, eax
    pop pop ebx
    add add esp, 124
    ret ret
    mov mov eax, dword ptr [esp + 16]
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx + 8]
    mov mov eax, dword ptr [esp + 20]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    pop pop edi
    pop pop esi
    mov mov eax, ebp
    pop pop ebp
    pop pop ebx
    add add esp, 124
    ret ret
FUN_1001a4c0 ENDP
END
