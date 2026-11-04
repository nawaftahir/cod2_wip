.686
.MODEL FLAT, C
EXTRN sub_1008556B:PROC
EXTRN sub_100857B4:PROC
EXTRN sub_10085FE6:PROC
EXTRN sub_10086190:PROC
EXTRN sub_10086256:PROC
EXTRN sub_10086335:PROC
EXTRN sub_10086393:PROC
EXTRN sub_100863D1:PROC
EXTRN sub_1008649F:PROC
EXTRN sub_10086565:PROC
EXTRN sub_10086578:PROC
EXTRN sub_1008658C:PROC
EXTRN sub_10086FD2:PROC
EXTRN sub_1008704E:PROC
EXTRN sub_1008710C:PROC
EXTRN sub_100871F2:PROC
EXTRN sub_1008729F:PROC
EXTRN sub_10087369:PROC
EXTRN sub_1008738E:PROC
EXTRN sub_1008AE45:PROC
EXTRN sub_1008B64B:PROC
EXTRN sub_1008C36E:PROC
EXTRN sub_1008C397:PROC
EXTRN sub_1008D64D:PROC
EXTRN sub_1008DA12:PROC
EXTRN sub_100B8641:PROC
EXTRN sub_100F78AD:PROC
.CODE
FUN_1009370b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 56
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 0000000CCh]
    push edi
    mov edi, 000000100h
    test edi, eax
    jne L0
    test al, 4
    je L1
L0:
    xor eax, eax
    inc eax
    jmp L29
L1:
    push ebx
    mov ecx, esi
    call sub_1008D64D
    xor ebx, ebx
    cmp eax, ebx
    jl L28
    push 0000001FCh
    call sub_100F78AD
    cmp eax, ebx
    pop ecx
    je L2
    mov ecx, eax
    call sub_100B8641
    jmp L3
L2:
    xor eax, eax
L3:
    cmp eax, ebx
    mov dword ptr [esi + 0000000E0h], eax
    je L30
    mov ecx, dword ptr [esi + 0000000CCh]
    or ecx, edi
    push ecx
    push 046580201h
    push esi
    mov ecx, eax
    call sub_1008B64B
    cmp eax, ebx
    jl L28
    mov ecx, dword ptr [esi + 0000000E0h]
    call sub_10086FD2
    cmp eax, ebx
    jl L28
    mov ecx, esi
    call sub_100871F2
    cmp eax, ebx
    jl L28
    xor eax, eax
    cmp dword ptr [esi + 8], ebx
    jbe L5
L4:
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    or dword ptr [ecx + 48], 0FFFFFFFFh
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    or dword ptr [ecx + 68], 0FFFFFFFFh
    inc eax
    cmp eax, dword ptr [esi + 8]
    jb L4
L5:
    or dword ptr [ebp - 12], 0FFFFFFFFh
    cmp dword ptr [esi + 12], ebx
    mov dword ptr [ebp - 8], ebx
    mov dword ptr [ebp - 20], ebx
    jbe L17
L6:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [ebp - 20]
    mov edi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [edi]
    test eax, 0FFF00000h
    je L16
    mov ecx, eax
    mov eax, dword ptr [edi + 4]
    and ecx, 0000FFFFFh
    xor edx, edx
    div ecx
    mov dword ptr [ebp - 40], ecx
    mov dword ptr [ebp - 32], ebx
    cmp eax, ebx
    mov dword ptr [ebp - 56], eax
    jbe L16
    mov dword ptr [ebp - 16], ebx
L7:
    cmp ecx, ebx
    mov dword ptr [ebp - 4], ebx
    jbe L15
    mov ebx, dword ptr [edi + 8]
    add ebx, dword ptr [ebp - 16]
    mov dword ptr [ebp - 28], ecx
L8:
    mov eax, dword ptr [ebx]
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [ecx + 4]
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx + edx*4]
    test byte ptr [ecx + 4], 2
    je L9
    push eax
    mov ecx, esi
    call sub_1008704E
    test eax, eax
    jne L9
    inc dword ptr [ebp - 4]
L9:
    add ebx, 4
    dec dword ptr [ebp - 28]
    jne L8
    cmp dword ptr [ebp - 4], 0
    je L15
    or ebx, 0FFFFFFFFh
    cmp dword ptr [ebp - 12], ebx
    jne L10
    push 4
    push ebx
    push 000080251h
    push 01010E914h
    mov ecx, esi
    call sub_10086256
    cmp eax, ebx
    mov dword ptr [ebp - 12], eax
    je L30
