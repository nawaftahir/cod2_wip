.686
.MODEL FLAT, C
EXTRN sub_100F8620:PROC
EXTRN sub_100F88F5:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB7A7:PROC
EXTRN sub_100FC55A:PROC
EXTRN sub_100FE59F:PROC
EXTRN sub_100FE606:PROC
EXTRN sub_100FF482:PROC
EXTRN sub_100FF48E:PROC
EXTRN sub_100FF509:PROC
EXTRN sub_100FF50F:PROC
EXTRN sub_100FF516:PROC
EXTRN sub_100FF51B:PROC
EXTRN sub_100FF522:PROC
EXTRN sub_100FF537:PROC
EXTRN sub_100FF59A:PROC
EXTRN sub_100FF5A2:PROC
EXTRN sub_100FF5A5:PROC
EXTRN sub_100FF5AF:PROC
EXTRN sub_100FF5DD:PROC
EXTRN sub_100FF608:PROC
EXTRN sub_100FF611:PROC
EXTRN sub_100FF61A:PROC
EXTRN sub_100FF62A:PROC
EXTRN sub_100FF637:PROC
EXTRN sub_100FF647:PROC
EXTRN sub_100FF649:PROC
EXTRN sub_100FF64F:PROC
EXTRN sub_100FF667:PROC
EXTRN sub_100FF68C:PROC
EXTRN sub_100FF69A:PROC
EXTRN sub_100FF6CB:PROC
EXTRN sub_100FF6D3:PROC
EXTRN sub_100FF6E2:PROC
EXTRN sub_100FF6E4:PROC
EXTRN sub_100FF6EA:PROC
EXTRN sub_100FF6EF:PROC
EXTRN sub_100FF6F2:PROC
EXTRN sub_100FF6F3:PROC
EXTRN sub_100FF6F4:PROC
EXTRN sub_100FF6FC:PROC
EXTRN sub_100FF700:PROC
EXTRN sub_100FF70C:PROC
EXTRN sub_100FF71B:PROC
EXTRN sub_100FF720:PROC
EXTRN sub_100FF730:PROC
EXTRN sub_100FF733:PROC
EXTRN sub_100FF738:PROC
EXTRN sub_100FF741:PROC
EXTRN sub_100FF74A:PROC
EXTRN sub_100FF753:PROC
EXTRN sub_100FF75B:PROC
EXTRN sub_100FF75F:PROC
EXTRN sub_100FF760:PROC
EXTRN sub_100FF764:PROC
EXTRN sub_100FF7B8:PROC
EXTRN sub_100FF7BD:PROC
EXTRN sub_100FF7C7:PROC
EXTRN sub_100FF7EB:PROC
EXTRN sub_100FF7F0:PROC
EXTRN sub_100FF7F5:PROC
EXTRN sub_100FF7FB:PROC
EXTRN sub_100FF808:PROC
EXTRN sub_100FF809:PROC
EXTRN sub_100FF812:PROC
EXTRN sub_100FF819:PROC
EXTRN sub_100FF81F:PROC
EXTRN sub_100FF823:PROC
EXTRN sub_100FF829:PROC
EXTRN sub_100FF851:PROC
EXTRN sub_100FF865:PROC
EXTRN sub_100FF8A1:PROC
EXTRN sub_100FF8C5:PROC
EXTRN sub_100FF8CA:PROC
EXTRN sub_101060B8:PROC
EXTRN EXTRN g_1010C180:DWORD:DWORD
EXTRN EXTRN g_1010C184:DWORD:DWORD
.CODE
__store_winword PROC
    push push 56
    push push 01017CF70h
    call sub_100FB61C
    mov mov eax, dword ptr [ebp + 12]
    xor xor esi, esi
    sub sub eax, esi
    je L1
    dec dec eax
    mov mov eax, dword ptr [ebp + 28]
    je L0
    mov mov eax, dword ptr [eax + 0A8h]
    jmp L2
    mov mov eax, dword ptr [eax + 0A4h]
    jmp L3
    mov mov eax, dword ptr [ebp + 28]
    mov mov eax, dword ptr [eax + 0A0h]
    mov mov dword ptr [ebp - 32], eax
    mov mov ecx, dword ptr [ebp + 28]
    cmp cmp dword ptr [ecx + 0B0h], 1
    je L5
    cmp cmp dword ptr [ebp + 12], 2
    mov mov eax, dword ptr [g_1010C184]
    jne L4
    mov mov eax, dword ptr [g_1010C180]
