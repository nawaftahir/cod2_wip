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
EXTRN sub_1002CA0B:PROC
EXTRN sub_1002CA10:PROC
EXTRN sub_1002CA23:PROC
EXTRN sub_1002CA7D:PROC
EXTRN sub_1002CAA0:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101CE794:DWORD:DWORD
EXTRN EXTRN g_106D3194:DWORD:DWORD
EXTRN EXTRN g_1072DDBC:DWORD:DWORD
.CODE
FUN_1002c910 PROC
    push push ecx
    mov mov eax, dword ptr [g_106D3194]
    mov mov eax, dword ptr [eax]
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 16]
    push push esi
    mov mov esi, dword ptr [esp + 24]
    cmp cmp dword ptr [esi], eax
    push push edi
    je sub_1002CA10
    mov mov ecx, dword ptr [g_101CE794]
    mov mov dword ptr [esi], eax
    mov mov al, byte ptr [ecx + 8]
    test test al, al
    je sub_1002CA23
    mov mov edx, dword ptr [g_1072DDBC]
    push push edx
    mov mov edi, 0106A3180h
    call sub_1002C4B0
    add add esp, 4
    push push edi
    call sub_1002C5B9
    mov mov eax, dword ptr [g_101CE708]
    mov mov ecx, dword ptr [eax + 8]
    add add esp, 4
    cmp cmp ecx, 2
    mov mov eax, 0106C3180h
    jne sub_1002CA0B
    push push esi
    call sub_1002C684
    mov mov eax, dword ptr [ebp]
    add add esp, 4
    cmp cmp eax, 4
    push push 0106C3180h
    jne sub_1002CA0B
    push push 0
    push push 21
    push push ebp
    call sub_1000EC7E
    add add esp, 16
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
    push push 21
    xor xor edi, edi
    xor xor ebx, ebx
    mov mov esi, ebp
    call sub_1000EAB4
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
    mov mov edx, esi
    call sub_1002C854
    cmp cmp dword ptr [ebp], 4
    push push 0106C3180h
    jne sub_1002CA7D
    push push 0
    push push 50
    push push ebp
    call sub_1000ECB9
    add add esp, 16
    jmp sub_1002CAA0
    push push 50
    xor xor edi, edi
    xor xor ebx, ebx
    mov mov esi, ebp
    call sub_1000EAEB
    mov mov esi, dword ptr [esp + 36]
    add add esp, 8
    push push 0106C3180h
    push push 50
    push push ebp
    mov mov eax, esi
    call L0
    add add esp, 12
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
FUN_1002c910 ENDP
END
