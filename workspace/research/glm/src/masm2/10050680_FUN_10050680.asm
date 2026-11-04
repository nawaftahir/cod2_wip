.686
.MODEL FLAT, C
EXTRN sub_1004C7E6:PROC
EXTRN sub_1004C7F9:PROC
EXTRN sub_10050913:PROC
EXTRN sub_10050916:PROC
EXTRN sub_100509D7:PROC
EXTRN sub_100509DC:PROC
EXTRN sub_100509FD:PROC
EXTRN sub_10050A03:PROC
EXTRN sub_10050A06:PROC
EXTRN sub_10050A13:PROC
EXTRN sub_10050A75:PROC
EXTRN sub_10050A9E:PROC
EXTRN sub_10050AA1:PROC
EXTRN sub_10050AA8:PROC
EXTRN sub_10050AAC:PROC
.CODE
FUN_10050680 PROC
    sub sub esp, 12
    push push ebx
    push push ebp
    push push esi
    mov mov esi, dword ptr [esp + 28]
    mov mov eax, dword ptr [esi + 0174h]
    xor xor ebp, ebp
    cmp cmp eax, ebp
    sete sete bl
    push push edi
    mov mov edi, dword ptr [esi + 01A0h]
    xor xor cl, cl
    test test bl, bl
    mov mov dword ptr [esp + 24], edi
    mov mov byte ptr [esp + 32], bl
    je L0
    cmp cmp dword ptr [esi + 0178h], ebp
    jmp L1
    mov mov edx, dword ptr [esi + 0178h]
    cmp cmp eax, edx
    jg L2
    cmp cmp edx, 64
    jl L3
    mov mov cl, 1
    cmp cmp dword ptr [esi + 012Ch], 1
    je L4
    mov mov cl, 1
    mov mov eax, dword ptr [esi + 017Ch]
    cmp cmp eax, ebp
    je L5
    mov mov edx, dword ptr [esi + 0180h]
L0:
    dec dec eax
    cmp cmp edx, eax
    je L6
    mov mov cl, 1
    cmp cmp dword ptr [esi + 0180h], 13
    jg L7
    test test cl, cl
    je L8
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 16
    mov mov ecx, dword ptr [esi]
    mov mov edx, dword ptr [esi + 0174h]
    mov mov dword ptr [ecx + 24], edx
L3:
    mov mov eax, dword ptr [esi]
    mov mov ecx, dword ptr [esi + 0178h]
    mov mov dword ptr [eax + 28], ecx
    mov mov edx, dword ptr [esi]
    mov mov eax, dword ptr [esi + 017Ch]
    mov mov dword ptr [edx + 32], eax
L4:
    mov mov ecx, dword ptr [esi]
    mov mov edx, dword ptr [esi + 0180h]
    mov mov dword ptr [ecx + 36], edx
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    cmp cmp dword ptr [esi + 012Ch], ebp
    mov mov dword ptr [esp + 16], ebp
    jle L12
L5:
    lea lea ecx, [esi + 0130h]
    mov mov dword ptr [esp + 20], ecx
    jmp L9
    lea lea ecx, [ecx]
    mov mov edx, dword ptr [esp + 20]
    mov mov eax, dword ptr [edx]
    mov mov ebx, dword ptr [eax + 4]
    mov mov ecx, dword ptr [esi + 094h]
    mov mov al, byte ptr [esp + 32]
    mov mov ebp, ebx
    shl shl ebp, 8
    add add ebp, ecx
    test test al, al
    jne L10
    cmp cmp dword ptr [ebp], 0
    jge L11
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 115
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 24], ebx
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 28], 0
    mov mov ecx, dword ptr [esi]
    push push -1
    push push esi
    call call dword ptr [ecx + 4]
    add add esp, 8
    mov mov edi, dword ptr [esi + 0174h]
    cmp cmp edi, dword ptr [esi + 0178h]
    jg sub_10050913
    mov mov eax, dword ptr [ebp + edi*4]
    mov mov ecx, dword ptr [esi + 017Ch]
    xor xor edx, edx
    test test eax, eax
    setl setl dl
    dec dec edx
    and and eax, edx
    cmp cmp ecx, eax
    je sub_10050916
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 115
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 24], ebx
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 28], edi
    mov mov eax, dword ptr [esi]
    push push -1
    push push esi
    call call dword ptr [eax + 4]
    add add esp, 8
    mov mov ecx, dword ptr [esi + 0180h]
    mov mov dword ptr [ebp + edi*4], ecx
    mov mov eax, dword ptr [esi + 0178h]
    inc inc edi
    cmp cmp edi, eax
    jle sub_10050913
    mov mov eax, dword ptr [esp + 16]
    mov mov edx, dword ptr [esp + 20]
    mov mov ecx, dword ptr [esi + 012Ch]
    inc inc eax
    add add edx, 4
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 16], eax
    mov mov dword ptr [esp + 20], edx
    jl L13
    mov mov edi, dword ptr [esp + 24]
    mov mov bl, byte ptr [esp + 32]
    xor xor ebp, ebp
    cmp cmp dword ptr [esi + 017Ch], ebp
    jne sub_100509DC
    test test bl, bl
    je sub_100509D7
    mov mov dword ptr [edi + 4], 010050980h
    jmp sub_100509FD
    mov mov dword ptr [edi + 4], 010050BD0h
    jmp sub_10050A06
    test test bl, bl
    je sub_10050A03
    mov mov dword ptr [edi + 4], 010050E10h
    jmp sub_10050A13
    mov mov dword ptr [edi + 4], 010050F00h
    cmp cmp dword ptr [esi + 012Ch], ebp
    mov mov dword ptr [esp + 16], ebp
    jle sub_10050AA1
    lea lea ebx, [edi + 24]
    lea lea ebp, [esi + 0130h]
    mov mov cl, byte ptr [esp + 32]
    test test cl, cl
    mov mov eax, dword ptr [ebp]
    je sub_10050A75
    mov mov ecx, dword ptr [esi + 017Ch]
    test test ecx, ecx
    jne sub_10050A9E
    mov mov ecx, dword ptr [eax + 20]
    push push 1
    lea lea eax, [edi + ecx*4 + 44]
    push push esi
    call sub_1004C7E6
    jmp sub_10050AAC
    mov mov ecx, dword ptr [eax + 24]
    lea lea edi, [edi + ecx*4 + 44]
    push push 0
    push push esi
    mov mov eax, edi
    call sub_1004C7F9
    mov mov edx, dword ptr [edi]
    mov mov eax, dword ptr [esp + 32]
    mov mov dword ptr [eax + 60], edx
    mov mov edi, eax
    add add esp, 8
    mov mov eax, dword ptr [esp + 16]
    mov mov dword ptr [ebx], 0
    mov mov ecx, dword ptr [esi + 012Ch]
    inc inc eax
    add add ebp, 4
    add add ebx, 4
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 16], eax
    jl sub_10050AA8
    xor xor ebp, ebp
    mov mov dword ptr [edi + 16], ebp
    mov mov dword ptr [edi + 12], ebp
    mov mov dword ptr [edi + 20], ebp
    mov mov byte ptr [edi + 8], 0
    mov mov ecx, dword ptr [esi + 0104h]
    mov mov dword ptr [edi + 40], ecx
    pop pop edi
    pop pop esi
    pop pop ebp
L13:
    pop pop ebx
FUN_10050680 ENDP
END
