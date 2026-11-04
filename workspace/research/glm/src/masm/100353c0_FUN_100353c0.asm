.686
.MODEL FLAT, C
.CODE
FUN_100353c0 PROC
    mov eax, dword ptr [ecx + 20]
    sub esp, 8
    xor edx, edx
    test eax, eax
    jle L2
    push ebx
    push ebp
    push esi
    mov ebx, 01072DC1Ch
    sub ebx, ecx
    push edi
    mov dword ptr [esp + 20], ebx
    mov esi, 01072DC14h
    mov edi, 01072DC18h
    mov ebx, 01072DC10h
    sub esi, ecx
    sub edi, ecx
    sub ebx, ecx
    lea eax, [ecx + 32]
    mov dword ptr [esp + 16], ebx
    jmp L1
L0:
    mov ebx, dword ptr [esp + 16]
    lea ecx, [ecx]
L1:
    mov ebp, dword ptr [eax - 8]
    mov dword ptr [ebx + eax], ebp
    mov ebx, dword ptr [eax - 4]
    mov ebp, dword ptr [esp + 20]
    mov dword ptr [esi + eax], ebx
    mov ebx, dword ptr [eax]
    mov dword ptr [edi + eax], ebx
    mov ebx, dword ptr [eax + 4]
    mov dword ptr [eax + ebp], ebx
    mov ebx, dword ptr [ecx + 20]
    inc edx
    add eax, 16
    cmp edx, ebx
    jl L0
    pop edi
    pop esi
    pop ebp
    pop ebx
L2:
    add esp, 8
    ret
FUN_100353c0 ENDP
END
