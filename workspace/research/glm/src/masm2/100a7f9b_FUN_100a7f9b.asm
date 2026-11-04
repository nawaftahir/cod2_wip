.686
.MODEL FLAT, C
EXTRN sub_1006C7D1:PROC
EXTRN sub_1006C7DF:PROC
EXTRN sub_10085543:PROC
EXTRN sub_100855B0:PROC
EXTRN sub_100856C0:PROC
EXTRN sub_100859D1:PROC
EXTRN sub_10085A4C:PROC
EXTRN sub_10085B50:PROC
EXTRN sub_10085E2B:PROC
EXTRN sub_10085EDB:PROC
EXTRN sub_100862DC:PROC
EXTRN sub_10086330:PROC
EXTRN sub_10086386:PROC
EXTRN sub_1008638E:PROC
EXTRN sub_100A8373:PROC
EXTRN sub_100A837D:PROC
EXTRN sub_100A83EA:PROC
EXTRN sub_100A83FF:PROC
EXTRN sub_100A840D:PROC
EXTRN sub_100A8424:PROC
EXTRN sub_100A843D:PROC
EXTRN sub_100A8465:PROC
EXTRN sub_100A84BD:PROC
EXTRN sub_100A84CB:PROC
EXTRN sub_100A8519:PROC
EXTRN sub_100A853D:PROC
EXTRN sub_100A8544:PROC
EXTRN sub_100A8547:PROC
EXTRN sub_100A8550:PROC
EXTRN sub_100A85CE:PROC
EXTRN sub_100A8627:PROC
EXTRN sub_100A8637:PROC
EXTRN sub_100A8659:PROC
EXTRN sub_100A867B:PROC
EXTRN sub_100A86BF:PROC
EXTRN sub_100A86C7:PROC
EXTRN sub_100A86CD:PROC
EXTRN sub_100A86E9:PROC
EXTRN sub_100A8706:PROC
EXTRN sub_100A871B:PROC
EXTRN sub_100A8722:PROC
.CODE
FUN_100a7f9b PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0E8h
    and and dword ptr [ebp - 4], 0
    and and dword ptr [ebp - 8], 0
    push push ebx
    mov mov ebx, ecx
    mov mov ecx, dword ptr [ebx + 0224h]
    mov mov eax, dword ptr [ebx + 76]
    push push esi
    push push edi
    mov mov dword ptr [ebp - 56], ecx
    cmp cmp eax, ecx
    jmp L20
    mov mov ecx, dword ptr [ebx + 0230h]
    mov mov esi, dword ptr [ecx + eax*4]
    test test esi, esi
    mov mov dword ptr [ebp - 40], esi
    je sub_100A8373
    mov mov eax, dword ptr [esi]
    test test eax, eax
    je sub_100A837D
    and and eax, 0FFFFFh
    mov mov dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [esi + 4]
    xor xor edx, edx
    div div dword ptr [ebp - 16]
    and and dword ptr [ebp - 32], 0
    test test eax, eax
    mov mov dword ptr [ebp - 52], eax
    jbe L17
    and and dword ptr [ebp - 20], 0
    lea lea eax, [ebp - 098h]
    mov mov dword ptr [ebp - 28], eax
    mov mov edi, dword ptr [ebp - 28]
    or or eax, -1
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    or or eax, -1
    lea lea edi, [ebp - 0E8h]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    xor xor edx, edx
    cmp cmp dword ptr [ebp - 16], edx
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    mov mov dword ptr [ebp - 36], edx
    mov mov dword ptr [ebp - 44], edx
    jbe L6
    mov mov eax, dword ptr [esi]
    and and eax, 0FFF00000h
    mov mov dword ptr [ebp - 24], eax
    mov mov eax, dword ptr [esi + 8]
    add add eax, dword ptr [ebp - 20]
    cmp cmp dword ptr [ebp - 24], 050000000h
    mov mov edi, dword ptr [eax]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov edi, dword ptr [ecx + edi*4]
    mov mov dword ptr [ebp - 12], edi
    je L1
    mov mov edi, dword ptr [ebp - 16]
    cmp cmp edi, dword ptr [esi + 12]
    jne L2
    mov mov edi, dword ptr [esi + 16]
    mov mov edx, dword ptr [edi + edx*4]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [ebp - 12]
    mov mov edi, dword ptr [ecx + 4]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [ecx + edi*4]
    test test byte ptr [ecx + 5], 1
    mov mov ecx, dword ptr [ebp - 32]
    lea lea ecx, [edx + ecx*4]
    je L4
    mov mov dword ptr [ebp + ecx*4 - 098h], edx
    jmp L5
    mov mov edi, dword ptr [ebp - 12]
    mov mov edi, dword ptr [edi + 16]
    mov mov dword ptr [ebp + ecx*4 - 098h], edi
    cmp cmp edx, 3
    jne L7
    mov mov dword ptr [ebp - 36], 1
    and and dword ptr [ebp + edx*4 - 0E8h], 0
    mov mov edx, dword ptr [ebp - 44]
    inc inc edx
    add add eax, 4
    cmp cmp edx, dword ptr [ebp - 16]
    mov mov dword ptr [ebp - 44], edx
    jb L3
    cmp cmp dword ptr [ebp - 36], 0
    je L9
    xor xor edx, edx
    inc inc edx
    cmp cmp dword ptr [ebp - 16], edx
    jne L10
    cmp cmp dword ptr [ebp - 24], 050000000h
    jne L8
    cmp cmp dword ptr [esi + 12], edx
    je L13
    mov mov ecx, dword ptr [ebp - 28]
    xor xor eax, eax
    mov mov edi, dword ptr [ecx]
    cmp cmp edi, dword ptr [eax + 0101A4060h]
    je L11
    cmp cmp dword ptr [ebp + eax - 0E8h], -1
    je L14
    xor xor edx, edx
    add add eax, 4
    add add ecx, 4
    cmp cmp eax, 16
    jb L12
    test test edx, edx
    jne sub_100A8424
    push push 2
    lea lea eax, [ebp - 0E8h]
    push push eax
    push push dword ptr [ebp - 28]
    call L0
    test test eax, eax
    jne sub_100A843D
    xor xor edi, edi
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push 3
    push push 0
