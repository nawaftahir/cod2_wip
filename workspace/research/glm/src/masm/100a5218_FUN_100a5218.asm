.686
.MODEL FLAT, C
EXTRN sub_1006A819:PROC
EXTRN sub_1006A898:PROC
EXTRN sub_100C50A3:PROC
EXTRN sub_100C7CE5:PROC
EXTRN sub_100C8CE5:PROC
EXTRN sub_100C8CF4:PROC
EXTRN sub_100C9A4A:PROC
EXTRN sub_100F601F:PROC
EXTRN sub_100F78FF:PROC
EXTRN sub_100F7955:PROC
EXTRN sub_100F7990:PROC
.CODE
FUN_100a5218 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 76
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
    xor ecx, ecx
    cmp dword ptr [esi + 000000158h], ecx
    mov edi, eax
    je L6
    cmp dword ptr [ebx + 108], -1
    je L22
    cmp dword ptr [ebp + 8], 00000FFFFh
    je L5
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [ebx + 4]
    mov eax, dword ptr [ecx + eax*4]
    test byte ptr [eax + 4], 16
    push dword ptr [ebp + 8]
    mov ecx, esi
    je L0
    call sub_100C8CE5
    push edi
    push dword ptr [eax]
    push 010115CC8h
    jmp L1
L0:
    call sub_100C8CF4
    push edi
    push dword ptr [eax]
    push 010115CC0h
L1:
    lea eax, [ebp - 76]
    push 32
    push eax
    call sub_100F78FF
    add esp, 20
    push 1
    push dword ptr [ebx + 12]
    lea eax, [ebp - 76]
    lea ecx, [esi + 0000001D4h]
    push eax
    mov byte ptr [ebp - 45], 0
    call sub_1006A819
    test eax, eax
    jl L11
    inc dword ptr [esi + 0000001F0h]
    test byte ptr [esi + 0000000CCh], 1
    je L5
    mov eax, dword ptr [ebx + 96]
    test eax, eax
    je L5
    cmp dword ptr [eax + 4], 6
    jne L5
    mov edi, dword ptr [eax + 20]
    cmp dword ptr [edi + 4], 3
    jne L5
    mov eax, dword ptr [edi + 24]
    lea edx, [eax + 1]
L2:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L2
    sub eax, edx
    add eax, 3
    push eax
    call sub_100F7955
    test eax, eax
    pop ecx
    mov dword ptr [ebp + 8], eax
    jne L3
    mov eax, 08007000Eh
    jmp L11
L3:
    push dword ptr [edi + 24]
    push 010115CB8h
    push eax
    call sub_100F601F
    add esp, 12
    push 1
    push dword ptr [ebx + 12]
    lea ecx, [esi + 0000001D4h]
    push dword ptr [ebp + 8]
    call sub_1006A898
    push dword ptr [ebp + 8]
    mov edi, eax
    call sub_100F7990
    test edi, edi
    pop ecx
    jge L4
    mov eax, edi
    jmp L11
L4:
    inc dword ptr [esi + 0000001F0h]
L5:
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L22
    mov ecx, dword ptr [ebx + 108]
    mov dword ptr [eax], ecx
    jmp L22
L6:
    mov eax, dword ptr [ebp + 8]
    cmp eax, 18
    mov dword ptr [ebp - 8], ecx
    ja L10
    jmp dword ptr [eax*4 + 0x100a5617]
    mov dword ptr [ebp + 8], ecx
L7:
    cmp edi, 15
    ja L10
L8:
    or edi, 0FFFF8000h
    shl edi, 16
    or dword ptr [ebp + 8], edi
    test byte ptr [ebx + 3], 1
    mov dword ptr [ebp - 24], ecx
    je L9
    mov dword ptr [ebp - 24], 000400000h
L9:
    push 31
    mov ecx, esi
    call sub_100C9A4A
    test eax, eax
    jl L11
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_100C7CE5
    test eax, eax
    jl L11
    mov eax, dword ptr [ebx + 4]
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [ecx + eax*4]
    test byte ptr [eax + 4], 16
    je L12
    mov eax, dword ptr [esi + 112]
    lea ecx, [ebp - 16]
    push ecx
    shl eax, 25
    sar eax, 31
    or dword ptr [ebp - 8], eax
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 20]
    push ecx
    push ebx
    mov ecx, esi
    call dword ptr [eax + 0x88]
    test eax, eax
    jge L13
    jmp L11
    mov dword ptr [ebp + 8], 1
    jmp L7
    mov dword ptr [ebp + 8], 2
    jmp L7
    mov dword ptr [ebp + 8], 3
    jmp L7
    mov dword ptr [ebp + 8], 4
    jmp L7
    mov dword ptr [ebp + 8], 5
    jmp L7
    mov dword ptr [ebp + 8], 6
    jmp L7
    mov dword ptr [ebp + 8], 7
    jmp L7
    cmp edi, ecx
    mov dword ptr [ebp + 8], 8
    je L8