L10:
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [esi + 0000000E0h]
    push eax
    push eax
    and eax, 0000FFFFFh
    or eax, 010000000h
    push eax
    call sub_10086335
    cmp eax, ebx
    je L30
    mov ecx, dword ptr [esi + 0000000E0h]
    mov ecx, dword ptr [ecx + 24]
    mov eax, dword ptr [ecx + eax*4]
    push edi
    mov ecx, eax
    mov dword ptr [ebp - 28], eax
    call sub_1008556B
    and dword ptr [ebp - 4], 0
    and dword ptr [ebp - 24], 0
    mov ebx, dword ptr [ebp - 16]
L11:
    mov eax, dword ptr [edi + 8]
    mov edx, dword ptr [esi + 20]
    add eax, ebx
    mov dword ptr [ebp - 48], eax
    mov eax, dword ptr [eax]
    mov ecx, eax
    shl ecx, 2
    mov dword ptr [ebp - 36], ecx
    mov ecx, dword ptr [ecx + edx]
    mov edx, dword ptr [esi + 16]
    mov dword ptr [ebp - 44], ecx
    mov ecx, dword ptr [ecx + 4]
    mov ecx, dword ptr [edx + ecx*4]
    test byte ptr [ecx + 4], 2
    mov dword ptr [ebp - 52], eax
    je L14
    push eax
    mov ecx, esi
    call sub_1008710C
    test eax, eax
    jne L14
    mov ecx, dword ptr [ebp - 44]
    mov eax, dword ptr [ecx + 72]
    cmp eax, -1
    je L12
    mov edx, dword ptr [esi + 24]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 010100000h
    je L14
L12:
    mov eax, dword ptr [ecx + 48]
    cmp eax, -1
    je L13
    mov ecx, dword ptr [ebp - 48]
    mov dword ptr [ecx], eax
    jmp L14
L13:
    mov ecx, dword ptr [esi + 0000000E0h]
    fldz
    push ecx
    push ecx
    fstp qword ptr [esp]
    push dword ptr [ebp - 4]
    push dword ptr [ebp - 8]
    push dword ptr [ecx + 000000084h]
    call sub_10086393
    cmp eax, -1
    mov dword ptr [ebp - 48], eax
    je L30
    mov ecx, dword ptr [ebp - 4]
    fldz
    mov edx, dword ptr [ebp - 28]
    mov edx, dword ptr [edx + 16]
    shl ecx, 2
    push ecx
    push ecx
    fstp qword ptr [esp]
    push dword ptr [ebp - 4]
    mov dword ptr [ecx + edx], eax
    mov eax, dword ptr [ebp - 28]
    push dword ptr [ebp - 8]
    mov eax, dword ptr [eax + 8]
    mov edx, dword ptr [ebp - 52]
    push dword ptr [ebp - 12]
    mov dword ptr [ecx + eax], edx
    mov ecx, esi
    call sub_100863D1
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [ebx + ecx], eax
    mov eax, dword ptr [edi + 8]
    cmp dword ptr [ebx + eax], -1
    je L30
    mov ecx, dword ptr [edi + 8]
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [ebx + ecx]
    mov edx, dword ptr [ebp - 36]
    mov ecx, dword ptr [eax + ecx*4]
    push dword ptr [edx + eax]
    mov dword ptr [ebp - 52], ecx
    call sub_10085FE6
    mov eax, dword ptr [ebp - 52]
    and dword ptr [eax + 96], 0
    and dword ptr [eax + 100], 0
    mov ecx, dword ptr [ebp - 48]
    mov edx, dword ptr [ebp - 36]
    inc dword ptr [ebp - 4]
    mov dword ptr [eax + 68], ecx
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + edx]
    mov eax, dword ptr [ebx + eax]
    mov dword ptr [ecx + 48], eax
L14:
    inc dword ptr [ebp - 24]
    mov eax, dword ptr [ebp - 24]
    add ebx, 4
    cmp eax, dword ptr [ebp - 40]
    jb L11
    mov ecx, dword ptr [ebp - 4]
    mov eax, ecx
    and eax, 0000FFFFFh
    or eax, 010000000h
    mov edx, ecx
    neg edx
    sbb edx, edx
    and edx, eax
    mov eax, dword ptr [ebp - 28]
    inc dword ptr [ebp - 8]
    mov dword ptr [eax], edx
    mov dword ptr [eax + 12], ecx
    mov dword ptr [eax + 4], ecx