L2:
    mov mov dword ptr [ebp - 48], eax
    mov mov ebx, dword ptr [ebp + 16]
    mov mov dx, word ptr [ebx + 20]
    add add dx, 076Ch
    mov mov word ptr [ebp - 72], dx
    mov mov dx, word ptr [ebx + 16]
    inc inc dx
    mov mov word ptr [ebp - 70], dx
    mov mov dx, word ptr [ebx + 12]
    mov mov word ptr [ebp - 66], dx
    mov mov dx, word ptr [ebx + 8]
    mov mov word ptr [ebp - 64], dx
    mov mov dx, word ptr [ebx + 4]
    mov mov word ptr [ebp - 62], dx
    mov mov dx, word ptr [ebx]
    mov mov word ptr [ebp - 60], dx
    mov mov word ptr [ebp - 58], si
    push push esi
    push push esi
    push push dword ptr [ebp - 32]
    lea lea edx, [ebp - 72]
    push push edx
    push push esi
    push push dword ptr [ecx + 0ACh]
    call call eax
L4:
    mov mov dword ptr [ebp - 44], eax
    cmp cmp eax, esi
    je L9
    mov mov dword ptr [ebp - 52], esi
    mov mov dword ptr [ebp - 4], esi
    add add eax, 3
    and and eax, -4
    call sub_100F88F5
    mov mov dword ptr [ebp - 24], esp
    mov mov edi, esp
    mov mov dword ptr [ebp - 56], edi
    or or dword ptr [ebp - 4], -1
    jmp L6
    xor xor eax, eax
    inc inc eax
    ret ret
    mov mov esp, dword ptr [ebp - 24]
    call sub_101060B8
    xor xor edi, edi
    or or dword ptr [ebp - 4], -1
    mov mov ebx, dword ptr [ebp + 16]
    xor xor esi, esi
    cmp cmp edi, esi
    jne L8
    push push dword ptr [ebp - 44]
    call sub_100FC55A
    pop pop ecx
    mov mov edi, eax
    cmp cmp edi, esi
    je L10
    mov mov dword ptr [ebp - 52], 1
    mov mov dword ptr [ebp - 36], edi
    push push dword ptr [ebp - 44]
    push push edi
    push push dword ptr [ebp - 32]
    lea lea eax, [ebp - 72]
    push push eax
    push push esi
    mov mov eax, dword ptr [ebp + 28]
    push push dword ptr [eax + 0ACh]
    call call dword ptr [ebp - 48]
    dec dec eax
    cmp cmp eax, esi
    jle L11
    mov mov esi, dword ptr [ebp + 24]
    mov mov ecx, dword ptr [ebp + 20]
    cmp cmp dword ptr [esi], 0
    jbe L13
    mov mov edx, dword ptr [ecx]
    mov mov ebx, dword ptr [ebp - 36]
    mov mov bl, byte ptr [ebx]
    mov mov byte ptr [edx], bl
    inc inc dword ptr [ecx]
    inc inc dword ptr [ebp - 36]
    dec dec dword ptr [esi]
    dec dec eax
    test test eax, eax
    jg L12
    cmp cmp dword ptr [ebp - 52], 0
    je L14
    push push edi
    call sub_100F8620
    pop pop ecx
    xor xor eax, eax
    inc inc eax
    lea lea esp, [ebp - 84]
    call sub_100FB7A7
    ret ret
    mov mov ebx, dword ptr [ebp + 16]
    mov mov eax, dword ptr [ebp - 32]
    mov mov cl, byte ptr [eax]
    test test cl, cl
    je L15
    mov mov edi, dword ptr [ebp + 24]
    mov mov esi, dword ptr [ebp + 20]
    jmp L17
    mov mov ebx, dword ptr [ebp + 16]
    cmp cmp dword ptr [edi], 0
    je L16
    mov mov byte ptr [ebp - 25], 0
    xor xor edx, edx
    mov mov dword ptr [ebp - 40], edx
    mov mov eax, dword ptr [ebp - 32]
    inc inc eax
    inc inc edx
    cmp cmp byte ptr [eax], cl
    je L18
    mov mov dword ptr [ebp - 36], eax
    movsx movsx ecx, cl
    cmp cmp ecx, 100
    jg sub_100FF48E
    je L30
    cmp cmp ecx, 39
    je L25
    cmp cmp ecx, 65
    je L19
    cmp cmp ecx, 72
    je L21
    cmp cmp ecx, 77
    je L20
    cmp cmp ecx, 97
    jne sub_100FF5DD
    push push 01017CF68h
    mov mov ebx, dword ptr [ebp - 32]
    push push ebx
    call sub_100FE59F
    pop pop ecx
    pop pop ecx
    test test eax, eax
    jne L26
    add add ebx, 5
    jmp L27
    mov mov ecx, edx
    dec dec ecx
    je L23
    dec dec ecx
    je L24
    dec dec ecx
    je L22
    dec dec ecx
    jne sub_100FF608
    mov mov byte ptr [ebp - 25], 66
    jmp sub_100FF611
    mov mov byte ptr [ebp - 25], 98
    jmp sub_100FF61A
    mov mov dword ptr [ebp - 40], 1
    mov mov byte ptr [ebp - 25], 109
    jmp sub_100FF62A
    mov mov ecx, edx
    dec dec ecx
    je L28
    dec dec ecx
