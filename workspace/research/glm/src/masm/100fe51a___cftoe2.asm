.686
.MODEL FLAT, C
EXTRN sub_100FE525:PROC
EXTRN sub_100FE8F5:PROC
EXTRN g_101A50E4:DWORD
.CODE
__cftoe2 PROC
    push ebp
    mov ebp, esp
    cmp byte ptr [ebp + 16], 0
    push esi
    mov esi, eax
    je L0
    xor eax, eax
    cmp dword ptr [ebp + 8], eax
    push edi
    setg al
    xor ecx, ecx
    cmp dword ptr [esi], 45
    sete cl
    mov edi, eax
    add ecx, ebx
    mov eax, ecx
    call sub_100FE525
    pop edi
L0:
    cmp dword ptr [esi], 45
    mov eax, ebx
    jne L1
    mov byte ptr [ebx], 45
    lea eax, [ebx + 1]
L1:
    cmp dword ptr [ebp + 8], 0
    jle L2
    lea ecx, [eax + 1]
    mov dl, byte ptr [ecx]
    mov byte ptr [eax], dl
    mov eax, ecx
    mov cl, byte ptr [g_101A50E4]
    mov byte ptr [eax], cl
L2:
    xor ecx, ecx
    cmp byte ptr [ebp + 16], cl
    push 01017CDF4h
    sete cl
    add ecx, eax
    add ecx, dword ptr [ebp + 8]
    push ecx
    call sub_100FE8F5
    cmp dword ptr [ebp + 12], 0
    pop ecx
    pop ecx
    mov ecx, eax
    je L3
    mov byte ptr [ecx], 69
L3:
    mov eax, dword ptr [esi + 12]
    inc ecx
    cmp byte ptr [eax], 48
    je L7
    mov eax, dword ptr [esi + 4]
    dec eax
    jns L4
    neg eax
    mov byte ptr [ecx], 45
L4:
    inc ecx
    cmp eax, 100
    jl L5
    cdq
    push 100
    pop esi
    idiv esi
    add byte ptr [ecx], al
    mov eax, edx
L5:
    inc ecx
    cmp eax, 10
    jl L6
    cdq
    push 10
    pop esi
    idiv esi
    add byte ptr [ecx], al
    mov eax, edx
L6:
    add byte ptr [ecx + 1], al
L7:
    mov eax, ebx
    pop esi
    pop ebp
    ret
__cftoe2 ENDP
END
