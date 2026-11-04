.686
.MODEL FLAT, C
EXTRN sub_10086ED4:PROC
EXTRN sub_10089414:PROC
EXTRN sub_1008944F:PROC
EXTRN sub_100894F8:PROC
EXTRN sub_1008A6CF:PROC
EXTRN sub_1008A891:PROC
EXTRN sub_100929D1:PROC
EXTRN sub_10092A04:PROC
EXTRN sub_100930AC:PROC
EXTRN sub_100930E3:PROC
EXTRN sub_10093192:PROC
EXTRN sub_100F7909:PROC
EXTRN sub_100F7A92:PROC
.CODE
FUN_10098a05 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 120
    push ebx
    push esi
    mov ebx, ecx
    xor esi, esi
    test byte ptr [ebx + 111], 12
    mov dword ptr [ebp - 4], esi
    jne L0
    xor eax, eax
    inc eax
    jmp L20
L0:
    mov ecx, ebx
    call sub_10086ED4
    cmp eax, esi
    jl L20
    mov eax, dword ptr [ebx + 44]
    dec eax
    push eax
    push dword ptr [ebx + 000000088h]
    lea eax, [ebp - 120]
    push eax
    mov ecx, ebx
    call sub_100929D1
    test eax, eax
    jl L1
    push esi
    lea eax, [ebp - 120]
    push eax
    mov ecx, ebx
    call sub_100930AC
    test eax, eax
    jge L2
L1:
    lea eax, [ebp - 120]
    push eax
    mov ecx, ebx
    call sub_1008A6CF
    push dword ptr [ebx + 44]
    lea eax, [ebp - 120]
    push dword ptr [ebx + 000000088h]
    mov ecx, ebx
    push eax
    call sub_10092A04
    test eax, eax
    jl L19
    push esi
    lea eax, [ebp - 120]
    push eax
    mov ecx, ebx
    call sub_100930E3
    test eax, eax
    jl L19
L2:
    mov eax, dword ptr [ebx + 12]
    shl eax, 2
    push eax
    call sub_100F7909
    cmp eax, esi
    pop ecx
    mov dword ptr [ebp - 4], eax
    je L19
    mov ecx, dword ptr [ebx + 12]
    mov esi, dword ptr [ebx + 24]
    shl ecx, 2
    push edi
    mov edi, eax
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, ebx
    call sub_10089414
    mov dword ptr [ebp - 12], eax
    xor eax, eax
    cmp dword ptr [ebx + 12], eax
    mov dword ptr [ebp - 16], eax
    jbe L10
L3:
    mov ecx, dword ptr [ebx + 24]
    mov ecx, dword ptr [ecx + eax*4]
    test byte ptr [ecx + 44], 1
    je L9
    test eax, eax
    mov dword ptr [ebp - 8], eax
    jbe L8
L4:
    push dword ptr [ebp - 8]
    mov ecx, ebx
    call sub_100894F8
    test eax, eax
    je L7
    call sub_1008944F
    cmp eax, dword ptr [ebp - 12]
    mov dword ptr [ebp - 20], eax
    ja L6
    jne L5
    test byte ptr [ebx + 111], 8
    jne L6
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [ebx + 24]
    lea eax, [eax + ecx*4]
    mov ecx, dword ptr [eax - 4]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [eax + 44]
    cmp eax, dword ptr [ecx + 44]
    jne L6
L5:
    push 0
    lea eax, [ebp - 120]
    push eax
    mov ecx, ebx
    call sub_10093192
    test eax, eax
    jl L6
    mov ecx, dword ptr [ebp - 16]
    mov esi, dword ptr [ebx + 24]
    mov edi, dword ptr [ebp - 4]
    lea ecx, [ecx*4 + 4]
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    mov eax, dword ptr [ebp - 20]
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov dword ptr [ebp - 12], eax
L6:
    dec dword ptr [ebp - 8]
    jne L4
L7:
    mov eax, dword ptr [ebp - 16]
L8:
    mov edi, dword ptr [ebx + 24]
    mov esi, dword ptr [ebp - 4]
    lea ecx, [eax*4 + 4]
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
L9:
    inc eax
    cmp eax, dword ptr [ebx + 12]
    mov dword ptr [ebp - 16], eax
    jb L3
L10:
    mov edx, dword ptr [ebx + 12]
    xor eax, eax
    test edx, edx
    mov dword ptr [ebp - 16], eax
    jbe L18
L11:
    mov esi, dword ptr [ebx + 24]
    mov ecx, eax
    shl ecx, 2
    mov esi, dword ptr [esi + ecx]
    test byte ptr [esi + 44], 1
    je L17
    lea esi, [eax + 1]
    cmp esi, edx
    jae L14
    mov eax, dword ptr [ebx + 24]
    mov edx, dword ptr [eax + ecx]
    mov edx, dword ptr [edx + 44]
    lea eax, [eax + esi*4]
L12:
    mov edi, dword ptr [eax]
    cmp edx, dword ptr [edi + 44]
    jne L13
    inc esi
    add eax, 4
    cmp esi, dword ptr [ebx + 12]
    jb L12
L13:
    mov eax, dword ptr [ebp - 16]
L14:
    mov edx, esi
    sub edx, eax
    shr edx, 1
    je L16
    mov eax, esi
    mov dword ptr [ebp - 16], ecx
    shl eax, 2
    mov dword ptr [ebp - 12], edx
L15:
    mov ecx, dword ptr [ebx + 24]
    mov edx, dword ptr [ebp - 16]
    add dword ptr [ebp - 16], 4
    add edx, ecx
    mov ecx, dword ptr [eax + ecx - 4]
    mov edi, dword ptr [edx]
    mov dword ptr [edx], ecx
    mov ecx, dword ptr [ebx + 24]
    mov dword ptr [eax + ecx - 4], edi
    sub eax, 4
    dec dword ptr [ebp - 12]
    jne L15
L16:
    lea eax, [esi - 1]
L17:
    mov edx, dword ptr [ebx + 12]
    inc eax
    cmp eax, edx
    mov dword ptr [ebp - 16], eax
    jb L11
L18:
    pop edi
L19:
    lea eax, [ebp - 120]
    push eax
    mov ecx, ebx
    call sub_1008A891
    push dword ptr [ebp - 4]
    call sub_100F7A92
    pop ecx
    xor eax, eax
L20:
    pop esi
    pop ebx
    leave
    ret
FUN_10098a05 ENDP
END
