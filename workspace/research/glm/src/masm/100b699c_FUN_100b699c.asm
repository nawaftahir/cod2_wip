.686
.MODEL FLAT, C
EXTRN sub_1006A7FA:PROC
EXTRN sub_1006A879:PROC
EXTRN sub_100C4F36:PROC
EXTRN sub_100C7CB2:PROC
EXTRN sub_100C8CD5:PROC
EXTRN sub_100C9A17:PROC
EXTRN sub_100F6000:PROC
EXTRN sub_100F78E0:PROC
EXTRN sub_100F7936:PROC
EXTRN sub_100F7971:PROC
.CODE
FUN_100b699c PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 48
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    push edi
    push dword ptr [ebx + 108]
    mov esi, ecx
    mov eax, dword ptr [esi]
    call dword ptr [eax + 0x54]
    push dword ptr [ebx + 108]
    mov dword ptr [ebp + 8], eax
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x58]
    cmp dword ptr [esi + 000000158h], 0
    mov edi, eax
    je L4
    cmp dword ptr [ebx + 108], -1
    je L14
    cmp dword ptr [ebp + 8], 00000FFFFh
    je L3
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_100C8CD5
    push edi
    push dword ptr [eax]
    lea eax, [ebp - 48]
    push 010115CC8h
    push 32
    push eax
    call sub_100F78E0
    add esp, 20
    push 1
    push dword ptr [ebx + 12]
    lea eax, [ebp - 48]
    lea ecx, [esi + 0000001D4h]
    push eax
    mov byte ptr [ebp - 17], 0
    call sub_1006A7FA
    test eax, eax
    jl L16
    inc dword ptr [esi + 0000001F0h]
    test byte ptr [esi + 0000000CCh], 1
    je L3
    mov eax, dword ptr [ebx + 96]
    test eax, eax
    je L3
    cmp dword ptr [eax + 4], 6
    jne L3
    mov edi, dword ptr [eax + 20]
    cmp dword ptr [edi + 4], 3
    jne L3
    mov eax, dword ptr [edi + 24]
    lea edx, [eax + 1]
L0:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L0
    sub eax, edx
    add eax, 3
    push eax
    call sub_100F7936
    test eax, eax
    pop ecx
    mov dword ptr [ebp + 8], eax
    jne L1
    mov eax, 08007000Eh
    jmp L16
L1:
    push dword ptr [edi + 24]
    push 010115CB8h
    push eax
    call sub_100F6000
    add esp, 12
    push 1
    push dword ptr [ebx + 12]
    lea ecx, [esi + 0000001D4h]
    push dword ptr [ebp + 8]
    call sub_1006A879
    push dword ptr [ebp + 8]
    mov edi, eax
    call sub_100F7971
    test edi, edi
    pop ecx
    jge L2
    mov eax, edi
    jmp L16
L2:
    inc dword ptr [esi + 0000001F0h]
L3:
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L14
    mov ecx, dword ptr [ebx + 108]
    jmp L13
L4:
    mov eax, dword ptr [ebp + 8]
    cmp eax, 14
    ja L15
    jmp dword ptr [eax*4 + 0x100b6cd2]
    and dword ptr [ebp + 8], 0
L5:
    cmp edi, 15
    ja L15
L6:
    or edi, 0FFFF8000h
    shl edi, 16
    or dword ptr [ebp + 8], edi
    push 31
    mov ecx, esi
    call sub_100C9A17
    test eax, eax
    jl L16
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_100C7CB2
    test eax, eax
    jl L16
    test byte ptr [esi + 0000000CCh], 1
    je L12
    and dword ptr [ebp - 8], 0
    and dword ptr [ebp - 4], 0
    or eax, 0FFFFFFFFh
    cmp dword ptr [esi + 8], 0
    lea edi, [ebp - 32]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    jbe L9
    mov edi, dword ptr [ebx + 4]
    mov ecx, dword ptr [esi + 20]
L7:
    mov eax, dword ptr [ecx]
    cmp edi, dword ptr [eax + 4]
    jne L8
    mov edx, dword ptr [ebx + 8]
    cmp edx, dword ptr [eax + 8]
    jne L8
    mov edx, dword ptr [ebx + 12]
    cmp edx, dword ptr [eax + 12]
    jne L8
    mov eax, dword ptr [eax + 16]
    mov edx, dword ptr [ebp - 4]
    mov dword ptr [ebp + eax*4 - 32], edx
L8:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    add ecx, 4
    cmp eax, dword ptr [esi + 8]
    jb L7
L9:
    mov edx, dword ptr [ebp - 8]
    xor ecx, ecx
L10:
    mov eax, dword ptr [ebp + ecx*4 - 32]
    cmp eax, -1
    je L11
    mov dword ptr [ebp + edx*4 - 32], eax
    inc edx
L11:
    inc ecx
    cmp ecx, 4
    jb L10
    mov eax, dword ptr [esi]
    push 1
    lea ecx, [ebp - 8]
    push ecx
    push edx
    lea ecx, [ebp - 32]
    push ecx
    mov ecx, esi
    call dword ptr [eax + 0x70]
    test eax, eax
    jl L16
L12:
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 12]
    push ecx
    lea ecx, [ebp - 16]
    push ecx
    push ebx
    mov ecx, esi
    call dword ptr [eax + 0x88]
    test eax, eax
    jl L16
    mov eax, dword ptr [ebp - 12]
    mov edx, dword ptr [esi]
    mov ecx, eax
    or ecx, 0FFFFFFF8h
    shl ecx, 20
    and eax, 24
    or ecx, eax
    mov eax, dword ptr [ebp - 16]
    push 0
    shl ecx, 8
    and eax, 0000007FFh
    or ecx, eax
    push 0000F0000h
    push ecx
    mov ecx, esi
    call dword ptr [edx + 0x64]
    test eax, eax
    jl L16
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L16
    mov ecx, esi
    call sub_100C4F36
    test eax, eax
    jl L16
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L14
    mov ecx, dword ptr [ebp + 8]
L13:
    mov dword ptr [eax], ecx
L14:
    xor eax, eax
    jmp L16
    mov dword ptr [ebp + 8], 1
    jmp L5
    mov dword ptr [ebp + 8], 2
    jmp L5
    mov dword ptr [ebp + 8], 3
    jmp L5
    mov dword ptr [ebp + 8], 4
    jmp L5
    mov dword ptr [ebp + 8], 5
    jmp L5
    mov dword ptr [ebp + 8], 6
    jmp L5
    mov dword ptr [ebp + 8], 7
    jmp L5
    test edi, edi
    mov dword ptr [ebp + 8], 8
    je L6
L15:
    mov eax, 080004005h
L16:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
    mov dword ptr [ebp + 8], 9
    jmp L5
    mov dword ptr [ebp + 8], 10
    jmp L5
    mov dword ptr [ebp + 8], 11
    jmp L5
    mov dword ptr [ebp + 8], 12
    jmp L5
    mov dword ptr [ebp + 8], 13
    jmp L5
    xor eax, eax
    inc eax
    jmp L16
FUN_100b699c ENDP
END
