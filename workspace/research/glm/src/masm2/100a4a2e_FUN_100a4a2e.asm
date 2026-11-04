.686
.MODEL FLAT, C
EXTRN sub_1008B151:PROC
EXTRN sub_1008B22A:PROC
EXTRN sub_1008B29E:PROC
EXTRN sub_1008B2CD:PROC
EXTRN sub_1008B302:PROC
EXTRN sub_100A4CEE:PROC
EXTRN sub_100A4CF0:PROC
EXTRN sub_100A4CF7:PROC
EXTRN sub_100A4CFE:PROC
EXTRN sub_100A4D1A:PROC
EXTRN sub_100A4D1E:PROC
EXTRN sub_100A4D23:PROC
EXTRN sub_100A4D28:PROC
EXTRN sub_100A4D3A:PROC
EXTRN sub_100A4D3C:PROC
EXTRN sub_100A4D46:PROC
EXTRN sub_100A4D4B:PROC
EXTRN sub_100A4DBB:PROC
EXTRN sub_100A4DDF:PROC
EXTRN sub_100A4DF7:PROC
EXTRN sub_100A4E33:PROC
EXTRN sub_100A4E56:PROC
EXTRN sub_100A4E85:PROC
EXTRN sub_100A4E8B:PROC
EXTRN sub_100A4EBD:PROC
.CODE
FUN_100a4a2e PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 96
    push push esi
    mov mov esi, ecx
    xor xor edx, edx
    xor xor eax, eax
    cmp cmp dword ptr [esi + 0158h], edx
    jne L12
    test test byte ptr [esi + 112], 64
    push push ebx
    push push edi
    mov mov dword ptr [ebp - 4], edx
    mov mov dword ptr [ebp - 8], edx
    mov mov dword ptr [ebp - 16], edx
    je L4
    cmp cmp dword ptr [esi + 8], edx
    lea lea edi, [ebp - 32]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    mov mov dword ptr [ebp - 12], edx
    stosd stosd dword ptr es:[edi], eax
    jbe L1
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [edi + 4]
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    test test byte ptr [eax + 4], 32
    je L2
    push push dword ptr [edi + 108]
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 84]
    push push dword ptr [edi + 108]
    mov mov ebx, eax
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 88]
    mov mov ecx, ebx
    dec dec ecx
    je L3
    sub sub ecx, 4
    jne L5
    test test eax, eax
    jne L6
    cmp cmp dword ptr [edi + 16], eax
    jbe L7
    cmp cmp dword ptr [ebp - 12], eax
    jne L8
    push push 010115C44h
    push push 011BCh
    push push dword ptr [edi + 96]
    push push esi
    call sub_1008B151
    xor xor eax, eax
    add add esp, 16
    inc inc eax
    mov mov dword ptr [ebp - 12], eax
    mov mov dword ptr [ebp - 4], eax
    jmp L9
    test test eax, eax
    jne L10
    mov mov eax, dword ptr [edi + 16]
    mov mov dword ptr [ebp + eax*4 - 32], 1
    mov mov eax, dword ptr [edi + 96]
    mov mov dword ptr [ebp - 16], eax
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [esi + 8]
    jb L0
    xor xor edx, edx
    xor xor ecx, ecx
    xor xor eax, eax
    cmp cmp dword ptr [ebp + eax*4 - 32], edx
    je L11
    inc inc ecx
    inc inc eax
    cmp cmp eax, 4
    jb L11
    cmp cmp ecx, 4
    je sub_100A4D3A
    push push 010115C00h
    push push 011BDh
    push push dword ptr [ebp - 16]
    jmp sub_100A4D3C
    push push 16
    pop pop ecx
    lea lea edi, [ebp - 96]
    rep stosd rep stosd dword ptr es:[edi], eax
    xor xor eax, eax
    lea lea edi, [ebp - 32]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    xor xor ebx, ebx
    stosd stosd dword ptr es:[edi], eax
    inc inc ebx
    cmp cmp dword ptr [esi + 8], edx
    stosd stosd dword ptr es:[edi], eax
L1:
    jbe sub_100A4CF0
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [edi + 4]
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    test test byte ptr [eax + 4], 32
    je sub_100A4CF7
    push push dword ptr [edi + 108]
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 84]
    push push dword ptr [edi + 108]
L6:
    mov mov dword ptr [ebp - 12], eax
    mov mov eax, dword ptr [esi]
L7:
    mov mov ecx, esi
    call call dword ptr [eax + 88]
L8:
    mov mov ecx, dword ptr [ebp - 12]
    sub sub ecx, 11
    je sub_100A4CFE
    dec dec ecx
    dec dec ecx
    jne sub_100A4D1A
    test test eax, eax
    jne sub_100A4D1E
    cmp cmp dword ptr [edi + 16], eax
    je sub_100A4D23
    cmp cmp dword ptr [ebp - 16], eax
    jne sub_100A4D28
    push push 010115BE8h
    push push 011B0h
    push push dword ptr [edi + 96]
    push push esi
    call sub_1008B22A
    add add esp, 16
    mov mov dword ptr [ebp - 16], ebx
    mov mov dword ptr [ebp - 4], ebx
    jmp sub_100A4D46
    cmp cmp eax, 4
    jae sub_100A4D4B
    mov mov ecx, dword ptr [edi + 16]
    shl shl eax, 2
    add add ecx, eax
    mov mov dword ptr [ebp + ecx*4 - 96], ebx
    mov mov ecx, dword ptr [edi + 96]
    mov mov dword ptr [ebp + eax - 32], ecx
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [esi + 8]
    jb sub_100A4CEE
    xor xor edx, edx
    mov mov dword ptr [ebp - 16], edx
    mov mov dword ptr [ebp - 12], ebx
    xor xor edi, edi
    mov mov eax, edi
    xor xor ecx, ecx
L11:
    shl shl eax, 4
    push push 4
    lea lea eax, [ebp + eax - 96]
    pop pop edx
    xor xor ebx, ebx
    cmp cmp dword ptr [eax], ebx
    setne setne bl
    add add eax, 4
    add add ecx, ebx
    dec dec edx
    jne sub_100A4DBB
    test test ecx, ecx
    jne sub_100A4E33
    test test edi, edi
    jne sub_100A4DF7
    push push 010115BA8h
    push push 011B2h
    push push dword ptr [ebp - 32]
    push push esi
    call sub_1008B29E
    add add esp, 16
    mov mov dword ptr [ebp - 4], 1
    mov mov dword ptr [ebp - 16], 1
    inc inc edi
    cmp cmp edi, 4
    jb sub_100A4DDF
    cmp cmp dword ptr [ebp - 12], 0
    jne sub_100A4E56
    push push 010115B70h
    push push 011BAh
    push push 0
    push push esi
    call sub_1008B2CD
    add add esp, 16
    mov mov dword ptr [ebp - 4], 1
    mov mov eax, dword ptr [ebp - 4]
    neg neg eax
    sbb sbb eax, eax
    pop pop edi
    and and eax, 080004005h
    pop pop ebx
    pop pop esi
    leave leave
    ret ret
    cmp cmp ecx, 4
    je sub_100A4EBD
    push push edi
    push push 010115B48h
    push push 011B1h
    push push dword ptr [ebp + edi*4 - 32]
    push push esi
    call sub_1008B302
    add add esp, 20
    mov mov dword ptr [ebp - 4], 1
    cmp cmp dword ptr [ebp - 16], 0
    je sub_100A4E85
    and and dword ptr [ebp - 12], 0
    jmp sub_100A4E8B
FUN_100a4a2e ENDP
END
