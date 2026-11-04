.686
.MODEL FLAT, C
EXTRN sub_10067D2C:PROC
EXTRN sub_10084388:PROC
EXTRN sub_1009E13E:PROC
.CODE
FUN_100843e6 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    push 8
    mov ebx, ecx
    pop ecx
    lea edi, [ebp - 32]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov edi, dword ptr [ebp + 12]
    mov ecx, dword ptr [ebx]
    lea eax, [edi + 2]
    xor esi, esi
    push esi
    mov dword ptr [ebp - 24], eax
    lea eax, [ebp + 12]
    push eax
    push 2
    push dword ptr [ebx + 4]
    lea eax, [ebp - 32]
    push esi
    push esi
    push eax
    push 1
    mov dword ptr [ebp - 32], 10
    call sub_1009E13E
    test eax, eax
    je L2
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [eax], esi
L0:
    xor eax, eax
L1:
    pop edi
    pop esi
    pop ebx
    leave
    ret 12
L2:
    mov edx, dword ptr [ebp + 16]
    mov eax, dword ptr [ebp + 12]
    push esi
    push edx
    push dword ptr [eax + 32]
    call sub_10084388
    cmp eax, esi
    jl L1
    mov cx, word ptr [edi]
    mov eax, 01010F234h
    cmp cx, word ptr [eax]
    jne L4
    cmp dword ptr [edx], 1
    jne L3
    mov eax, dword ptr [ebp + 12]
    mov eax, dword ptr [eax + 32]
    cmp dword ptr [eax + 4], 9
    jne L3
    cmp dword ptr [eax + 16], esi
    jne L3
    cmp dword ptr [eax + 20], esi
    je L0
L3:
    push edi
    push 010110278h
    push 000000B54h
    jmp L6
L4:
    mov cx, word ptr [edi]
    mov eax, 01010F230h
    cmp cx, word ptr [eax]
    jne L0
    cmp dword ptr [edx], 1
    jne L5
    mov eax, dword ptr [ebp + 12]
    mov eax, dword ptr [eax + 32]
    cmp dword ptr [eax + 4], 9
    jne L5
    cmp dword ptr [eax + 16], 1
    jne L5
    cmp dword ptr [eax + 20], 4
    jne L5
    cmp dword ptr [eax + 28], 3
    jae L0
L5:
    push edi
    push 010110220h
    push 000000B55h
L6:
    mov eax, dword ptr [ebx]
    mov eax, dword ptr [eax + 4]
    push dword ptr [ebp + 8]
    add eax, 24
    push eax
    call sub_10067D2C
    add esp, 20
    mov eax, 080004005h
    jmp L1
FUN_100843e6 ENDP
END