L1:
    push push dword ptr [ebx + 088h]
    mov mov ecx, ebx
L2:
    call sub_100862DC
    cmp cmp eax, -1
    mov mov dword ptr [ebp + edi*4 - 72], eax
    je sub_100A8519
    inc inc edi
    cmp cmp edi, 1
    jb L15
    push push 116
    call sub_100859D1
    xor xor edi, edi
    cmp cmp eax, edi
    je L16
    mov mov ecx, eax
    call sub_10085543
    mov mov dword ptr [ebp - 4], eax
    jmp L18
    mov mov dword ptr [ebp - 4], edi
    cmp cmp dword ptr [ebp - 4], edi
    je sub_100A8544
    mov mov ecx, dword ptr [ebp - 4]
    push push edi
    push push 1
    push push 6
L4:
    push push 050000003h
    call sub_10085A4C
    mov mov edi, eax
    test test edi, edi
    jl sub_100A853D
    mov mov ecx, dword ptr [ebp - 4]
    push push esi
    call sub_100855B0
    mov mov edi, eax
    test test edi, edi
    jl sub_100A8550
    mov mov ecx, dword ptr [ebp - 20]
L6:
    mov mov eax, dword ptr [esi + 8]
    mov mov eax, dword ptr [ecx + eax]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov edi, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [edi + 16]
    mov mov dword ptr [ebp - 36], eax
    xor xor eax, eax
    mov mov dword ptr [ebp - 12], eax
    jmp sub_100A83EA
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp eax, dword ptr [ebp - 36]
    jne sub_100A83FF
    mov mov ecx, dword ptr [ebx + 0444h]
    jmp sub_100A840D
    mov mov ecx, dword ptr [ebx + 0440h]
    fld fld qword ptr [edi + 32]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push eax
    push push 0
    push push dword ptr [edi + 4]
    mov mov dword ptr [ebp + eax*4 - 88], ecx
    mov mov ecx, ebx
    call sub_1008638E
    cmp cmp eax, -1
    mov mov ecx, dword ptr [ebp - 12]
    mov mov dword ptr [ebp + ecx*4 - 104], eax
    je sub_100A85CE
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    push push edi
    mov mov ecx, eax
    mov mov dword ptr [ebp - 24], eax
    call sub_10085EDB
    mov mov ecx, dword ptr [ebp - 20]
    mov mov eax, dword ptr [esi + 8]
    mov mov eax, dword ptr [ecx + eax]
