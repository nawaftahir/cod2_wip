.686
.MODEL FLAT, C
EXTRN sub_10087006:PROC
EXTRN sub_1008707D:PROC
EXTRN sub_100870CC:PROC
EXTRN sub_1008A98B:PROC
EXTRN sub_1008D8AE:PROC
EXTRN sub_1008D8B4:PROC
EXTRN sub_1008D8BA:PROC
EXTRN sub_1008D8BE:PROC
EXTRN sub_1008D8C4:PROC
EXTRN sub_1008D8C6:PROC
EXTRN sub_1008D8D0:PROC
EXTRN sub_1008D8D6:PROC
EXTRN sub_1008D8DC:PROC
EXTRN sub_1008D8ED:PROC
EXTRN sub_1008D8F4:PROC
EXTRN sub_1008D907:PROC
EXTRN sub_1008D90D:PROC
EXTRN sub_1008D90E:PROC
EXTRN sub_1008D916:PROC
EXTRN sub_1008D93B:PROC
EXTRN sub_1008D995:PROC
EXTRN sub_1008D9A5:PROC
EXTRN sub_1008D9B4:PROC
EXTRN sub_1008D9E7:PROC
EXTRN sub_1008D9F2:PROC
EXTRN sub_1008D9FC:PROC
EXTRN sub_1008DA1C:PROC
EXTRN sub_1008DA23:PROC
EXTRN sub_1008DA3A:PROC
EXTRN sub_1008DA41:PROC
EXTRN sub_1008DA58:PROC
EXTRN sub_1008DA5F:PROC
EXTRN sub_1008DABE:PROC
EXTRN sub_1008DACD:PROC
.CODE
FUN_1008d61e PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    push push ebx
    push push esi
    push push edi
    mov mov edi, ecx
    call sub_1008A98B
    xor xor ebx, ebx
    cmp cmp dword ptr [edi + 8], ebx
    jbe L0
    mov mov eax, dword ptr [edi + 20]
    mov mov eax, dword ptr [eax + ebx*4]
    mov mov edx, dword ptr [edi + 16]
    mov mov ecx, dword ptr [eax + 4]
    mov mov esi, dword ptr [edx + ecx*4]
    and and dword ptr [eax], -33
    mov mov edx, dword ptr [esi + 4]
    test test dl, 16
    mov mov ecx, dword ptr [eax]
    je L1
    test test dh, 2
    jne L2
    or or ecx, 32
    mov mov dword ptr [eax], ecx
    test test byte ptr [esi + 5], 8
    je L3
    or or dword ptr [eax], 32
    inc inc ebx
    cmp cmp ebx, dword ptr [edi + 8]
    jb L0
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [edi + 12], 0
    jbe sub_1008D8B4
    mov mov eax, dword ptr [edi + 24]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov esi, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [esi]
L0:
    mov mov ecx, eax
    and and ecx, 0FFF00000h
    je sub_1008D8BE
    cmp cmp ecx, 050100000h
    je sub_1008D8AE
    cmp cmp ecx, 011000000h
    je sub_1008D8BA
