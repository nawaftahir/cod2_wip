.686
.MODEL FLAT, C
EXTRN sub_100194D7:PROC
EXTRN sub_1001A1F7:PROC
EXTRN sub_1001A38C:PROC
EXTRN sub_1005F465:PROC
EXTRN sub_1005F5A2:PROC
EXTRN sub_1005F647:PROC
EXTRN sub_1005F6A9:PROC
EXTRN sub_1005F73D:PROC
EXTRN sub_1005FB35:PROC
EXTRN sub_1005FC19:PROC
EXTRN sub_1005FCCD:PROC
EXTRN sub_10061F8E:PROC
EXTRN sub_10061FAE:PROC
EXTRN g_101AAC70:DWORD
.CODE
FUN_1001a160 PROC
    sub esp, 00000011Ch
    mov eax, dword ptr [ebx + 16]
    mov ecx, dword ptr [ebx + 12]
    mov edx, ecx
    push ebp
    mov ebp, dword ptr [esp + 000000124h]
    add eax, ebx
    push edi
    shr ecx, 2
    mov dword ptr [esp + 12], eax
    xor eax, eax
    lea edi, [esp + 36]
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    push 1
    push 010195818h
    mov ecx, ebp
    mov dword ptr [esp + 16], 0
    call sub_1005FB35
    add esp, 8
    test eax, eax
    jne L0
    pop edi
    xor al, al
    pop ebp
    add esp, 00000011Ch
    ret
L0:
    mov eax, dword ptr [esp + 000000134h]
    add eax, 4
    mov dword ptr [esp + 16], eax
    push esi
L1:
    mov edx, dword ptr [g_101AAC70]
    lea esp, [esp]
L2:
    imul edx, edx, 00000045Ch
    add edx, 0101A66B0h
    mov al, byte ptr [edx + 000000404h]
    test al, al
    je L3
    mov ecx, dword ptr [edx + 000000418h]
    mov byte ptr [edx + 000000404h], 0
    mov dword ptr [ebp], ecx
    mov eax, dword ptr [edx + 000000414h]
    mov dword ptr [edx + 000000400h], eax
L3:
    push ebp
    mov eax, 1
    call sub_1005F73D
    mov esi, eax
    mov al, byte ptr [esi]
    add esp, 4
    test al, al
    je L10
    cmp al, 125
    je L11
    mov edi, dword ptr [esp + 000000130h]
    mov ecx, dword ptr [esp + 16]
    push esi
    push ebx
    push edi
    call sub_100194D7
    add esp, 12
    cmp eax, -1
    jne L7
    mov ecx, dword ptr [g_101AAC70]
    imul ecx, ecx, 00000045Ch
    push edi
    push esi
    push 010195294h
    mov dword ptr [ecx + 0101A6AC0h], 0101952B0h
    call sub_1005F465
    mov edx, dword ptr [g_101AAC70]
    imul edx, edx, 00000045Ch
    push 1
    push 01019563Ch
    mov ecx, ebp
    mov dword ptr [edx + 0101A6AC0h], 0101956FCh
    call sub_1005FC19
    add esp, 20
    test eax, eax
    je L21
    mov edx, dword ptr [g_101AAC70]
    mov eax, dword ptr [ebp]
    mov ecx, edx
    imul ecx, ecx, 00000045Ch
    add ecx, 0101A66B0h
    test eax, eax
    je L2
    movsx edx, byte ptr [eax]
    test edx, edx
    je L6
    lea ebx, [ebx]
L4:
    inc eax
    cmp edx, 10
    je L5
    movsx edx, byte ptr [eax]
    test edx, edx
    jne L4
    mov dword ptr [ebp], eax
    jmp L1
L5:
    inc dword ptr [ecx + 000000400h]
L6:
    mov dword ptr [ebp], eax
    jmp L1
