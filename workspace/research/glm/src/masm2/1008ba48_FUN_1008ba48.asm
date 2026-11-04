.686
.MODEL FLAT, C
EXTRN sub_1008546F:PROC
EXTRN sub_10086238:PROC
EXTRN sub_1008623E:PROC
EXTRN sub_1008AAD8:PROC
EXTRN sub_1008BBE3:PROC
EXTRN sub_1008BC1B:PROC
EXTRN sub_1008BC55:PROC
EXTRN sub_1008BC56:PROC
EXTRN sub_1008BC5B:PROC
EXTRN sub_1008BC85:PROC
EXTRN sub_1008BC88:PROC
EXTRN sub_1008BD35:PROC
EXTRN sub_1008BD3A:PROC
EXTRN sub_1008BD40:PROC
EXTRN sub_1008BD46:PROC
EXTRN sub_1008BD68:PROC
.CODE
FUN_1008ba48 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 24
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 8]
    xor xor ebx, ebx
    cmp cmp eax, ebx
    push push edi
    mov mov dword ptr [ebp - 4], ebx
    jbe L0
    mov mov ecx, dword ptr [esi + 20]
    mov mov edx, dword ptr [ecx]
    mov mov edx, dword ptr [edx + 12]
    cmp cmp edx, dword ptr [ebp - 4]
    jbe L2
    cmp cmp edx, -1
    je L3
    mov mov dword ptr [ebp - 4], edx
    add add ecx, 4
    dec dec eax
    jne L1
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [esi + 12], ebx
    mov mov dword ptr [ebp - 12], ebx
    jbe sub_1008BBE3
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ebp - 12]
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [edi + 12]
    cmp cmp eax, ebx
    jbe L4
    mov mov edx, dword ptr [edi + 16]
    mov mov dword ptr [ebp - 16], eax
L3:
    mov mov ebx, dword ptr [edx]
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + ebx*4]
    cmp cmp dword ptr [ecx + 68], -1
    jne L6
    mov mov ecx, dword ptr [ecx + 4]
    mov mov ebx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ebx + ecx*4]
    test test byte ptr [ecx + 4], 32
    je L7
    dec dec eax
    add add edx, 4
    dec dec dword ptr [ebp - 16]
    jne L5
    xor xor ebx, ebx
    cmp cmp eax, dword ptr [edi + 12]
    je sub_1008BC1B
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 16], ebx
    je L8
    push push eax
    push push eax
    and and eax, 0FFFFFh
    or or eax, 010000000h
    push push eax
    mov mov ecx, esi
    call sub_1008623E
    cmp cmp eax, -1
    je sub_1008BC85
    mov mov ecx, dword ptr [esi + 24]
    mov mov eax, dword ptr [ecx + eax*4]
    push push edi
    mov mov ecx, eax
    mov mov dword ptr [ebp - 16], eax
    call sub_1008546F
    cmp cmp dword ptr [edi + 12], ebx
    mov mov dword ptr [ebp - 8], ebx
    jbe sub_1008BC55
    mov mov dword ptr [ebp - 20], ebx
    mov mov eax, dword ptr [edi + 16]
    fldz fldz
    mov mov ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [esi + 20]
L5:
    mov mov ebx, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [esi + 16]
L6:
    mov mov eax, dword ptr [ebx + 4]
    mov mov eax, dword ptr [ecx + eax*4]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push dword ptr [ebx + 16]
    mov mov ecx, esi
    push push dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 24], eax
    push push dword ptr [esi + 088h]
    call sub_10086238
    cmp cmp dword ptr [ebx + 68], -1
    jne sub_1008BC5B
    mov mov ecx, dword ptr [ebp - 24]
    test test byte ptr [ecx + 4], 32
    jne sub_1008BC88
    mov mov ecx, dword ptr [edi + 16]
    mov mov ebx, dword ptr [ebp - 8]
    mov mov ebx, dword ptr [ecx + ebx*4]
    mov mov ecx, dword ptr [ebp - 20]
    mov mov edx, dword ptr [ebp - 16]
    mov mov edx, dword ptr [edx + 16]
    mov mov dword ptr [ecx + edx], ebx
    mov mov edx, dword ptr [ebp - 16]
    mov mov edx, dword ptr [edx + 8]
    mov mov dword ptr [ecx + edx], eax
    add add ecx, 4
    mov mov dword ptr [ebp - 20], ecx
    mov mov ecx, dword ptr [ebp - 8]
    mov mov edx, dword ptr [edi + 16]
    mov mov dword ptr [edx + ecx*4], eax
    inc inc ecx
    cmp cmp ecx, dword ptr [edi + 12]
    mov mov dword ptr [ebp - 8], ecx
    jb sub_1008BC56
    xor xor ebx, ebx
    inc inc dword ptr [ebp - 4]
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp eax, dword ptr [esi + 12]
    jb sub_1008BBE3
    mov mov ecx, esi
    call sub_1008AAD8
    cmp cmp eax, ebx
    jl sub_1008BD35
    xor xor ecx, ecx
    cmp cmp dword ptr [esi + 8], ebx
    jbe sub_1008BD3A
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    cmp cmp dword ptr [eax + 72], -1
    jne sub_1008BD40
    cmp cmp dword ptr [eax + 84], -1
    jne sub_1008BD46
    mov mov edx, dword ptr [esi + 116]
    mov mov dword ptr [eax + 4], edx
    inc inc ecx
    cmp cmp ecx, dword ptr [esi + 8]
    jb sub_1008BD3A
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
    mov mov eax, 08007000Eh
    jmp sub_1008BD68
FUN_1008ba48 ENDP
END
