.686
.MODEL FLAT, C
EXTRN sub_10067C9D:PROC
EXTRN sub_10067CF2:PROC
EXTRN sub_10067EDA:PROC
EXTRN sub_100F624B:PROC
.CODE
FUN_10063ee5 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000100h
    push ebx
    mov ebx, dword ptr [ebp + 8]
    cmp dword ptr [ebx + 80], 0
    mov dword ptr [ebx + 68], 1
    je L2
    push esi
    mov esi, dword ptr [ebp + 12]
    push edi
    push 13
    pop ecx
    mov edi, 01010C5E8h
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    pop edi
    pop esi
    jne L1
    cmp dword ptr [ebx + 76], eax
    je L0
    lea eax, [ebx + 000000278h]
    cmp dword ptr [eax], 9
    jne L0
    push dword ptr [ebx + 000000280h]
    add ebx, 24
    push 01010C5C4h
    push 0000005E0h
    push eax
    push ebx
    call sub_10067C9D
    add esp, 20
    jmp L2
L0:
    lea eax, [ebx + 000000278h]
    push eax
    push 0000005DCh
    lea ecx, [ebx + 24]
    call sub_10067EDA
    jmp L2
L1:
    lea eax, [ebp + 16]
    push eax
    push dword ptr [ebp + 12]
    lea eax, [ebp - 000000100h]
    push 000000100h
    push eax
    call sub_100F624B
    lea eax, [ebp - 000000100h]
    push eax
    push 010193358h
    lea eax, [ebx + 000000278h]
    push 0
    push eax
    add ebx, 24
    push ebx
    mov byte ptr [ebp - 1], 0
    call sub_10067CF2
    add esp, 36
L2:
    pop ebx
    leave
    ret
FUN_10063ee5 ENDP
END
