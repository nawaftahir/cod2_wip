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
EXTRN sub_10098C43:PROC
EXTRN sub_10098C54:PROC
EXTRN sub_10098C60:PROC
EXTRN sub_10098C63:PROC
EXTRN sub_10098C6E:PROC
EXTRN sub_10098C74:PROC
EXTRN sub_10098C76:PROC
EXTRN sub_10098C77:PROC
EXTRN sub_10098C7E:PROC
EXTRN sub_10098C94:PROC
EXTRN sub_10098C9E:PROC
EXTRN sub_10098CA5:PROC
EXTRN sub_10098CB2:PROC
EXTRN sub_10098CCA:PROC
EXTRN sub_10098D90:PROC
EXTRN sub_10098D99:PROC
EXTRN sub_10098DA0:PROC
EXTRN sub_10098DBC:PROC
EXTRN sub_10098DC2:PROC
EXTRN sub_10098DED:PROC
EXTRN sub_10098DF8:PROC
EXTRN sub_100F7909:PROC
EXTRN sub_100F7A92:PROC
.CODE
FUN_10098a05 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 120
    push push ebx
    push push esi
    mov mov ebx, ecx
    xor xor esi, esi
    test test byte ptr [ebx + 111], 12
    mov mov dword ptr [ebp - 4], esi
    jne L0
    xor xor eax, eax
    inc inc eax
    jmp sub_10098C54
    mov mov ecx, ebx
    call sub_10086ED4
    cmp cmp eax, esi
    jl sub_10098C63
    mov mov eax, dword ptr [ebx + 44]
    dec dec eax
    push push eax
    push push dword ptr [ebx + 088h]
    lea lea eax, [ebp - 120]
    push push eax
    mov mov ecx, ebx
    call sub_100929D1
    test test eax, eax
    jl L1
    push push esi
    lea lea eax, [ebp - 120]
    push push eax
    mov mov ecx, ebx
    call sub_100930AC
    test test eax, eax
    jge L2
    lea lea eax, [ebp - 120]
    push push eax
    mov mov ecx, ebx
    call sub_1008A6CF
    push push dword ptr [ebx + 44]
    lea lea eax, [ebp - 120]
    push push dword ptr [ebx + 088h]
    mov mov ecx, ebx
    push push eax
    call sub_10092A04
    test test eax, eax
    jl sub_10098C9E
    push push esi
    lea lea eax, [ebp - 120]
    push push eax
    mov mov ecx, ebx
    call sub_100930E3
    test test eax, eax
    jl sub_10098CB2
    mov mov eax, dword ptr [ebx + 12]
    shl shl eax, 2
    push push eax
    call sub_100F7909
    cmp cmp eax, esi
    pop pop ecx
    mov mov dword ptr [ebp - 4], eax
    je sub_10098CCA
    mov mov ecx, dword ptr [ebx + 12]
    mov mov esi, dword ptr [ebx + 24]
    shl shl ecx, 2
    push push edi
    mov mov edi, eax
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, ebx
    call sub_10089414
    mov mov dword ptr [ebp - 12], eax
    xor xor eax, eax
    cmp cmp dword ptr [ebx + 12], eax
    mov mov dword ptr [ebp - 16], eax
    jbe sub_10098C74
    mov mov ecx, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [ecx + eax*4]
    test test byte ptr [ecx + 44], 1
    je sub_10098C77
    test test eax, eax
    mov mov dword ptr [ebp - 8], eax
    jbe sub_10098C63
    push push dword ptr [ebp - 8]
    mov mov ecx, ebx
    call sub_100894F8
    test test eax, eax
    je sub_10098C6E
    call sub_1008944F
    cmp cmp eax, dword ptr [ebp - 12]
    mov mov dword ptr [ebp - 20], eax
    ja sub_10098C76
    jne sub_10098C43
    test test byte ptr [ebx + 111], 8
    jne sub_10098C7E
    mov mov ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebx + 24]
    lea lea eax, [eax + ecx*4]
    mov mov ecx, dword ptr [eax - 4]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [eax + 44]
    cmp cmp eax, dword ptr [ecx + 44]
    jne sub_10098C94
    push push 0
    lea lea eax, [ebp - 120]
    push push eax
    mov mov ecx, ebx
    call sub_10093192
    test test eax, eax
    jl sub_10098CA5
    mov mov ecx, dword ptr [ebp - 16]
    mov mov esi, dword ptr [ebx + 24]
    mov mov edi, dword ptr [ebp - 4]
    lea lea ecx, [ecx*4 + 4]
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    mov mov eax, dword ptr [ebp - 20]
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov dword ptr [ebp - 12], eax
    dec dec dword ptr [ebp - 8]
    jne sub_10098C60
    mov mov eax, dword ptr [ebp - 16]
    mov mov edi, dword ptr [ebx + 24]
    mov mov esi, dword ptr [ebp - 4]
    lea lea ecx, [eax*4 + 4]
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    inc inc eax
    cmp cmp eax, dword ptr [ebx + 12]
    mov mov dword ptr [ebp - 16], eax
    jb sub_10098C74
    mov mov edx, dword ptr [ebx + 12]
    xor xor eax, eax
    test test edx, edx
    mov mov dword ptr [ebp - 16], eax
    jbe sub_10098DBC
    mov mov esi, dword ptr [ebx + 24]
    mov mov ecx, eax
    shl shl ecx, 2
    mov mov esi, dword ptr [esi + ecx]
    test test byte ptr [esi + 44], 1
    je sub_10098DC2
    lea lea esi, [eax + 1]
    cmp cmp esi, edx
    jae sub_10098D90
    mov mov eax, dword ptr [ebx + 24]
    mov mov edx, dword ptr [eax + ecx]
    mov mov edx, dword ptr [edx + 44]
    lea lea eax, [eax + esi*4]
    mov mov edi, dword ptr [eax]
    cmp cmp edx, dword ptr [edi + 44]
    jne sub_10098DA0
    inc inc esi
    add add eax, 4
    cmp cmp esi, dword ptr [ebx + 12]
    jb sub_10098D99
    mov mov eax, dword ptr [ebp - 16]
    mov mov edx, esi
    sub sub edx, eax
    shr shr edx, 1
    je sub_10098DED
    mov mov eax, esi
    mov mov dword ptr [ebp - 16], ecx
    shl shl eax, 2
    mov mov dword ptr [ebp - 12], edx
    mov mov ecx, dword ptr [ebx + 24]
    mov mov edx, dword ptr [ebp - 16]
    add add dword ptr [ebp - 16], 4
    add add edx, ecx
    mov mov ecx, dword ptr [eax + ecx - 4]
    mov mov edi, dword ptr [edx]
    mov mov dword ptr [edx], ecx
    mov mov ecx, dword ptr [ebx + 24]
    mov mov dword ptr [eax + ecx - 4], edi
    sub sub eax, 4
    dec dec dword ptr [ebp - 12]
    jne sub_10098DF8
    lea lea eax, [esi - 1]
    mov mov edx, dword ptr [ebx + 12]
    inc inc eax
    cmp cmp eax, edx
    mov mov dword ptr [ebp - 16], eax
    jb sub_10098DBC
    pop pop edi
    lea lea eax, [ebp - 120]
    push push eax
    mov mov ecx, ebx
    call sub_1008A891
    push push dword ptr [ebp - 4]
    call sub_100F7A92
    pop pop ecx
    xor xor eax, eax
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_10098a05 ENDP
END
