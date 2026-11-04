.686
.MODEL FLAT, C
EXTRN sub_1008B5C8:PROC
EXTRN sub_1008B5E4:PROC
EXTRN sub_100AA5B5:PROC
EXTRN sub_100AA5CB:PROC
EXTRN sub_100AA801:PROC
EXTRN sub_100AA841:PROC
EXTRN sub_100F7A5F:PROC
EXTRN sub_100F7B26:PROC
EXTRN sub_100F7B37:PROC
EXTRN sub_100F7B48:PROC
EXTRN sub_100F7B60:PROC
EXTRN sub_100F7D4F:PROC
EXTRN sub_100F7D5E:PROC
.CODE
FUN_100aab2a PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 112
    and dword ptr [ebp - 16], 0
    and dword ptr [ebp - 8], 0
    push ebx
    push esi
    push edi
    mov esi, ecx
    push 6
    pop edx
    xor eax, eax
    mov ecx, edx
    lea edi, [ebp - 88]
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    lea edi, [ebp - 112]
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    lea edi, [ebp - 64]
    rep stosd dword ptr es:[edi], eax
    or eax, 0FFFFFFFFh
    mov ecx, edx
    lea edi, [esi + 00000040Ch]
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    lea edi, [esi + 000000424h]
    rep stosd dword ptr es:[edi], eax
    xor edi, edi
    cmp dword ptr [esi + 12], edi
    mov dword ptr [ebp - 20], 1
    mov dword ptr [ebp - 28], edi
    mov dword ptr [ebp - 4], edi
    jbe L9
    xor ebx, ebx
    inc ebx
L0:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [eax]
    mov edx, ecx
    and edx, 0FFF00000h
    cmp edx, 060000000h
    mov dword ptr [eax + 36], edi
    je L12
    cmp edx, 060500000h
    je L12
    cmp edx, 060A00000h
    je L12
    cmp edx, 060F00000h
    je L12
    cmp edx, 011000000h
    je L13
    cmp edx, 072C00000h
    je L12
    cmp edx, 072D00000h
    je L12
    mov edi, ecx
    and edi, 0000FFFFFh
    mov dword ptr [ebp - 36], edi
    je L7
    test ecx, ecx
    je L7
    and dword ptr [ebp - 12], 0
    cmp dword ptr [eax + 4], 0
    jbe L6
    mov ecx, dword ptr [eax + 4]
    mov eax, dword ptr [eax + 8]
    mov dword ptr [ebp - 40], ecx
    mov dword ptr [ebp - 24], eax
L1:
    mov eax, dword ptr [ebp - 24]
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [esi + 000000080h]
    cmp dword ptr [ecx + 4], eax
    jne L5
    cmp byte ptr [ecx + 108], 3
    movzx eax, byte ptr [ecx + 109]
    jne L5
    mov edx, eax
    shl edx, 2
    lea eax, [ebp + edx - 88]
    cmp dword ptr [eax], 0
    je L2
    mov ecx, dword ptr [esi + 0000000C8h]
    and ecx, 00000FFFFh
    cmp ecx, 000000104h
    je L2
    cmp dword ptr [ebp + edx - 64], 0
    jne L2
    and dword ptr [ebp - 20], 0
L2:
    mov dword ptr [eax], ebx
    mov eax, dword ptr [ebp - 12]
    lea ecx, [eax + edi]
    cmp eax, ecx
    mov dword ptr [ebp + edx - 112], ebx
    jae L5
    sub ecx, dword ptr [ebp - 12]
    mov ebx, dword ptr [ebp - 24]
    lea edx, [ebp + edx - 64]
    mov eax, dword ptr [edx]
    mov dword ptr [ebp - 32], ecx
L3:
    mov edi, dword ptr [ebx]
    mov ecx, dword ptr [esi + 20]
    mov edi, dword ptr [ecx + edi*4]
    mov edi, dword ptr [edi + 16]
    inc edi
    cmp edi, eax
    jbe L4
    mov eax, edi
L4:
    add ebx, 4
    dec dword ptr [ebp - 32]
    jne L3
    mov edi, dword ptr [ebp - 36]
    xor ebx, ebx
    mov dword ptr [edx], eax
    inc ebx
L5:
    add dword ptr [ebp - 12], edi
    mov eax, edi
    shl eax, 2
    add dword ptr [ebp - 24], eax
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [ebp - 40]
    jb L1
