.686
.MODEL FLAT, C
EXTRN sub_10086A44:PROC
EXTRN sub_1008B01C:PROC
EXTRN sub_1008B17E:PROC
EXTRN sub_1008B322:PROC
EXTRN sub_10094A7C:PROC
EXTRN sub_10095159:PROC
EXTRN sub_100951D1:PROC
EXTRN sub_100951D7:PROC
EXTRN sub_100951D8:PROC
EXTRN sub_100951DD:PROC
EXTRN sub_100951E0:PROC
EXTRN sub_100951EC:PROC
EXTRN sub_100951F1:PROC
EXTRN sub_100951F4:PROC
EXTRN sub_100951FF:PROC
EXTRN sub_10095219:PROC
EXTRN sub_10095241:PROC
EXTRN sub_10095302:PROC
EXTRN sub_10095305:PROC
EXTRN sub_10095306:PROC
EXTRN sub_10095308:PROC
EXTRN sub_10095315:PROC
EXTRN sub_10095336:PROC
EXTRN sub_10095385:PROC
EXTRN sub_100F7887:PROC
EXTRN sub_100F7AE3:PROC
.CODE
FUN_10094eb4 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 36
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 12]
    shl shl eax, 2
    xor xor ebx, ebx
    push push eax
    mov mov dword ptr [ebp - 4], ebx
    call sub_100F7887
    cmp cmp eax, ebx
    pop pop ecx
    mov mov dword ptr [ebp - 8], eax
    jne L0
    mov mov esi, 08007000Eh
    jmp sub_10095159
    cmp cmp dword ptr [esi + 12], ebx
    push push edi
    mov mov dword ptr [ebp - 12], ebx
    jbe L2
    mov mov ecx, dword ptr [ebp - 12]
    mov mov eax, dword ptr [esi + 24]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [eax]
    and and ecx, 0FFF00000h
    je L3
    cmp cmp dword ptr [ebp + 8], ebx
    je L1
    cmp cmp dword ptr [eax + 36], ebx
    jne L4
    cmp cmp ecx, 010F00000h
    je L5
    cmp cmp ecx, 020700000h
    je L6
    cmp cmp ecx, 011100000h
    je L7
    cmp cmp ecx, 011200000h
    je L8
    cmp cmp ecx, 011300000h
    je L9
    cmp cmp ecx, 011400000h
    je L10
    cmp cmp ecx, 020800000h
    je L11
    cmp cmp ecx, 020900000h
    je L13
    cmp cmp ecx, 011500000h
    je L15
    mov mov edi, dword ptr [eax + 12]
    cmp cmp edi, ebx
    mov mov dword ptr [ebp - 16], ebx
    jbe L12
    mov mov ecx, dword ptr [esi + 20]
    mov mov edx, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + 16]
    mov mov ebx, dword ptr [eax]
    mov mov ebx, dword ptr [ecx + ebx*4]
    mov mov ebx, dword ptr [ebx + 4]
    mov mov ebx, dword ptr [edx + ebx*4]
    test test word ptr [ebx + 4], 01020h
    jne L16
    inc inc dword ptr [ebp - 16]
    add add eax, 4
    cmp cmp dword ptr [ebp - 16], edi
    jb L14
    cmp cmp dword ptr [ebp - 16], edi
    jb L17
    mov mov edx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp - 12]
    inc inc dword ptr [ebp - 4]
    mov mov dword ptr [eax + edx*4], ecx
    xor xor ebx, ebx
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp eax, dword ptr [esi + 12]
    jb L2
    mov mov dword ptr [ebp - 20], ebx
    and and dword ptr [ebp + 8], 0
    mov mov ecx, esi
    call sub_1008B01C
    mov mov edi, dword ptr [ebp - 4]
    mov mov ebx, dword ptr [ebp - 8]
    push push esi
    push push edi
    push push ebx
    push push 01008B352h
    call sub_10086A44
    xor xor eax, eax
    cmp cmp edi, eax
    jbe sub_10095241
    mov mov dword ptr [ebp - 12], 1
    mov mov dword ptr [ebp - 16], ebx
    mov mov dword ptr [ebp - 32], edi
    mov mov eax, dword ptr [ebp - 16]
    mov mov eax, dword ptr [eax]
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 24], eax
    je sub_100951D8
    mov mov eax, dword ptr [ebp - 12]
    jmp sub_100951D1
    mov mov ecx, dword ptr [ebp - 8]
    lea lea ebx, [ecx + eax*4]
    mov mov edi, dword ptr [ebx]
    cmp cmp edi, -1
    mov mov dword ptr [ebp - 36], ebx
    je sub_100951E0
