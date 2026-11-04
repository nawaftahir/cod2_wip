.686
.MODEL FLAT, C
EXTRN sub_100197CF:PROC
EXTRN sub_100197F3:PROC
EXTRN sub_10019817:PROC
EXTRN sub_1001983B:PROC
EXTRN sub_100199AE:PROC
EXTRN sub_100199F6:PROC
.CODE
FUN_100198c0 PROC
    xor xor ecx, ecx
    push push ebp
    push push esi
    push push edi
    mov mov dword ptr [eax], ecx
    mov mov dword ptr [eax + 4], ecx
    mov mov dword ptr [eax + 8], ecx
    mov mov edi, 010195538h
    mov mov esi, edx
    mov mov ecx, 7
    xor xor ebp, ebp
    mov mov dword ptr [eax + 12], 03F800000h
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L0
    push push eax
    push push 1
    push push ebx
    call sub_100197CF
    add add esp, 12
    pop pop edi
    pop pop esi
    mov mov al, 1
    pop pop ebp
    ret ret
    mov mov edi, 010195530h
    mov mov esi, edx
    mov mov ecx, 7
    xor xor ebp, ebp
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L1
    push push eax
    push push 2
    push push ebx
    call sub_100197F3
    add add esp, 12
    pop pop edi
    pop pop esi
    mov mov al, 1
    pop pop ebp
    ret ret
    mov mov edi, 010195528h
    mov mov esi, edx
    mov mov ecx, 7
    xor xor ebp, ebp
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100199AE
    push push eax
    push push 3
    push push ebx
    call sub_10019817
    add add esp, 12
    pop pop edi
    pop pop esi
    mov mov al, 1
    pop pop ebp
    ret ret
    mov mov esi, edx
    mov mov edi, 010195520h
    mov mov ecx, 7
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100199F6
    push push eax
    push push 4
    push push ebx
    call sub_1001983B
    add add esp, 12
    pop pop edi
    pop pop esi
    mov mov al, 1
    pop pop ebp
    ret ret
    pop pop edi
    pop pop esi
L1:
    xor xor al, al
    pop pop ebp
    ret ret
FUN_100198c0 ENDP
END