L7:
    mov cl, byte ptr [esp + eax + 40]
    test cl, cl
    jne L20
    mov ecx, dword ptr [esp + 16]
    mov edi, dword ptr [esp + 20]
    mov byte ptr [esp + eax + 40], 1
    lea eax, [eax + eax*4]
    lea eax, [ecx + eax*4]
    mov dword ptr [esp + 32], eax
    mov edx, dword ptr [eax + 12]
    add edx, ebx
    mov dword ptr [esp + 36], edx
    mov ax, word ptr [eax + 6]
    mov word ptr [edi - 2], ax
    lea esi, [edi - 4]
    mov eax, esi
    lea ecx, [esp + 24]
    mov edx, ebp
    call sub_1001A1F7
    test al, al
    je L21
    push 1
    push 010195820h
    mov ecx, ebp
    call sub_1005FCCD
    add esp, 8
    test eax, eax
    je L21
    cmp word ptr [esi], 3
    jne L9
    mov eax, dword ptr [edi]
    cmp eax, 14
    jne L8
    mov eax, dword ptr [esp + 000000134h]
    mov ecx, dword ptr [esp + 12]
    or byte ptr [eax], 1
    inc ecx
    add edi, 8
    mov dword ptr [esp + 12], ecx
    mov dword ptr [esp + 20], edi
    jmp L1
L8:
    cmp eax, 15
    jne L9
    mov eax, dword ptr [esp + 000000134h]
    or byte ptr [eax], 2
L9:
    mov ecx, dword ptr [esp + 12]
    inc ecx
    add edi, 8
    mov dword ptr [esp + 12], ecx
    mov dword ptr [esp + 20], edi
    jmp L1
L10:
    push 0101952BCh
    call sub_1005F5A2
    add esp, 4
    pop esi
    pop edi
    xor al, al
    pop ebp
    add esp, 00000011Ch
    ret
L11:
    mov eax, dword ptr [ebx + 12]
    mov ecx, dword ptr [esp + 12]
    cmp ecx, eax
    jne L13
L12:
    pop esi
    pop edi
    mov al, 1
    pop ebp
    add esp, 00000011Ch
    ret
L13:
    xor ebp, ebp
    test eax, eax
    jbe L16
    mov edx, dword ptr [esp + 000000138h]
    mov esi, dword ptr [esp + 16]
    lea edi, [edx + ecx*8]
    lea esp, [esp]
L14:
    mov al, byte ptr [esp + ebp + 40]
    test al, al
    jne L15
    mov dword ptr [esp + 32], esi
    mov eax, dword ptr [esi + 12]
    add eax, ebx
    mov dword ptr [esp + 36], eax
    mov cx, word ptr [esi + 6]
    mov word ptr [edi + 2], cx
    mov edx, dword ptr [esi]
    add edx, ebx
    mov eax, edi
    lea ecx, [esp + 24]
    call sub_1001A38C
    test al, al
    je L15
    mov ecx, dword ptr [esp + 12]
    inc ecx
    mov byte ptr [esp + ebp + 40], 1
    mov dword ptr [esp + 12], ecx
    add edi, 8
L15:
    mov eax, dword ptr [ebx + 12]
    inc ebp
    add esi, 20
    cmp ebp, eax
    jb L14
L16:
    mov edx, dword ptr [esp + 12]
    cmp edx, dword ptr [ebx + 12]
    je L12
    mov eax, dword ptr [esp + 000000130h]
    push eax
    push 010195230h
    call sub_1005F647
    mov eax, dword ptr [ebx + 12]
    add esp, 8
    xor esi, esi
    test eax, eax
    jbe L19
    mov edi, dword ptr [esp + 16]
L17:
    mov al, byte ptr [esp + esi + 40]
    test al, al
    jne L18
    mov ecx, dword ptr [edi]
    add ecx, ebx
    push ecx
    push 0101932D4h
    call sub_10061F8E
    add esp, 8
L18:
    mov eax, dword ptr [ebx + 12]
    inc esi
    add edi, 20
    cmp esi, eax
    jb L17
L19:
    mov edx, dword ptr [ebx + 12]
    sub edx, dword ptr [esp + 12]
    push edx
    push 010195210h
    call sub_10061FAE
    add esp, 8
    pop esi
    pop edi
    xor al, al
    pop ebp
    add esp, 00000011Ch
    ret
L20:
    push edi
    push esi
    push 010195254h
    call sub_1005F6A9
    add esp, 12
L21:
    pop esi
    pop edi
    xor al, al
    pop ebp
    add esp, 00000011Ch
    ret
FUN_1001a160 ENDP
END
