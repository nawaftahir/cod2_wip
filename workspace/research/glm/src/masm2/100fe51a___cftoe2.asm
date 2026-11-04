.686
.MODEL FLAT, C
EXTRN sub_100FE5FB:PROC
EXTRN sub_100FE621:PROC
EXTRN sub_100FE63C:PROC
EXTRN sub_100FE63E:PROC
EXTRN sub_100FE65C:PROC
EXTRN sub_100FE8F5:PROC
EXTRN EXTRN g_101A50E4:DWORD:DWORD
.CODE
__cftoe2 PROC
    push push ebp
    mov mov ebp, esp
    cmp cmp byte ptr [ebp + 16], 0
    push push esi
    mov mov esi, eax
    je L1
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 8], eax
    push push edi
    setg setg al
    xor xor ecx, ecx
    cmp cmp dword ptr [esi], 45
    sete sete cl
    mov mov edi, eax
    add add ecx, ebx
    mov mov eax, ecx
    call L0
    pop pop edi
    cmp cmp dword ptr [esi], 45
    mov mov eax, ebx
    jne L2
    mov mov byte ptr [ebx], 45
    lea lea eax, [ebx + 1]
    cmp cmp dword ptr [ebp + 8], 0
    jle L3
    lea lea ecx, [eax + 1]
    mov mov dl, byte ptr [ecx]
    mov mov byte ptr [eax], dl
    mov mov eax, ecx
    mov mov cl, byte ptr [g_101A50E4]
    mov mov byte ptr [eax], cl
    xor xor ecx, ecx
    cmp cmp byte ptr [ebp + 16], cl
    push push 01017CDF4h
    sete sete cl
    add add ecx, eax
    add add ecx, dword ptr [ebp + 8]
    push push ecx
    call sub_100FE8F5
    cmp cmp dword ptr [ebp + 12], 0
    pop pop ecx
    pop pop ecx
    mov mov ecx, eax
    je sub_100FE5FB
    mov mov byte ptr [ecx], 69
    mov mov eax, dword ptr [esi + 12]
    inc inc ecx
    cmp cmp byte ptr [eax], 48
    je sub_100FE63E
    mov mov eax, dword ptr [esi + 4]
    dec dec eax
    jns sub_100FE621
    neg neg eax
    mov mov byte ptr [ecx], 45
    inc inc ecx
    cmp cmp eax, 100
    jl sub_100FE63C
    cdq cdq
    push push 100
    pop pop esi
    idiv idiv esi
    add add byte ptr [ecx], al
    mov mov eax, edx
    inc inc ecx
    cmp cmp eax, 10
    jl sub_100FE65C
    cdq cdq
    push push 10
    pop pop esi
    idiv idiv esi
    add add byte ptr [ecx], al
    mov mov eax, edx
    add add byte ptr [ecx + 1], al
    mov mov eax, ebx
    pop pop esi
    pop pop ebp
    ret ret
__cftoe2 ENDP
END