L10:
    mov eax, 080004005h
L11:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
    mov dword ptr [ebp + 8], 9
    jmp L7
    mov dword ptr [ebp + 8], 10
    jmp L7
    mov dword ptr [ebp + 8], 11
    jmp L7
    mov dword ptr [ebp + 8], 12
    jmp L7
    mov dword ptr [ebp + 8], 13
    jmp L7
    mov dword ptr [ebp + 8], 080000000h
    jmp L7
    mov dword ptr [ebp + 8], 080000000h
    mov dword ptr [ebp - 8], 1
    jmp L7
L12:
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 8]
    push ecx
    lea ecx, [ebp - 16]
    push ecx
    lea ecx, [ebp - 20]
    push ecx
    push ebx
    mov ecx, esi
    call dword ptr [eax + 0x84]
    test eax, eax
    jl L11
    and dword ptr [ebp - 8], 0
L13:
    and dword ptr [ebp - 28], 0
    and dword ptr [ebp - 12], 0
    or eax, 0FFFFFFFFh
    cmp dword ptr [esi + 8], 0
    lea edi, [ebp - 44]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    jbe L16
    mov edi, dword ptr [ebx + 4]
    mov ecx, dword ptr [esi + 20]
L14:
    mov eax, dword ptr [ecx]
    cmp edi, dword ptr [eax + 4]
    jne L15
    mov edx, dword ptr [ebx + 8]
    cmp edx, dword ptr [eax + 8]
    jne L15
    mov edx, dword ptr [ebx + 12]
    cmp edx, dword ptr [eax + 12]
    jne L15
    mov eax, dword ptr [eax + 16]
    mov edx, dword ptr [ebp - 12]
    mov dword ptr [ebp + eax*4 - 44], edx
L15:
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 12]
    add ecx, 4
    cmp eax, dword ptr [esi + 8]
    jb L14
L16:
    mov edx, dword ptr [ebp - 28]
    xor ecx, ecx
L17:
    mov eax, dword ptr [ebp + ecx*4 - 44]
    cmp eax, -1
    je L18
    mov dword ptr [ebp + edx*4 - 44], eax
    inc edx
L18:
    inc ecx
    cmp ecx, 4
    jb L17
    push dword ptr [ebp - 8]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 4]
    push ecx
    push edx
    lea ecx, [ebp - 44]
    push ecx
    mov ecx, esi
    call dword ptr [eax + 0x70]
    test eax, eax
    jl L11
    mov eax, dword ptr [esi]
    push 0
    push 4
    mov ecx, esi
    call dword ptr [eax + 0x50]
    mov edi, dword ptr [ebp + 8]
    mov ecx, edi
    and ecx, 07FFFFFFFh
    cmp ecx, eax
    jne L19
    or byte ptr [ebp - 2], 15
L19:
    and byte ptr [ebp - 2], 0000000EFh
    test byte ptr [esi + 112], 64
    jne L21
    test byte ptr [esi + 0000000CCh], 32
    jne L20
    test byte ptr [ebx + 3], 2
    je L21
L20:
    or byte ptr [ebp - 2], 32
L21:
    mov eax, dword ptr [ebp - 16]
    mov edx, dword ptr [esi]
    mov ecx, eax
    or ecx, 0FFFFFFF8h
    shl ecx, 20
    and eax, 24
    or ecx, eax
    mov eax, dword ptr [ebp - 20]
    shl ecx, 8
    and eax, 0000007FFh
    push 0
    push dword ptr [ebp - 4]
    or ecx, eax
    or ecx, dword ptr [ebp - 24]
    push ecx
    mov ecx, esi
    call dword ptr [edx + 0x64]
    test eax, eax
    jl L11
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L11
    mov ecx, esi
    call sub_100C50A3
    test eax, eax
    jl L11
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L22
    mov dword ptr [eax], edi
L22:
    xor eax, eax
    jmp L11
    xor eax, eax
    inc eax
    jmp L11
FUN_100a5218 ENDP
END
