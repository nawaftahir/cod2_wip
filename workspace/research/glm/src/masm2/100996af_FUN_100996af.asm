.686
.MODEL FLAT, C
EXTRN sub_100650E1:PROC
EXTRN sub_10065105:PROC
EXTRN sub_10082923:PROC
EXTRN sub_1008299C:PROC
EXTRN sub_100997FD:PROC
EXTRN sub_100997FF:PROC
EXTRN sub_10099817:PROC
EXTRN sub_10099832:PROC
EXTRN sub_10099875:PROC
EXTRN sub_1009987B:PROC
EXTRN sub_1009987E:PROC
EXTRN sub_10099882:PROC
EXTRN sub_100998A0:PROC
EXTRN sub_100998A8:PROC
EXTRN sub_100998AB:PROC
EXTRN sub_100998D0:PROC
EXTRN sub_100998D4:PROC
EXTRN sub_100998D5:PROC
EXTRN sub_100998D6:PROC
EXTRN sub_100998D9:PROC
EXTRN sub_100998DC:PROC
.CODE
FUN_100996af PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, dword ptr [ebp + 12]
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    push push edi
    mov mov edi, dword ptr [eax + 20]
    add add esi, 28
    add add edi, 16
    cmp cmp dword ptr [esi], 0
    je L4
    mov mov eax, dword ptr [esi]
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [ebp + 8], eax
    mov mov eax, dword ptr [eax + 16]
    mov mov bl, byte ptr [ecx]
    mov mov dl, bl
    cmp cmp bl, byte ptr [eax]
    jne L1
    test test dl, dl
    je L1
    mov mov bl, byte ptr [ecx + 1]
    mov mov dl, bl
    cmp cmp bl, byte ptr [eax + 1]
    jne L3
    inc inc ecx
    inc inc ecx
    inc inc eax
    inc inc eax
    test test dl, dl
    jne L0
    xor xor eax, eax
    jmp L5
    sbb sbb eax, eax
    sbb sbb eax, -1
    test test eax, eax
    jge L6
    mov mov esi, dword ptr [ebp + 8]
    add add esi, 8
    jmp L7
    jle L8
    mov mov esi, dword ptr [ebp + 8]
    add add esi, 12
    cmp cmp dword ptr [esi], 0
    jne L2
    cmp cmp dword ptr [esi], 0
    jne L9
L0:
    push push 24
    call sub_100650E1
    xor xor ebx, ebx
    cmp cmp eax, ebx
    je L10
    push push ebx
    push push ebx
    push push ebx
    push push dword ptr [edi + 8]
    mov mov ecx, eax
    call sub_1008299C
L3:
    jmp L11
L4:
    xor xor eax, eax
    cmp cmp eax, ebx
    mov mov dword ptr [esi], eax
    je sub_100997FD
    push push 20
    call sub_10065105
L5:
    xor xor ebx, ebx
    cmp cmp eax, ebx
    je sub_100997FF
    mov mov ecx, dword ptr [esi]
    push push 010114734h
    push push dword ptr [ecx + 20]
    mov mov ecx, eax
    push push dword ptr [ebp + 12]
L6:
    call sub_10082923
    jmp sub_10099817
    xor xor eax, eax
    cmp cmp eax, ebx
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], eax
L7:
    jne sub_10099832
    mov mov eax, 08007000Eh
L8:
    jmp sub_100998A0
    mov mov eax, dword ptr [esi]
    mov mov eax, dword ptr [eax + 20]
    cmp cmp dword ptr [eax + 12], ebx
    jne sub_100998A8
    cmp cmp dword ptr [esi], 0
    mov mov edx, esi
    je sub_100998AB
    mov mov eax, dword ptr [edx]
    test test eax, eax
    je sub_1009987B
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_10099882
    mov mov edi, dword ptr [ecx + 12]
    mov mov dword ptr [ecx + 12], eax
    mov mov dword ptr [eax + 8], edi
    mov mov dword ptr [edx], ecx
    jmp sub_10099875
    lea lea edx, [eax + 12]
    inc inc ebx
    cmp cmp dword ptr [edx], 0
    jne sub_1009987E
    jmp sub_100998D0
    test test ebx, ebx
    mov mov edx, esi
    jbe sub_100998D6
L10:
    mov mov dword ptr [ebp + 12], ebx
    mov mov ecx, dword ptr [edx]
    test test ecx, ecx
    je sub_100998D5
    mov mov eax, dword ptr [ecx + 12]
    test test eax, eax
    je sub_100998DC
    mov mov edi, dword ptr [eax + 8]
    mov mov dword ptr [eax + 8], ecx
    mov mov dword ptr [ecx + 12], edi
    mov mov dword ptr [edx], eax
    mov mov edx, dword ptr [edx]
    add add edx, 12
    dec dec dword ptr [ebp + 12]
    jne sub_100998D9
    shr shr ebx, 1
    jne sub_100998D4
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 8
FUN_100996af ENDP
END
