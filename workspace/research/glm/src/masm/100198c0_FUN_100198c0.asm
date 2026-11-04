.686
.MODEL FLAT, C
EXTRN sub_100197CF:PROC
EXTRN sub_100197F3:PROC
EXTRN sub_10019817:PROC
EXTRN sub_1001983B:PROC
.CODE
FUN_100198c0 PROC
    xor ecx, ecx
    push ebp
    push esi
    push edi
    mov dword ptr [eax], ecx
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax + 8], ecx
    mov edi, 010195538h
    mov esi, edx
    mov ecx, 7
    xor ebp, ebp
    mov dword ptr [eax + 12], 03F800000h
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L0
    push eax
    push 1
    push ebx
    call sub_100197CF
    add esp, 12
    pop edi
    pop esi
    mov al, 1
    pop ebp
    ret
L0:
    mov edi, 010195530h
    mov esi, edx
    mov ecx, 7
    xor ebp, ebp
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L1
    push eax
    push 2
    push ebx
    call sub_100197F3
    add esp, 12
    pop edi
    pop esi
    mov al, 1
    pop ebp
    ret
L1:
    mov edi, 010195528h
    mov esi, edx
    mov ecx, 7
    xor ebp, ebp
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L2
    push eax
    push 3
    push ebx
    call sub_10019817
    add esp, 12
    pop edi
    pop esi
    mov al, 1
    pop ebp
    ret
L2:
    mov esi, edx
    mov edi, 010195520h
    mov ecx, 7
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L3
    push eax
    push 4
    push ebx
    call sub_1001983B
    add esp, 12
    pop edi
    pop esi
    mov al, 1
    pop ebp
    ret
L3:
    pop edi
    pop esi
    xor al, al
    pop ebp
    ret
FUN_100198c0 ENDP
END