L15:
    mov ecx, dword ptr [ebp - 40]
    inc dword ptr [ebp - 32]
    mov eax, ecx
    shl eax, 2
    add dword ptr [ebp - 16], eax
    mov eax, dword ptr [ebp - 32]
    xor ebx, ebx
    cmp eax, dword ptr [ebp - 56]
    jb L7
L16:
    inc dword ptr [ebp - 20]
    mov eax, dword ptr [ebp - 20]
    cmp eax, dword ptr [esi + 12]
    jb L6
L17:
    cmp dword ptr [esi + 8], ebx
    mov dword ptr [ebp - 20], ebx
    jbe L22
L18:
    mov ecx, dword ptr [ebp - 20]
    mov eax, dword ptr [esi + 20]
    mov edi, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [edi + 8]
    cmp ecx, -1
    mov dword ptr [ebp - 36], edi
    je L21
    mov ebx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [ebx + 4]
    mov edx, dword ptr [esi + 16]
    mov eax, dword ptr [edx + eax*4]
    test byte ptr [eax + 4], 2
    mov dword ptr [ebp - 40], ebx
    je L21
    push ecx
    mov ecx, esi
    call sub_1008729F
    test eax, eax
    jne L21
    cmp dword ptr [ebx + 48], -1
    jne L20
    cmp dword ptr [ebp - 12], -1
    jne L19
    push 4
    push -1
    push 000080251h
    push 01010E914h
    mov ecx, esi
    call sub_1008649F
    cmp eax, -1
    mov dword ptr [ebp - 12], eax
    je L30
L19:
    mov ecx, dword ptr [esi + 0000000E0h]
    push 1
    push 1
    push 010000001h
    call sub_10086578
    cmp eax, -1
    je L30
    mov ecx, dword ptr [esi + 0000000E0h]
    mov ecx, dword ptr [ecx + 24]
    mov edi, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [esi + 24]
    mov eax, dword ptr [ebx + 72]
    push dword ptr [ecx + eax*4]
    mov ecx, edi
    call sub_100857B4
    fldz
    mov ecx, dword ptr [ebp - 36]
    mov ecx, dword ptr [ecx + 8]
    mov eax, dword ptr [edi + 8]
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esi + 0000000E0h]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 0
    push dword ptr [ebp - 8]
    push dword ptr [ecx + 000000084h]
    call sub_10086565
    mov ecx, dword ptr [edi + 16]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [edi + 16]
    cmp dword ptr [eax], -1
    je L30
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push 0
    push dword ptr [ebp - 8]
    mov ecx, esi
    push dword ptr [ebp - 12]
    call sub_1008658C
    cmp eax, -1
    mov dword ptr [ebx + 48], eax
    je L30
    mov ecx, dword ptr [esi + 20]
    mov ebx, dword ptr [ecx + eax*4]
    push dword ptr [ebp - 40]
    mov ecx, ebx
    call sub_10086190
    mov eax, dword ptr [edi + 16]
    mov eax, dword ptr [eax]
    and dword ptr [ebx + 96], 0
    and dword ptr [ebx + 100], 0
    inc dword ptr [ebp - 8]
    mov edi, dword ptr [ebp - 36]
    mov dword ptr [ebx + 68], eax
    mov ebx, dword ptr [ebp - 40]
L20:
    mov eax, dword ptr [ebx + 48]
    mov dword ptr [edi + 8], eax
L21:
    inc dword ptr [ebp - 20]
    mov eax, dword ptr [ebp - 20]
    cmp eax, dword ptr [esi + 8]
    jb L18
    xor ebx, ebx
L22:
    mov ecx, dword ptr [esi + 0000000E0h]
    call sub_1008C36E
    cmp eax, ebx
    je L23
    jl L28
L23:
    mov ecx, dword ptr [esi + 0000000E0h]
    call sub_10087369
    cmp eax, ebx
    je L24
    jl L28
L24:
    mov ecx, dword ptr [esi + 0000000E0h]
    call sub_1008AE45
    mov ecx, esi
    call sub_1008C397
    cmp eax, ebx
    je L25
    jl L28
L25:
    mov ecx, esi
    call sub_1008738E
    cmp eax, ebx
    je L26
    jl L28
L26:
    mov ecx, esi
    call sub_1008DA12
    cmp eax, ebx
    je L27
    jl L28
L27:
    xor eax, eax
L28:
    pop ebx
L29:
    pop edi
    pop esi
    leave
    ret
L30:
    mov eax, 08007000Eh
    jmp L28
FUN_1009370b ENDP
END
