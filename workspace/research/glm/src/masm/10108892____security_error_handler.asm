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
EXTRN fp_1010C160:DWORD
EXTRN g_101A50D0:DWORD
EXTRN g_101AE258:DWORD
.CODE
___security_error_handler PROC
    push 000000118h
    push 0101824E0h
    call sub_100FB61F
    mov eax, dword ptr [g_101A50D0]
    mov dword ptr [ebp - 28], eax
    mov eax, dword ptr [g_101AE258]
    xor ecx, ecx
    cmp eax, ecx
    je L1
    mov dword ptr [ebp - 4], ecx
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call eax
    pop ecx
    pop ecx
L0:
    or dword ptr [ebp - 4], 0FFFFFFFFh
    jmp sub_10108A0A
    xor eax, eax
    inc eax
    ret
    mov esp, dword ptr [ebp - 24]
    jmp L0
L1:
    mov eax, dword ptr [ebp + 8]
    dec eax
    je L2
    mov edi, 0101824BCh
    mov dword ptr [ebp - 000000128h], 010182408h
    mov esi, 0000000D4h
    jmp L3
L2:
    mov edi, 0101823E8h
    mov dword ptr [ebp - 000000128h], 010182348h
    mov esi, 0000000B9h
L3:
    mov byte ptr [ebp - 32], cl
    push 000000104h
    lea eax, [ebp - 000000124h]
    push eax
    push ecx
    call dword ptr [fp_1010C160]
    test eax, eax
    jne L4
    push 01017CDDCh
    lea eax, [ebp - 000000124h]
    push eax
    call sub_100FE92C
    pop ecx
    pop ecx
L4:
    lea ebx, [ebp - 000000124h]
    mov eax, ebx
    push eax
    call sub_100FA2AC
    pop ecx
    add eax, 11
    cmp eax, 60
    jbe L5
    mov eax, ebx
    push eax
    call sub_100FA2BD
    mov ebx, eax
    lea eax, [ebp - 000000124h]
    sub eax, 49
    add ebx, eax
    push 3
    push 01017CDD8h
    push ebx
    call sub_100F5EC7
    add esp, 16
L5:
    push ebx
    call sub_100FA2E0
    pop ecx
    lea eax, [eax + esi + 12]
    add eax, 3
    and eax, 0FFFFFFFCh
    call sub_100F8920
    mov dword ptr [ebp - 24], esp
    mov esi, esp
    push edi
    push esi
    call sub_100FE98C
    mov edi, 01017CDB8h
    push edi
    push esi
    call sub_100FE9A8
    push 01018233Ch
    push esi
    call sub_100FE9B3
    push ebx
    push esi
    call sub_100FE9BA
    push edi
    push esi
    call sub_100FE9C1
    push dword ptr [ebp - 000000128h]
    push esi
    call sub_100FE9CD
    push 000012010h
    push 01017CD90h
    push esi
    call sub_101083C2
___security_error_handler ENDP
END
