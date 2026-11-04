.686
.MODEL FLAT, C
EXTRN sub_10065006:PROC
EXTRN sub_10067C98:PROC
EXTRN sub_10067CD9:PROC
.CODE
FUN_10065377 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    mov ebx, ecx
    push 9
    mov esi, 01010C804h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L0
    mov eax, dword ptr [ebx + 00000028Ch]
    jmp L4
L0:
    lea eax, [ebp - 4]
    push eax
    lea eax, [ebp + 8]
    push eax
    push dword ptr [ebp + 8]
    mov ecx, ebx
    call sub_10065006
    test eax, eax
    je L3
    cmp dword ptr [ebp + 8], 0
    je L1
    push 01010C7C0h
    lea eax, [ebx + 000000278h]
    push 0000005EDh
    push eax
    add ebx, 24
    push ebx
    call sub_10067C98
    xor eax, eax
    add esp, 16
    inc eax
    jmp L4
L1:
    mov eax, dword ptr [ebp - 4]
    test eax, eax
    je L2
    cmp dword ptr [eax + 12], 0
    jne L2
    mov ecx, dword ptr [eax + 16]
    cmp ecx, 2
    jl L2
    cmp ecx, 4
    jg L2
    mov eax, dword ptr [eax + 24]
    jmp L4
L2:
    push 01010C78Ch
    lea eax, [ebx + 000000278h]
    push 0000005EEh
    push eax
    add ebx, 24
    push ebx
    call sub_10067CD9
    add esp, 16
L3:
    xor eax, eax
L4:
    pop edi
    pop esi
    pop ebx
    leave
    ret 4
FUN_10065377 ENDP
END
