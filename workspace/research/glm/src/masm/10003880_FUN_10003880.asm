.686
.MODEL FLAT, C
EXTRN sub_10003275:PROC
EXTRN sub_10003643:PROC
EXTRN sub_10003CBD:PROC
EXTRN sub_100139FB:PROC
EXTRN sub_10013AD8:PROC
EXTRN sub_10013C4B:PROC
EXTRN sub_10013D28:PROC
EXTRN sub_1002AA08:PROC
EXTRN sub_1002AD05:PROC
EXTRN sub_1005F716:PROC
EXTRN sub_1005F786:PROC
EXTRN sub_1005F856:PROC
EXTRN sub_1005F966:PROC
EXTRN sub_1005F9D6:PROC
EXTRN sub_1005FAA6:PROC
EXTRN sub_100F7AF9:PROC
EXTRN sub_100F7D49:PROC
EXTRN fp_101D49D4:DWORD
EXTRN fp_101D49D8:DWORD
EXTRN fp_101D49FC:DWORD
EXTRN g_101AAC70:DWORD
EXTRN g_101AE37C:DWORD
EXTRN g_101AE380:DWORD
.CODE
FUN_10003880 PROC
    sub esp, 00000021Ch
    mov eax, dword ptr [ecx]
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [eax + 000000134h]
    mov eax, dword ptr [eax + 000000130h]
    push edi
    add esi, dword ptr [ecx + 4]
    push eax
    mov dword ptr [esp + 40], esi
    call dword ptr [fp_101D49D8]
    add esp, 4
    mov dword ptr [esp + 28], eax
    mov dword ptr [esp + 32], 0
    mov dword ptr [esp + 16], esi
    lea esp, [esp]
