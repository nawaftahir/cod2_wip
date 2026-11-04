.686
.MODEL FLAT, C
EXTRN sub_10086821:PROC
EXTRN sub_10086839:PROC
EXTRN sub_100A7FA3:PROC
EXTRN sub_100A8026:PROC
EXTRN sub_100A80B6:PROC
EXTRN sub_100A80C6:PROC
EXTRN sub_100A8170:PROC
EXTRN sub_100A817E:PROC
EXTRN sub_100A836C:PROC
EXTRN sub_100A8EA3:PROC
EXTRN sub_100A8EA6:PROC
EXTRN sub_100A8EAD:PROC
EXTRN sub_100A8EB7:PROC
EXTRN sub_100A8ECA:PROC
EXTRN sub_100A8ED2:PROC
EXTRN sub_100A8ED7:PROC
EXTRN sub_100A8EDD:PROC
EXTRN sub_100A8EE6:PROC
EXTRN sub_100A8F03:PROC
EXTRN sub_100A8F30:PROC
EXTRN sub_100A8F5F:PROC
EXTRN sub_100A8F6B:PROC
EXTRN sub_100A8F6C:PROC
EXTRN sub_100A8FCB:PROC
EXTRN sub_100A8FFA:PROC
EXTRN sub_100A9017:PROC
EXTRN sub_100A90FF:PROC
EXTRN sub_100A9103:PROC
EXTRN sub_100A9167:PROC
EXTRN sub_100A9179:PROC
EXTRN sub_100A91AD:PROC
EXTRN sub_100A91D3:PROC
EXTRN sub_100A91FB:PROC
EXTRN sub_100A91FF:PROC
EXTRN sub_100A9200:PROC
EXTRN sub_100A9208:PROC
EXTRN sub_100A9209:PROC
EXTRN sub_100A920F:PROC
EXTRN sub_100A9213:PROC
EXTRN sub_100A921C:PROC
EXTRN sub_100A921E:PROC
EXTRN sub_100A922B:PROC
EXTRN sub_100A9234:PROC
EXTRN sub_100A9239:PROC
EXTRN sub_100A923E:PROC
EXTRN sub_100A923F:PROC
EXTRN sub_100A926E:PROC
EXTRN sub_100A927C:PROC
EXTRN sub_100A9281:PROC
EXTRN sub_100A9283:PROC
EXTRN sub_100A9286:PROC
EXTRN sub_100A9292:PROC
EXTRN sub_100A9297:PROC
EXTRN sub_100A92AF:PROC
EXTRN sub_100A9326:PROC
EXTRN sub_100A93A9:PROC
EXTRN sub_100A93B5:PROC
EXTRN sub_100A93BA:PROC
EXTRN sub_100A93BC:PROC
EXTRN sub_100A93D2:PROC
EXTRN sub_100A93FD:PROC
EXTRN sub_100A9418:PROC
EXTRN sub_100A9431:PROC
EXTRN sub_100A943D:PROC
EXTRN sub_100A9449:PROC
EXTRN sub_100C3EFC:PROC
EXTRN sub_100C3F14:PROC
EXTRN sub_100C3FC1:PROC
EXTRN sub_100C3FF1:PROC
EXTRN sub_100C4009:PROC
EXTRN sub_100C413D:PROC
EXTRN sub_100C4155:PROC
EXTRN sub_100C419F:PROC
.CODE
FUN_100a88e8 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0A8h
    push push ebx
    mov mov ebx, ecx
    push push esi
    mov mov esi, dword ptr [ebx + 0100h]
    mov mov ecx, dword ptr [esi]
    push push edi
    mov mov edi, ecx
    and and edi, 0FFFFFh
    test test esi, esi
    mov mov dword ptr [ebp - 28], ebx
    mov mov dword ptr [ebp - 24], edi
    je sub_100A8ECA
    test test ecx, ecx
    je sub_100A8ED2
    mov mov eax, dword ptr [esi + 4]
    xor xor edx, edx
    div div edi
    and and dword ptr [ebp - 20], 0
    and and ecx, 0FFF00000h
    cmp cmp ecx, 050000000h
    mov mov dword ptr [ebp - 8], eax
    je sub_100A8EDD
    cmp cmp dword ptr [esi + 12], edi
    jne sub_100A8EE6
    mov mov eax, dword ptr [ebx + 0C8h]
    and and dword ptr [ebp - 40], 0
    xor xor edi, edi
    and and eax, 0FFFFh
    inc inc edi
    cmp cmp eax, 0104h
    je L0
    push push esi
    mov mov ecx, ebx
    call sub_100A7FA3
    test test eax, eax
    je L1
    mov mov ecx, dword ptr [esi + 12]
    test test ecx, ecx
    jbe L2
    mov mov eax, dword ptr [ebx + 20]
    mov mov esi, dword ptr [esi + 16]
    mov mov edx, dword ptr [esi]
    mov mov edx, dword ptr [eax + edx*4]
    cmp cmp dword ptr [edx + 16], 3
    jne L4
    mov mov dword ptr [ebp - 20], edi
    mov mov dword ptr [ebp - 40], edi
    add add esi, 4
    dec dec ecx
    jne L3
    and and dword ptr [ebp - 16], 0
    cmp cmp dword ptr [ebp - 8], 0
    jbe L6
    and and dword ptr [ebp - 32], 0
    lea lea eax, [ebp - 0A8h]
    mov mov dword ptr [ebp - 4], eax
    mov mov edi, dword ptr [ebp - 4]
    or or eax, -1
    stosd stosd dword ptr es:[edi], eax
    and and dword ptr [ebp - 12], 0
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    or or eax, -1
    cmp cmp dword ptr [ebp - 24], 0
    lea lea edi, [ebp - 120]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    jbe L5
    mov mov eax, dword ptr [ebp - 32]
    mov mov ecx, dword ptr [ebx + 0100h]
    mov mov edx, dword ptr [ebx + 20]
    mov mov edi, dword ptr [ebx + 16]
    mov mov dword ptr [ebp - 36], eax
    mov mov esi, dword ptr [ebp - 36]
    mov mov eax, dword ptr [ecx + 8]
    mov mov eax, dword ptr [esi + eax]
    mov mov esi, dword ptr [edx + eax*4]
    mov mov ebx, dword ptr [ebp - 12]
    mov mov eax, dword ptr [ecx + 16]
    mov mov eax, dword ptr [eax + ebx*4]
    mov mov ebx, dword ptr [esi + 4]
    mov mov ebx, dword ptr [edi + ebx*4]
    test test byte ptr [ebx + 5], 1
    mov mov eax, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [eax + 16]
    je L8
    mov mov esi, dword ptr [ebp - 16]
    lea lea esi, [eax + esi*4]
