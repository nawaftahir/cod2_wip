.686
.MODEL FLAT, C
EXTRN sub_10099C2E:PROC
EXTRN sub_10099EFF:PROC
EXTRN sub_10099F08:PROC
EXTRN sub_10099F9C:PROC
EXTRN sub_10099FCA:PROC
EXTRN sub_1009A004:PROC
EXTRN sub_1009A010:PROC
EXTRN sub_1009A016:PROC
EXTRN sub_1009A027:PROC
EXTRN sub_1009A034:PROC
EXTRN sub_1009A080:PROC
EXTRN sub_1009A096:PROC
EXTRN sub_1009A0EA:PROC
EXTRN sub_1009A102:PROC
EXTRN sub_100F79C7:PROC
EXTRN sub_100F79EA:PROC
EXTRN sub_100F7A36:PROC
EXTRN sub_100F7A93:PROC
.CODE
FUN_10099c8f PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0104h
    push push ebx
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 16]
    test test edi, edi
    lea lea eax, [ebp - 0104h]
    mov mov ebx, ecx
    mov mov dword ptr [ebp - 4], eax
    jne L0
    mov mov dword ptr [ebp - 4], 010114870h
    jmp L30
    mov mov eax, dword ptr [edi + 4]
    dec dec eax
    je L25
    sub sub eax, 7
    je L10
    dec dec eax
    je L1
    mov mov dword ptr [ebp - 4], 010114868h
    jmp sub_10099EFF
    test test byte ptr [edi + 33], 2
    mov mov edx, 010114860h
    jne L2
    mov mov edx, 01019166Eh
    mov mov eax, dword ptr [edi + 20]
    cmp cmp eax, 29
    ja L4
    jmp jmp dword ptr [eax*4 + 010099EEAh]
    mov mov eax, 010114858h
    jmp L5
    mov mov eax, 010114854h
    jmp L7
    mov mov eax, 01011484Ch
    jmp L8
    mov mov eax, 010114844h
    jmp L9
    mov mov eax, 01011483Ch
    jmp L11
    mov mov eax, 010114834h
    jmp L12
    mov mov eax, 01011482Ch
    jmp L13
    mov mov eax, 0101950A0h
    jmp L14
    mov mov eax, 010114820h
    jmp L15
    mov mov eax, 010114814h
    jmp L16
L3:
    mov mov eax, 010114808h
    jmp L17
    mov mov eax, 0101147FCh
    jmp L18
    mov mov eax, 01019558Ch
    jmp L19
    mov mov eax, 0101147F0h
    jmp L20
    mov mov eax, 0101147E4h
    jmp L21
    mov mov eax, 0101147D8h
    jmp L22
    mov mov eax, 0101147CCh
    jmp L23
    mov mov eax, 0101147C0h
    jmp L24
    mov mov eax, 0101147B0h
    jmp L26
    mov mov eax, 0101147A0h
    jmp L27
    mov mov eax, 010114790h
    jmp L28
    mov mov eax, 010114784h
    jmp L29
    mov mov eax, 010114868h
    mov mov ecx, dword ptr [edi + 16]
    dec dec ecx
    je sub_10099F08
    dec dec ecx
    je L31
    push push eax
    push push edx
    push push 010194930h
    jmp sub_10099FCA
    push push dword ptr [edi + 28]
    push push dword ptr [edi + 24]
    push push eax
    push push edx
    push push 010114778h
    lea lea eax, [ebp - 0104h]
    push push 0FFh
    push push eax
    call sub_100F79C7
    add add esp, 28
    jmp sub_1009A004
    push push dword ptr [edi + 28]
    push push eax
    push push edx
    push push 010114770h
    lea lea eax, [ebp - 0104h]
    push push 0FFh
    push push eax
    call sub_100F79EA
    add add esp, 24
    jmp sub_1009A027
    cmp cmp dword ptr [edi + 4], 8
    mov mov eax, edi
    jne sub_10099F9C
    mov mov eax, dword ptr [eax + 16]
    cmp cmp dword ptr [eax + 4], 8
    je sub_10099F9C
    push push eax
    mov mov esi, 0FFh
    push push esi
    lea lea eax, [ebp - 0104h]
    push push eax
    mov mov ecx, ebx
    call L6
L6:
    mov mov ebx, eax
    jmp sub_1009A010
    push push dword ptr [edi + 20]
    mov mov ecx, esi
    push push 010114768h
    sub sub ecx, ebx
    lea lea eax, [ebp + ebx - 0104h]
    push push ecx
    push push eax
L10:
    call sub_100F7A36
    lea lea eax, [ebp + ebx - 0104h]
    add add esp, 16
    mov mov byte ptr [ebp - 5], 0
    lea lea ecx, [eax + 1]
    mov mov dl, byte ptr [eax]
L14:
    inc inc eax
    test test dl, dl
    jne sub_1009A034
    mov mov edi, dword ptr [edi + 16]
    sub sub eax, ecx
    add add ebx, eax
    cmp cmp dword ptr [edi + 4], 8
    je sub_1009A016
    jmp sub_1009A096
    push push edi
L17:
    mov mov ecx, ebx
    call sub_10099C2E
L18:
    test test eax, eax
    mov mov esi, 010114860h
L19:
    jne sub_1009A080
    mov mov esi, 01019166Eh
L20:
    push push edi
    mov mov ecx, ebx
    call L3
    push push eax
    push push esi
    push push 010114758h
    lea lea eax, [ebp - 0104h]
L23:
    push push 0FFh
    push push eax
    call sub_100F7A93
L25:
    add add esp, 20
L26:
    mov mov byte ptr [ebp - 5], 0
    mov mov esi, dword ptr [ebp - 4]
L27:
    mov mov eax, esi
    lea lea edx, [eax + 1]
    mov mov cl, byte ptr [eax]
L28:
    inc inc eax
    test test cl, cl
    jne sub_1009A0EA
    sub sub eax, edx
L29:
    cmp cmp eax, dword ptr [ebp + 12]
    jbe sub_1009A102
    mov mov eax, dword ptr [ebp + 12]
    mov mov edx, dword ptr [ebp + 8]
    mov mov ecx, eax
    mov mov ebx, ecx
    shr shr ecx, 2
    mov mov edi, edx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, ebx
    and and ecx, 3
L30:
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    pop pop edi
    pop pop esi
    mov mov byte ptr [eax + edx], 0
L31:
    pop pop ebx
    leave leave
    ret ret 12
FUN_10099c8f ENDP
END
