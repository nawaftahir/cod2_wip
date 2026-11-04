.686
.MODEL FLAT, C
EXTRN sub_100644A2:PROC
EXTRN sub_100645FA:PROC
EXTRN sub_100649FB:PROC
EXTRN sub_100652CC:PROC
EXTRN sub_100652DB:PROC
EXTRN sub_100652E2:PROC
EXTRN sub_1006530B:PROC
EXTRN sub_10065314:PROC
EXTRN sub_10065324:PROC
EXTRN sub_1006533A:PROC
EXTRN sub_1006533D:PROC
EXTRN sub_10065340:PROC
EXTRN sub_10067822:PROC
EXTRN sub_100686E3:PROC
.CODE
FUN_10065219 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    push push esi
    mov mov ebx, ecx
    mov mov ecx, dword ptr [ebx + 026Ch]
    push push edi
    lea lea esi, [ebx + 0278h]
    push push esi
    push push dword ptr [ebx + 0298h]
    call sub_100686E3
    test test eax, eax
    jl sub_100652DB
    mov mov esi, dword ptr [esi]
    cmp cmp esi, 9
    mov mov dword ptr [ebp - 4], esi
    jne sub_100652CC
    mov mov eax, dword ptr [ebx + 0280h]
    push push 12
    mov mov edi, 01010C764h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L0
    mov mov ecx, ebx
    call sub_100644A2
    jmp sub_1006530B
    push push 8
    mov mov edi, 01010C75Ch
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100652E2
    mov mov ecx, ebx
    call sub_100645FA
    jmp sub_10065324
    mov mov esi, eax
    push push 4
    mov mov edi, 01010C758h
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10065314
    mov mov ecx, ebx
    call sub_100649FB
    jmp sub_1006533D
    cmp cmp dword ptr [ebp - 4], 12
    je sub_1006533A
    cmp cmp dword ptr [ebp - 4], 13
    je sub_10065340
    mov mov ecx, dword ptr [ebx + 026Ch]
    call sub_10067822
    xor xor eax, eax
    mov mov dword ptr [ebx + 64], 1
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_10065219 ENDP
END