L9:
    je L29
    jmp sub_100FF637
    mov mov dword ptr [ebp - 40], 1
    mov mov byte ptr [ebp - 25], 72
    jmp sub_100FF647
    push push 01017CF64h
    push push ebx
    call sub_100FE606
    pop pop ecx
    pop pop ecx
    test test eax, eax
    jne sub_100FF482
    add add ebx, 3
    mov mov dword ptr [ebp - 36], ebx
    mov mov byte ptr [ebp - 25], 112
    jmp sub_100FF667
    add add dword ptr [ebp - 32], edx
    test test dl, 1
    je sub_100FF6D3
    mov mov eax, dword ptr [ebp - 32]
    jmp sub_100FF509
    mov mov ecx, dword ptr [edi]
    test test ecx, ecx
    je sub_100FF6E2
    cmp cmp al, 39
L11:
    je sub_100FF522
    movzx movzx edx, al
    mov mov ebx, dword ptr [ebp + 8]
    mov mov ebx, dword ptr [ebx + 72]
L13:
    test test byte ptr [ebx + edx*2 + 1], 080h
    je sub_100FF516
    cmp cmp ecx, 1
    jbe sub_100FF51B
    mov mov ecx, dword ptr [ebp - 32]
    inc inc ecx
    cmp cmp byte ptr [ecx], 0
    je sub_100FF6CB
    mov mov edx, dword ptr [esi]
    mov mov byte ptr [edx], al
    inc inc dword ptr [esi]
    mov mov eax, ecx
    dec dec dword ptr [edi]
    jmp sub_100FF537
    mov mov eax, dword ptr [ebp - 32]
L14:
    mov mov ecx, dword ptr [esi]
    mov mov dl, byte ptr [eax]
    mov mov byte ptr [ecx], dl
    inc inc dword ptr [esi]
    inc inc eax
    mov mov dword ptr [ebp - 32], eax
    dec dec dword ptr [edi]
    mov mov al, byte ptr [eax]
    test test al, al
    jne sub_100FF50F
    jmp sub_100FF730
    inc inc dword ptr [ebp - 32]
    jmp sub_100FF738
    mov mov ecx, edx
    dec dec ecx
    je sub_100FF5A5
    dec dec ecx
    je sub_100FF5AF
    dec dec ecx
    je sub_100FF5A2
    dec dec ecx
    jne sub_100FF6EA
    mov mov byte ptr [ebp - 25], 65
    jmp sub_100FF6F3
    mov mov byte ptr [ebp - 25], 97
    jmp sub_100FF6FC
    mov mov dword ptr [ebp - 40], 1
    mov mov byte ptr [ebp - 25], 100
    jmp sub_100FF70C
    sub sub ecx, 104
    je sub_100FF700
    sub sub ecx, 5
    je sub_100FF6F2
    sub sub ecx, 6
    je sub_100FF6E4
    dec dec ecx
    je sub_100FF649
    sub sub ecx, 5
    jne sub_100FF733
    mov mov ecx, edx
    dec dec ecx
    dec dec ecx
    je sub_100FF64F
    dec dec ecx
    dec dec ecx
    jne sub_100FF741
    mov mov byte ptr [ebp - 25], 89
    jmp sub_100FF74A
    mov mov byte ptr [ebp - 25], 121
    jmp sub_100FF753
    mov mov eax, dword ptr [ebp + 28]
    cmp cmp dword ptr [ebx + 8], 11
    jg sub_100FF68C
    mov mov eax, dword ptr [eax + 098h]
    jmp sub_100FF69A
    mov mov eax, dword ptr [eax + 09Ch]
    cmp cmp edx, 1
    jne sub_100FF71B
    cmp cmp dword ptr [edi], 0
    jbe sub_100FF720
    mov mov cl, byte ptr [eax]
    movzx movzx edx, cl
    mov mov ebx, dword ptr [ebp + 8]
    mov mov ebx, dword ptr [ebx + 72]
    test test byte ptr [ebx + edx*2 + 1], 080h
    je sub_100FF6EF
    cmp cmp dword ptr [edi], 1
    jbe sub_100FF6F4
