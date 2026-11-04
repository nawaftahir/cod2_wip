.686
.MODEL FLAT, C
EXTRN sub_1008699B:PROC
EXTRN sub_1008979C:PROC
EXTRN sub_10089970:PROC
EXTRN sub_100899E4:PROC
EXTRN sub_100899E6:PROC
EXTRN sub_100899EB:PROC
EXTRN sub_100899F9:PROC
EXTRN sub_100899FC:PROC
EXTRN sub_10089A1E:PROC
EXTRN sub_10089A30:PROC
EXTRN sub_10089A60:PROC
EXTRN sub_10089A62:PROC
EXTRN sub_10089A65:PROC
EXTRN sub_10089A68:PROC
EXTRN sub_10089A76:PROC
EXTRN sub_10089A9E:PROC
EXTRN sub_10089AC1:PROC
.CODE
FUN_100897ca PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 12
    push push ebx
    mov mov ebx, ecx
    mov mov eax, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [ebp + 8]
    push push esi
    mov mov esi, dword ptr [eax + ecx*4]
    push push edi
    xor xor edi, edi
    cmp cmp dword ptr [esi + 36], edi
    mov mov dword ptr [ebp - 4], ebx
    jne sub_10089970
    cmp cmp dword ptr [esi + 20], edi
    jbe L0
    mov mov eax, dword ptr [esi + 24]
    mov mov edx, dword ptr [ebx + 24]
    and and dword ptr [ebp - 12], 0
    lea lea eax, [eax + edi*4]
    mov mov ecx, dword ptr [eax]
    mov mov ebx, dword ptr [edx + ecx*4]
    and and dword ptr [ebp - 8], 0
    push push dword ptr [eax]
    mov mov ecx, dword ptr [ebp - 4]
    lea lea eax, [ebp - 12]
    push push eax
    lea lea eax, [ebp - 8]
    push push eax
    push push ebx
    call sub_1008979C
    mov mov eax, dword ptr [ebp - 8]
    lea lea ecx, [eax + 1]
    mov mov eax, dword ptr [ebp - 12]
    cdq cdq
    idiv idiv ecx
    inc inc edi
    mov mov dword ptr [ebx + 48], eax
    cmp cmp edi, dword ptr [esi + 20]
    mov mov ebx, dword ptr [ebp - 4]
    jb L0
    push push ebx
    push push dword ptr [esi + 20]
    push push dword ptr [esi + 24]
    push push 0100865E0h
    call sub_1008699B
    xor xor edi, edi
    cmp cmp dword ptr [esi + 20], edi
    jbe L2
    push push dword ptr [ebp + 16]
    mov mov eax, dword ptr [esi + 24]
    push push dword ptr [ebp + 12]
    mov mov ecx, ebx
    push push dword ptr [eax + edi*4]
    call L1
L1:
    test test eax, eax
    jl sub_100899EB
    inc inc edi
    cmp cmp edi, dword ptr [esi + 20]
    jb L2
    cmp cmp dword ptr [esi + 36], 0
    jne sub_100899F9
    mov mov eax, dword ptr [ebp + 16]
    mov mov edx, dword ptr [ebp + 8]
    mov mov edi, dword ptr [ebp + 12]
    and and dword ptr [ebp - 4], 0
    mov mov dword ptr [esi + 36], 1
    mov mov ecx, dword ptr [eax]
    mov mov dword ptr [edi + ecx*4], edx
    inc inc dword ptr [eax]
    cmp cmp dword ptr [esi + 20], 0
    jbe sub_10089A1E
    mov mov edx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov eax, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [ecx + 28]
    and and dword ptr [ebp + 8], 0
    or or edi, -1
    test test edx, edx
    jbe sub_10089A30
    mov mov ecx, dword ptr [ecx + 32]
    mov mov dword ptr [ebp - 12], ecx
    mov mov dword ptr [ebp - 8], ecx
    mov mov ecx, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ecx]
    mov mov ecx, dword ptr [eax + ecx*4]
    cmp cmp dword ptr [ecx + 36], 0
    jne sub_100899E6
    cmp cmp edi, -1
    jne sub_100899FC
    mov mov edi, dword ptr [ebp + 8]
    inc inc dword ptr [ebp + 8]
    add add dword ptr [ebp - 8], 4
    cmp cmp dword ptr [ebp + 8], edx
    jb sub_100899E4
    cmp cmp edi, -1
    je sub_10089A60
    cmp cmp dword ptr [ebp + 8], edx
    jne sub_10089A65
    mov mov ecx, dword ptr [ebp - 12]
    mov mov edx, dword ptr [ecx + edi*4]
    mov mov ecx, dword ptr [eax + edx*4]
    mov mov edi, dword ptr [ecx + 20]
    and and dword ptr [ebp + 8], 0
    test test edi, edi
    jbe sub_10089A62
    mov mov ecx, dword ptr [ecx + 24]
    mov mov dword ptr [ebp - 8], ecx
    mov mov ecx, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ecx]
    mov mov ecx, dword ptr [eax + ecx*4]
    cmp cmp dword ptr [ecx + 36], 0
    je sub_10089A76
    inc inc dword ptr [ebp + 8]
    add add dword ptr [ebp - 8], 4
    cmp cmp dword ptr [ebp + 8], edi
    jb sub_10089A68
    cmp cmp dword ptr [ebp + 8], edi
    jb sub_10089A9E
    push push dword ptr [ebp + 16]
    mov mov ecx, ebx
    push push dword ptr [ebp + 12]
    push push edx
    call L3
L3:
    test test eax, eax
    jl sub_10089AC1
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [esi + 20]
    jb sub_10089A1E
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 12
FUN_100897ca ENDP
END
