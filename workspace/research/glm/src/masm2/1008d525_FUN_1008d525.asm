.686
.MODEL FLAT, C
EXTRN sub_1006DBFA:PROC
EXTRN sub_1008A98E:PROC
EXTRN sub_1008AFC9:PROC
EXTRN sub_1008D61F:PROC
EXTRN sub_1008D625:PROC
EXTRN sub_1008D62F:PROC
EXTRN sub_1008D657:PROC
EXTRN sub_1008D6A2:PROC
EXTRN sub_1008D6A4:PROC
EXTRN sub_1008D6AA:PROC
EXTRN sub_1008D6B7:PROC
.CODE
FUN_1008d525 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    push push esi
    xor xor ebx, ebx
    push push edi
    mov mov esi, ecx
    mov mov dword ptr [ebp - 4], ebx
    call sub_1008A98E
    xor xor edx, edx
    cmp cmp dword ptr [esi + 4], ebx
    jbe L0
    mov mov eax, dword ptr [esi + 16]
    mov mov ecx, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [ecx + 4]
    test test ah, 4
    je L1
    cmp cmp dword ptr [ecx + 40], -1
    jne L2
    and and eax, 0FFFFFBFFh
    mov mov dword ptr [ecx + 4], eax
    mov mov dword ptr [ebp - 4], 1
    inc inc edx
    cmp cmp edx, dword ptr [esi + 4]
    jb L0
    xor xor edi, edi
    xor xor edx, edx
    cmp cmp dword ptr [esi + 8], ebx
    jbe L5
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [eax + 4]
    mov mov ebx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ebx + ecx*4]
    mov mov ecx, dword ptr [ecx + 4]
    test test ch, 1
    je L3
    test test ch, 8
    je L4
    mov mov dword ptr [eax + 84], 1
    cmp cmp dword ptr [eax + 84], -1
    jne sub_1008D61F
    cmp cmp dword ptr [eax + 72], -1
    jne sub_1008D625
    or or dword ptr [eax + 48], -1
    jmp sub_1008D62F
    mov mov dword ptr [eax + 48], edi
    inc inc edi
    inc inc edx
    cmp cmp edx, dword ptr [esi + 8]
    jb L4
    xor xor ebx, ebx
    cmp cmp edi, dword ptr [esi + 8]
    jne sub_1008D657
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 4], ebx
    sete sete al
    jmp sub_1008D6B7
    mov mov ecx, esi
    call sub_1008AFC9
    xor xor edi, edi
    cmp cmp dword ptr [esi + 8], ebx
    jbe sub_1008D6A2
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [eax + edi*4]
    cmp cmp dword ptr [ecx + 84], -1
    jne sub_1008D6A4
    cmp cmp dword ptr [ecx + 72], -1
    jne sub_1008D6AA
    push push 1
    call sub_1006DBFA
    jmp sub_1008D6B7
    mov mov dword ptr [eax + ebx*4], ecx
    inc inc ebx
    inc inc edi
    cmp cmp edi, dword ptr [esi + 8]
    jb sub_1008D6A2
    mov mov ecx, dword ptr [esi + 8]
    mov mov edx, dword ptr [esi + 20]
    sub sub ecx, ebx
    shl shl ecx, 2
    lea lea edi, [edx + ebx*4]
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov dword ptr [esi + 8], ebx
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_1008d525 ENDP
END