L6:
    inc dword ptr [ebp - 28]
L7:
    xor edi, edi
L8:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 12]
    jb L0
    cmp dword ptr [ebp - 28], 16
    jbe L9
    mov dword ptr [ebp - 20], edi
L9:
    xor eax, eax
    cmp dword ptr [esi + 8], edi
    jbe L11
L10:
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    inc eax
    mov dword ptr [ecx + 64], edi
    cmp eax, dword ptr [esi + 8]
    jb L10
L11:
    cmp dword ptr [ebp - 20], edi
    mov ebx, dword ptr [esi + 12]
    mov dword ptr [ebp - 40], ebx
    je L19
    push 000000800h
    mov dword ptr [esi + 00000022Ch], edi
    call sub_100F7A5F
    mov edi, eax
    test edi, edi
    pop ecx
    mov dword ptr [esi + 000000230h], edi
    je L20
    xor eax, eax
    push eax
    push eax
    push ebx
    mov ecx, 000000200h
    rep stosd dword ptr es:[edi], eax
    push dword ptr [esi + 24]
    lea eax, [esi + 000000224h]
    push eax
    push dword ptr [esi + 000000230h]
    mov ecx, esi
    call sub_100AA5B5
    test eax, eax
    jge L32
    jmp L38
L12:
    cmp edx, 011000000h
    jne L14
L13:
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax]
    jmp L15
L14:
    mov eax, dword ptr [eax + 8]
    and ecx, 0000FFFFFh
    mov eax, dword ptr [eax + ecx*4]
L15:
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 4]
    cmp ecx, dword ptr [esi + 000000080h]
    jne L17
    cmp dword ptr [eax + 60], edi
    jne L17
    cmp byte ptr [eax + 108], 3
    movzx ecx, byte ptr [eax + 109]
    jne L18
    lea eax, [ebp + ecx*4 - 88]
    cmp dword ptr [eax], edi
    je L16
    mov ecx, dword ptr [esi + 0000000C8h]
    and ecx, 00000FFFFh
    cmp ecx, 000000104h
    je L16
    mov dword ptr [ebp - 20], edi
L16:
    mov dword ptr [eax], ebx
    jmp L8
L17:
    mov dword ptr [ebp - 20], edi
    jmp L8
L18:
    push 010117110h
    push 0000011A1h
    push dword ptr [eax + 96]
    jmp L40
L19:
    mov edi, 000000800h
    push edi
    call sub_100F7B26
    test eax, eax
    pop ecx
    mov dword ptr [esi + 00000022Ch], eax
    je L20
    push edi
    call sub_100F7B37
    test eax, eax
    pop ecx
    mov dword ptr [esi + 000000230h], eax
    je L20
    push edi
    call sub_100F7B48
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 16], eax
    jne L21
L20:
    mov eax, 08007000Eh
    jmp L38
L21:
    push edi
    call sub_100F7B60
    mov edi, dword ptr [esi + 00000022Ch]
    mov ebx, 000000200h
    mov dword ptr [ebp - 8], eax
    xor eax, eax
    pop ecx
    mov ecx, ebx
    rep stosd dword ptr es:[edi], eax
    mov edi, dword ptr [esi + 000000230h]
    mov ecx, ebx
    rep stosd dword ptr es:[edi], eax
    mov edi, dword ptr [ebp - 16]
    mov ecx, ebx
    rep stosd dword ptr es:[edi], eax
    mov edi, dword ptr [ebp - 8]
    mov ecx, ebx
    rep stosd dword ptr es:[edi], eax
    cmp dword ptr [esi + 12], eax
    mov dword ptr [esi + 000000220h], eax
    mov dword ptr [esi + 000000224h], eax
    mov dword ptr [ebp - 12], eax
    mov dword ptr [ebp - 4], eax
    jbe L27
L22:
    cmp dword ptr [ebp - 4], ebx
    jae L39
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [esi + 24]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [eax]
    mov edx, ecx
    and edx, 0FFF00000h
    cmp edx, 060000000h
    je L23
    cmp edx, 060500000h
    je L23
    cmp edx, 060A00000h
    je L23
    cmp edx, 060F00000h
    je L23
    cmp edx, 011000000h
    je L23
    cmp edx, 072D00000h
    je L23
    cmp edx, 072C00000h
    jne L26