L5:
    mov mov ecx, dword ptr [ebp - 24]
    cmp cmp ecx, edi
    jae sub_100951F4
    push push esi
L6:
    push push edi
    call sub_1008B322
    test test eax, eax
L7:
    jne sub_100951FF
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ebp - 24]
L8:
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [eax + edi*4]
    xor xor edx, edx
L9:
    cmp cmp dword ptr [ecx + 12], edx
    mov mov dword ptr [ebp + 8], edx
    jbe sub_100951F1
L10:
    mov mov ebx, dword ptr [ebp + 8]
    mov mov edi, dword ptr [eax + 16]
    mov mov edi, dword ptr [edi + ebx*4]
    mov mov ebx, dword ptr [esi + 20]
L12:
    mov mov edi, dword ptr [ebx + edi*4]
    mov mov edx, dword ptr [ecx + 16]
    mov mov ebx, dword ptr [ebp + 8]
L14:
    mov mov edx, dword ptr [edx + ebx*4]
L15:
    inc inc dword ptr [ebp + 8]
    mov mov dword ptr [edi + 48], edx
    mov mov edx, dword ptr [ebp + 8]
    cmp cmp edx, dword ptr [ecx + 12]
    jb sub_100951EC
    mov mov ebx, dword ptr [ebp - 36]
    xor xor edx, edx
    or or dword ptr [ebx], -1
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], edx
    mov mov dword ptr [eax + 12], edx
    xor xor eax, eax
    inc inc eax
    mov mov dword ptr [ebp - 20], eax
    mov mov dword ptr [ebp + 8], eax
    mov mov eax, dword ptr [ebp - 28]
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 28], eax
    jb sub_100951DD
    add add dword ptr [ebp - 16], 4
    inc inc dword ptr [ebp - 12]
    dec dec dword ptr [ebp - 32]
    jne sub_100951D7
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 8], eax
    je sub_10095302
    mov mov ecx, dword ptr [ebp - 4]
    cmp cmp ecx, eax
    mov mov dword ptr [ebp - 36], ecx
    mov mov dword ptr [ebp - 4], eax
    mov mov dword ptr [ebp - 32], eax
    jbe sub_10095306
    mov mov ecx, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ecx + eax*4]
    cmp cmp ecx, -1
    je sub_10095305
    mov mov eax, dword ptr [esi + 24]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edi, dword ptr [eax + 4]
    and and dword ptr [ebp + 8], 0
    test test edi, edi
    jbe sub_10095305
    mov mov eax, dword ptr [eax + 8]
    mov mov edx, dword ptr [eax]
    mov mov ebx, dword ptr [esi + 20]
    mov mov ebx, dword ptr [ebx + edx*4]
    cmp cmp dword ptr [ebx + 48], edx
    jne sub_10095315
    inc inc dword ptr [ebp + 8]
    add add eax, 4
    cmp cmp dword ptr [ebp + 8], edi
    jb sub_10095308
    cmp cmp dword ptr [ebp + 8], edi
    je sub_10095336
    mov mov edx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 8]
    inc inc dword ptr [ebp - 4]
    mov mov dword ptr [eax + edx*4], ecx
    mov mov eax, dword ptr [ebp - 32]
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 36]
    mov mov dword ptr [ebp - 32], eax
    jb sub_10095306
    mov mov ecx, esi
    call sub_1008B17E
    jmp sub_10095219
    cmp cmp dword ptr [ebp - 20], eax
    pop pop edi
    je sub_10095385
    mov mov ecx, esi
    call sub_10094A7C
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 20], eax
    sete sete al
    mov mov esi, eax
    push push dword ptr [ebp - 8]
    call sub_100F7AE3
    pop pop ecx
    mov mov eax, esi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
FUN_10094eb4 ENDP
END
