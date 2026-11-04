.686
.MODEL FLAT, C
EXTRN sub_100863EC:PROC
EXTRN sub_100864A7:PROC
EXTRN sub_1008B2FE:PROC
EXTRN sub_1008B379:PROC
EXTRN sub_1008B3B5:PROC
EXTRN sub_1008B401:PROC
EXTRN sub_1008B42B:PROC
EXTRN sub_1008B4D7:PROC
EXTRN sub_100F5E1E:PROC
EXTRN sub_100F748C:PROC
EXTRN sub_100F79FF:PROC
EXTRN sub_100F7A2E:PROC
EXTRN sub_100F7A5B:PROC
EXTRN sub_100F7A6F:PROC
EXTRN sub_100F7A83:PROC
EXTRN sub_100F7AA7:PROC
EXTRN sub_100F7AD0:PROC
EXTRN sub_100F7BB4:PROC
EXTRN sub_100F7BDD:PROC
EXTRN sub_100F8588:PROC
EXTRN sub_100F8673:PROC
.CODE
FUN_100aff11 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 52
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    mov eax, dword ptr [edi + 104]
    mov eax, dword ptr [eax + 24]
    push 31
    push eax
    mov dword ptr [ebp - 12], eax
    lea eax, [ebp - 52]
    xor esi, esi
    push eax
    mov dword ptr [ebp - 8], ecx
    mov dword ptr [ebp - 20], esi
    mov dword ptr [ebp - 4], esi
    call sub_100F5E1E
    add esp, 12
    cmp byte ptr [ebp - 52], 0
    mov byte ptr [ebp - 21], 0
    lea ebx, [ebp - 52]
    je L2
L0:
    movsx eax, byte ptr [ebx]
    push eax
    call sub_100F8588
    test eax, eax
    pop ecx
    je L1
    inc ebx
    cmp byte ptr [ebx], 0
    jne L0
L1:
    cmp byte ptr [ebx], 0
    je L2
    push ebx
    call sub_100F748C
    pop ecx
    mov dword ptr [ebp + 8], eax
    jmp L3
L2:
    and dword ptr [ebp + 8], 0
L3:
    cmp byte ptr [ebx], 0
    je L4
    mov byte ptr [ebx], 0
    inc ebx
L4:
    mov al, byte ptr [ebx]
    test al, al
    je L7
L5:
    movsx eax, al
    push eax
    call sub_100F8673
    test eax, eax
    pop ecx
    je L6
    inc ebx
    mov al, byte ptr [ebx]
    test al, al
    jne L5
L6:
    cmp byte ptr [ebx], 0
    je L7
    or dword ptr [ebp + 8], 0FFFFFFFFh
    jmp L8
L7:
    mov eax, dword ptr [edi + 112]
    shr eax, 2
    add dword ptr [ebp + 8], eax
L8:
    mov eax, dword ptr [edi + 108]
    cmp eax, -1
    mov ebx, 000001196h
    je L9
    movzx edx, byte ptr [edi + 109]
    and eax, 0000000FFh
    cmp eax, 4
    mov dword ptr [ebp - 4], eax
    mov dword ptr [ebp + 8], edx
    jne L34
    mov ecx, dword ptr [ebp - 8]
    lea eax, [ecx + 000000448h]
    cmp dword ptr [eax], 0
    jne L42
    cmp dword ptr [ebp + 12], 0
    jne L42
    xor esi, esi
    push edx
    inc esi
    mov dword ptr [eax], esi
    lea eax, [ebp - 52]
    push eax
    push 010117854h
    push ebx
    push dword ptr [edi + 104]
    push ecx
    jmp L33
L9:
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [edi + 4]
    mov edx, dword ptr [ecx + 16]
    mov esi, dword ptr [edx + eax*4]
    push edi
    call sub_100863EC
    mov dword ptr [ebp - 16], eax
    mov eax, dword ptr [esi + 4]
    test al, 16
    je L26
    test ah, 2
    jne L26
    lea eax, [ebp - 52]
    push 0101966D4h
    push eax
    call sub_100F79FF
    test eax, eax
    pop ecx
    pop ecx
    jne L12
    cmp dword ptr [ebp + 12], eax
    mov dword ptr [ebp - 4], 1
    je L10
    push 2
    jmp L13
