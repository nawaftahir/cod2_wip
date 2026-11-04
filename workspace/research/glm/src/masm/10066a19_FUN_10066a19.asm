.686
.MODEL FLAT, C
EXTRN sub_1006428B:PROC
EXTRN sub_10064344:PROC
EXTRN sub_10065CDB:PROC
EXTRN sub_10065F9E:PROC
EXTRN sub_100668B5:PROC
EXTRN g_101AB950:DWORD
EXTRN g_101ABD38:DWORD
EXTRN g_101ABD3C:DWORD
EXTRN g_101ABD40:DWORD
EXTRN g_101ABD44:DWORD
EXTRN g_101ABD48:DWORD
EXTRN g_101ABD4C:DWORD
EXTRN g_101ABD50:DWORD
EXTRN g_101ABD78:DWORD
.CODE
FUN_10066a19 PROC
    mov edi, edi
    push ebx
    push esi
    xor esi, esi
    push edi
    mov dword ptr [g_101ABD50], esi
    mov dword ptr [g_101ABD4C], esi
    mov dword ptr [g_101ABD44], 0101AB950h
    mov dword ptr [g_101ABD40], 0101AB180h
    mov word ptr [g_101AB950], si
L0:
    or eax, 0FFFFFFFFh
    mov dword ptr [g_101ABD48], eax
L1:
    movsx ecx, word ptr [esi*2 + 01019E100h]
    test ecx, ecx
    jne L5
    test eax, eax
    jge L2
    mov ecx, dword ptr [g_101ABD78]
    call sub_10065CDB
    test eax, eax
    mov dword ptr [g_101ABD48], eax
    jge L2
    xor eax, eax
    mov dword ptr [g_101ABD48], eax
L2:
    movsx ecx, word ptr [esi*2 + 01019E1C0h]
    test ecx, ecx
    je L3
    add ecx, eax
    js L3
    mov edi, 000000171h
    cmp ecx, edi
    jg L4
    add ecx, ecx
    movsx edx, word ptr [ecx + 01019E608h]
    cmp edx, eax
    jne L4
    mov eax, dword ptr [g_101ABD44]
    cmp eax, 0101ABD36h
    jae L19
    movsx esi, word ptr [ecx + 01019E320h]
    inc eax
    inc eax
    mov dword ptr [g_101ABD44], eax
    mov word ptr [eax], si
    add dword ptr [g_101ABD40], 4
    mov eax, dword ptr [g_101ABD38]
    mov ecx, dword ptr [g_101ABD40]
    mov dword ptr [ecx], eax
    or eax, 0FFFFFFFFh
    cmp dword ptr [g_101ABD4C], 0
    mov dword ptr [g_101ABD48], eax
    jle L1
    dec dword ptr [g_101ABD4C]
    jmp L1
L3:
    mov edi, 000000171h
L4:
    movsx ecx, word ptr [esi*2 + 01019E260h]
    test ecx, ecx
    je L12
    add ecx, eax
    js L12
    cmp ecx, edi
    jg L12
    add ecx, ecx
    movsx edx, word ptr [ecx + 01019E608h]
    cmp edx, eax
    jne L12
    movsx ecx, word ptr [ecx + 01019E320h]
L5:
    mov eax, dword ptr [g_101ABD40]
    lea edi, [ecx + ecx]
    movsx esi, word ptr [edi + 01019E0A0h]
    mov ebx, esi
    shl ebx, 2
    sub eax, ebx
    mov eax, dword ptr [eax + 4]
    mov dword ptr [g_101ABD3C], eax
    lea eax, [ecx - 1]
    cmp eax, 46
    ja L7
    jmp dword ptr [eax*4 + 0x10066e81]
    push 1
    push 0
    jmp L6
    push 1
    push 1
    jmp L6
    push 1
    push 2
    jmp L6
    push 2
    push 3
    jmp L6
    push 0
    push 4
    jmp L6
    push 0
    push 5
    jmp L6
    push 1
    push 6
    jmp L6
    push 1
    push 7
    jmp L6
    push 1
    push 8
    jmp L6
    push 1
    push 9
    jmp L6
    push 0
    push 10
    jmp L6
    push 0
    push 11
    jmp L6
    push 0
    push 12
    jmp L6
    push 0
    push 13
    jmp L6
    push 0
    push 14
    jmp L6
    push 1
    push 15
    jmp L6
    push 1
    push 16
    jmp L6
    push 1
    push 17
    jmp L6
    push 1
    push 18
    jmp L6
    push 1
    push 19
    jmp L6
    push 1
    push 20
    jmp L6
    push 1
    push 21
    jmp L6
    push 1
    push 22
    jmp L6
    push 1
    push 23
    jmp L6
    push 2
    push 24
    jmp L6
    push 2
    push 25
    jmp L6
    push 1
    push 26
    jmp L6
    push 2
    push 27
    jmp L6
    push 2
    push 28
    jmp L6
    push 1
    push 29
    jmp L6
    push 2
    push 30
    jmp L6
    push 2
    push 31
    jmp L6
    push 2
    push 32
    jmp L6
    push 2
    push 33
    jmp L6
    push 1
    push 34
    jmp L6
    push 2
    push 35
    jmp L6
    push 2
    push 36
    jmp L6
    push 1
    push 37
    jmp L6
    push 2
    push 38
    jmp L6
    push 1
    push 39
    jmp L6
    push 2
    push 40
    jmp L6
    push 1
    push 41
    jmp L6
    push 3
    push 42
    jmp L6
    push 1
    push 43
    jmp L6
    push 0
    push 44
    jmp L6
    push 0
    push 45
    jmp L6
    push 0
    push 46
