.686
.MODEL FLAT, C
EXTRN sub_10085519:PROC
EXTRN sub_1008B36E:PROC
EXTRN sub_1008B379:PROC
EXTRN sub_1008B3B1:PROC
EXTRN sub_1008B3BC:PROC
EXTRN sub_1008B3C4:PROC
EXTRN sub_1008B3C5:PROC
EXTRN sub_1008B3D0:PROC
EXTRN sub_1008B3D3:PROC
EXTRN sub_1008B3D9:PROC
EXTRN sub_1008B3E1:PROC
EXTRN sub_1008B3E4:PROC
EXTRN sub_1008B3EC:PROC
EXTRN sub_1008B40B:PROC
EXTRN sub_1008B411:PROC
EXTRN sub_1008B467:PROC
EXTRN sub_1008B47D:PROC
EXTRN sub_1008B484:PROC
EXTRN sub_1008B48B:PROC
EXTRN sub_1008B498:PROC
EXTRN sub_1008B49F:PROC
EXTRN sub_1008B4A4:PROC
EXTRN sub_1008B4B7:PROC
EXTRN sub_1008B4CE:PROC
EXTRN sub_1008B4D5:PROC
.CODE
FUN_1008b1b3 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    push push ebx
    mov mov ebx, dword ptr [ebp + 12]
    mov mov eax, dword ptr [ebx + 24]
    push push esi
    mov mov esi, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ebp + 8]
    push push edi
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [esi]
    mov mov ecx, dword ptr [edi]
    cmp cmp eax, ecx
    jb sub_1008B36E
    ja sub_1008B379
    mov mov eax, dword ptr [esi + 12]
    and and dword ptr [ebp - 4], 0
    test test eax, eax
    jbe L1
    mov mov ecx, dword ptr [edi + 16]
    mov mov eax, dword ptr [esi + 16]
    sub sub eax, ecx
    mov mov dword ptr [ebp + 8], ecx
    mov mov dword ptr [ebp - 8], eax
    jmp L0
    mov mov eax, dword ptr [ebp - 8]
    mov mov edx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax + edx]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov edx, dword ptr [edx]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [eax + 4]
    mov mov ebx, dword ptr [ecx + 4]
    cmp cmp edx, ebx
    jb sub_1008B3B1
    ja sub_1008B3BC
    mov mov edx, dword ptr [eax + 20]
    mov mov ebx, dword ptr [ecx + 20]
    cmp cmp edx, ebx
    jb sub_1008B3C5
    ja sub_1008B3D0
    mov mov eax, dword ptr [eax + 24]
    mov mov ecx, dword ptr [ecx + 24]
    cmp cmp eax, ecx
    jl sub_1008B3D9
L0:
    jg sub_1008B3E4
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    add add dword ptr [ebp + 8], 4
    cmp cmp eax, dword ptr [esi + 12]
    mov mov ebx, dword ptr [ebp + 12]
    jb L2
    mov mov ecx, esi
    call sub_10085519
    test test eax, eax
    je sub_1008B3C4
    mov mov ecx, dword ptr [esi]
    and and ecx, 0FFFFFh
    mov mov dword ptr [ebp - 20], ecx
    mov mov dword ptr [ebp - 8], 0
    jbe sub_1008B3D3
    mov mov edi, dword ptr [edi + 8]
    mov mov esi, dword ptr [esi + 8]
    mov mov eax, dword ptr [ebx + 20]
    mov mov dword ptr [ebp - 4], edi
    lea lea ecx, [edi + ecx*4]
    sub sub esi, edi
    mov mov edx, dword ptr [ebp - 4]
    mov mov edi, dword ptr [esi + edx]
    mov mov edx, dword ptr [edx]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov edi, dword ptr [eax + edi*4]
    mov mov ebx, dword ptr [edi + 48]
    mov mov edx, dword ptr [edx + 48]
    mov mov edi, dword ptr [esi + ecx]
    mov mov edi, dword ptr [eax + edi*4]
    mov mov edi, dword ptr [edi + 48]
    cmp cmp ebx, edi
    mov mov dword ptr [ebp - 12], edx
    mov mov edx, dword ptr [ecx]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [edx + 48]
    mov mov dword ptr [ebp - 16], edx
    mov mov dword ptr [ebp + 12], ebx
    jb sub_1008B3E1
    mov mov dword ptr [ebp + 12], edi
    mov mov dword ptr [ebp + 8], ebx
    ja sub_1008B3EC
    mov mov dword ptr [ebp + 8], edi
    mov mov edi, dword ptr [ebp - 12]
    mov mov ebx, dword ptr [ebp - 16]
    cmp cmp edi, ebx
    mov mov edx, edi
    jb sub_1008B40B
    mov mov edx, ebx
    ja sub_1008B411
    mov mov edi, ebx
    cmp cmp dword ptr [ebp + 12], edx
    jb sub_1008B47D
    ja sub_1008B484
    cmp cmp dword ptr [ebp + 8], edi
    jb sub_1008B484
    ja sub_1008B48B
    inc inc dword ptr [ebp - 8]
    mov mov edx, dword ptr [ebp - 8]
    add add dword ptr [ebp - 4], 4
    add add ecx, 4
    cmp cmp edx, dword ptr [ebp - 20]
    jb sub_1008B3E4
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
    mov mov edx, dword ptr [esi + 4]
    and and dword ptr [ebp + 12], 0
    test test edx, edx
    jbe sub_1008B467
    mov mov edi, dword ptr [edi + 8]
    mov mov esi, dword ptr [esi + 8]
    mov mov ebx, dword ptr [ebx + 20]
    mov mov eax, edi
    sub sub esi, edi
    mov mov ecx, dword ptr [esi + eax]
    mov mov edi, dword ptr [eax]
    mov mov ecx, dword ptr [ebx + ecx*4]
    mov mov edi, dword ptr [ebx + edi*4]
    mov mov ecx, dword ptr [ecx + 48]
    mov mov edi, dword ptr [edi + 48]
    cmp cmp ecx, edi
    jb sub_1008B4CE
    ja sub_1008B4D5
    inc inc dword ptr [ebp + 12]
    add add eax, 4
    cmp cmp dword ptr [ebp + 12], edx
    jb sub_1008B4B7
    jmp sub_1008B498
    or or eax, -1
    jmp sub_1008B49F
    xor xor eax, eax
    inc inc eax
    jmp sub_1008B4A4
FUN_1008b1b3 ENDP
END