L10:
    mov eax, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + 40]
L11:
    cmp dword ptr [ebp + 8], eax
    jmp L17
L12:
    lea eax, [ebp - 52]
    push 0101956A0h
    push eax
    call sub_100F7A2E
    test eax, eax
    pop ecx
    pop ecx
    jne L15
    cmp dword ptr [ebp + 12], eax
    mov dword ptr [ebp - 4], 3
    je L14
    push 8
L13:
    pop eax
    jmp L11
L14:
    mov eax, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + 60]
    jmp L11
L15:
    lea eax, [ebp - 52]
    push 0101966DCh
    push eax
    call sub_100F7A5B
    test eax, eax
    pop ecx
    pop ecx
    je L16
    lea eax, [ebp - 52]
    push 010195A98h
    push eax
    call sub_100F7A6F
    test eax, eax
    pop ecx
    pop ecx
    je L16
    lea eax, [ebp - 52]
    push 01010EC98h
    push eax
    call sub_100F7A83
    test eax, eax
    pop ecx
    pop ecx
    jne L18
L16:
    cmp dword ptr [ebp + 8], 1
    mov dword ptr [ebp - 4], 4
L17:
    sbb esi, esi
    inc esi
    jmp L21
L18:
    lea eax, [ebp - 52]
    push 01011784Ch
    push eax
    call sub_100F7AA7
    test eax, eax
    pop ecx
    pop ecx
    jne L19
    inc eax
    cmp dword ptr [ebp + 8], eax
    mov dword ptr [ebp - 4], eax
    sbb esi, esi
    inc esi
    mov dword ptr [ebp - 20], eax
    jne L21
    and dword ptr [ebp + 8], 0
    jmp L21
L19:
    lea eax, [ebp - 52]
    push 0101966C8h
    push eax
    call sub_100F7AD0
    test eax, eax
    pop ecx
    pop ecx
    jne L20
    inc eax
    cmp dword ptr [ebp + 8], eax
    mov dword ptr [ebp - 4], eax
    sbb esi, esi
    inc esi
    mov dword ptr [ebp - 20], eax
    jne L21
    mov dword ptr [ebp + 8], eax
    jmp L21
L20:
    and dword ptr [ebp - 4], 0
    xor esi, esi
    inc esi
L21:
    xor eax, eax
    cmp dword ptr [ebp + 12], eax
    je L22
    cmp dword ptr [edi + 16], eax
    jne L24
L22:
    cmp esi, eax
    je L23
    push dword ptr [ebp - 12]
    push dword ptr [ebp - 16]
    push 010117830h
    push ebx
    push dword ptr [edi + 104]
    push dword ptr [ebp - 8]
    call sub_1008B2FE
    add esp, 24
    jmp L24
L23:
    cmp dword ptr [ebp - 20], eax
    je L24
    push dword ptr [ebp + 8]
    mov eax, dword ptr [ebp - 4]
    push dword ptr [eax*4 + 0101A3F88h]
    push dword ptr [ebp - 12]
    push dword ptr [ebp - 16]
    push 0101177F4h
    push 000001261h
    push dword ptr [edi + 104]
    push dword ptr [ebp - 8]
    call sub_1008B3B5
    add esp, 32
L24:
    cmp dword ptr [ebp - 4], 4
    je L25
    test esi, esi
    je L34
L25:
    mov eax, dword ptr [ebp - 8]
    add eax, 000000448h
    cmp dword ptr [eax], 0
    jne L34
    cmp dword ptr [ebp + 12], 0
    jne L34
    push dword ptr [ebp - 12]
    mov dword ptr [eax], 1
    push dword ptr [ebp - 16]
    push 0101177CCh
    push ebx
    push dword ptr [edi + 104]
    push dword ptr [ebp - 8]
    call sub_1008B379
    xor esi, esi
    add esp, 24
    inc esi
    jmp L34