L0:
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    je L1
    mov ecx, dword ptr [eax + 000000418h]
    mov edx, dword ptr [eax + 000000414h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [esp + 16], ecx
    mov dword ptr [eax + 000000400h], edx
L1:
    lea eax, [esp + 16]
    push eax
    mov eax, 1
    call sub_1005F716
    mov ecx, dword ptr [esp + 20]
    add esp, 4
    test ecx, ecx
    je L12
    cmp byte ptr [eax], 123
    jne L12
    mov dword ptr [esp + 40], 01019166Eh
    mov dword ptr [esp + 24], 1
    xor ebp, ebp
L2:
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    je L3
    mov ecx, dword ptr [eax + 000000418h]
    mov edx, dword ptr [eax + 000000414h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [esp + 16], ecx
    mov dword ptr [eax + 000000400h], edx
L3:
    lea eax, [esp + 16]
    push eax
    mov eax, 1
    call sub_1005F786
    mov ebx, eax
    mov al, byte ptr [ebx]
    add esp, 4
    test al, al
    je L10
    cmp al, 125
    je L10
    mov edi, 010191664h
    mov esi, ebx
    mov ecx, 10
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L4
    mov dword ptr [esp + 20], edx
    jmp L6
L4:
    mov esi, dword ptr [esp + 24]
    cmp esi, 64
    jne L5
    push esi
    push 010191634h
    push 1
    call sub_100139FB
    add esp, 12
L5:
    mov dword ptr [esp + 20], esi
    inc esi
    mov dword ptr [esp + 24], esi
L6:
    mov eax, dword ptr [esp + 28]
    mov edx, dword ptr [esp + 20]
    lea ecx, [eax + ebp]
    lea edx, [esp + edx*8 + 40]
    mov eax, ebx
    mov dword ptr [edx], ecx
    lea esi, [eax + 1]
    lea ecx, [ecx]
L7:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L7
    mov edi, dword ptr [edx]
    sub eax, esi
    lea ecx, [eax + 1]
    add ebp, ecx
    mov edx, ecx
    shr ecx, 2
    mov esi, ebx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    je L8
    mov ecx, dword ptr [eax + 000000418h]
    mov edx, dword ptr [eax + 000000414h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [esp + 16], ecx
    mov dword ptr [eax + 000000400h], edx
L8:
    lea eax, [esp + 16]
    push eax
    mov eax, 1
    call sub_1005F856
    mov ecx, dword ptr [esp + 32]
    mov edi, dword ptr [esp + 24]
    lea edx, [ecx + ebp]
    lea edi, [esp + edi*8 + 48]
    mov ecx, eax
    add esp, 4
    mov dword ptr [edi], edx
    lea esi, [ecx + 1]
    nop
L9:
    mov dl, byte ptr [ecx]
    inc ecx
    test dl, dl
    jne L9
    mov edi, dword ptr [edi]
    sub ecx, esi
    inc ecx
    add ebp, ecx
    mov esi, eax
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    jmp L2
L10:
    mov ecx, dword ptr [esp + 40]
    cmp byte ptr [ecx], 0
    jne L11
    push 010191604h
    push 1
    call sub_10013AD8
    add esp, 8
L11:
    mov edx, dword ptr [esp + 44]
    push 0101915F8h
    push edx
    call sub_100F7AF9
    add esp, 8
    test eax, eax
    jne L0
    push eax
    push eax
    mov eax, dword ptr [esp + 32]
    push eax
    lea ebx, [esp + 52]
    call sub_10003275
    add esp, 12
    test al, al
    je L0
    inc dword ptr [esp + 32]
    jmp L0
L12:
    mov esi, dword ptr [esp + 32]
    lea ecx, [esi + esi*2]
    shl ecx, 5
    push ecx
    call dword ptr [fp_101D49D4]
    mov dword ptr [g_101AE380], eax
    add esp, 4
    mov eax, esi
    mov ecx, 0101AE288h
    mov dword ptr [g_101AE37C], 0
    call sub_1002AA08
    mov edx, dword ptr [esp + 36]
    mov dword ptr [esp + 16], edx
L13:
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    je L14
    mov ecx, dword ptr [eax + 000000418h]
    mov edx, dword ptr [eax + 000000414h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [esp + 16], ecx
    mov dword ptr [eax + 000000400h], edx
L14:
    lea eax, [esp + 16]
    push eax
    mov eax, 1
    call sub_1005F966
    mov cl, byte ptr [eax]
    add esp, 4
    cmp cl, 123
    jne L25
    mov dword ptr [esp + 40], 01019166Eh
    mov dword ptr [esp + 24], 1
    xor ebp, ebp
    jmp L15
    lea esp, [esp]
    nop
L15:
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    je L16
    mov ecx, dword ptr [eax + 000000418h]
    mov edx, dword ptr [eax + 000000414h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [esp + 16], ecx
    mov dword ptr [eax + 000000400h], edx
L16:
    lea eax, [esp + 16]
    push eax
    mov eax, 1
    call sub_1005F9D6
    mov ebx, eax
    mov al, byte ptr [ebx]
    add esp, 4
    test al, al
    je L23
    cmp al, 125
    je L23
    mov edi, 010191664h
    mov esi, ebx
    mov ecx, 10
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L17
    mov dword ptr [esp + 20], edx
    jmp L19
L17:
    mov esi, dword ptr [esp + 24]
    cmp esi, 64
    jne L18
    push esi
    push 010191634h
    push 1
    call sub_10013C4B
    add esp, 12
L18:
    mov dword ptr [esp + 20], esi
    inc esi
    mov dword ptr [esp + 24], esi
L19:
    mov eax, dword ptr [esp + 28]
    mov edx, dword ptr [esp + 20]
    lea ecx, [eax + ebp]
    lea edx, [esp + edx*8 + 40]
    mov eax, ebx
    mov dword ptr [edx], ecx
    lea esi, [eax + 1]
    lea ecx, [ecx]
L20:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L20
    mov edi, dword ptr [edx]
    sub eax, esi
    lea ecx, [eax + 1]
    add ebp, ecx
    mov edx, ecx
    shr ecx, 2
    mov esi, ebx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    je L21
    mov ecx, dword ptr [eax + 000000418h]
    mov edx, dword ptr [eax + 000000414h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [esp + 16], ecx
    mov dword ptr [eax + 000000400h], edx
L21:
    lea eax, [esp + 16]
    push eax
    mov eax, 1
    call sub_1005FAA6
    mov ecx, dword ptr [esp + 32]
    mov edi, dword ptr [esp + 24]
    lea edx, [ecx + ebp]
    lea edi, [esp + edi*8 + 48]
    mov ecx, eax
    add esp, 4
    mov dword ptr [edi], edx
    lea esi, [ecx + 1]
    nop
L22:
    mov dl, byte ptr [ecx]
    inc ecx
    test dl, dl
    jne L22
    mov edi, dword ptr [edi]
    sub ecx, esi
    inc ecx
    add ebp, ecx
    mov esi, eax
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    jmp L15
L23:
    mov ecx, dword ptr [esp + 40]
    cmp byte ptr [ecx], 0
    jne L24
    push 010191604h
    push 1
    call sub_10013D28
    add esp, 8
L24:
    mov edx, dword ptr [esp + 44]
    push 0101915F8h
    push edx
    call sub_100F7D49
    add esp, 8
    test eax, eax
    jne L13
    mov esi, dword ptr [esp + 24]
    lea eax, [esp + 40]
    push eax
    call sub_10003643
    add esp, 4
    jmp L13
L25:
    push 0101AE288h
    call sub_1002AD05
    add esp, 4
    call sub_10003CBD
    call dword ptr [fp_101D49FC]
    pop edi
    pop esi
    pop ebp
FUN_10003880 ENDP
END
