.686
.MODEL FLAT, C
EXTRN sub_1008B2BB:PROC
EXTRN sub_1008B2DF:PROC
EXTRN sub_1008B2F7:PROC
EXTRN sub_100A6EF8:PROC
.CODE
FUN_100a9330 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 12
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ecx + 12], 0
    push ebx
    push esi
    push edi
    jbe L6
    mov eax, dword ptr [ecx + 24]
    mov dword ptr [ebp - 8], eax
    mov edi, 011000000h
L0:
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [ecx + 0000000FCh], eax
    mov eax, dword ptr [ebp - 8]
    mov esi, dword ptr [eax]
    test esi, esi
    mov dword ptr [ecx + 000000100h], esi
    je L5
    cmp dword ptr [esi], 0
    je L5
    mov eax, dword ptr [esi]
    mov edx, eax
    and eax, 0000FFFFFh
    mov ebx, eax
    and edx, 0FFF00000h
    mov eax, 060C00000h
    cmp edx, eax
    ja L2
    je L15
    cmp edx, 060200000h
    je L14
    cmp edx, 060300000h
    je L13
    cmp edx, 060700000h
    je L1
    cmp edx, 060800000h
    jne L3
    xor eax, eax
    inc eax
    jmp L22
L1:
    mov eax, dword ptr [ecx + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000104h
    je L3
    xor edx, edx
    inc edx
    mov eax, edx
    jmp L23
L2:
    cmp edx, 060D00000h
    je L20
    cmp edx, 061100000h
    je L17
    cmp edx, 061200000h
    je L16
L3:
    push edx
    call sub_100A6EF8
    test eax, eax
    jne L4
    cmp edx, edi
    jne L5
L4:
    mov eax, dword ptr [esi + 8]
    sub edx, edi
    neg edx
    sbb edx, edx
    and edx, ebx
    mov eax, dword ptr [eax + edx*4]
    mov edx, dword ptr [ecx + 20]
    mov eax, dword ptr [edx + eax*4]
    cmp dword ptr [eax + 60], 0
    je L5
    mov edx, dword ptr [ecx + 0000000C8h]
    and edx, 00000FFFFh
    cmp edx, 000000104h
    je L5
    mov eax, dword ptr [eax + 4]
    mov edx, dword ptr [ecx + 16]
    mov eax, dword ptr [edx + eax*4]
    test byte ptr [eax + 4], 16
    jne L24
L5:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    add dword ptr [ebp - 8], 4
    cmp eax, dword ptr [ecx + 12]
    jb L0
L6:
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ecx + 12], 0
    jbe L11
    mov eax, dword ptr [ecx + 24]
    mov dword ptr [ebp - 12], eax
L7:
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [ecx + 0000000FCh], eax
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [eax]
    xor edx, edx
    cmp eax, edx
    mov dword ptr [ecx + 000000100h], eax
    je L10
    cmp dword ptr [eax], edx
    je L10
    cmp dword ptr [eax + 4], edx
    mov dword ptr [ebp - 8], edx
    jbe L10
    mov edi, dword ptr [ecx + 20]
    mov edx, dword ptr [eax + 8]
L8:
    mov esi, dword ptr [edx]
    mov esi, dword ptr [edi + esi*4]
    mov ebx, dword ptr [ecx + 000000080h]
    cmp dword ptr [esi + 4], ebx
    jne L9
    cmp byte ptr [esi + 108], 5
    je L25
L9:
    inc dword ptr [ebp - 8]
    mov esi, dword ptr [ecx + 000000100h]
    mov ebx, dword ptr [ebp - 8]
    add edx, 4
    cmp ebx, dword ptr [esi + 4]
    jb L8
L10:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    add dword ptr [ebp - 12], 4
    cmp eax, dword ptr [ecx + 12]
    jb L7
L11:
    xor eax, eax
L12:
    pop edi
    pop esi
    pop ebx
    leave
    ret
L13:
    xor eax, eax
    jmp L22
L14:
    xor eax, eax
    jmp L19
L15:
    push 2
    jmp L18
L16:
    push 3
    jmp L21
L17:
    push 3
L18:
    pop eax
L19:
    xor edx, edx
    inc edx
    jmp L23
L20:
    push 2
L21:
    pop eax
L22:
    xor edx, edx
L23:
    mov edi, dword ptr [ecx + 0000000C8h]
    and edi, 0000000FFh
    push edi
    push dword ptr [edx*4 + 0101A4080h]
    push dword ptr [eax*4 + 0101A4070h]
    push 010116CECh
    push 0000011B4h
    push dword ptr [esi + 60]
    push ecx
    call sub_1008B2BB
    add esp, 28
    jmp L26
L24:
    mov eax, dword ptr [ecx + 0000000C8h]
    and eax, 0000000FFh
    push eax
    push 010116CBCh
    push 0000011B4h
    push dword ptr [esi + 60]
    push ecx
    call sub_1008B2DF
    add esp, 20
    jmp L26
L25:
    push 010116C7Ch
    push 0000011A0h
    push dword ptr [eax + 60]
    push ecx
    call sub_1008B2F7
    add esp, 16
L26:
    mov eax, 080004005h
    jmp L12
FUN_100a9330 ENDP
END
