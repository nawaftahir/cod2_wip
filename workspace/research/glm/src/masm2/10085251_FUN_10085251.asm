.686
.MODEL FLAT, C
EXTRN sub_1006507F:PROC
EXTRN sub_1008515E:PROC
EXTRN sub_10085329:PROC
EXTRN sub_10085342:PROC
EXTRN sub_1008535B:PROC
EXTRN sub_10085382:PROC
EXTRN sub_1008539B:PROC
EXTRN sub_1008539E:PROC
EXTRN sub_100853A5:PROC
EXTRN sub_100853BA:PROC
EXTRN sub_100853CD:PROC
.CODE
FUN_10085251 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push ebx
    push push 96
    mov mov ebx, ecx
    call sub_1006507F
    test test eax, eax
    je L0
    mov mov ecx, eax
    call sub_1008515E
    mov mov dword ptr [ebp - 4], eax
    jmp L1
    and and dword ptr [ebp - 4], 0
    mov mov eax, dword ptr [ebp - 4]
    test test eax, eax
    je sub_10085342
    push push esi
    push push edi
    push push 8
    lea lea esi, [ebx + 16]
    lea lea edi, [eax + 16]
    pop pop ecx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, dword ptr [ebx + 48]
    mov mov dword ptr [eax + 48], ecx
    mov mov ecx, dword ptr [ebx + 52]
    mov mov dword ptr [eax + 52], ecx
L1:
    mov mov ecx, dword ptr [ebx + 56]
    mov mov dword ptr [eax + 56], ecx
    mov mov ecx, dword ptr [ebx + 84]
    mov mov dword ptr [eax + 84], ecx
    mov mov ecx, dword ptr [ebx + 88]
    xor xor esi, esi
    mov mov dword ptr [eax + 88], ecx
    cmp cmp dword ptr [ebx + 60], esi
    je sub_10085329
    mov mov ecx, dword ptr [ebx + 60]
    mov mov eax, dword ptr [ecx]
    call call dword ptr [eax + 4]
    cmp cmp eax, esi
    mov mov ecx, dword ptr [ebp - 4]
    mov mov dword ptr [ecx + 60], eax
    je sub_10085382
    mov mov eax, ecx
    cmp cmp dword ptr [ebx + 64], esi
    je sub_1008535B
    mov mov ecx, dword ptr [ebx + 64]
    mov mov eax, dword ptr [ecx]
    call call dword ptr [eax + 4]
    cmp cmp eax, esi
    mov mov ecx, dword ptr [ebp - 4]
    mov mov dword ptr [ecx + 64], eax
    je sub_1008539B
    mov mov eax, ecx
    mov mov edi, eax
    mov mov dword ptr [ebp - 8], esi
    lea lea esi, [ebx + 68]
    sub sub edi, ebx
    cmp cmp dword ptr [esi], 0
    je sub_1008539E
    mov mov ecx, dword ptr [esi]
    mov mov eax, dword ptr [ecx]
    call call dword ptr [eax + 4]
    test test eax, eax
    mov mov dword ptr [edi + esi], eax
    je sub_100853BA
    mov mov eax, dword ptr [ebp - 4]
    inc inc dword ptr [ebp - 8]
    add add esi, 4
    cmp cmp dword ptr [ebp - 8], 4
    jb sub_100853A5
    jmp sub_100853CD
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_10085251 ENDP
END
