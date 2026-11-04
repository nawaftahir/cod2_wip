.686
.MODEL FLAT, C
EXTRN sub_1006C66F:PROC
EXTRN sub_1006DCFA:PROC
EXTRN sub_1006EC0C:PROC
EXTRN sub_10086195:PROC
EXTRN sub_10086209:PROC
.CODE
FUN_1006df60 PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    xor ebx, ebx
    cmp dword ptr [ebp + 32], ebx
    push esi
    push edi
    mov edi, ecx
    mov dword ptr [ebp - 4], ebx
    mov dword ptr [ebp - 8], ebx
    jne L1
    lea eax, [ebp - 8]
    mov dword ptr [ebp + 32], eax
L1:
    mov esi, dword ptr [ebp + 8]
    cmp esi, ebx
    je L14
    mov eax, dword ptr [esi + 4]
    dec eax
    je L13
    sub eax, 5
    je L12
    dec eax
    dec eax
    je L7
    dec eax
    je L4
    dec eax
    dec eax
    je L2
    push 01010F7B0h
    push ebx
    push ebx
    push edi
    call sub_1006DCFA
    add esp, 16
    jmp L14
L2:
    lea eax, [ebp - 4]
    push eax
    push dword ptr [esi + 48]
    mov ecx, edi
    push dword ptr [esi + 44]
    push dword ptr [ebp + 32]
    push dword ptr [ebp + 28]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    push dword ptr [esi + 32]
    call sub_1006EC0C
L3:
    cmp eax, ebx
    jge L14
    jmp L16
L4:
    cmp dword ptr [esi + 16], 3
    jne L6
    cmp dword ptr [ebp + 24], ebx
    jne L5
    mov ecx, dword ptr [edi + 8]
    push 4
    push -1
    push 0000002D1h
    push 01010E8DCh
    call sub_10086195
    mov dword ptr [ebp + 16], eax
    jmp L6
L5:
    mov eax, dword ptr [edi + 8]
    mov eax, dword ptr [eax + 16]
    mov ecx, dword ptr [ebp + 16]
    mov eax, dword ptr [eax + ecx*4]
    or byte ptr [eax + 4], 000000080h
L6:
    lea eax, [ebp - 4]
    push eax
    push dword ptr [ebp + 28]
    mov ecx, edi
    push dword ptr [ebp + 32]
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    push dword ptr [esi + 32]
    push dword ptr [esi + 28]
    push dword ptr [esi + 24]
    push dword ptr [esi + 16]
    call sub_1006C66F
    jmp L3
L7:
    cmp dword ptr [ebp + 24], ebx
    jne L10
    mov eax, esi
L8:
    cmp dword ptr [eax + 4], 8
    jne L9
    mov eax, dword ptr [eax + 16]
    cmp eax, ebx
    jne L8
L9:
    cmp eax, ebx
    je L10
    cmp dword ptr [eax + 4], 9
    jne L10
    cmp dword ptr [eax + 16], 3
    jne L10
    mov ecx, dword ptr [edi + 8]
    push 4
    push -1
    push 0000002D1h
    push 01010E8DCh
    call sub_10086209
    mov dword ptr [ebp + 16], eax
    mov dword ptr [ebp + 24], 1
L10:
    cmp dword ptr [esi + 20], 0
    jbe L14
L11:
    mov ecx, dword ptr [ebp - 4]
    lea eax, [ebp + 8]
    push eax
    push dword ptr [ebp + 32]
    mov eax, dword ptr [ebp + 12]
    push dword ptr [ebp + 28]
    lea eax, [eax + ecx*4]
    push dword ptr [ebp + 24]
    mov ecx, edi
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
    push eax
    push dword ptr [esi + 16]
    call L0
    test eax, eax
    jl L16
    mov eax, dword ptr [ebp + 8]
    add dword ptr [ebp - 4], eax
    inc ebx
    cmp ebx, dword ptr [esi + 20]
    jb L11
    jmp L14
L12:
    lea eax, [ebp - 4]
    push eax
    push dword ptr [ebp + 32]
    mov ecx, edi
    push dword ptr [ebp + 28]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    push dword ptr [esi + 24]
    call L0
    jmp L3
L13:
    mov ebx, dword ptr [ebp + 12]
    lea eax, [ebp + 12]
    push eax
    push dword ptr [ebp + 32]
    mov ecx, edi
    push dword ptr [ebp + 28]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
    push ebx
    push dword ptr [esi + 8]
    call L0
    test eax, eax
    jl L16
    lea eax, [ebp + 8]
    push eax
    push dword ptr [ebp + 32]
    mov eax, dword ptr [ebp + 12]
    push dword ptr [ebp + 28]
    lea eax, [ebx + eax*4]
    push dword ptr [ebp + 24]
    mov ecx, edi
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
    push eax
    push dword ptr [esi + 12]
    call L0
    test eax, eax
    jl L16
    mov eax, dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp + 8]
    add ecx, eax
    mov dword ptr [ebp - 4], ecx
L14:
    mov eax, dword ptr [ebp + 36]
    test eax, eax
    je L15
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [eax], ecx
L15:
    xor eax, eax
L16:
    pop edi
    pop esi
    pop ebx
    leave
    ret 32
FUN_1006df60 ENDP
END
