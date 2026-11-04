.686
.MODEL FLAT, C
EXTRN fp_1010C050:DWORD
EXTRN fp_101AE23C:DWORD
EXTRN fp_101AE24C:DWORD
EXTRN g_1010C04C:DWORD
EXTRN g_101AE00C:DWORD
EXTRN g_101AE018:DWORD
EXTRN g_101AE23C:DWORD
EXTRN g_101AE240:DWORD
EXTRN g_101AE244:DWORD
EXTRN g_101AE248:DWORD
EXTRN g_101AE24C:DWORD
.CODE
___crtMessageBoxA PROC
    push ebp
    mov ebp, esp
    sub esp, 16
    push ebx
    xor ebx, ebx
    cmp dword ptr [g_101AE23C], ebx
    push esi
    push edi
    jne L0
    push 010182330h
    call dword ptr [fp_1010C050]
    mov edi, eax
    cmp edi, ebx
    je L2
    mov esi, dword ptr [g_1010C04C]
    push 010182324h
    push edi
    call esi
    test eax, eax
    mov dword ptr [g_101AE23C], eax
    je L2
    push 010182314h
    push edi
    call esi
    push 010182300h
    push edi
    mov dword ptr [g_101AE240], eax
    call esi
    cmp dword ptr [g_101AE00C], 2
    mov dword ptr [g_101AE244], eax
    jne L0
    push 0101822E4h
    push edi
    call esi
    test eax, eax
    mov dword ptr [g_101AE24C], eax
    je L0
    push 0101822CCh
    push edi
    call esi
    mov dword ptr [g_101AE248], eax
L0:
    mov eax, dword ptr [g_101AE248]
    test eax, eax
    je L4
    call eax
    test eax, eax
    je L1
    lea ecx, [ebp - 4]
    push ecx
    push 12
    lea ecx, [ebp - 16]
    push ecx
    push 1
    push eax
    call dword ptr [fp_101AE24C]
    test eax, eax
    je L1
    test byte ptr [ebp - 8], 1
    jne L4
L1:
    cmp dword ptr [g_101AE018], 4
    jb L3
    or byte ptr [ebp + 18], 32
    jmp L5
L2:
    xor eax, eax
    jmp L6
L3:
    or byte ptr [ebp + 18], 4
    jmp L5
L4:
    mov eax, dword ptr [g_101AE240]
    test eax, eax
    je L5
    call eax
    mov ebx, eax
    test ebx, ebx
    je L5
    mov eax, dword ptr [g_101AE244]
    test eax, eax
    je L5
    push ebx
    call eax
    mov ebx, eax
L5:
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    push ebx
    call dword ptr [fp_101AE23C]
L6:
    pop edi
    pop esi
    pop ebx
    leave
    ret
___crtMessageBoxA ENDP
END
