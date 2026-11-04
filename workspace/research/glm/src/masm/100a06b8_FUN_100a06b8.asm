.686
.MODEL FLAT, C
EXTRN sub_100650CB:PROC
EXTRN sub_1006511C:PROC
EXTRN sub_10065141:PROC
EXTRN sub_10082934:PROC
EXTRN sub_100832C7:PROC
EXTRN sub_1008343C:PROC
EXTRN sub_1009A677:PROC
EXTRN sub_1009EEA6:PROC
EXTRN sub_100F78A2:PROC
EXTRN sub_100F7982:PROC
.CODE
FUN_100a06b8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 16
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    xor edi, edi
    cmp esi, edi
    mov dword ptr [ebp - 16], ecx
    je L12
    cmp dword ptr [esi + 4], 13
    jne L12
    mov eax, dword ptr [esi + 24]
    imul eax, dword ptr [esi + 20]
    mov dword ptr [ebp - 8], eax
    shl eax, 4
    push ebx
    push eax
    call sub_100F78A2
    cmp eax, edi
    pop ecx
    mov dword ptr [ebp - 12], eax
    je L10
    mov ecx, dword ptr [ebp - 16]
    push eax
    push esi
    call sub_1009EEA6
    test eax, eax
    jl L10
    push 80
    call sub_100650CB
    cmp eax, edi
    je L0
    lea ecx, [esi + 48]
    push ecx
    push 1
    push edi
    push edi
    push edi
    push edi
    mov ecx, eax
    call sub_100832C7
    mov ebx, eax
    jmp L1
L0:
    xor ebx, ebx
L1:
    cmp ebx, edi
    je L10
    cmp dword ptr [esi + 16], edi
    je L2
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    cmp eax, edi
    mov dword ptr [ebx + 16], eax
    je L10
L2:
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ebp - 8], 0
    lea edi, [ebx + 32]
    jbe L8
    mov eax, dword ptr [ebp - 12]
    mov dword ptr [ebp + 8], eax
L3:
    push 20
    call sub_1006511C
    test eax, eax
    je L4
    push 010114AE8h
    push 0
    push 0
    mov ecx, eax
    call sub_10082934
    jmp L5
L4:
    xor eax, eax
L5:
    test eax, eax
    mov dword ptr [edi], eax
    je L9
    push 64
    call sub_10065141
    test eax, eax
    je L6
    lea ecx, [esi + 48]
    push ecx
    push dword ptr [ebp + 8]
    mov ecx, eax
    call sub_1008343C
    jmp L7
L6:
    xor eax, eax
L7:
    test eax, eax
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 8], eax
    je L9
    mov edi, dword ptr [edi]
    add dword ptr [ebp + 8], 16
    add edi, 12
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp - 8]
    jb L3
L8:
    mov ecx, dword ptr [ebp - 16]
    push ebx
    call sub_1009A677
    jmp L11
L9:
    xor edi, edi
L10:
    xor ebx, ebx
L11:
    push dword ptr [ebp - 12]
    call sub_100F7982
    pop ecx
    mov eax, ebx
    pop ebx
    jmp L13
L12:
    xor eax, eax
L13:
    pop edi
    pop esi
    leave
    ret 4
FUN_100a06b8 ENDP
END
