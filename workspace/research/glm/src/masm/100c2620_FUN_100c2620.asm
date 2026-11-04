.686
.MODEL FLAT, C
EXTRN sub_100857F0:PROC
EXTRN sub_10086ED5:PROC
EXTRN sub_1008A75D:PROC
EXTRN sub_1008A9A5:PROC
EXTRN sub_1008A9B9:PROC
EXTRN sub_1008AD0B:PROC
EXTRN sub_10092A1B:PROC
EXTRN sub_10092A58:PROC
EXTRN sub_10092A95:PROC
EXTRN sub_10093100:PROC
EXTRN sub_10093137:PROC
EXTRN sub_10093176:PROC
EXTRN sub_100BA213:PROC
EXTRN sub_100C25B9:PROC
EXTRN sub_100C27D6:PROC
EXTRN sub_100F79AE:PROC
EXTRN sub_100F79C6:PROC
EXTRN sub_100F7BBA:PROC
EXTRN sub_100F7BC2:PROC
.CODE
FUN_100c2620 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0000000E8h
    push ebx
    mov ebx, ecx
    test byte ptr [ebx + 0000000CCh], 4
    je L0
    xor eax, eax
    inc eax
    jmp L26
L0:
    push edi
    mov ecx, ebx
    call sub_10086ED5
    xor edi, edi
    cmp eax, edi
    jl L25
    mov ecx, ebx
    call sub_1008AD0B
    cmp eax, edi
    jl L25
    push esi
    mov esi, dword ptr [ebx + 12]
    push 25
    mov dword ptr [ebp - 8], edi
    mov dword ptr [ebp - 12], edi
    mov dword ptr [ebp - 28], edi
    pop ecx
    xor eax, eax
    test byte ptr [ebx + 111], 16
    lea edi, [ebp - 000000084h]
    rep stosd dword ptr es:[edi], eax
    push 25
    pop ecx
    lea edi, [ebp - 0000000E8h]
    mov dword ptr [ebp - 20], esi
    rep stosd dword ptr es:[edi], eax
    jne L4
    mov eax, dword ptr [ebx + 48]
    test eax, eax
    je L1
    push eax
    push dword ptr [ebx + 00000008Ch]
    lea eax, [ebp - 0000000E8h]
    push eax
    mov ecx, ebx
    call sub_10092A1B
    mov edi, eax
    test edi, edi
    jl L23
    push 0
    lea eax, [ebp - 0000000E8h]
    push eax
    mov ecx, ebx
    call sub_10093100
    xor ecx, ecx
    test eax, eax
    setge cl
    mov dword ptr [ebp - 28], ecx
L1:
    mov eax, dword ptr [ebx + 44]
    dec eax
    push eax
    push dword ptr [ebx + 000000088h]
    lea eax, [ebp - 000000084h]
    push eax
    mov ecx, ebx
    call sub_10092A58
    test eax, eax
    jl L2
    push 0
    lea eax, [ebp - 000000084h]
    push eax
    mov ecx, ebx
    call sub_10093137
    test eax, eax
    jge L4
L2:
    lea eax, [ebp - 000000084h]
    push eax
    mov ecx, ebx
    call sub_1008A75D
    push dword ptr [ebx + 44]
    lea eax, [ebp - 000000084h]
    push dword ptr [ebx + 000000088h]
    mov ecx, ebx
    push eax
    call sub_10092A95
    mov edi, eax
    test edi, edi
    jl L3
    push 0
    lea eax, [ebp - 000000084h]
    push eax
    mov ecx, ebx
    call sub_10093176
    mov edi, eax
    test edi, edi
    jge L4
L3:
    cmp edi, 08007000Eh
    je L23
    xor edi, edi
    inc edi
    jmp L23
L4:
    shl esi, 2
    push esi
    mov dword ptr [ebp - 16], esi
    call sub_100F79AE
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 8], eax
    jne L6
L5:
    mov edi, 08007000Eh
    jmp L23
L6:
    push esi
    call sub_100F79C6
    mov edi, eax
    test edi, edi
    pop ecx
    mov dword ptr [ebp - 12], edi
    je L5
    mov ecx, esi
    mov esi, dword ptr [ebx + 24]
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov edx, dword ptr [ebp - 20]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [ebp - 16]
    mov esi, dword ptr [ebx + 24]
    mov edi, dword ptr [ebp - 8]
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    xor ecx, ecx
    test edx, edx
    jbe L8
L7:
    mov eax, dword ptr [ebx + 24]
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [ebx + 000000100h], eax
    or dword ptr [eax + 36], 0FFFFFFFFh
    inc ecx
    cmp ecx, edx
    jb L7