L23:
    and ecx, 0000FFFFFh
    cmp edx, 011000000h
    mov dword ptr [ebp - 32], ecx
    jne L24
    xor ecx, ecx
    mov dword ptr [ebp - 32], ecx
L24:
    mov edx, dword ptr [eax + 8]
    mov edi, dword ptr [esi + 20]
    lea edx, [edx + ecx*4]
    mov ecx, dword ptr [edx]
    mov ecx, dword ptr [edi + ecx*4]
    mov edi, dword ptr [ecx + 4]
    cmp edi, dword ptr [esi + 000000088h]
    je L25
    cmp dword ptr [ecx + 60], 0
    jne L25
    cmp edi, dword ptr [esi + 000000080h]
    jne L26
    cmp byte ptr [ecx + 108], 3
    jne L41
    movzx eax, byte ptr [ecx + 109]
    cmp dword ptr [ebp + eax*4 - 112], 0
    je L26
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000104h
    je L26
    push 0101170C0h
    push 0000011A8h
    jmp L42
L25:
    mov eax, dword ptr [eax + 4]
    sub eax, dword ptr [ebp - 32]
    lea ecx, [ebp - 12]
    push ecx
    push dword ptr [ebp - 16]
    mov ecx, esi
    push eax
    push edx
    call sub_100AA5CB
    mov edi, eax
    test edi, edi
    jl L35
L26:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 12]
    jb L22
L27:
    xor ebx, ebx
    xor edx, edx
    cmp dword ptr [ebp - 12], ebx
    jbe L29
    mov eax, dword ptr [ebp - 16]
    mov ecx, dword ptr [ebp - 8]
    sub ecx, eax
L28:
    mov edi, dword ptr [eax]
    mov dword ptr [ecx + eax], edi
    mov dword ptr [eax], ebx
    inc edx
    add eax, 4
    cmp edx, dword ptr [ebp - 12]
    jb L28
L29:
    push ebx
    push ebx
    push dword ptr [ebp - 40]
    lea eax, [esi + 000000224h]
    push dword ptr [esi + 24]
    mov ecx, esi
    push eax
    push dword ptr [esi + 000000230h]
    call sub_100AA801
    mov edi, eax
    cmp edi, ebx
    jl L35
    xor eax, eax
    cmp dword ptr [ebp - 12], eax
    jbe L31
L30:
    mov ecx, dword ptr [ebp - 8]
    mov ecx, dword ptr [ecx + eax*4]
    and dword ptr [ecx + 36], 0
    inc eax
    cmp eax, dword ptr [ebp - 12]
    jb L30
L31:
    push dword ptr [esi + 76]
    lea eax, [esi + 000000220h]
    push dword ptr [esi + 000000230h]
    mov ecx, esi
    push dword ptr [ebp - 12]
    push dword ptr [ebp - 8]
    push eax
    push dword ptr [esi + 00000022Ch]
    call sub_100AA841
    mov edi, eax
    test edi, edi
    jl L35
L32:
    xor edi, edi
    xor ecx, ecx
    cmp dword ptr [esi + 8], edi
    jbe L35
L33:
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    cmp dword ptr [eax + 64], 1
    jne L34
    mov edx, dword ptr [esi + 116]
    mov dword ptr [eax + 4], edx
L34:
    inc ecx
    cmp ecx, dword ptr [esi + 8]
    jb L33
L35:
    cmp dword ptr [ebp - 16], 0
    je L36
    push dword ptr [ebp - 16]
    call sub_100F7D4F
    pop ecx
L36:
    cmp dword ptr [ebp - 8], 0
    je L37
    push dword ptr [ebp - 8]
    call sub_100F7D5E
    pop ecx
L37:
    mov eax, edi
L38:
    pop edi
    pop esi
    pop ebx
    leave
    ret
L39:
    push 010116F88h
    push 0000011A2h
    push 0
L40:
    push esi
    call sub_1008B5C8
    add esp, 16
    mov eax, 080004005h
    jmp L38
L41:
    push 010116D90h
    push 0000011A1h
L42:
    push 0
    push esi
    call sub_1008B5E4
    add esp, 16
    mov edi, 080004005h
    jmp L35
FUN_100aab2a ENDP
END
