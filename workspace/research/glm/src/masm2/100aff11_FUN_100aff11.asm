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
EXTRN sub_100B0391:PROC
EXTRN sub_100B03BD:PROC
EXTRN sub_100B03DD:PROC
EXTRN sub_100B03E2:PROC
EXTRN sub_100B0421:PROC
EXTRN sub_100B042A:PROC
EXTRN sub_100B0434:PROC
EXTRN sub_100B04FC:PROC
EXTRN sub_100B0516:PROC
EXTRN sub_100B0527:PROC
EXTRN sub_100B0531:PROC
EXTRN sub_100B0536:PROC
EXTRN sub_100B0547:PROC
EXTRN sub_100B0559:PROC
EXTRN sub_100B055A:PROC
EXTRN sub_100B0575:PROC
EXTRN sub_100B0589:PROC
EXTRN sub_100B0595:PROC
EXTRN sub_100B05DF:PROC
EXTRN sub_100B0628:PROC
EXTRN sub_100B068B:PROC
EXTRN sub_100B068F:PROC
EXTRN sub_100B0691:PROC
EXTRN sub_100B0697:PROC
EXTRN sub_100B06AF:PROC
EXTRN sub_100B06B3:PROC
EXTRN sub_100B06B9:PROC
EXTRN sub_100B06BB:PROC
EXTRN sub_100B0745:PROC
EXTRN sub_100B0750:PROC
EXTRN sub_100B0756:PROC
EXTRN sub_100B0757:PROC
EXTRN sub_100B0761:PROC
EXTRN sub_100B0776:PROC
EXTRN sub_100B0794:PROC
EXTRN sub_100B07B0:PROC
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
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 52
    push push ebx
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    mov mov eax, dword ptr [edi + 104]
    mov mov eax, dword ptr [eax + 24]
    push push 31
    push push eax
    mov mov dword ptr [ebp - 12], eax
    lea lea eax, [ebp - 52]
    xor xor esi, esi
    push push eax
    mov mov dword ptr [ebp - 8], ecx
    mov mov dword ptr [ebp - 20], esi
    mov mov dword ptr [ebp - 4], esi
    call sub_100F5E1E
    add add esp, 12
    cmp cmp byte ptr [ebp - 52], 0
    mov mov byte ptr [ebp - 21], 0
    lea lea ebx, [ebp - 52]
    je L2
    movsx movsx eax, byte ptr [ebx]
    push push eax
    call sub_100F8588
    test test eax, eax
    pop pop ecx
    je L1
    inc inc ebx
    cmp cmp byte ptr [ebx], 0
    jne L0
    cmp cmp byte ptr [ebx], 0
    je L3
    push push ebx
    call sub_100F748C
    pop pop ecx
    mov mov dword ptr [ebp + 8], eax
    jmp L4
    and and dword ptr [ebp + 8], 0
    cmp cmp byte ptr [ebx], 0
    je L5
    mov mov byte ptr [ebx], 0
    inc inc ebx
    mov mov al, byte ptr [ebx]
    test test al, al
    je L7
    movsx movsx eax, al
    push push eax
    call sub_100F8673
    test test eax, eax
    pop pop ecx
    je L8
    inc inc ebx
    mov mov al, byte ptr [ebx]
    test test al, al
    jne L6
    cmp cmp byte ptr [ebx], 0
    je L9