L8:
    mov mov ecx, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ecx + 56]
    cmp cmp ecx, -1
    jne sub_100A84BD
    mov mov ecx, dword ptr [ebp - 24]
    mov mov dword ptr [ecx + 56], eax
    jmp sub_100A84CB
    mov mov eax, dword ptr [ebp - 24]
    mov mov dword ptr [eax + 56], ecx
    inc inc dword ptr [ebp - 12]
    cmp cmp dword ptr [ebp - 12], 3
    jb sub_100A8465
L10:
    mov mov eax, dword ptr [ebp - 4]
    mov mov edi, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ebp - 16]
    lea lea esi, [ebp - 88]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
L13:
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    mov mov edi, dword ptr [eax + 8]
    add add edi, 12
    test test ecx, ecx
    lea lea esi, [ebp - 104]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    mov mov edi, dword ptr [eax + 16]
    lea lea esi, [ebp - 72]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    jbe sub_100A8544
    mov mov eax, dword ptr [ebp - 20]
    mov mov edx, dword ptr [ebp - 40]
    mov mov edx, dword ptr [edx + 8]
    mov mov esi, dword ptr [ebp - 72]
    mov mov dword ptr [eax + edx], esi
    add add eax, 4
    dec dec ecx
    jne sub_100A8547
    mov mov eax, dword ptr [ebx + 0224h]
    cmp cmp eax, 0200h
    jae sub_100A8659
    mov mov ecx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [ebx + 0230h]
    mov mov dword ptr [edx + eax*4], ecx
    inc inc dword ptr [ebx + 0224h]
    push push ecx
    mov mov ecx, ebx
    call sub_10086330
    test test eax, eax
    jl sub_100A867B
    and and dword ptr [ebp - 4], 0
    mov mov esi, dword ptr [ebp - 40]
    mov mov eax, dword ptr [ebp - 16]
    inc inc dword ptr [ebp - 32]
    add add dword ptr [ebp - 28], 16
    shl shl eax, 2
    add add dword ptr [ebp - 20], eax
    mov mov eax, dword ptr [ebp - 32]
    cmp cmp eax, dword ptr [ebp - 52]
    jb L19
    push push 116
    call sub_10085B50
    test test eax, eax
    je sub_100A8627
    mov mov ecx, eax
    call sub_100856C0
    mov mov dword ptr [ebp - 8], eax
    jmp sub_100A8637
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [ebp - 8], 0
    je sub_100A86BF
    push push dword ptr [ebp - 8]
    mov mov ecx, ebx
    call sub_10086386
    test test eax, eax
    jl sub_100A86CD
    mov mov ecx, dword ptr [ebp - 8]
    push push esi
    call sub_10085E2B
    mov mov edi, eax
    test test edi, edi
    jl sub_100A86C7
    mov mov eax, dword ptr [ebx + 0224h]
    cmp cmp eax, 0200h
    jae sub_100A86E9
    mov mov ecx, dword ptr [ebx + 0230h]
    mov mov edx, dword ptr [ebp - 8]
    and and dword ptr [ebp - 8], 0
    mov mov dword ptr [ecx + eax*4], edx
    inc inc dword ptr [ebx + 0224h]
    and and dword ptr [esi], 0
    mov mov eax, dword ptr [ebp - 48]
    inc inc eax
L17:
    cmp cmp eax, dword ptr [ebp - 56]
    mov mov dword ptr [ebp - 48], eax
    jb L21
    xor xor edi, edi
    mov mov ecx, dword ptr [ebp - 4]
    test test ecx, ecx
    je sub_100A8706
    push push 1
    call sub_1006C7D1
    mov mov ecx, dword ptr [ebp - 8]
    test test ecx, ecx
    je sub_100A8722
    push push 1
    call sub_1006C7DF
    mov mov eax, edi
    pop pop edi
    pop pop esi
L20:
    pop pop ebx
    leave leave
    ret ret
    mov mov edi, 08007000Eh
    jmp sub_100A871B
FUN_100a7f9b ENDP
END
