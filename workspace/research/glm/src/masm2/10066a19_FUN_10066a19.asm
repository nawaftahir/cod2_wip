.686
.MODEL FLAT, C
EXTRN sub_1006428B:PROC
EXTRN sub_10064344:PROC
EXTRN sub_10065CDB:PROC
EXTRN sub_10065F9E:PROC
EXTRN sub_100668B5:PROC
EXTRN sub_10066E84:PROC
EXTRN sub_10066E8D:PROC
EXTRN sub_10066E95:PROC
EXTRN sub_10066E96:PROC
EXTRN sub_10066E9B:PROC
EXTRN sub_10066E9F:PROC
EXTRN sub_10066EA3:PROC
EXTRN sub_10066EA8:PROC
EXTRN sub_10066EAB:PROC
EXTRN sub_10066EB1:PROC
EXTRN sub_10066EBA:PROC
EXTRN sub_10066EBC:PROC
EXTRN sub_10066EC3:PROC
EXTRN sub_10066ECC:PROC
EXTRN sub_10066ED5:PROC
EXTRN sub_10066EDE:PROC
EXTRN sub_10066EE7:PROC
EXTRN sub_10066EF0:PROC
EXTRN sub_10066EF9:PROC
EXTRN sub_10066EFF:PROC
EXTRN sub_10066F03:PROC
EXTRN sub_10066F05:PROC
EXTRN sub_10066F0B:PROC
EXTRN sub_10066F11:PROC
EXTRN sub_10066F17:PROC
EXTRN sub_10066F1D:PROC
EXTRN sub_10066F23:PROC
EXTRN sub_10066F29:PROC
EXTRN sub_10066F2F:PROC
EXTRN sub_10066F35:PROC
EXTRN sub_10066F3B:PROC
EXTRN sub_10066F41:PROC
EXTRN sub_10066F47:PROC
EXTRN sub_10066F4D:PROC
EXTRN sub_10066F53:PROC
EXTRN sub_10066F59:PROC
EXTRN sub_10066F5F:PROC
EXTRN sub_10066F65:PROC
EXTRN sub_10066F6B:PROC
EXTRN sub_10066F71:PROC
EXTRN sub_10066F77:PROC
EXTRN sub_1006702F:PROC
EXTRN sub_10067033:PROC
EXTRN sub_10067050:PROC
EXTRN sub_10067064:PROC
EXTRN sub_100670C5:PROC
EXTRN sub_100670C9:PROC
EXTRN sub_100670D1:PROC
EXTRN sub_100670DE:PROC
EXTRN sub_100670EE:PROC
EXTRN sub_10067162:PROC
EXTRN sub_100671B4:PROC
EXTRN sub_100671D3:PROC
EXTRN sub_100671E1:PROC
EXTRN sub_100671EF:PROC
EXTRN sub_100671F3:PROC
EXTRN sub_100671F7:PROC
EXTRN sub_100671F9:PROC
EXTRN sub_1006721A:PROC
EXTRN sub_10067221:PROC
EXTRN sub_10067276:PROC
EXTRN sub_1006727D:PROC
EXTRN sub_100672C4:PROC
EXTRN EXTRN g_101AB950:DWORD:DWORD
EXTRN EXTRN g_101ABD38:DWORD:DWORD
EXTRN EXTRN g_101ABD3C:DWORD:DWORD
EXTRN EXTRN g_101ABD40:DWORD:DWORD
EXTRN EXTRN g_101ABD44:DWORD:DWORD
EXTRN EXTRN g_101ABD48:DWORD:DWORD
EXTRN EXTRN g_101ABD4C:DWORD:DWORD
EXTRN EXTRN g_101ABD50:DWORD:DWORD
EXTRN EXTRN g_101ABD78:DWORD:DWORD
.CODE
FUN_10066a19 PROC
    mov mov edi, edi
    push push ebx
    push push esi
    xor xor esi, esi
    push push edi
    mov mov dword ptr [g_101ABD50], esi
    mov mov dword ptr [g_101ABD4C], esi
    mov mov dword ptr [g_101ABD44], 0101AB950h
    mov mov dword ptr [g_101ABD40], 0101AB180h
    mov mov word ptr [g_101AB950], si
    or or eax, -1
    mov mov dword ptr [g_101ABD48], eax
    movsx movsx ecx, word ptr [esi*2 + 01019E100h]
    test test ecx, ecx
    jne L6
    test test eax, eax
    jge L0
    mov mov ecx, dword ptr [g_101ABD78]
    call sub_10065CDB
    test test eax, eax
    mov mov dword ptr [g_101ABD48], eax
    jge L1
    xor xor eax, eax
    mov mov dword ptr [g_101ABD48], eax
    movsx movsx ecx, word ptr [esi*2 + 01019E1C0h]
    test test ecx, ecx
    je L4
    add add ecx, eax
    js L5
    mov mov edi, 0171h
    cmp cmp ecx, edi
    jg L6
    add add ecx, ecx
    movsx movsx edx, word ptr [ecx + 01019E608h]
    cmp cmp edx, eax
    jne L7
    mov mov eax, dword ptr [g_101ABD44]
    cmp cmp eax, 0101ABD36h
    jae sub_10066F03
    movsx movsx esi, word ptr [ecx + 01019E320h]
    inc inc eax
    inc inc eax
    mov mov dword ptr [g_101ABD44], eax
    mov mov word ptr [eax], si
    add add dword ptr [g_101ABD40], 4
    mov mov eax, dword ptr [g_101ABD38]
    mov mov ecx, dword ptr [g_101ABD40]
    mov mov dword ptr [ecx], eax
    or or eax, -1