L0:
    mov mov dword ptr [ebp + esi*4 - 0A8h], eax
    jmp L10
    mov mov ebx, dword ptr [ebp - 16]
L1:
    mov mov esi, dword ptr [esi + 16]
    lea lea ebx, [eax + ebx*4]
    mov mov dword ptr [ebp + ebx*4 - 0A8h], esi
L3:
    and and dword ptr [ebp + eax*4 - 120], 0
L4:
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 12]
    add add dword ptr [ebp - 36], 4
    cmp cmp eax, dword ptr [ebp - 24]
    jb L7
    mov mov ebx, dword ptr [ebp - 28]
    push push 5
    lea lea eax, [ebp - 120]
    push push eax
    push push dword ptr [ebp - 4]
    call sub_100A8026
    test test eax, eax
    jne L11
    mov mov dword ptr [ebp - 20], 1
    mov mov eax, dword ptr [ebp - 24]
    inc inc dword ptr [ebp - 16]
    add add dword ptr [ebp - 4], 16
    shl shl eax, 2
    add add dword ptr [ebp - 32], eax
    mov mov eax, dword ptr [ebp - 16]
    cmp cmp eax, dword ptr [ebp - 8]
    jb L9
    xor xor esi, esi
    cmp cmp dword ptr [ebp - 20], esi
    je sub_100A8FFA
    cmp cmp dword ptr [ebp - 24], 4
    mov mov dword ptr [ebp - 16], esi
    mov mov dword ptr [ebp - 28], esi
    jne L21
    mov mov dword ptr [ebp - 4], 1
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp - 4], ecx
    je L14
    xor xor eax, eax
    lea lea edi, [ebp - 120]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    or or eax, -1
    lea lea edi, [ebp - 104]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    or or dword ptr [ebp + esi*4 - 120], -1
    cmp cmp dword ptr [ebp - 8], ecx
    mov mov dword ptr [ebp + esi*4 - 104], ecx
    mov mov dword ptr [ebp - 4], ecx
    jbe L13
    mov mov eax, dword ptr [ebp - 8]
    lea lea edi, [ebp - 0A8h]
    mov mov dword ptr [ebp - 20], eax
    push push 5
    lea lea eax, [ebp - 120]
    push push eax
    push push edi
    call sub_100A80B6
    test test eax, eax
    je L16
    push push 5
    lea lea eax, [ebp - 120]
    push push eax
    push push edi
    call sub_100A80C6
    test test eax, eax
    jne L17
    mov mov dword ptr [ebp - 4], 1
    add add edi, 16
    dec dec dword ptr [ebp - 20]
    jne L15
    cmp cmp dword ptr [ebp - 40], 0
    je L18
    cmp cmp esi, 3
    je L19
    mov mov dword ptr [ebp - 4], 1
    cmp cmp dword ptr [ebp - 4], 0
    je L20
    inc inc esi
    cmp cmp esi, 4
