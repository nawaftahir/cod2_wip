.686
.MODEL FLAT, C
EXTRN sub_10003275:PROC
EXTRN sub_10003643:PROC
EXTRN sub_10003DF1:PROC
EXTRN sub_10003E78:PROC
EXTRN sub_10003ED1:PROC
EXTRN sub_10003F64:PROC
EXTRN sub_10003F8C:PROC
EXTRN sub_10003F95:PROC
EXTRN sub_10003FAB:PROC
EXTRN sub_10003FD3:PROC
EXTRN sub_10003FE7:PROC
EXTRN sub_10003FFF:PROC
EXTRN sub_10004028:PROC
EXTRN sub_10004030:PROC
EXTRN sub_10004071:PROC
EXTRN sub_100040E7:PROC
EXTRN sub_10004147:PROC
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
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN fp_101D49D8:DWORD:DWORD
EXTRN EXTRN fp_101D49FC:DWORD:DWORD
EXTRN EXTRN g_101AAC70:DWORD:DWORD
EXTRN EXTRN g_101AE37C:DWORD:DWORD
EXTRN EXTRN g_101AE380:DWORD:DWORD
.CODE
FUN_10003880 PROC
    sub sub esp, 021Ch
    mov mov eax, dword ptr [ecx]
    push push ebx
    push push ebp
    push push esi
    mov mov esi, dword ptr [eax + 0134h]
    mov mov eax, dword ptr [eax + 0130h]
    push push edi
    add add esi, dword ptr [ecx + 4]
    push push eax
    mov mov dword ptr [esp + 40], esi
    call dword ptr [fp_101D49D8]
    add add esp, 4
    mov mov dword ptr [esp + 28], eax
    mov mov dword ptr [esp + 32], 0
    mov mov dword ptr [esp + 16], esi
    lea lea esp, [esp]
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je L0
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov edx, dword ptr [eax + 0414h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [esp + 16], ecx
    mov mov dword ptr [eax + 0400h], edx
    lea lea eax, [esp + 16]
    push push eax
    mov mov eax, 1
    call sub_1005F716
    mov mov ecx, dword ptr [esp + 20]
    add add esp, 4
    test test ecx, ecx
    je L9
    cmp cmp byte ptr [eax], 123
    jne L10
    mov mov dword ptr [esp + 40], 01019166Eh
    mov mov dword ptr [esp + 24], 1
    xor xor ebp, ebp
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je L1
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov edx, dword ptr [eax + 0414h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [esp + 16], ecx
    mov mov dword ptr [eax + 0400h], edx
    lea lea eax, [esp + 16]
    push push eax
    mov mov eax, 1
    call sub_1005F786
    mov mov ebx, eax
    mov mov al, byte ptr [ebx]
    add add esp, 4
    test test al, al
    je L11
    cmp cmp al, 125
    je L12
    mov mov edi, 010191664h
    mov mov esi, ebx
    mov mov ecx, 10
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L2
    mov mov dword ptr [esp + 20], edx
    jmp L3
    mov mov esi, dword ptr [esp + 24]
    cmp cmp esi, 64
    jne L3
    push push esi
    push push 010191634h
    push push 1
    call sub_100139FB
    add add esp, 12
    mov mov dword ptr [esp + 20], esi
    inc inc esi
    mov mov dword ptr [esp + 24], esi
    mov mov eax, dword ptr [esp + 28]
    mov mov edx, dword ptr [esp + 20]
    lea lea ecx, [eax + ebp]
    lea lea edx, [esp + edx*8 + 40]
    mov mov eax, ebx
    mov mov dword ptr [edx], ecx
    lea lea esi, [eax + 1]
    lea lea ecx, [ecx]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne L8
    mov mov edi, dword ptr [edx]
    sub sub eax, esi
    lea lea ecx, [eax + 1]
    add add ebp, ecx
    mov mov edx, ecx
    shr shr ecx, 2
    mov mov esi, ebx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je L13
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov edx, dword ptr [eax + 0414h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [esp + 16], ecx
L1:
    mov mov dword ptr [eax + 0400h], edx
    lea lea eax, [esp + 16]
    push push eax
    mov mov eax, 1
    call sub_1005F856
    mov mov ecx, dword ptr [esp + 32]
    mov mov edi, dword ptr [esp + 24]
    lea lea edx, [ecx + ebp]
    lea lea edi, [esp + edi*8 + 48]
    mov mov ecx, eax
    add add esp, 4
    mov mov dword ptr [edi], edx
    lea lea esi, [ecx + 1]
    nop nop
    mov mov dl, byte ptr [ecx]
    inc inc ecx
    test test dl, dl
    jne L14
    mov mov edi, dword ptr [edi]
    sub sub ecx, esi
    inc inc ecx
    add add ebp, ecx
    mov mov esi, eax
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    jmp L7
    mov mov ecx, dword ptr [esp + 40]
    cmp cmp byte ptr [ecx], 0
    jne L15
    push push 010191604h
    push push 1
    call sub_10013AD8
    add add esp, 8
    mov mov edx, dword ptr [esp + 44]
    push push 0101915F8h
    push push edx
    call sub_100F7AF9
    add add esp, 8
    test test eax, eax
    jne L4
    push push eax
    push push eax
    mov mov eax, dword ptr [esp + 32]
    push push eax
    lea lea ebx, [esp + 52]
    call sub_10003275
    add add esp, 12
    test test al, al
    je L5
    inc inc dword ptr [esp + 32]
    jmp L6
    mov mov esi, dword ptr [esp + 32]
    lea lea ecx, [esi + esi*2]
    shl shl ecx, 5
    push push ecx
    call dword ptr [fp_101D49D4]
    mov mov dword ptr [g_101AE380], eax
    add add esp, 4
    mov mov eax, esi
    mov mov ecx, 0101AE288h
    mov mov dword ptr [g_101AE37C], 0
    call sub_1002AA08
    mov mov edx, dword ptr [esp + 36]
    mov mov dword ptr [esp + 16], edx
L5:
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je sub_10003DF1
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov edx, dword ptr [eax + 0414h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [esp + 16], ecx
    mov mov dword ptr [eax + 0400h], edx
L8:
    lea lea eax, [esp + 16]
    push push eax
    mov mov eax, 1
    call sub_1005F966
    mov mov cl, byte ptr [eax]
    add add esp, 4
    cmp cmp cl, 123
    jne sub_10003FFF
    mov mov dword ptr [esp + 40], 01019166Eh
    mov mov dword ptr [esp + 24], 1
    xor xor ebp, ebp
    jmp sub_10003E78
    lea lea esp, [esp]
    nop nop
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
L12:
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je sub_10003ED1
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov edx, dword ptr [eax + 0414h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [esp + 16], ecx
    mov mov dword ptr [eax + 0400h], edx
    lea lea eax, [esp + 16]
    push push eax
    mov mov eax, 1
    call sub_1005F9D6
    mov mov ebx, eax
    mov mov al, byte ptr [ebx]
    add add esp, 4
    test test al, al
    je sub_10004028
    cmp cmp al, 125
    je sub_10004030
    mov mov edi, 010191664h
    mov mov esi, ebx
    mov mov ecx, 10
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10003F64
    mov mov dword ptr [esp + 20], edx
    jmp sub_10003F8C
    mov mov esi, dword ptr [esp + 24]
    cmp cmp esi, 64
    jne sub_10003F8C
    push push esi
    push push 010191634h
    push push 1
    call sub_10013C4B
    add add esp, 12
    mov mov dword ptr [esp + 20], esi
    inc inc esi
    mov mov dword ptr [esp + 24], esi
    mov mov eax, dword ptr [esp + 28]
    mov mov edx, dword ptr [esp + 20]
    lea lea ecx, [eax + ebp]
    lea lea edx, [esp + edx*8 + 40]
    mov mov eax, ebx
    mov mov dword ptr [edx], ecx
    lea lea esi, [eax + 1]
    lea lea ecx, [ecx]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne sub_10003FE7
    mov mov edi, dword ptr [edx]
    sub sub eax, esi
    lea lea ecx, [eax + 1]
    add add ebp, ecx
    mov mov edx, ecx
    shr shr ecx, 2
    mov mov esi, ebx
L14:
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je sub_10004071
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov edx, dword ptr [eax + 0414h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [esp + 16], ecx
    mov mov dword ptr [eax + 0400h], edx
    lea lea eax, [esp + 16]
    push push eax
    mov mov eax, 1
    call sub_1005FAA6
    mov mov ecx, dword ptr [esp + 32]
    mov mov edi, dword ptr [esp + 24]
    lea lea edx, [ecx + ebp]
    lea lea edi, [esp + edi*8 + 48]
    mov mov ecx, eax
L15:
    add add esp, 4
    mov mov dword ptr [edi], edx
    lea lea esi, [ecx + 1]
    nop nop
    mov mov dl, byte ptr [ecx]
    inc inc ecx
    test test dl, dl
    jne sub_100040E7
    mov mov edi, dword ptr [edi]
    sub sub ecx, esi
    inc inc ecx
    add add ebp, ecx
    mov mov esi, eax
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    jmp sub_10003FD3
    mov mov ecx, dword ptr [esp + 40]
    cmp cmp byte ptr [ecx], 0
    jne sub_10004147
    push push 010191604h
    push push 1
    call sub_10013D28
    add add esp, 8
    mov mov edx, dword ptr [esp + 44]
    push push 0101915F8h
    push push edx
    call sub_100F7D49
    add add esp, 8
    test test eax, eax
    jne sub_10003F95
    mov mov esi, dword ptr [esp + 24]
    lea lea eax, [esp + 40]
    push push eax
    call sub_10003643
    add add esp, 4
    jmp sub_10003FAB
    push push 0101AE288h
    call sub_1002AD05
    add add esp, 4
    call L16
    call dword ptr [fp_101D49FC]
    pop pop edi
    pop pop esi
    pop pop ebp
FUN_10003880 ENDP
END
