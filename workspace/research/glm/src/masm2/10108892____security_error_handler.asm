.686
.MODEL FLAT, C
EXTRN sub_100F5EC7:PROC
EXTRN sub_100F8920:PROC
EXTRN sub_100FA2AC:PROC
EXTRN sub_100FA2BD:PROC
EXTRN sub_100FA2E0:PROC
EXTRN sub_100FB61F:PROC
EXTRN sub_100FE92C:PROC
EXTRN sub_100FE98C:PROC
EXTRN sub_100FE9A8:PROC
EXTRN sub_100FE9B3:PROC
EXTRN sub_100FE9BA:PROC
EXTRN sub_100FE9C1:PROC
EXTRN sub_100FE9CD:PROC
EXTRN sub_101083C2:PROC
EXTRN sub_10108A0A:PROC
EXTRN sub_10108A21:PROC
EXTRN EXTRN fp_1010C160:DWORD:DWORD
EXTRN EXTRN g_101A50D0:DWORD:DWORD
EXTRN EXTRN g_101AE258:DWORD:DWORD
.CODE
___security_error_handler PROC
    push push 0118h
    push push 0101824E0h
    call sub_100FB61F
    mov mov eax, dword ptr [g_101A50D0]
    mov mov dword ptr [ebp - 28], eax
    mov mov eax, dword ptr [g_101AE258]
    xor xor ecx, ecx
    cmp cmp eax, ecx
    je L0
    mov mov dword ptr [ebp - 4], ecx
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call call eax
    pop pop ecx
    pop pop ecx
    or or dword ptr [ebp - 4], -1
    jmp sub_10108A0A
    xor xor eax, eax
    inc inc eax
    ret ret
    mov mov esp, dword ptr [ebp - 24]
    jmp L1
    mov mov eax, dword ptr [ebp + 8]
    dec dec eax
    je L2
    mov mov edi, 0101824BCh
    mov mov dword ptr [ebp - 0128h], 010182408h
    mov mov esi, 0D4h
    jmp L3
    mov mov edi, 0101823E8h
    mov mov dword ptr [ebp - 0128h], 010182348h
    mov mov esi, 0B9h
    mov mov byte ptr [ebp - 32], cl
    push push 0104h
    lea lea eax, [ebp - 0124h]
    push push eax
    push push ecx
    call dword ptr [fp_1010C160]
    test test eax, eax
    jne L4
    push push 01017CDDCh
    lea lea eax, [ebp - 0124h]
    push push eax
    call sub_100FE92C
    pop pop ecx
    pop pop ecx
    lea lea ebx, [ebp - 0124h]
L2:
    mov mov eax, ebx
    push push eax
    call sub_100FA2AC
    pop pop ecx
    add add eax, 11
    cmp cmp eax, 60
    jbe sub_10108A21
    mov mov eax, ebx
    push push eax
    call sub_100FA2BD
    mov mov ebx, eax
    lea lea eax, [ebp - 0124h]
    sub sub eax, 49
    add add ebx, eax
    push push 3
    push push 01017CDD8h
    push push ebx
    call sub_100F5EC7
    add add esp, 16
    push push ebx
    call sub_100FA2E0
    pop pop ecx
    lea lea eax, [eax + esi + 12]
    add add eax, 3
    and and eax, -4
    call sub_100F8920
    mov mov dword ptr [ebp - 24], esp
    mov mov esi, esp
    push push edi
    push push esi
    call sub_100FE98C
    mov mov edi, 01017CDB8h
    push push edi
    push push esi
    call sub_100FE9A8
    push push 01018233Ch
    push push esi
    call sub_100FE9B3
    push push ebx
    push push esi
    call sub_100FE9BA
    push push edi
    push push esi
    call sub_100FE9C1
    push push dword ptr [ebp - 0128h]
    push push esi
    call sub_100FE9CD
    push push 012010h
    push push 01017CD90h
    push push esi
    call sub_101083C2
___security_error_handler ENDP
END