L5:
    jb L12
    xor xor ecx, ecx
    mov mov dword ptr [ebp - 4], 1
L7:
    mov mov dword ptr [ebp - 12], ecx
L8:
    cmp cmp dword ptr [ebp - 4], 0
    je sub_100A8EB7
    xor xor ecx, ecx
    mov mov dword ptr [ebp - 20], ecx
    mov mov edx, dword ptr [ebp - 12]
    xor xor esi, esi
    cmp cmp ecx, edx
    je sub_100A8EA3
    xor xor eax, eax
    lea lea edi, [ebp - 120]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    or or eax, -1
    lea lea edi, [ebp - 104]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    lea lea eax, [ebp - 120]
    or or dword ptr [eax + edx*4], -1
    or or dword ptr [eax + ecx*4], -1
    cmp cmp dword ptr [ebp - 8], esi
    mov mov dword ptr [ebp + edx*4 - 104], esi
    mov mov dword ptr [ebp + ecx*4 - 104], esi
    mov mov dword ptr [ebp - 4], esi
    mov mov dword ptr [ebp - 36], esi
    jbe L22
    mov mov eax, dword ptr [ebp - 8]
    lea lea esi, [ebp - 0A8h]
    mov mov dword ptr [ebp - 32], eax
    push push 5
    lea lea eax, [ebp - 120]
    push push eax
    push push esi
    call sub_100A8170
    mov mov edi, eax
    push push 5
    lea lea eax, [ebp - 104]
    push push eax
    push push esi
    call sub_100A817E
    test test edi, edi
    jne L24
    mov mov dword ptr [ebp - 36], 1
    jmp L25
    push push 4
    push push dword ptr [ebp - 8]
    lea lea eax, [ebp - 120]