L26:
    test al, 32
    je L41
    lea eax, [ebp - 52]
    push 0101966D4h
    push eax
    call sub_100F7BB4
    test eax, eax
    pop ecx
    pop ecx
    jne L27
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp - 8]
    cmp eax, dword ptr [ecx + 72]
    mov dword ptr [ebp - 4], 1
    sbb esi, esi
    inc esi
    jmp L29
L27:
    lea eax, [ebp - 52]
    push 01010EC78h
    push eax
    call sub_100F7BDD
    pop ecx
    xor esi, esi
    test eax, eax
    pop ecx
    jne L28
    mov dword ptr [ebp - 4], 4
    inc esi
    jmp L30
L28:
    and dword ptr [ebp - 4], 0
    inc esi
L29:
    test esi, esi
    je L32
L30:
    cmp dword ptr [ebp + 12], 0
    je L31
    cmp dword ptr [edi + 16], 0
    jne L32
L31:
    push dword ptr [ebp - 12]
    push dword ptr [ebp - 16]
    push 010117830h
    push ebx
    push dword ptr [edi + 104]
    push dword ptr [ebp - 8]
    call sub_1008B401
    add esp, 24
L32:
    cmp dword ptr [ebp - 4], 4
    jne L34
    cmp dword ptr [ebp + 12], 0
    jne L42
    push dword ptr [ebp - 12]
    push dword ptr [ebp - 16]
    push 01011779Ch
    push ebx
    push dword ptr [edi + 104]
    push dword ptr [ebp - 8]
L33:
    call sub_1008B42B
    add esp, 24
L34:
    cmp dword ptr [ebp - 4], 3
    jne L39
    cmp dword ptr [ebp + 8], 0
    jbe L37
    cmp dword ptr [ebp + 8], 4
    jae L37
    cmp dword ptr [edi + 16], 3
    jne L37
    mov edx, dword ptr [ebp - 8]
    mov eax, dword ptr [edx + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000104h
    jae L38
    lea ebx, [edx + 00000043Ch]
    cmp dword ptr [ebx], -1
    jne L35
    push 4
    push -1
    push 81
    push 010117794h
    mov ecx, edx
    call sub_100864A7
    mov dword ptr [ebx], eax
L35:
    mov ebx, dword ptr [ebx]
    cmp ebx, -1
    jne L36
    mov eax, 08007000Eh
    jmp L44
L36:
    mov eax, dword ptr [ebp + 8]
    and dword ptr [edi + 12], 0
    dec eax
    mov dword ptr [ebp - 4], 5
    mov dword ptr [edi + 4], ebx
    mov dword ptr [edi + 16], eax
    jmp L42
L37:
    mov edx, dword ptr [ebp - 8]
L38:
    mov ecx, dword ptr [edx + 60]
    cmp dword ptr [ebp + 8], ecx
    jb L42
    cmp dword ptr [ebp + 12], 0
    jne L42
    lea eax, [edx + 000000448h]
    cmp dword ptr [eax], 0
    jne L42
    push ecx
    push 010117748h
    xor esi, esi
    inc esi
    push ebx
    mov dword ptr [eax], esi
    push dword ptr [edi + 104]
    push edx
    call sub_1008B4D7
    add esp, 20
L39:
    cmp dword ptr [ebp - 4], 1
    jne L40
    or word ptr [edi], 000000114h
    fldz
    fstp qword ptr [edi + 32]
    fld1
    fstp qword ptr [edi + 40]
L40:
    cmp dword ptr [ebp - 4], 0
    jne L42
L41:
    xor esi, esi
    inc esi
L42:
    mov ecx, dword ptr [ebp + 8]
    cmp ecx, 00000FFFFh
    jbe L43
    xor esi, esi
    inc esi
L43:
    mov eax, dword ptr [ebp - 4]
    and eax, 0000000FFh
    shl ecx, 8
    or eax, ecx
    mov dword ptr [edi + 108], eax
    mov eax, esi
    neg eax
    sbb eax, eax
    and eax, 080004005h
L44:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
FUN_100aff11 ENDP
END
