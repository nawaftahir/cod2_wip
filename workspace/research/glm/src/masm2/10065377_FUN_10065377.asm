.686
.MODEL FLAT, C
EXTRN sub_10065006:PROC
EXTRN sub_1006543B:PROC
EXTRN sub_1006544F:PROC
EXTRN sub_10065461:PROC
EXTRN sub_10065467:PROC
EXTRN sub_1006546F:PROC
EXTRN sub_10065474:PROC
EXTRN sub_10065479:PROC
EXTRN sub_10065498:PROC
EXTRN sub_10067C98:PROC
EXTRN sub_10067CD9:PROC
.CODE
FUN_10065377 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    mov mov ebx, ecx
    push push 9
    mov mov esi, 01010C804h
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L0
    mov mov eax, dword ptr [ebx + 028Ch]
    jmp sub_1006543B
    lea lea eax, [ebp - 4]
    push push eax
    lea lea eax, [ebp + 8]
    push push eax
    push push dword ptr [ebp + 8]
    mov mov ecx, ebx
    call sub_10065006
    test test eax, eax
    je sub_1006544F
    cmp cmp dword ptr [ebp + 8], 0
    je L1
L0:
    push push 01010C7C0h
    lea lea eax, [ebx + 0278h]
    push push 05EDh
    push push eax
    add add ebx, 24
    push push ebx
    call sub_10067C98
    xor xor eax, eax
    add add esp, 16
    inc inc eax
    jmp sub_10065479
    mov mov eax, dword ptr [ebp - 4]
    test test eax, eax
    je sub_10065461
    cmp cmp dword ptr [eax + 12], 0
    jne sub_10065467
    mov mov ecx, dword ptr [eax + 16]
    cmp cmp ecx, 2
    jl sub_1006546F
    cmp cmp ecx, 4
    jg sub_10065474
    mov mov eax, dword ptr [eax + 24]
    jmp sub_10065498
    push push 01010C78Ch
    lea lea eax, [ebx + 0278h]
    push push 05EEh
    push push eax
    add add ebx, 24
    push push ebx
    call sub_10067CD9
    add add esp, 16
    xor xor eax, eax
    pop pop edi
    pop pop esi
L1:
    pop pop ebx
    leave leave
    ret ret 4
FUN_10065377 ENDP
END