L0:
    or or dword ptr [ebp + 8], -1
    jmp L10
    mov mov eax, dword ptr [edi + 112]
    shr shr eax, 2
    add add dword ptr [ebp + 8], eax
    mov mov eax, dword ptr [edi + 108]
    cmp cmp eax, -1
    mov mov ebx, 01196h
    je L11
    movzx movzx edx, byte ptr [edi + 109]
    and and eax, 0FFh
    cmp cmp eax, 4
    mov mov dword ptr [ebp - 4], eax
    mov mov dword ptr [ebp + 8], edx
    jne L31
    mov mov ecx, dword ptr [ebp - 8]
    lea lea eax, [ecx + 0448h]
    cmp cmp dword ptr [eax], 0
    jne sub_100B042A
    cmp cmp dword ptr [ebp + 12], 0
    jne sub_100B0434
    xor xor esi, esi
    push push edx
    inc inc esi
    mov mov dword ptr [eax], esi
    lea lea eax, [ebp - 52]
    push push eax
    push push 010117854h
    push push ebx
    push push dword ptr [edi + 104]
    push push ecx
    jmp L33
    mov mov ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [edi + 4]
    mov mov edx, dword ptr [ecx + 16]
    mov mov esi, dword ptr [edx + eax*4]
    push push edi
    call sub_100863EC
    mov mov dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [esi + 4]
    test test al, 16
    je L24
    test test ah, 2
    jne L26
    lea lea eax, [ebp - 52]
    push push 0101966D4h
    push push eax
    call sub_100F79FF
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne L12
    cmp cmp dword ptr [ebp + 12], eax
    mov mov dword ptr [ebp - 4], 1
    je L13
    push push 2
    jmp L14
    mov mov eax, dword ptr [ebp - 8]
    mov mov eax, dword ptr [eax + 40]
    cmp cmp dword ptr [ebp + 8], eax
    jmp L19
    lea lea eax, [ebp - 52]
    push push 0101956A0h
    push push eax
    call sub_100F7A2E
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne L17
    cmp cmp dword ptr [ebp + 12], eax
    mov mov dword ptr [ebp - 4], 3
    je L18
    push push 8
    pop pop eax
    jmp L15
    mov mov eax, dword ptr [ebp - 8]
    mov mov eax, dword ptr [eax + 60]
    jmp L16
    lea lea eax, [ebp - 52]
    push push 0101966DCh
    push push eax
    call sub_100F7A5B
    test test eax, eax
    pop pop ecx
    pop pop ecx
    je L20
    lea lea eax, [ebp - 52]
    push push 010195A98h
    push push eax
    call sub_100F7A6F
    test test eax, eax
    pop pop ecx
    pop pop ecx
    je L21
    lea lea eax, [ebp - 52]
    push push 01010EC98h
    push push eax
    call sub_100F7A83
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne L22
    cmp cmp dword ptr [ebp + 8], 1
    mov mov dword ptr [ebp - 4], 4
    sbb sbb esi, esi
    inc inc esi
    jmp L25
    lea lea eax, [ebp - 52]
    push push 01011784Ch
    push push eax
    call sub_100F7AA7
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne L23
    inc inc eax
    cmp cmp dword ptr [ebp + 8], eax
    mov mov dword ptr [ebp - 4], eax
    sbb sbb esi, esi
    inc inc esi
    mov mov dword ptr [ebp - 20], eax
    jne L27
    and and dword ptr [ebp + 8], 0
    jmp L28
    lea lea eax, [ebp - 52]
    push push 0101966C8h
    push push eax
    call sub_100F7AD0
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne L29
    inc inc eax
    cmp cmp dword ptr [ebp + 8], eax
    mov mov dword ptr [ebp - 4], eax
    sbb sbb esi, esi
    inc inc esi
    mov mov dword ptr [ebp - 20], eax
    jne L30
    mov mov dword ptr [ebp + 8], eax
    jmp L31
    and and dword ptr [ebp - 4], 0
    xor xor esi, esi
    inc inc esi
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 12], eax
    je L32
    cmp cmp dword ptr [edi + 16], eax
    jne sub_100B03BD
    cmp cmp esi, eax
    je sub_100B0391
    push push dword ptr [ebp - 12]
    push push dword ptr [ebp - 16]
    push push 010117830h
    push push ebx
    push push dword ptr [edi + 104]
    push push dword ptr [ebp - 8]
    call sub_1008B2FE
    add add esp, 24
    jmp sub_100B03DD
    cmp cmp dword ptr [ebp - 20], eax
    je sub_100B03E2
    push push dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp - 4]
    push push dword ptr [eax*4 + 0101A3F88h]
    push push dword ptr [ebp - 12]
    push push dword ptr [ebp - 16]
    push push 0101177F4h
    push push 01261h
    push push dword ptr [edi + 104]
    push push dword ptr [ebp - 8]
    call sub_1008B3B5
    add add esp, 32
    cmp cmp dword ptr [ebp - 4], 4
    je sub_100B0421
    test test esi, esi
    je sub_100B0516
    mov mov eax, dword ptr [ebp - 8]
    add add eax, 0448h
    cmp cmp dword ptr [eax], 0
    jne sub_100B0527
    cmp cmp dword ptr [ebp + 12], 0
    jne sub_100B0531
    push push dword ptr [ebp - 12]
    mov mov dword ptr [eax], 1
    push push dword ptr [ebp - 16]
    push push 0101177CCh
    push push ebx
L14:
    push push dword ptr [edi + 104]
    push push dword ptr [ebp - 8]
    call sub_1008B379
    xor xor esi, esi
    add add esp, 24
    inc inc esi
L16:
    jmp sub_100B0559
    test test al, 32
    je sub_100B0628
    lea lea eax, [ebp - 52]
    push push 0101966D4h
    push push eax
    call sub_100F7BB4
    test test eax, eax
