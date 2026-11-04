.686
.MODEL FLAT, C
EXTRN sub_1008699B:PROC
EXTRN sub_1008979C:PROC
.CODE
FUN_100897ca PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 12
    push ebx
    mov ebx, ecx
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebp + 8]
    push esi
    mov esi, dword ptr [eax + ecx*4]
    push edi
    xor edi, edi
    cmp dword ptr [esi + 36], edi
    mov dword ptr [ebp - 4], ebx
    jne L12
    cmp dword ptr [esi + 20], edi
    jbe L2
L1:
    mov eax, dword ptr [esi + 24]
    mov edx, dword ptr [ebx + 24]
    and dword ptr [ebp - 12], 0
    lea eax, [eax + edi*4]
    mov ecx, dword ptr [eax]
    mov ebx, dword ptr [edx + ecx*4]
    and dword ptr [ebp - 8], 0
    push dword ptr [eax]
    mov ecx, dword ptr [ebp - 4]
    lea eax, [ebp - 12]
    push eax
    lea eax, [ebp - 8]
    push eax
    push ebx
    call sub_1008979C
    mov eax, dword ptr [ebp - 8]
    lea ecx, [eax + 1]
    mov eax, dword ptr [ebp - 12]
    cdq
    idiv ecx
    inc edi
    mov dword ptr [ebx + 48], eax
    cmp edi, dword ptr [esi + 20]
    mov ebx, dword ptr [ebp - 4]
    jb L1
L2:
    push ebx
    push dword ptr [esi + 20]
    push dword ptr [esi + 24]
    push 0100865E0h
    call sub_1008699B
    xor edi, edi
    cmp dword ptr [esi + 20], edi
    jbe L4
L3:
    push dword ptr [ebp + 16]
    mov eax, dword ptr [esi + 24]
    push dword ptr [ebp + 12]
    mov ecx, ebx
    push dword ptr [eax + edi*4]
    call L0
    test eax, eax
    jl L13
    inc edi
    cmp edi, dword ptr [esi + 20]
    jb L3
L4:
    cmp dword ptr [esi + 36], 0
    jne L12
    mov eax, dword ptr [ebp + 16]
    mov edx, dword ptr [ebp + 8]
    mov edi, dword ptr [ebp + 12]
    and dword ptr [ebp - 4], 0
    mov dword ptr [esi + 36], 1
    mov ecx, dword ptr [eax]
    mov dword ptr [edi + ecx*4], edx
    inc dword ptr [eax]
    cmp dword ptr [esi + 20], 0
    jbe L12
L5:
    mov edx, dword ptr [ebp - 4]
    mov ecx, dword ptr [esi + 24]
    mov ecx, dword ptr [ecx + edx*4]
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [ecx + 28]
    and dword ptr [ebp + 8], 0
    or edi, 0FFFFFFFFh
    test edx, edx
    jbe L11
    mov ecx, dword ptr [ecx + 32]
    mov dword ptr [ebp - 12], ecx
    mov dword ptr [ebp - 8], ecx
L6:
    mov ecx, dword ptr [ebp - 8]
    mov ecx, dword ptr [ecx]
    mov ecx, dword ptr [eax + ecx*4]
    cmp dword ptr [ecx + 36], 0
    jne L7
    cmp edi, -1
    jne L8
    mov edi, dword ptr [ebp + 8]
L7:
    inc dword ptr [ebp + 8]
    add dword ptr [ebp - 8], 4
    cmp dword ptr [ebp + 8], edx
    jb L6
    cmp edi, -1
    je L11
L8:
    cmp dword ptr [ebp + 8], edx
    jne L11
    mov ecx, dword ptr [ebp - 12]
    mov edx, dword ptr [ecx + edi*4]
    mov ecx, dword ptr [eax + edx*4]
    mov edi, dword ptr [ecx + 20]
    and dword ptr [ebp + 8], 0
    test edi, edi
    jbe L10
    mov ecx, dword ptr [ecx + 24]
    mov dword ptr [ebp - 8], ecx
L9:
    mov ecx, dword ptr [ebp - 8]
    mov ecx, dword ptr [ecx]
    mov ecx, dword ptr [eax + ecx*4]
    cmp dword ptr [ecx + 36], 0
    je L10
    inc dword ptr [ebp + 8]
    add dword ptr [ebp - 8], 4
    cmp dword ptr [ebp + 8], edi
    jb L9
L10:
    cmp dword ptr [ebp + 8], edi
    jb L11
    push dword ptr [ebp + 16]
    mov ecx, ebx
    push dword ptr [ebp + 12]
    push edx
    call L0
    test eax, eax
    jl L13
L11:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 20]
    jb L5
L12:
    xor eax, eax
L13:
    pop edi
    pop esi
    pop ebx
    leave
    ret 12
FUN_100897ca ENDP
END
