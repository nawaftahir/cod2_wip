.686
.MODEL FLAT, C
EXTRN sub_1008B14B:PROC
EXTRN sub_100B346E:PROC
EXTRN sub_100B3473:PROC
EXTRN sub_100B347C:PROC
EXTRN sub_100B3491:PROC
EXTRN sub_100B3497:PROC
EXTRN sub_100B349D:PROC
EXTRN sub_100B34B1:PROC
EXTRN sub_100B34F8:PROC
EXTRN sub_100B3502:PROC
EXTRN sub_100B3507:PROC
.CODE
FUN_100b32d7 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    push push esi
    push push edi
    xor xor edi, edi
    cmp cmp dword ptr [ebp + 20], edi
    mov mov esi, ecx
    mov mov dword ptr [ebp - 4], edi
    je L0
    mov mov dword ptr [ebp - 4], 0F0000h
    jmp L4
    mov mov eax, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    test test byte ptr [eax + 61], 2
    je L1
    mov mov dword ptr [ebp - 4], 0100000h
    cmp cmp dword ptr [ebp + 12], edi
    jbe L8
    mov mov eax, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax + edi*4]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 16]
    xor xor ebx, ebx
    sub sub eax, ebx
    je L5
    dec dec eax
    je L3
    dec dec eax
    je L2
    dec dec eax
    jne L6
    mov mov ebx, 080000h
    jmp L7
    mov mov ebx, 040000h
    jmp L8
    mov mov ebx, 020000h
    jmp L9
    mov mov ebx, 010000h
    mov mov eax, dword ptr [ebp - 4]
    test test eax, ebx
    je L10
    mov mov eax, dword ptr [esi + 0100h]
    push push 010115D0Ch
    push push 012D5h
    push push dword ptr [eax + 60]
    push push esi
    call sub_1008B14B
    add add esp, 16
    or or dword ptr [ebp - 4], ebx
    inc inc edi
    cmp cmp edi, dword ptr [ebp + 12]
    jb L8
    mov mov eax, dword ptr [esi + 0CCh]
    test test al, 32
    jne sub_100B346E
    xor xor ecx, ecx
    cmp cmp ecx, dword ptr [ebp + 12]
    jae sub_100B3473
    mov mov edi, dword ptr [esi + 20]
    mov mov eax, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax + ecx*4]
L2:
    mov mov eax, dword ptr [edi + eax*4]
    test test byte ptr [eax + 3], 2
L4:
    jne sub_100B347C
    mov mov edx, dword ptr [eax + 4]
    mov mov ebx, dword ptr [esi + 16]
    mov mov edx, dword ptr [ebx + edx*4]
    test test byte ptr [edx + 4], 1
L6:
    je sub_100B3491
    cmp cmp dword ptr [eax + 72], -1
    je sub_100B3497
    cmp cmp dword ptr [eax + 84], -1
    jne sub_100B349D
L8:
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp + 12]
    jb sub_100B3473
    cmp cmp ecx, dword ptr [ebp + 12]
    jne sub_100B34B1
    or or byte ptr [ebp - 2], 32
    test test byte ptr [esi + 0CCh], 1
    je sub_100B34F8
    xor xor ecx, ecx
    cmp cmp dword ptr [esi + 0124h], ecx
    je sub_100B3502
    cmp cmp dword ptr [ebp + 12], ecx
    jbe sub_100B3507
    mov mov eax, dword ptr [esi + 0128h]
    mov mov edi, dword ptr [ebp + 8]
    mov mov edi, dword ptr [edi + ecx*4]
    mov mov edx, dword ptr [esi + 0124h]
    lea lea eax, [eax + eax*2]
    lea lea eax, [ecx + eax*2]
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp + 12]
    mov mov dword ptr [edx + eax*4 - 16], edi
    jb sub_100B3507
    mov mov eax, dword ptr [ebp + 16]
    mov mov ecx, dword ptr [ebp - 4]
    pop pop edi
    pop pop esi
    mov mov dword ptr [eax], ecx
    xor xor eax, eax
    pop pop ebx
    leave leave
    ret ret 16
FUN_100b32d7 ENDP
END