L19:
    inc inc eax
    cmp cmp byte ptr [eax], 0
    je sub_100FF7B8
    mov mov edx, dword ptr [esi]
    mov mov byte ptr [edx], cl
    inc inc dword ptr [esi]
    dec dec dword ptr [edi]
    mov mov ecx, dword ptr [esi]
    mov mov al, byte ptr [eax]
    mov mov byte ptr [ecx], al
    inc inc dword ptr [esi]
    dec dec dword ptr [edi]
    jmp sub_100FF75B
    cmp cmp dword ptr [edi], 0
    jbe sub_100FF760
L20:
    movzx movzx edx, cl
    mov mov ebx, dword ptr [ebp + 8]
    mov mov ebx, dword ptr [ebx + 72]
    test test byte ptr [ebx + edx*2 + 1], 080h
    je sub_100FF75F
    cmp cmp dword ptr [edi], 1
    jbe sub_100FF764
    inc inc eax
    cmp cmp byte ptr [eax], 0
    je sub_100FF7F0
    mov mov edx, dword ptr [esi]
    mov mov byte ptr [edx], cl
    inc inc dword ptr [esi]
    dec dec dword ptr [edi]
    mov mov ecx, dword ptr [esi]
    mov mov dl, byte ptr [eax]
    mov mov byte ptr [ecx], dl
    inc inc dword ptr [esi]
L21:
    inc inc eax
    dec dec dword ptr [edi]
    mov mov cl, byte ptr [eax]
    test test cl, cl
    jne sub_100FF75B
    mov mov eax, dword ptr [ebp - 36]
    mov mov dword ptr [ebp - 32], eax
    jmp sub_100FF851
    mov mov ecx, edx
    dec dec ecx
    je sub_100FF7BD
L22:
    dec dec ecx
    je sub_100FF7C7
L23:
    jmp sub_100FF7FB
    mov mov dword ptr [ebp - 40], 1
    mov mov byte ptr [ebp - 25], 83
    jmp sub_100FF808
    mov mov ecx, edx
    dec dec ecx
    je sub_100FF7EB
    dec dec ecx
    je sub_100FF7F5
L25:
    jmp sub_100FF812
    mov mov dword ptr [ebp - 40], 1
    mov mov byte ptr [ebp - 25], 77
    jmp sub_100FF81F
    mov mov ecx, edx
    dec dec ecx
    je sub_100FF819
    dec dec ecx
    je sub_100FF823
    jmp sub_100FF829
    mov mov dword ptr [ebp - 40], 1
    mov mov byte ptr [ebp - 25], 73
    mov mov al, byte ptr [ebp - 25]
    test test al, al
    je sub_100FF865
    push push dword ptr [ebp - 40]
    push push dword ptr [ebp + 28]
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 8]
    mov mov ebx, edi
    mov mov ecx, esi
    call L7
    add add esp, 16
    test test eax, eax
    jne sub_100FF809
    xor xor eax, eax
    jmp sub_100FF59A
    mov mov ecx, dword ptr [ebp - 32]
    mov mov al, byte ptr [ecx]
    movzx movzx edx, al
    mov mov ebx, dword ptr [ebp + 8]
    mov mov ebx, dword ptr [ebx + 72]
    test test byte ptr [ebx + edx*2 + 1], 080h
    je sub_100FF8C5
    cmp cmp dword ptr [edi], 1
    jbe sub_100FF8CA
L30:
    inc inc ecx
    cmp cmp byte ptr [ecx], 0
    je sub_100FF8A1
    mov mov edx, dword ptr [esi]
    mov mov byte ptr [edx], al
    inc inc dword ptr [esi]
    dec dec dword ptr [edi]
    mov mov eax, dword ptr [esi]
    mov mov dl, byte ptr [ecx]
    mov mov byte ptr [eax], dl
    inc inc dword ptr [esi]
    inc inc ecx
__store_winword ENDP
END
