.686
.MODEL FLAT, C
EXTRN sub_1008B2B1:PROC
EXTRN sub_100C5D1F:PROC
EXTRN sub_100C7486:PROC
EXTRN sub_100C748B:PROC
EXTRN sub_100C7494:PROC
EXTRN sub_100C749A:PROC
EXTRN sub_100C74CB:PROC
EXTRN sub_100C74D1:PROC
EXTRN sub_100C74E4:PROC
EXTRN sub_100C7514:PROC
EXTRN sub_100C752E:PROC
EXTRN sub_100C7531:PROC
EXTRN sub_100C7551:PROC
EXTRN sub_100C75A0:PROC
EXTRN sub_100C75C7:PROC
EXTRN EXTRN g_1019BC88:DWORD:DWORD
.CODE
FUN_100c72c8 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    and and dword ptr [ebp - 4], 0
    push push esi
    xor xor edx, edx
    mov mov esi, ecx
    mov mov ecx, dword ptr [ebp + 8]
    inc inc edx
    test test ecx, ecx
    push push edi
    je L0
    mov mov dword ptr [ebp - 4], edx
    jmp L1
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov dword ptr [ebp + 8], ecx
    mov mov eax, dword ptr [ecx]
    mov mov edi, eax
    and and edi, 0FFF00000h
    cmp cmp edi, 020400000h
    je L2
    mov mov eax, edx
    jmp sub_100C748B
    and and eax, 0FFFFFh
    mov mov edx, eax
    mov mov eax, dword ptr [ecx + 8]
    mov mov ecx, dword ptr [esi + 16]
    push push ebx
    lea lea edi, [eax + edx*4]
    mov mov ebx, dword ptr [edi]
    mov mov dword ptr [ebp - 20], edx
    mov mov edx, dword ptr [esi + 20]
    mov mov ebx, dword ptr [edx + ebx*4]
    mov mov ebx, dword ptr [ebx + 4]
    mov mov ebx, dword ptr [ecx + ebx*4]
    test test byte ptr [ebx + 5], 1
    je L3
    mov mov dword ptr [ebp - 16], eax
    mov mov eax, edi
    jmp L4
    mov mov ebx, dword ptr [eax]
    mov mov ebx, dword ptr [edx + ebx*4]
    mov mov ebx, dword ptr [ebx + 4]
    mov mov ecx, dword ptr [ecx + ebx*4]
L2:
    test test byte ptr [ecx + 5], 1
    je sub_100C74CB
    mov mov dword ptr [ebp - 16], edi
    mov mov ebx, dword ptr [esi + 0100h]
    cmp cmp ebx, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ebp - 16]
    je L5
    mov mov ecx, dword ptr [ebx + 8]
    xor xor edi, edi
    cmp cmp dword ptr [ebp - 20], edi
    mov mov dword ptr [esi + 015Ch], edi
    mov mov dword ptr [ebp - 12], edi
    jbe sub_100C7494
    mov mov dword ptr [ebp - 8], eax
    sub sub dword ptr [ebp - 8], ecx
    mov mov eax, dword ptr [ebp - 8]
    fld fld qword ptr [g_1019BC88]
    mov mov eax, dword ptr [eax + ecx]
    mov mov eax, dword ptr [edx + eax*4]
    fld fld qword ptr [eax + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_100C7514
    cmp cmp dword ptr [ebp - 4], edi
    jne sub_100C7486
    mov mov eax, dword ptr [ecx]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [eax + 60]
    and and eax, 01F0000h
    cmp cmp eax, 080000h
    jne sub_100C7531
    mov mov eax, dword ptr [ecx]
    mov mov edi, dword ptr [edx + eax*4]
    test test byte ptr [edi + 61], 2
    jne sub_100C74D1
    xor xor eax, eax
L4:
    cmp cmp dword ptr [ebp - 4], eax
    sete sete al
    lea lea eax, [eax*4 + 20]
    test test dword ptr [edi], eax
    jne sub_100C74E4
    mov mov dword ptr [esi + 015Ch], 1
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 12]
    add add ecx, 4
    xor xor edi, edi
    cmp cmp eax, dword ptr [ebp - 20]
    jb sub_100C749A
    cmp cmp dword ptr [ebp - 4], edi
    mov mov ecx, esi
    push push edi
    je sub_100C752E
    push push dword ptr [ebp + 8]
    mov mov eax, 010000h
    push push eax
    push push dword ptr [ebx + 8]
    push push edi
    push push eax
    jmp sub_100C7551
    push push edi
    push push 090000h
    push push dword ptr [ebp - 16]
    push push 080000h
    push push 010000h
    call sub_100C5D1F
    cmp cmp dword ptr [esi + 015Ch], 2
    mov mov edi, eax
    jne sub_100C75A0
    mov mov eax, dword ptr [esi + 0100h]
    push push 01011A588h
    push push 0125Eh
    push push dword ptr [eax + 60]
    push push esi
    call sub_1008B2B1
    add add esp, 16
    mov mov eax, edi
    jmp sub_100C75C7
    xor xor eax, eax
    inc inc eax
    pop pop ebx
    pop pop edi
    pop pop esi
    leave leave
    ret ret 4
FUN_100c72c8 ENDP
END
