.686
.MODEL FLAT, C
EXTRN sub_1000EAB4:PROC
EXTRN sub_1000EAEB:PROC
EXTRN sub_1000EC7E:PROC
EXTRN sub_1000ECB9:PROC
EXTRN sub_1002C4B0:PROC
EXTRN sub_1002C5B9:PROC
EXTRN sub_1002C684:PROC
EXTRN sub_1002C854:PROC
EXTRN sub_1002C931:PROC
EXTRN g_101CE708:DWORD
EXTRN g_101CE794:DWORD
EXTRN g_106D3194:DWORD
EXTRN g_1072DDBC:DWORD
.CODE
FUN_1002c910 PROC
    push ecx
    mov eax, dword ptr [g_106D3194]
    mov eax, dword ptr [eax]
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 16]
    push esi
    mov esi, dword ptr [esp + 24]
    cmp dword ptr [esi], eax
    push edi
    je L4
    mov ecx, dword ptr [g_101CE794]
    mov dword ptr [esi], eax
    mov al, byte ptr [ecx + 8]
    test al, al
    je L4
    mov edx, dword ptr [g_1072DDBC]
    push edx
    mov edi, 0106A3180h
    call sub_1002C4B0
    add esp, 4
    push edi
    call sub_1002C5B9
    mov eax, dword ptr [g_101CE708]
    mov ecx, dword ptr [eax + 8]
    add esp, 4
    cmp ecx, 2
    mov eax, 0106C3180h
    jne L1
    push esi
    call sub_1002C684
    mov eax, dword ptr [ebp]
    add esp, 4
    cmp eax, 4
    push 0106C3180h
    jne L0
    push 0
    push 21
    push ebp
    call sub_1000EC7E
    add esp, 16
    pop edi
    pop esi
    pop ebp
    pop ebx
    pop ecx
    ret
L0:
    push 21
    xor edi, edi
    xor ebx, ebx
    mov esi, ebp
    call sub_1000EAB4
    add esp, 8
    pop edi
    pop esi
    pop ebp
    pop ebx
    pop ecx
    ret
L1:
    mov edx, esi
    call sub_1002C854
    cmp dword ptr [ebp], 4
    push 0106C3180h
    jne L2
    push 0
    push 50
    push ebp
    call sub_1000ECB9
    add esp, 16
    jmp L3
L2:
    push 50
    xor edi, edi
    xor ebx, ebx
    mov esi, ebp
    call sub_1000EAEB
    mov esi, dword ptr [esp + 36]
    add esp, 8
L3:
    push 0106C3180h
    push 50
    push ebp
    mov eax, esi
    call sub_1002C931
    add esp, 12
L4:
    pop edi
    pop esi
    pop ebp
    pop ebx
    pop ecx
    ret
FUN_1002c910 ENDP
END