L1:
    cmp cmp dword ptr [g_101ABD4C], 0
    mov mov dword ptr [g_101ABD48], eax
    jle L2
    dec dec dword ptr [g_101ABD4C]
    jmp L3
    mov mov edi, 0171h
    movsx movsx ecx, word ptr [esi*2 + 01019E260h]
    test test ecx, ecx
    je sub_10066E9B
    add add ecx, eax
    js sub_10066EA3
    cmp cmp ecx, edi
    jg sub_10066EAB
    add add ecx, ecx
    movsx movsx edx, word ptr [ecx + 01019E608h]
    cmp cmp edx, eax
    jne sub_10066EBC
L3:
    movsx movsx ecx, word ptr [ecx + 01019E320h]
    mov mov eax, dword ptr [g_101ABD40]
    lea lea edi, [ecx + ecx]
    movsx movsx esi, word ptr [edi + 01019E0A0h]
    mov mov ebx, esi
    shl shl ebx, 2
    sub sub eax, ebx
    mov mov eax, dword ptr [eax + 4]
    mov mov dword ptr [g_101ABD3C], eax
    lea lea eax, [ecx - 1]
    cmp cmp eax, 46
    ja L9
    jmp jmp dword ptr [eax*4 + 010066E81h]
    push push 1
    push push 0
    jmp L10
    push push 1
    push push 1
    jmp L11
    push push 1
    push push 2
    jmp L12
    push push 2
    push push 3
    jmp L13
    push push 0
    push push 4
    jmp L14
    push push 0
    push push 5
    jmp L15
    push push 1
    push push 6
    jmp L16
    push push 1
    push push 7
    jmp L17
    push push 1
    push push 8
    jmp L18
    push push 1
    push push 9
    jmp L19
    push push 0
    push push 10
    jmp L20
    push push 0
    push push 11
    jmp sub_10066E84
    push push 0
    push push 12
    jmp sub_10066E8D
    push push 0
    push push 13
    jmp sub_10066E96
    push push 0
    push push 14
    jmp sub_10066E9F
    push push 1
    push push 15
    jmp sub_10066EA8
    push push 1
    push push 16
    jmp sub_10066EB1
    push push 1
    push push 17
    jmp sub_10066EBA
    push push 1
    push push 18
    jmp sub_10066EC3
    push push 1
    push push 19
    jmp sub_10066ECC
    push push 1
    push push 20
    jmp sub_10066ED5
    push push 1
    push push 21
    jmp sub_10066EDE
    push push 1
    push push 22
    jmp sub_10066EE7
    push push 1
    push push 23
    jmp sub_10066EF0
    push push 2
    push push 24
    jmp sub_10066EF9
    push push 2
    push push 25
    jmp sub_10066EFF
    push push 1
    push push 26
    jmp sub_10066F05
    push push 2
    push push 27
    jmp sub_10066F0B
    push push 2
    push push 28
    jmp sub_10066F11
    push push 1
    push push 29
    jmp sub_10066F17
    push push 2
    push push 30
    jmp sub_10066F1D
    push push 2
    push push 31
    jmp sub_10066F23
    push push 2
    push push 32
    jmp sub_10066F29
    push push 2
    push push 33
    jmp sub_10066F2F
    push push 1
    push push 34
    jmp sub_10066F35
    push push 2
    push push 35
    jmp sub_10066F3B
    push push 2
    push push 36
    jmp sub_10066F41
    push push 1
    push push 37
    jmp sub_10066F47
    push push 2
    push push 38
    jmp sub_10066F4D
    push push 1
    push push 39
    jmp sub_10066F53
    push push 2
    push push 40
    jmp sub_10066F59
    push push 1
    push push 41
    jmp sub_10066F5F
    push push 3
    push push 42
    jmp sub_10066F65
    push push 1
    push push 43
    jmp sub_10066F6B
    push push 0
    push push 44
    jmp sub_10066F71
    push push 0
    push push 45
    jmp sub_10066F77
    push push 0
    push push 46
    mov mov ecx, dword ptr [g_101ABD78]
    call sub_100668B5
    mov mov eax, dword ptr [g_101ABD44]
    movsx movsx ecx, word ptr [edi + 01019E040h]
    neg neg esi
    lea lea eax, [eax + esi*2]
    mov mov dword ptr [g_101ABD44], eax
    movsx movsx edx, word ptr [eax]
    sub sub dword ptr [g_101ABD40], ebx
    test test edx, edx
    jne sub_1006702F
    test test ecx, ecx
    jne sub_10067033
    inc inc eax
    inc inc eax
    push push 15
    mov mov dword ptr [g_101ABD44], eax
    pop pop esi
    mov mov word ptr [eax], si
    add add dword ptr [g_101ABD40], 4
    mov mov eax, dword ptr [g_101ABD3C]
    mov mov ecx, dword ptr [g_101ABD40]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [g_101ABD48]
    test test eax, eax
    jge sub_10067050
    mov mov ecx, dword ptr [g_101ABD78]
    call sub_10065F9E
    test test eax, eax
    mov mov dword ptr [g_101ABD48], eax
    jge sub_10067064
    xor xor eax, eax
    mov mov dword ptr [g_101ABD48], eax
    test test eax, eax
    jne L8
    xor xor eax, eax
    jmp sub_100671B4
    lea lea esi, [ecx + ecx]
    movsx movsx ecx, word ptr [esi + 01019E300h]
    test test ecx, ecx
    je sub_100670C5
    add add ecx, edx
    js sub_100670C9
    cmp cmp ecx, 0171h
    jg sub_100670D1
    add add ecx, ecx
    movsx movsx edi, word ptr [ecx + 01019E608h]
    cmp cmp edi, edx
    jne sub_100670DE
    movsx movsx esi, word ptr [ecx + 01019E320h]
    jmp sub_100670EE
    movsx movsx esi, word ptr [esi + 01019E1A0h]
    cmp cmp eax, 0101ABD36h
    jae sub_100671E1
    inc inc eax
    inc inc eax
    mov mov dword ptr [g_101ABD44], eax
    mov mov word ptr [eax], si
    mov mov eax, dword ptr [g_101ABD3C]
    jmp sub_100671D3
    cmp cmp dword ptr [g_101ABD4C], 0
    jne sub_10067162
    push push 01010C5E8h
    push push dword ptr [g_101ABD78]
    call sub_1006428B
    inc inc dword ptr [g_101ABD50]
    mov mov eax, dword ptr [g_101ABD48]
    pop pop ecx
    pop pop ecx
    push push 3
    pop pop ecx
    cmp cmp dword ptr [g_101ABD4C], ecx
    jge sub_10067221
    mov mov dword ptr [g_101ABD4C], ecx
    mov mov ecx, dword ptr [g_101ABD44]
    mov mov edx, 0100h
    movsx movsx eax, word ptr [ecx]
    movsx movsx eax, word ptr [eax*2 + 01019E1C0h]
    test test eax, eax
    je sub_100671EF
    add add eax, edx
    js sub_100671F3
    cmp cmp eax, edi
    jg sub_100671F7
    cmp cmp word ptr [eax*2 + 01019E608h], dx
    je sub_1006721A
    cmp cmp ecx, 0101AB950h
    jbe sub_10067276
    dec dec ecx
    dec dec ecx
    sub sub dword ptr [g_101ABD40], 4
    mov mov dword ptr [g_101ABD44], ecx
    jmp sub_100671F9
    cmp cmp ecx, 0101ABD36h
    jae sub_1006727D
    movsx movsx esi, word ptr [eax*2 + 01019E320h]
    inc inc ecx
    inc inc ecx
    mov mov dword ptr [g_101ABD44], ecx
    mov mov word ptr [ecx], si
    mov mov eax, dword ptr [g_101ABD38]
    add add dword ptr [g_101ABD40], 4
    mov mov ecx, dword ptr [g_101ABD40]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [g_101ABD48]
    jmp sub_10066E95
    test test eax, eax
    je sub_100672C4
    jmp sub_10066E96
    push push 01010C99Ch
    push push dword ptr [g_101ABD78]
    call sub_10064344
    pop pop ecx
    pop pop ecx
    xor xor eax, eax
    inc inc eax
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
FUN_10066a19 ENDP
END
