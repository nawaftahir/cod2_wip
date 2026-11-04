.686
.MODEL FLAT, C
EXTRN sub_100182F6:PROC
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
EXTRN fp_101D49D4:DWORD
EXTRN g_101D1BF8:DWORD
.CODE
FUN_1001a4c0 PROC
    sub esp, 124
    mov eax, dword ptr [esp + 000000084h]
    push ebx
    xor ebx, ebx
    push ebp
    push esi
    cmp eax, ebx
    mov eax, dword ptr [esp + 000000094h]
    push edi
    mov dword ptr [esp + 28], 0101948ECh
    mov dword ptr [esp + 44], 01019520Ch
    mov dword ptr [esp + 48], 01019166Eh
    mov dword ptr [esp + 52], ebx
    mov dword ptr [esp + 56], ebx
    lea edi, [esp + 60]
    mov esi, 16
    mov ecx, 10
    cdq
    jne L0
    idiv ecx
    push edx
    push eax
    push 010195200h
    call sub_10060C68
    mov dword ptr [esp + 44], 0101951F8h
    jmp L1
L0:
    idiv ecx
    push edx
    push eax
    push 0101951ECh
    call sub_10060C80
    mov dword ptr [esp + 44], 0101951E4h
L1:
    mov ebp, dword ptr [esp + 00000009Ch]
    add esp, 12
    push ebp
    push 0101951CCh
    mov esi, 64
    lea edi, [esp + 84]
    call sub_10060CA6
    lea edx, [esp + 44]
    push edx
    lea eax, [esp + 52]
    push eax
    push ebp
    call sub_100182F6
    add esp, 20
    test al, al
    jne L2
    mov ecx, edi
    push ecx
    push 0101951ACh
    call sub_1005F41A
    add esp, 8
    pop edi
    pop esi
    pop ebp
    xor eax, eax
    pop ebx
    add esp, 124
    ret
L2:
    lea edx, [esp + 20]
    push edx
    lea eax, [esp + 28]
    push eax
    mov eax, dword ptr [esp + 40]
    lea ecx, [esp + 24]
    push ecx
    push ebx
    lea edx, [esp + 76]
    push edx
    push eax
    mov eax, dword ptr [esp + 60]
    lea ecx, [esp + 52]
    push ecx
    mov ecx, dword ptr [esp + 68]
    lea edx, [esp + 72]
    push edx
    push eax
    push ecx
    call sub_10062C53
    mov esi, eax
    fnclex
    push 000030000h
    push 000020000h
    call sub_100F6281
    push 00008001Fh
    push 00008001Fh
    call sub_100F6290
    mov eax, dword ptr [esp + 40]
    add esp, 16
    cmp eax, ebx
    je L3
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 0xc]
    push eax
    lea eax, [esp + 80]
    push eax
    push 01019518Ch
    call sub_10061DBD
    mov eax, dword ptr [esp + 36]
    mov ecx, dword ptr [eax]
    add esp, 12
    push eax
    call dword ptr [ecx + 8]
L3:
    cmp esi, ebx
    jge L4
    push esi
    call sub_100EFF90
    push eax
    lea edx, [esp + 80]
    push edx
    push 010195170h
    call sub_1005F4C4
    add esp, 12
    pop edi
    pop esi
    pop ebp
    xor eax, eax
    pop ebx
    add esp, 124
    ret
L4:
    mov eax, dword ptr [esp + 16]
    cmp eax, ebx
    jne L6
    mov eax, dword ptr [esp + 20]
    cmp eax, ebx
    je L5
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
L5:
    lea edx, [esp + 76]
    push edx
    push 010195148h
    call sub_1005F4F6
    add esp, 8
    pop edi
    pop esi
    pop ebp
    xor eax, eax
    pop ebx
    add esp, 124
    ret
L6:
    cmp dword ptr [esp + 20], ebx
    mov ecx, dword ptr [eax]
    push eax
    jne L7
    call dword ptr [ecx + 8]
    lea edx, [esp + 76]
    push edx
    push 010195120h
    call sub_1005F51E
    add esp, 8
    pop edi
    pop esi
    pop ebp
    xor eax, eax
    pop ebx
    add esp, 124
    ret
L7:
    call dword ptr [ecx + 0x10]
    mov ebx, eax
    mov eax, ebp
    lea esi, [eax + 1]
L8:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L8
    sub eax, esi
    lea esi, [eax + 1]
    lea edx, [esi + ebx + 16]
    push edx
    call dword ptr [fp_101D49D4]
    mov ebp, eax
    mov ecx, esi
    mov esi, dword ptr [esp + 000000094h]
    mov edx, ecx
    shr ecx, 2
    lea eax, [ebp + 16]
    mov dword ptr [ebp + 4], eax
    lea edi, [ebx + ebp + 16]
    mov dword ptr [ebp], edi
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov eax, dword ptr [esp + 20]
    mov ecx, dword ptr [eax]
    add esp, 4
    push eax
    call dword ptr [ecx + 0xc]
    mov edi, dword ptr [ebp + 4]
    mov ecx, ebx
    mov edx, ecx
    shr ecx, 2
    mov esi, eax
    mov al, byte ptr [esp + 000000094h]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov cl, byte ptr [esp + 000000098h]
    mov byte ptr [ebp + 11], cl
    lea ecx, [ebp + 12]
    push ecx
    mov ecx, dword ptr [ebp + 4]
    shr bx, 2
    mov word ptr [ebp + 8], bx
    mov byte ptr [ebp + 10], al
    test al, al
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push ecx
    push eax
    jne L9
    call dword ptr [edx + 0x16c]
    jmp L10
L9:
    call dword ptr [edx + 0x1a8]
L10:
    test eax, eax
    jge L11
    push eax
    call sub_100F00B8
    mov edx, dword ptr [esp + 32]
    push eax
    push edx
    lea eax, [esp + 68]
    push eax
    lea ecx, [esp + 88]
    push ecx
    push 0101950F4h
    call sub_1005F5F6
    add esp, 20
    pop edi
    pop esi
    pop ebp
    xor eax, eax
    pop ebx
    add esp, 124
    ret
L11:
    mov eax, dword ptr [esp + 16]
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
    mov eax, dword ptr [esp + 20]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    pop edi
    pop esi
    mov eax, ebp
    pop ebp
    pop ebx
    add esp, 124
    ret
FUN_1001a4c0 ENDP
END