L3:
    cmp cmp ecx, 011200000h
    je sub_1008D8C6
    and and eax, 0F0000000h
    cmp cmp eax, 060000000h
    je sub_1008D8D6
    cmp cmp ecx, 010F00000h
    je sub_1008D8C4
    cmp cmp ecx, 011100000h
    je sub_1008D8D0
    cmp cmp ecx, 011400000h
    je sub_1008D8DC
    xor xor ebx, ebx
    cmp cmp dword ptr [esi + 12], ebx
    jbe L4
    mov mov eax, dword ptr [esi + 16]
    mov mov ecx, dword ptr [edi + 20]
    mov mov eax, dword ptr [eax + ebx*4]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax + 4]
    mov mov edx, dword ptr [edi + 16]
    mov mov ecx, dword ptr [edx + ecx*4]
    test test byte ptr [ecx + 5], 16
    je L5
    push push dword ptr [eax + 20]
    mov mov ecx, edi
    call sub_10087006
    test test eax, eax
    je L6
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + ebx*4]
    mov mov ecx, dword ptr [edi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    or or dword ptr [eax], 32
    inc inc ebx
    cmp cmp ebx, dword ptr [esi + 12]
    jb L4
    mov mov ecx, dword ptr [esi]
    mov mov eax, ecx
    and and eax, 0F0000000h
    cmp cmp eax, 010000000h
    jb sub_1008D8ED
    cmp cmp eax, 040000000h
    ja sub_1008D8F4
    mov mov eax, dword ptr [esi + 4]
    and and ecx, 0FFFFFh
    xor xor edx, edx
    div div ecx
    and and dword ptr [ebp - 4], 0
    mov mov dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [esi + 12]
    test test eax, eax
    jbe sub_1008D995
    and and dword ptr [ebp - 12], 0
    cmp cmp dword ptr [ebp - 16], 0
    jbe sub_1008D90D
    mov mov ebx, dword ptr [esi + 8]
    shl shl eax, 2
    mov mov dword ptr [ebp - 20], eax
    mov mov eax, dword ptr [ebp - 4]
    shl shl eax, 2
    add add ebx, eax
    push push dword ptr [ebx]
    mov mov ecx, edi
    call sub_1008707D
    test test eax, eax
    jne sub_1008D916
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 12]
    add add ebx, dword ptr [ebp - 20]
    cmp cmp eax, dword ptr [ebp - 16]
    jb sub_1008D907
    jmp sub_1008D93B
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [ebp - 4]
    shl shl eax, 2
    mov mov eax, dword ptr [eax + ecx]
    mov mov ecx, dword ptr [edi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    or or dword ptr [eax], 32
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi + 12]
    cmp cmp dword ptr [ebp - 4], eax
    jb sub_1008D90E
    jmp sub_1008D9F2
    and and dword ptr [ebp - 12], 0
    cmp cmp dword ptr [esi + 4], 0
    jbe sub_1008D9FC
    mov mov ebx, dword ptr [esi + 8]
    push push dword ptr [ebx]
    mov mov ecx, edi
    call sub_100870CC
    test test eax, eax
    jne sub_1008D9B4
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 12]
    add add ebx, 4
    cmp cmp eax, dword ptr [esi + 4]
    jb sub_1008D9A5
    jmp sub_1008DA1C
    xor xor ecx, ecx
    cmp cmp dword ptr [esi + 12], ecx
    jbe sub_1008DA23
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [edi + 20]
    mov mov eax, dword ptr [edx + eax*4]
L4:
    or or dword ptr [eax], 32
    inc inc ecx
    cmp cmp ecx, dword ptr [esi + 12]
    jb sub_1008D9E7
    jmp sub_1008DA3A
    xor xor ecx, ecx
    cmp cmp dword ptr [esi + 12], ecx
    jbe sub_1008DA41
    mov mov eax, dword ptr [esi + 16]
L5:
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [edi + 20]
    mov mov eax, dword ptr [edx + eax*4]
    or or dword ptr [eax], 32
    inc inc ecx
    cmp cmp ecx, dword ptr [esi + 12]
    jb sub_1008DA23
    jmp sub_1008DA58
    xor xor ecx, ecx
    cmp cmp dword ptr [esi + 12], ecx
    jbe sub_1008DA5F
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [edi + 20]
    mov mov eax, dword ptr [edx + eax*4]
    or or dword ptr [eax], 32
    inc inc ecx
    cmp cmp ecx, dword ptr [esi + 12]
    jb sub_1008DA5F
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [edi + 12]
    jb sub_1008D8B4
    xor xor ecx, ecx
    cmp cmp dword ptr [edi + 8], ecx
    jbe sub_1008DABE
    mov mov eax, dword ptr [edi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [eax + 4]
    mov mov esi, dword ptr [edi + 16]
    mov mov edx, dword ptr [esi + edx*4]
    test test byte ptr [edx + 4], 32
    je sub_1008DACD
    or or dword ptr [eax], 32
    inc inc ecx
    cmp cmp ecx, dword ptr [edi + 8]
    jb sub_1008DABE
    pop pop edi
    pop pop esi
    xor xor eax, eax
    pop pop ebx
    leave leave
    ret ret
FUN_1008d61e ENDP
END
