.686
.MODEL FLAT, C
EXTRN sub_1008B28B:PROC
EXTRN sub_100AA398:PROC
EXTRN sub_100AA3E0:PROC
EXTRN sub_100AA41A:PROC
EXTRN sub_100AA422:PROC
EXTRN sub_100AA426:PROC
EXTRN sub_100AA42A:PROC
EXTRN sub_100AA432:PROC
EXTRN sub_100AA43A:PROC
EXTRN sub_100AA442:PROC
EXTRN sub_100AA458:PROC
EXTRN sub_100AA47D:PROC
EXTRN sub_100AA48C:PROC
EXTRN sub_100AA490:PROC
EXTRN sub_100AA4E6:PROC
EXTRN sub_100AA53C:PROC
.CODE
FUN_100aa1ac PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 28
    push push ebx
    xor xor edx, edx
    mov mov ebx, ecx
    cmp cmp dword ptr [ebx + 12], edx
    push push esi
    push push edi
    mov mov dword ptr [ebp - 4], edx
    jbe L8
    mov mov eax, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov esi, dword ptr [eax + ecx*4]
    cmp cmp esi, edx
    je L9
    cmp cmp dword ptr [esi + 36], 1
    je L10
    cmp cmp dword ptr [esi], edx
    je L11
    cmp cmp dword ptr [esi + 12], edx
    mov mov dword ptr [ebp - 24], edx
    mov mov dword ptr [ebp - 12], edx
    jbe sub_100AA398
    cmp cmp dword ptr [ebp + 12], edx
    mov mov dword ptr [ebp - 8], edx
    jbe L3
    mov mov eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov edx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [eax + 4]
    cmp cmp ecx, dword ptr [ebx + 080h]
    jne L1
    cmp cmp byte ptr [eax + 108], 3
    jne sub_100AA3E0
    mov mov ecx, dword ptr [esi + 16]
    mov mov edi, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [ecx + edi*4]
    cmp cmp ecx, edx
    je L2
    cmp cmp ecx, dword ptr [eax + 56]
    jne L5
    mov mov edi, dword ptr [esi]
    mov mov eax, dword ptr [esi + 4]
    xor xor edx, edx
    and and edi, 0FFFFFh
    div div edi
    xor xor edx, edx
    mov mov dword ptr [ebp - 20], edx
    cmp cmp eax, edx
    mov mov dword ptr [ebp - 28], eax
    jbe L6
    mov mov dword ptr [ebp - 16], edx
    push push dword ptr [ebp + 20]
    mov mov eax, dword ptr [esi + 8]
    push push dword ptr [ebp + 16]
    add add eax, dword ptr [ebp - 16]
    push push edi
    push push eax
    mov mov ecx, ebx
    call L0
L0:
    test test eax, eax
    jl sub_100AA426
    inc inc dword ptr [ebp - 20]
    mov mov eax, edi
    shl shl eax, 2
    add add dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp eax, dword ptr [ebp - 28]
    mov mov dword ptr [ebp - 24], 1
    jb L7
    xor xor edx, edx
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebp + 12]
    jb L3
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp eax, dword ptr [esi + 12]
    jb L4
    cmp cmp dword ptr [ebp - 24], edx
    je sub_100AA458
    mov mov eax, dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 0FFF00000h
    cmp cmp ecx, 060000000h
    je sub_100AA41A
    cmp cmp ecx, 060500000h
    je sub_100AA422
    cmp cmp ecx, 060A00000h
    je sub_100AA42A
    cmp cmp ecx, 060F00000h
    je sub_100AA432
    cmp cmp ecx, 072C00000h
    je sub_100AA43A
    cmp cmp ecx, 072D00000h
    je sub_100AA442
    cmp cmp ecx, 011000000h
    jne sub_100AA47D
    and and eax, 0FFFFFh
    lea lea ecx, [eax + eax]
    cmp cmp eax, ecx
    mov mov dword ptr [ebp - 28], ecx
    jae sub_100AA48C
    mov mov ecx, dword ptr [esi + 8]
    lea lea ecx, [ecx + eax*4]
    mov mov edx, dword ptr [ebx + 20]
    mov mov edi, dword ptr [ecx]
    mov mov edi, dword ptr [edx + edi*4]
    mov mov edx, dword ptr [ebx + 088h]
    cmp cmp dword ptr [edi + 4], edx
    je sub_100AA4E6
    inc inc eax
    add add ecx, 4
    cmp cmp eax, dword ptr [ebp - 28]
    jb sub_100AA490
    xor xor edx, edx
    mov mov eax, dword ptr [ebp + 20]
    mov mov ecx, dword ptr [eax]
    mov mov edi, dword ptr [ebp + 16]
    mov mov dword ptr [edi + ecx*4], esi
    mov mov ecx, dword ptr [ebx + 24]
L6:
    mov mov esi, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ecx + esi*4]
    mov mov dword ptr [ecx + 36], 1
    inc inc dword ptr [eax]
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebx + 12]
    jb L8
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 16
    push push 010116D90h
    push push 011A1h
    jmp sub_100AA53C
    push push 010116D54h
    push push 011B6h
    push push dword ptr [esi + 60]
    push push ebx
    call sub_1008B28B
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_100AA53C
FUN_100aa1ac ENDP
END