L11:
    push push eax
    mov mov ecx, ebx
    call sub_100C3EFC
    test test eax, eax
    jl sub_100A9179
    push push 4
    push push dword ptr [ebp - 8]
    lea lea eax, [ebp - 104]
    push push eax
    mov mov ecx, ebx
    call sub_100C3F14
    jmp sub_100A9167
    test test eax, eax
    jne sub_100A8ED7
    mov mov dword ptr [ebp - 4], 1
    add add esi, 16
    dec dec dword ptr [ebp - 32]
    jne L23
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 40], eax
    je sub_100A8F03
    mov mov dword ptr [ebp - 4], 1
    cmp cmp dword ptr [ebp - 4], eax
    je sub_100A8F6C
    cmp cmp dword ptr [ebp - 36], eax
    jne sub_100A8F5F
    cmp cmp dword ptr [ebp - 40], 0
    je sub_100A8F30
    cmp cmp dword ptr [ebp - 108], 0
    je sub_100A8F6B
    lea lea esi, [ebp - 120]
    lea lea edi, [ebp - 88]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    or or eax, -1
    lea lea edi, [ebp - 72]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    or or eax, -1
    lea lea edi, [ebp - 56]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    mov mov eax, dword ptr [ebp - 12]
    and and dword ptr [ebp + eax*4 - 72], 0
    mov mov eax, dword ptr [ebp - 20]
    and and dword ptr [ebp + eax*4 - 56], 0
    mov mov dword ptr [ebp - 28], 1
    mov mov ecx, dword ptr [ebp - 20]
    inc inc ecx
    cmp cmp ecx, 4
    mov mov dword ptr [ebp - 20], ecx
    jb sub_100A8EA6
    jmp sub_100A8FCB
    mov mov dword ptr [ebp - 16], 1
    inc inc dword ptr [ebp - 12]
    cmp cmp dword ptr [ebp - 12], 4
    jb sub_100A8EAD
    cmp cmp dword ptr [ebp - 16], 0
    je sub_100A9017
    push push 4
    push push dword ptr [ebp - 8]
    lea lea eax, [ebp - 120]
    push push eax
    mov mov ecx, ebx
    call sub_100C3FC1
    test test eax, eax
    jl sub_100A923E
    push push 4
    jmp sub_100A91AD
    cmp cmp dword ptr [ebp - 28], 0
    je sub_100A91D3
    push push 4
    push push dword ptr [ebp - 8]
    lea lea eax, [ebp - 88]
    push push eax
    mov mov ecx, ebx
    mov mov dword ptr [ebp - 16], 1
    call sub_100C3FF1
    test test eax, eax
    jl sub_100A926E
    push push 4
    push push dword ptr [ebp - 8]
    lea lea eax, [ebp - 72]
    push push eax
    mov mov ecx, ebx
    call sub_100C4009
    test test eax, eax
    jl sub_100A9286
    push push 4
    lea lea eax, [ebp - 56]
    jmp sub_100A91FB
    cmp cmp dword ptr [ebp - 24], 3
    jne sub_100A921E
    or or dword ptr [ebp - 28], -1
    xor xor eax, eax
    cmp cmp dword ptr [ebp + eax*4 - 0A8h], -1
    jne sub_100A9103
    mov mov dword ptr [ebp - 28], eax
    inc inc eax
    cmp cmp eax, 4
    jb sub_100A90FF
    and and dword ptr [ebp - 12], 0
    cmp cmp dword ptr [ebp - 16], 0
    jne sub_100A920F
    xor xor ecx, ecx
    xor xor esi, esi
    cmp cmp dword ptr [ebp - 16], ecx
    jne sub_100A9209
    cmp cmp esi, dword ptr [ebp - 12]
    je sub_100A9208
    mov mov edx, dword ptr [ebp - 28]
    cmp cmp esi, edx
    je sub_100A9213
    cmp cmp dword ptr [ebp - 12], edx
    je sub_100A921C
    or or eax, -1
    lea lea edi, [ebp - 120]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    xor xor eax, eax
    lea lea edi, [ebp - 104]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    mov mov edi, dword ptr [ebp - 12]
    shl shl edi, 2
    lea lea eax, [ebp - 120]
    mov mov dword ptr [edi + eax], ecx
    mov mov dword ptr [eax + esi*4], ecx
    or or dword ptr [ebp + edi - 104], -1
    or or dword ptr [ebp + esi*4 - 104], -1
    or or dword ptr [ebp + edx*4 - 104], -1
    xor xor edi, edi
    cmp cmp dword ptr [ebp - 8], ecx
    mov mov dword ptr [ebp - 4], ecx
    jbe sub_100A922B
    lea lea eax, [ebp - 0A8h]
    mov mov dword ptr [ebp - 20], eax
    cmp cmp dword ptr [ebp - 4], ecx
    jne sub_100A9239
    push push 5
    lea lea eax, [ebp - 120]
    push push eax
    push push dword ptr [ebp - 20]
    call sub_100A836C
    test test eax, eax
    jne sub_100A923F
    mov mov dword ptr [ebp - 4], 1
    add add dword ptr [ebp - 20], 16
    inc inc edi
    xor xor ecx, ecx
    cmp cmp edi, dword ptr [ebp - 8]
    jb sub_100A9234
    cmp cmp dword ptr [ebp - 108], ecx
    jne sub_100A9283
    cmp cmp dword ptr [ebp - 120], ecx
    je sub_100A927C
    cmp cmp dword ptr [ebp - 116], ecx
    je sub_100A9281
    cmp cmp dword ptr [ebp - 112], ecx
    jne sub_100A9292
    cmp cmp dword ptr [ebp - 40], ecx
    je sub_100A9297
    mov mov dword ptr [ebp - 4], 1
    cmp cmp dword ptr [ebp - 4], ecx
    jne sub_100A92AF
    mov mov dword ptr [ebp - 16], 1
    inc inc esi
    cmp cmp esi, 4
    jb sub_100A9200
    inc inc dword ptr [ebp - 12]
    cmp cmp dword ptr [ebp - 12], 4
    jb sub_100A91FF
    cmp cmp dword ptr [ebp - 16], 0
    je sub_100A9326
    push push 3
    push push dword ptr [ebp - 8]
    lea lea eax, [ebp - 120]
    push push eax
    mov mov ecx, ebx
    call sub_100C413D
    test test eax, eax
    jl sub_100A93BA
    push push 3
    lea lea eax, [ebp - 104]
    push push dword ptr [ebp - 8]
    mov mov ecx, ebx
    push push eax
    call sub_100C4155
    test test eax, eax
    jl sub_100A93D2
    cmp cmp dword ptr [ebp - 16], 0
    jne sub_100A93B5
    xor xor esi, esi
    cmp cmp dword ptr [ebp - 24], esi
    jbe sub_100A93BC
    mov mov ecx, dword ptr [ebx + 20]
    push push dword ptr [ebp - 24]
    or or eax, -1
    push push dword ptr [ebp - 8]
    lea lea edi, [ebp - 120]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov eax, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax + esi*4]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 16]
    and and dword ptr [ebp + eax*4 - 120], 0
    lea lea eax, [ebp - 120]
    push push eax
    mov mov ecx, ebx
    call sub_100C419F
    test test eax, eax
    jl sub_100A9418
    inc inc esi
    cmp cmp esi, dword ptr [ebp - 24]
    jb sub_100A93A9
    jmp sub_100A93FD
    push push dword ptr [ebx + 0100h]
    mov mov ecx, ebx
    call sub_10086821
    test test eax, eax
    jl sub_100A9431
L22:
    mov mov ecx, dword ptr [ebx + 0100h]
    xor xor eax, eax
    mov mov dword ptr [ecx], eax
    jmp sub_100A943D
L23:
    push push esi
    mov mov ecx, ebx
    call sub_10086839
    test test eax, eax
    jl sub_100A9449
    mov mov eax, dword ptr [ebx + 0100h]
    and and dword ptr [eax], 0
    xor xor eax, eax
    pop pop edi
L25:
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100a88e8 ENDP
END