L18:
    pop pop ecx
    pop pop ecx
    jne sub_100B04FC
    mov mov eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ecx + 72]
    mov mov dword ptr [ebp - 4], 1
    sbb sbb esi, esi
    inc inc esi
    jmp sub_100B0536
    lea lea eax, [ebp - 52]
    push push 01010EC78h
    push push eax
    call sub_100F7BDD
    pop pop ecx
    xor xor esi, esi
    test test eax, eax
    pop pop ecx
    jne sub_100B0547
L19:
    mov mov dword ptr [ebp - 4], 4
    inc inc esi
    jmp sub_100B055A
    and and dword ptr [ebp - 4], 0
    inc inc esi
    test test esi, esi
    je sub_100B0589
    cmp cmp dword ptr [ebp + 12], 0
    je sub_100B0575
    cmp cmp dword ptr [edi + 16], 0
    jne sub_100B0595
    push push dword ptr [ebp - 12]
    push push dword ptr [ebp - 16]
    push push 010117830h
    push push ebx
    push push dword ptr [edi + 104]
    push push dword ptr [ebp - 8]
    call sub_1008B401
L20:
    add add esp, 24
    cmp cmp dword ptr [ebp - 4], 4
    jne sub_100B05DF
    cmp cmp dword ptr [ebp + 12], 0
    jne sub_100B06B3
    push push dword ptr [ebp - 12]
    push push dword ptr [ebp - 16]
    push push 01011779Ch
    push push ebx
    push push dword ptr [edi + 104]
    push push dword ptr [ebp - 8]
    call sub_1008B42B
    add add esp, 24
    cmp cmp dword ptr [ebp - 4], 3
    jne sub_100B06B9
    cmp cmp dword ptr [ebp + 8], 0
    jbe sub_100B068B
    cmp cmp dword ptr [ebp + 8], 4
    jae sub_100B0691
    cmp cmp dword ptr [edi + 16], 3
    jne sub_100B0697
    mov mov edx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [edx + 0C8h]
    and and eax, 0FFFFh
    cmp cmp eax, 0104h
    jae sub_100B06AF
    lea lea ebx, [edx + 043Ch]
    cmp cmp dword ptr [ebx], -1
    jne sub_100B068F
    push push 4
    push push -1
    push push 81
    push push 010117794h
    mov mov ecx, edx
    call sub_100864A7
    mov mov dword ptr [ebx], eax
    mov mov ebx, dword ptr [ebx]
    cmp cmp ebx, -1
    jne sub_100B06BB
    mov mov eax, 08007000Eh
    jmp sub_100B0757
    mov mov eax, dword ptr [ebp + 8]
    and and dword ptr [edi + 12], 0
    dec dec eax
    mov mov dword ptr [ebp - 4], 5
    mov mov dword ptr [edi + 4], ebx
L25:
    mov mov dword ptr [edi + 16], eax
    jmp sub_100B0745
L26:
    mov mov edx, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [edx + 60]
    cmp cmp dword ptr [ebp + 8], ecx
    jb sub_100B0750
    cmp cmp dword ptr [ebp + 12], 0
    jne sub_100B0756
    lea lea eax, [edx + 0448h]
    cmp cmp dword ptr [eax], 0
    jne sub_100B0761
    push push ecx
    push push 010117748h
    xor xor esi, esi
L28:
    inc inc esi
    push push ebx
    mov mov dword ptr [eax], esi
    push push dword ptr [edi + 104]
    push push edx
    call sub_1008B4D7
L29:
    add add esp, 20
    cmp cmp dword ptr [ebp - 4], 1
    jne sub_100B0776
    or or word ptr [edi], 0114h
    fldz fldz
    fstp fstp qword ptr [edi + 32]
    fld1 fld1
    fstp fstp qword ptr [edi + 40]
    cmp cmp dword ptr [ebp - 4], 0
    jne sub_100B0794
    xor xor esi, esi
    inc inc esi
    mov mov ecx, dword ptr [ebp + 8]
    cmp cmp ecx, 0FFFFh
    jbe sub_100B07B0
    xor xor esi, esi
    inc inc esi
    mov mov eax, dword ptr [ebp - 4]
    and and eax, 0FFh
    shl shl ecx, 8
    or or eax, ecx
    mov mov dword ptr [edi + 108], eax
    mov mov eax, esi
    neg neg eax
    sbb sbb eax, eax
    and and eax, 080004005h
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
FUN_100aff11 ENDP
END