L6:
    mov ecx, dword ptr [g_101ABD78]
    call sub_100668B5
L7:
    mov eax, dword ptr [g_101ABD44]
    movsx ecx, word ptr [edi + 01019E040h]
    neg esi
    lea eax, [eax + esi*2]
    mov dword ptr [g_101ABD44], eax
    movsx edx, word ptr [eax]
    sub dword ptr [g_101ABD40], ebx
    test edx, edx
    jne L9
    test ecx, ecx
    jne L9
    inc eax
    inc eax
    push 15
    mov dword ptr [g_101ABD44], eax
    pop esi
    mov word ptr [eax], si
    add dword ptr [g_101ABD40], 4
    mov eax, dword ptr [g_101ABD3C]
    mov ecx, dword ptr [g_101ABD40]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [g_101ABD48]
    test eax, eax
    jge L8
    mov ecx, dword ptr [g_101ABD78]
    call sub_10065F9E
    test eax, eax
    mov dword ptr [g_101ABD48], eax
    jge L8
    xor eax, eax
    mov dword ptr [g_101ABD48], eax
    test eax, eax
L8:
    jne L1
    xor eax, eax
    jmp L21
L9:
    lea esi, [ecx + ecx]
    movsx ecx, word ptr [esi + 01019E300h]
    test ecx, ecx
    je L10
    add ecx, edx
    js L10
    cmp ecx, 000000171h
    jg L10
    add ecx, ecx
    movsx edi, word ptr [ecx + 01019E608h]
    cmp edi, edx
    jne L10
    movsx esi, word ptr [ecx + 01019E320h]
    jmp L11
L10:
    movsx esi, word ptr [esi + 01019E1A0h]
L11:
    cmp eax, 0101ABD36h
    jae L19
    inc eax
    inc eax
    mov dword ptr [g_101ABD44], eax
    mov word ptr [eax], si
    mov eax, dword ptr [g_101ABD3C]
    jmp L17
L12:
    cmp dword ptr [g_101ABD4C], 0
    jne L13
    push 01010C5E8h
    push dword ptr [g_101ABD78]
    call sub_1006428B
    inc dword ptr [g_101ABD50]
    mov eax, dword ptr [g_101ABD48]
    pop ecx
    pop ecx
L13:
    push 3
    pop ecx
    cmp dword ptr [g_101ABD4C], ecx
    jge L18
    mov dword ptr [g_101ABD4C], ecx
    mov ecx, dword ptr [g_101ABD44]
    mov edx, 000000100h
L14:
    movsx eax, word ptr [ecx]
    movsx eax, word ptr [eax*2 + 01019E1C0h]
    test eax, eax
    je L15
    add eax, edx
    js L15
    cmp eax, edi
    jg L15
    cmp word ptr [eax*2 + 01019E608h], dx
    je L16
L15:
    cmp ecx, 0101AB950h
    jbe L20
    dec ecx
    dec ecx
    sub dword ptr [g_101ABD40], 4
    mov dword ptr [g_101ABD44], ecx
    jmp L14
L16:
    cmp ecx, 0101ABD36h
    jae L19
    movsx esi, word ptr [eax*2 + 01019E320h]
    inc ecx
    inc ecx
    mov dword ptr [g_101ABD44], ecx
    mov word ptr [ecx], si
    mov eax, dword ptr [g_101ABD38]
L17:
    add dword ptr [g_101ABD40], 4
    mov ecx, dword ptr [g_101ABD40]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [g_101ABD48]
    jmp L1
L18:
    test eax, eax
    je L20
    jmp L0
L19:
    push 01010C99Ch
    push dword ptr [g_101ABD78]
    call sub_10064344
    pop ecx
    pop ecx
L20:
    xor eax, eax
    inc eax
L21:
    pop edi
    pop esi
    pop ebx
    ret
FUN_10066a19 ENDP
END
