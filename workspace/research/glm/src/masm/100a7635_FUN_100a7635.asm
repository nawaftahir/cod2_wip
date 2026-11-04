.686
.MODEL FLAT, C
EXTRN sub_1006C5EF:PROC
EXTRN sub_1006C60B:PROC
EXTRN sub_10085441:PROC
EXTRN sub_100854C3:PROC
EXTRN sub_100858D1:PROC
EXTRN sub_1008595A:PROC
EXTRN sub_10086212:PROC
EXTRN sub_10086291:PROC
EXTRN g_1019BEB8:DWORD
.CODE
FUN_100a7635 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 16
    push ebx
    mov ebx, ecx
    push edi
    mov edi, dword ptr [ebx + 000000100h]
    mov eax, dword ptr [edi]
    and eax, 0FFF00000h
    cmp eax, 010100000h
    je L0
    xor eax, eax
    jmp L19
L0:
    mov eax, dword ptr [ebx + 000000100h]
    mov ecx, dword ptr [ebx + 20]
    mov edx, dword ptr [ebx + 16]
    and dword ptr [ebp - 4], 0
    push esi
    mov esi, dword ptr [eax]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 4]
    mov eax, dword ptr [edx + eax*4]
    and esi, 0000FFFFFh
    mov edx, 000000200h
    test dword ptr [eax + 4], edx
    mov dword ptr [ebp - 16], esi
    je L1
    mov dword ptr [ebp - 4], 1
L1:
    test byte ptr [ebx + 110], 2
    je L6
    test esi, esi
    jbe L6
    mov eax, dword ptr [edi + 8]
    mov dword ptr [ebp - 8], eax
    mov dword ptr [ebp - 12], esi
L2:
    mov eax, dword ptr [ebp - 8]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [ecx + eax*4]
    test dword ptr [eax + 60], edx
    je L3
    mov dword ptr [ebp - 4], 1
L3:
    mov edi, dword ptr [eax + 56]
    cmp edi, -1
    je L4
    mov eax, dword ptr [ecx + edi*4]
L4:
    test dword ptr [eax + 60], edx
    je L5
    mov dword ptr [ebp - 4], 1
L5:
    add dword ptr [ebp - 8], 4
    dec dword ptr [ebp - 12]
    jne L2
L6:
    cmp dword ptr [ebp - 4], 0
    jne L7
    xor eax, eax
    jmp L18
L7:
    push 116
    call sub_100858D1
    test eax, eax
    je L8
    mov ecx, eax
    call sub_10085441
    mov dword ptr [ebp - 4], eax
    jmp L9
L8:
    and dword ptr [ebp - 4], 0
L9:
    mov ecx, dword ptr [ebp - 4]
    test ecx, ecx
    jne L10
    mov edi, 08007000Eh
    jmp L17
L10:
    push 0
    push esi
    lea eax, [esi + esi]
    push eax
    mov eax, esi
    and eax, 0000FFFFFh
    or eax, 020500000h
    push eax
    call sub_1008595A
    mov edi, eax
    test edi, edi
    jl L16
    push dword ptr [ebx + 000000100h]
    mov ecx, dword ptr [ebp - 4]
    call sub_100854C3
    mov edi, eax
    test edi, edi
    jl L16
    push 4
    push 1
    push 000000311h
    push 01010E914h
    mov ecx, ebx
    call sub_10086212
    cmp eax, -1
    jne L12
L11:
    mov edi, 08007000Eh
    jmp L16
L12:
    fld qword ptr [g_1019BEB8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 0
    push 0
    push eax
    mov ecx, ebx
    call sub_10086291
    cmp eax, -1
    mov dword ptr [ebp - 8], eax
    je L11
    mov edx, dword ptr [ebx + 000000100h]
    mov eax, esi
    mov esi, dword ptr [edx + 8]
    mov edx, dword ptr [ebp - 4]
    mov edi, dword ptr [edx + 8]
    shl eax, 2
    mov ecx, eax
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    mov edx, dword ptr [ebp - 4]
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [edx + 16]
    mov dword ptr [ebp - 12], eax
    mov ecx, eax
    mov eax, dword ptr [ebx + 000000100h]
    mov esi, dword ptr [eax + 16]
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [ebp - 16]
    test ecx, ecx
    jbe L14
L13:
    mov esi, dword ptr [edx + 8]
    mov edi, dword ptr [ebp - 8]
    mov dword ptr [eax + esi], edi
    add eax, 4
    dec ecx
    jne L13
L14:
    mov ecx, dword ptr [ebx + 24]
    lea esi, [ebx + 0000000FCh]
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [ecx + eax*4]
    xor edi, edi
    cmp ecx, edi
    je L15
    push 1
    call sub_1006C5EF
    mov edx, dword ptr [ebp - 4]
L15:
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [ebx + 24]
    mov dword ptr [ecx + eax*4], edx
    mov dword ptr [ebp - 4], edi
L16:
    mov ecx, dword ptr [ebp - 4]
    test ecx, ecx
    je L17
    push 1
    call sub_1006C60B
L17:
    mov eax, edi
L18:
    pop esi
L19:
    pop edi
    pop ebx
    leave
    ret
FUN_100a7635 ENDP
END
