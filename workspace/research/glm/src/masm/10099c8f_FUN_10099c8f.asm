.686
.MODEL FLAT, C
EXTRN sub_10099C2E:PROC
EXTRN sub_10099D52:PROC
EXTRN sub_100F79C7:PROC
EXTRN sub_100F79EA:PROC
EXTRN sub_100F7A36:PROC
EXTRN sub_100F7A93:PROC
.CODE
FUN_10099c8f PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000104h
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 16]
    test edi, edi
    lea eax, [ebp - 000000104h]
    mov ebx, ecx
    mov dword ptr [ebp - 4], eax
    jne L1
    mov dword ptr [ebp - 4], 010114870h
    jmp L18
L1:
    mov eax, dword ptr [edi + 4]
    dec eax
    je L14
    sub eax, 7
    je L8
    dec eax
    je L2
    mov dword ptr [ebp - 4], 010114868h
    jmp L18
L2:
    test byte ptr [edi + 33], 2
    mov edx, 010114860h
    jne L3
    mov edx, 01019166Eh
L3:
    mov eax, dword ptr [edi + 20]
    cmp eax, 29
    ja L4
    jmp dword ptr [eax*4 + 0x10099eea]
    mov eax, 010114858h
    jmp L5
    mov eax, 010114854h
    jmp L5
    mov eax, 01011484Ch
    jmp L5
    mov eax, 010114844h
    jmp L5
    mov eax, 01011483Ch
    jmp L5
    mov eax, 010114834h
    jmp L5
    mov eax, 01011482Ch
    jmp L5
    mov eax, 0101950A0h
    jmp L5
    mov eax, 010114820h
    jmp L5
    mov eax, 010114814h
    jmp L5
    mov eax, 010114808h
    jmp L5
    mov eax, 0101147FCh
    jmp L5
    mov eax, 01019558Ch
    jmp L5
    mov eax, 0101147F0h
    jmp L5
    mov eax, 0101147E4h
    jmp L5
    mov eax, 0101147D8h
    jmp L5
    mov eax, 0101147CCh
    jmp L5
    mov eax, 0101147C0h
    jmp L5
    mov eax, 0101147B0h
    jmp L5
    mov eax, 0101147A0h
    jmp L5
    mov eax, 010114790h
    jmp L5
    mov eax, 010114784h
    jmp L5
L4:
    mov eax, 010114868h
L5:
    mov ecx, dword ptr [edi + 16]
    dec ecx
    je L7
    dec ecx
    je L6
    push eax
    push edx
    push 010194930h
    jmp L16
L6:
    push dword ptr [edi + 28]
    push dword ptr [edi + 24]
    push eax
    push edx
    push 010114778h
    lea eax, [ebp - 000000104h]
    push 0000000FFh
    push eax
    call sub_100F79C7
    add esp, 28
    jmp L17
L7:
    push dword ptr [edi + 28]
    push eax
    push edx
    push 010114770h
    lea eax, [ebp - 000000104h]
    push 0000000FFh
    push eax
    call sub_100F79EA
    add esp, 24
    jmp L17
L8:
    cmp dword ptr [edi + 4], 8
    mov eax, edi
    jne L10
L9:
    mov eax, dword ptr [eax + 16]
    cmp dword ptr [eax + 4], 8
    je L9
L10:
    push eax
    mov esi, 0000000FFh
    push esi
    lea eax, [ebp - 000000104h]
    push eax
    mov ecx, ebx
    call L0
    mov ebx, eax
    jmp L13
L11:
    push dword ptr [edi + 20]
    mov ecx, esi
    push 010114768h
    sub ecx, ebx
    lea eax, [ebp + ebx - 000000104h]
    push ecx
    push eax
    call sub_100F7A36
    lea eax, [ebp + ebx - 000000104h]
    add esp, 16
    mov byte ptr [ebp - 5], 0
    lea ecx, [eax + 1]
L12:
    mov dl, byte ptr [eax]
    inc eax
    test dl, dl
    jne L12
    mov edi, dword ptr [edi + 16]
    sub eax, ecx
    add ebx, eax
L13:
    cmp dword ptr [edi + 4], 8
    je L11
    jmp L18
L14:
    push edi
    mov ecx, ebx
    call sub_10099C2E
    test eax, eax
    mov esi, 010114860h
    jne L15
    mov esi, 01019166Eh
L15:
    push edi
    mov ecx, ebx
    call sub_10099D52
    push eax
    push esi
    push 010114758h
L16:
    lea eax, [ebp - 000000104h]
    push 0000000FFh
    push eax
    call sub_100F7A93
    add esp, 20
L17:
    mov byte ptr [ebp - 5], 0
L18:
    mov esi, dword ptr [ebp - 4]
    mov eax, esi
    lea edx, [eax + 1]
L19:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L19
    sub eax, edx
    cmp eax, dword ptr [ebp + 12]
    jbe L20
    mov eax, dword ptr [ebp + 12]
L20:
    mov edx, dword ptr [ebp + 8]
    mov ecx, eax
    mov ebx, ecx
    shr ecx, 2
    mov edi, edx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, ebx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    pop edi
    pop esi
    mov byte ptr [eax + edx], 0
    pop ebx
    leave
    ret 12
FUN_10099c8f ENDP
END