L8:
    lea edi, [edx - 1]
    test edi, edi
    mov dword ptr [ebp - 4], edi
    jl L22
L9:
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [eax + edi*4]
    mov dword ptr [ebx + 000000100h], ecx
    mov eax, dword ptr [ecx]
    mov esi, 0FFF00000h
    test esi, eax
    je L21
    and eax, 0F0000000h
    cmp eax, 060000000h
    je L21
    call sub_100857F0
    test eax, eax
    jne L21
    mov eax, dword ptr [ebx + 000000100h]
    mov ecx, dword ptr [eax]
    and ecx, esi
    cmp ecx, 011000000h
    je L21
    push edi
    push eax
    push dword ptr [ebp - 12]
    mov ecx, ebx
    call sub_100BA213
    test byte ptr [ebx + 112], 8
    je L19
    mov eax, dword ptr [ebx + 000000100h]
    mov edx, dword ptr [eax]
    xor ecx, ecx
    and edx, esi
    cmp edx, 050000000h
    mov dword ptr [ebp - 20], ecx
    mov dword ptr [ebp - 24], ecx
    jne L10
    mov dword ptr [ebp - 24], 1
L10:
    cmp dword ptr [eax + 12], ecx
    jbe L16
    mov ecx, dword ptr [ebx + 108]
    mov edx, dword ptr [ebx + 000000100h]
    mov edx, dword ptr [edx + 12]
    mov esi, dword ptr [ebx + 20]
    mov eax, dword ptr [eax + 16]
    shl ecx, 3
    sar ecx, 31
    mov dword ptr [ebp - 32], edx
L11:
    test ecx, ecx
    mov edx, dword ptr [eax]
    mov edx, dword ptr [esi + edx*4]
    jne L12
    mov edi, dword ptr [ebp - 000000084h]
    cmp edi, dword ptr [edx + 4]
    jne L12
    mov edi, dword ptr [edx + 12]
    mov edx, dword ptr [edx + 16]
    lea edx, [edx + edi*4]
    mov edi, dword ptr [ebp - 112]
    mov edx, dword ptr [edi + edx*4]
    jmp L13
L12:
    mov edx, dword ptr [edx + 16]
L13:
    cmp edx, 3
    jne L14
    mov dword ptr [ebp - 20], 1
    jmp L15
L14:
    mov dword ptr [ebp - 24], 1
L15:
    add eax, 4
    dec dword ptr [ebp - 32]
    jne L11
L16:
    xor eax, eax
    cmp dword ptr [ebp - 24], eax
    jne L17
    push 1
    push eax
    jmp L18
L17:
    cmp dword ptr [ebp - 20], eax
    jne L21
    push 0
    push 1
L18:
    push dword ptr [ebp - 4]
    lea eax, [ebp - 000000084h]
    push dword ptr [ebp - 12]
    mov ecx, ebx
    push dword ptr [ebp - 8]
    push eax
    call sub_100C25B9
    jmp L20
L19:
    push dword ptr [ebp - 28]
    lea eax, [ebp - 0000000E8h]
    push edi
    push dword ptr [ebp - 12]
    mov ecx, ebx
    push dword ptr [ebp - 8]
    push eax
    lea eax, [ebp - 000000084h]
    push eax
    call sub_100C27D6
L20:
    mov edi, eax
    test edi, edi
    jl L23
    jne L21
    mov ecx, dword ptr [ebp - 16]
    mov esi, dword ptr [ebx + 24]
    mov edi, dword ptr [ebp - 8]
    mov eax, ecx
    shr ecx, 2
    dec dword ptr [ebp - 4]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
L21:
    mov edi, dword ptr [ebp - 4]
    dec edi
    mov dword ptr [ebp - 4], edi
    jns L9
L22:
    xor edi, edi
L23:
    test byte ptr [ebx + 111], 16
    pop esi
    jne L24
    lea eax, [ebp - 000000084h]
    push eax
    mov ecx, ebx
    call sub_1008A9A5
    cmp dword ptr [ebx + 48], 0
    je L24
    lea eax, [ebp - 0000000E8h]
    push eax
    mov ecx, ebx
    call sub_1008A9B9
L24:
    push dword ptr [ebp - 12]
    call sub_100F7BBA
    push dword ptr [ebp - 8]
    call sub_100F7BC2
    pop ecx
    pop ecx
    mov eax, edi
L25:
    pop edi
L26:
    pop ebx
    leave
    ret
FUN_100c2620 ENDP
END
