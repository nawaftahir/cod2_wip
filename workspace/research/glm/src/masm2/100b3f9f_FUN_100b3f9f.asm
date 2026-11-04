.686
.MODEL FLAT, C
EXTRN sub_10085482:PROC
EXTRN sub_100854F9:PROC
EXTRN sub_10085912:PROC
EXTRN sub_10085997:PROC
EXTRN sub_100B41AC:PROC
EXTRN sub_100B41B7:PROC
EXTRN sub_100B41C3:PROC
EXTRN sub_100B41D5:PROC
EXTRN sub_100B4237:PROC
EXTRN sub_100B4260:PROC
EXTRN sub_100B426A:PROC
EXTRN sub_100B426B:PROC
EXTRN sub_100B427C:PROC
EXTRN sub_100B428D:PROC
EXTRN sub_100B42C0:PROC
.CODE
FUN_100b3f9f PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 44
    push push ebx
    push push esi
    mov mov esi, ecx
    xor xor ecx, ecx
    cmp cmp ecx, dword ptr [ebp + 16]
    push push edi
    jae L0
    mov mov eax, dword ptr [esi + 0100h]
    mov mov edx, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax]
    mov mov dword ptr [ebp - 8], edx
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [eax + 4]
    mov mov dword ptr [ebp - 12], eax
    mov mov dword ptr [ebp - 4], ecx
    mov mov edi, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + edi]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov edi, dword ptr [ebp - 12]
    cmp cmp edi, dword ptr [eax + 4]
    jne L2
    mov mov eax, dword ptr [esi + 0100h]
    mov mov edi, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax + 16]
    mov mov ebx, dword ptr [ebp - 4]
    mov mov ebx, dword ptr [ebx + edi]
    mov mov edi, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [edi + eax*4]
    mov mov ebx, dword ptr [edi + ebx*4]
    mov mov eax, dword ptr [eax + 12]
    cmp cmp eax, dword ptr [ebx + 12]
    je L3
    mov mov eax, dword ptr [ebp + 12]
    shl shl eax, 2
    add add dword ptr [ebp - 4], eax
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp + 16]
    jb L1
    cmp cmp ecx, dword ptr [ebp + 16]
    je sub_100B41C3
    imul imul ecx, dword ptr [ebp + 12]
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 8]
    lea lea edx, [eax + ecx*4]
    or or eax, -1
    lea lea edi, [ebp - 28]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    xor xor ecx, ecx
    xor xor ebx, ebx
    cmp cmp dword ptr [ebp + 12], ecx
    mov mov dword ptr [ebp + 16], edx
    stosd stosd dword ptr es:[edi], eax
    jbe L4
    mov mov eax, dword ptr [edx + ecx*4]
    mov mov edi, dword ptr [esi + 20]
    mov mov edi, dword ptr [edi + eax*4]
    mov mov edi, dword ptr [edi + 16]
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp + 12]
    mov mov dword ptr [ebp + edi*4 - 28], eax
    jb L4
    xor xor eax, eax
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp + eax*4 - 28], -1
    setne setne cl
    add add ebx, ecx
    inc inc eax
    cmp cmp eax, 4
    jb L5
    mov mov eax, dword ptr [esi]
    push push 0
    push push 0
    push push 4
    lea lea ecx, [ebp - 44]
    push push ecx
    push push dword ptr [esi + 0FCh]
    mov mov ecx, esi
L3:
    call call dword ptr [eax + 080h]
    test test eax, eax
    jl sub_100B4237
    push push 116
    call sub_10085912
    test test eax, eax
    je sub_100B41AC
    mov mov ecx, eax
    call sub_10085482
    jmp sub_100B41B7
    xor xor eax, eax
    test test eax, eax
    mov mov edi, dword ptr [ebp + 8]
    mov mov dword ptr [edi], eax
    jne sub_100B41D5
    mov mov eax, 08007000Eh
    jmp sub_100B4260
    push push 0
    push push ebx
    push push ebx
    and and ebx, 0FFFFFh
    or or ebx, 010000000h
    push push ebx
    mov mov ecx, eax
    call sub_10085997
    test test eax, eax
    jl sub_100B427C
    push push dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [edi]
    call sub_100854F9
    test test eax, eax
    jl sub_100B428D
    xor xor eax, eax
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp + ecx - 28], -1
    je sub_100B426A
    mov mov edx, dword ptr [edi]
    mov mov edx, dword ptr [edx + 16]
    mov mov ebx, dword ptr [ebp + ecx - 44]
    mov mov dword ptr [eax + edx], ebx
    mov mov edx, dword ptr [edi]
    mov mov ebx, dword ptr [edx + 8]
    mov mov edx, dword ptr [ebp + ecx - 28]
    mov mov dword ptr [eax + ebx], edx
    add add eax, 4
    add add ecx, 4
    cmp cmp ecx, 16
    jb sub_100B426B
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 12], eax
    jbe sub_100B42C0
    mov mov ecx, dword ptr [ebp + 16]
    mov mov edi, dword ptr [esi + 20]
    lea lea ecx, [ecx + eax*4]
    mov mov edx, dword ptr [ecx]
    mov mov edx, dword ptr [edi + edx*4]
    mov mov edx, dword ptr [edx + 16]
    mov mov edx, dword ptr [ebp + edx*4 - 44]
    inc inc eax
L5:
    cmp cmp eax, dword ptr [ebp + 12]
    mov mov dword ptr [ecx], edx
    jb sub_100B42C0
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 12
FUN_100b3f9f ENDP
END
