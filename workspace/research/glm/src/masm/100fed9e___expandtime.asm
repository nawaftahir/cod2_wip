.686
.MODEL FLAT, C
EXTRN sub_100FCC53:PROC
EXTRN sub_100FEDF4:PROC
EXTRN sub_100FEF2E:PROC
EXTRN sub_100FF0E9:PROC
EXTRN sub_100FF191:PROC
.CODE
__expandtime PROC
    push ebp
    mov ebp, esp
    movsx eax, al
    cmp eax, 90
    push esi
    mov esi, dword ptr [ebp + 12]
    push edi
    mov edi, ecx
    jg L17
    je L29
    cmp eax, 77
    jg L5
    je L4
    sub eax, 37
    je L3
    sub eax, 28
    je L2
    dec eax
    je L1
    sub eax, 6
    je L0
    dec eax
    jne L37
    mov eax, dword ptr [esi + 8]
    cdq
    push 12
    pop ecx
    idiv ecx
    mov eax, edx
    test eax, eax
    jne L26
    push ecx
    pop eax
    jmp L26
L0:
    push dword ptr [ebp + 20]
    mov eax, dword ptr [esi + 8]
    push 2
    jmp L6
L1:
    mov edx, dword ptr [esi + 16]
    mov esi, dword ptr [ebp + 16]
    mov edx, dword ptr [esi + edx*4 + 104]
    jmp L36
L2:
    mov edx, dword ptr [esi + 24]
    mov esi, dword ptr [ebp + 16]
    mov edx, dword ptr [esi + edx*4 + 28]
    jmp L36
L3:
    mov eax, dword ptr [edi]
    mov byte ptr [eax], 37
    inc dword ptr [edi]
    dec dword ptr [ebx]
    jmp L37
L4:
    push dword ptr [ebp + 20]
    mov eax, dword ptr [esi + 4]
    push 2
    jmp L6
L5:
    sub eax, 83
    je L16
    dec eax
    dec eax
    je L13
    dec eax
    dec eax
    je L11
    dec eax
    je L8
    dec eax
    jne L37
    mov eax, dword ptr [esi + 20]
    cdq
    push 100
    pop ecx
    idiv ecx
    push dword ptr [ebp + 20]
    push 4
    add eax, 19
    imul eax, eax, 100
    add eax, edx
L6:
    pop edx
L7:
    mov ecx, ebx
    call sub_100FEDF4
    pop ecx
    jmp L37
L8:
    push dword ptr [ebp + 16]
    push ebx
    push edi
    push esi
    push 2
L9:
    push dword ptr [ebp + 8]
    call sub_100FF0E9
    add esp, 24
    test eax, eax
    jne L37
L10:
    xor eax, eax
    jmp L38
L11:
    mov eax, dword ptr [esi + 24]
    test eax, eax
    jne L12
    push 6
    pop ecx
    jmp L14
L12:
    lea ecx, [eax - 1]
    jmp L14
L13:
    mov ecx, dword ptr [esi + 24]
L14:
    cmp dword ptr [esi + 28], ecx
    jge L15
    xor eax, eax
    jmp L26
L15:
    mov eax, dword ptr [esi + 28]
    push 7
    cdq
    pop esi
    idiv esi
    cmp edx, ecx
    jl L26
    jmp L25
L16:
    push dword ptr [ebp + 20]
    mov eax, dword ptr [esi]
    push 2
    jmp L6
L17:
    cmp eax, 109
    jg L28
    je L24
    sub eax, 97
    je L23
    dec eax
    je L22
    dec eax
    je L19
    dec eax
    je L18
    sub eax, 6
    jne L37
    push dword ptr [ebp + 20]
    mov eax, dword ptr [esi + 28]
    inc eax
    push 3
    jmp L6
L18:
    push dword ptr [ebp + 20]
    mov eax, dword ptr [esi + 12]
    push 2
    jmp L6
L19:
    cmp dword ptr [ebp + 20], 0
    push dword ptr [ebp + 16]
    push ebx
    push edi
    push esi
    je L21
    push 1
L20:
    push dword ptr [ebp + 8]
    call sub_100FF191
    add esp, 24
    test eax, eax
    je L10
    cmp dword ptr [ebx], 0
    je L10
    mov eax, dword ptr [edi]
    mov byte ptr [eax], 32
    inc dword ptr [edi]
    dec dword ptr [ebx]
    jmp L8
L21:
    push 0
    jmp L20
L22:
    mov edx, dword ptr [esi + 16]
    mov esi, dword ptr [ebp + 16]
    mov edx, dword ptr [esi + edx*4 + 56]
    jmp L36
L23:
    mov edx, dword ptr [esi + 24]
    mov esi, dword ptr [ebp + 16]
    mov edx, dword ptr [esi + edx*4]
    jmp L36
L24:
    mov eax, dword ptr [esi + 16]
L25:
    inc eax
L26:
    push dword ptr [ebp + 20]
L27:
    push 2
    jmp L6
L28:
    sub eax, 112
    je L34
    sub eax, 7
    je L33
    dec eax
    je L31
    dec eax
    je L30
    dec eax
    jne L37
L29:
    call sub_100FCC53
    xor edx, edx
    cmp dword ptr [esi + 32], edx
    setne dl
    mov edx, dword ptr [edx*4 + 0101A4E40h]
    jmp L36
L30:
    push dword ptr [ebp + 20]
    mov eax, dword ptr [esi + 20]
    cdq
    push 100
    pop ecx
    idiv ecx
    mov eax, edx
    jmp L27
L31:
    cmp dword ptr [ebp + 20], 0
    push dword ptr [ebp + 16]
    push ebx
    push edi
    push esi
    je L32
    push 1
    jmp L9
L32:
    push 0
    jmp L9
L33:
    push dword ptr [ebp + 20]
    mov eax, dword ptr [esi + 24]
    xor edx, edx
    inc edx
    jmp L7
L34:
    cmp dword ptr [esi + 8], 11
    mov edx, dword ptr [ebp + 16]
    jg L35
    mov edx, dword ptr [edx + 000000098h]
    jmp L36
L35:
    mov edx, dword ptr [edx + 00000009Ch]
L36:
    mov ecx, edi
    mov eax, ebx
    call sub_100FEF2E
L37:
    xor eax, eax
    inc eax
L38:
    pop edi
    pop esi
    pop ebp
    ret
__expandtime ENDP
END
