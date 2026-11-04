.686
.MODEL FLAT, C
EXTRN sub_1008B1A4:PROC
EXTRN sub_100A7E81:PROC
EXTRN sub_100A7ECE:PROC
EXTRN sub_100A7EE3:PROC
EXTRN sub_100A7EF8:PROC
EXTRN sub_100B0CC8:PROC
EXTRN sub_100B0CDB:PROC
EXTRN sub_100B0CED:PROC
EXTRN sub_100B0CEE:PROC
EXTRN sub_100B0D6A:PROC
EXTRN sub_100B0DA5:PROC
EXTRN sub_100B0DAE:PROC
EXTRN sub_100B0DBA:PROC
EXTRN sub_100B0DCF:PROC
EXTRN sub_100B0DDE:PROC
EXTRN sub_100B0DFE:PROC
.CODE
FUN_100b0b4e PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 36
    mov mov edx, dword ptr [ebp + 16]
    push push ebx
    mov mov ebx, ecx
    xor xor ecx, ecx
    push push esi
    xor xor eax, eax
    inc inc ecx
    test test edx, 010000h
    push push edi
    mov mov dword ptr [ebp - 4], ebx
    je L0
    mov mov dword ptr [ebp - 20], eax
    mov mov eax, ecx
    test test edx, 020000h
    je L1
    mov mov dword ptr [ebp + eax*4 - 20], ecx
    inc inc eax
    test test edx, 040000h
    je L2
    mov mov dword ptr [ebp + eax*4 - 20], 2
    inc inc eax
    test test edx, 080000h
    je L3
    mov mov dword ptr [ebp + eax*4 - 20], 3
    inc inc eax
    mov mov esi, dword ptr [ebp + 12]
    cmp cmp esi, eax
    jbe L4
    mov mov esi, eax
    or or eax, -1
    lea lea edi, [ebp - 36]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    xor xor ecx, ecx
    test test esi, esi
    stosd stosd dword ptr es:[edi], eax
    jbe L5
    mov mov eax, dword ptr [ebp + 8]
    mov mov edx, dword ptr [ebx + 20]
    lea lea edi, [ebp - 20]
    sub sub eax, edi
    mov mov ebx, dword ptr [ebp + ecx*4 - 20]
    lea lea edi, [eax + ecx*4]
    mov mov edi, dword ptr [ebp + edi - 20]
    mov mov edi, dword ptr [edx + edi*4]
    mov mov edi, dword ptr [edi + 16]
    inc inc ecx
    cmp cmp ecx, esi
    mov mov dword ptr [ebp + ebx*4 - 36], edi
    jb L6
    mov mov ebx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebx + 0C8h]
    and and eax, 0FFFFh
    cmp cmp eax, 0104h
    jne sub_100B0CEE
    mov mov edi, 0101A3FD0h
    xor xor esi, esi
    mov mov ebx, edi
    mov mov ecx, dword ptr [ebp - 4]
    push push ebx
    lea lea eax, [ebp - 36]
    push push eax
L4:
    call sub_100A7E81
    test test eax, eax
    jne sub_100B0CDB
    inc inc esi
    add add ebx, 16
    cmp cmp esi, 5
    jb sub_100B0CC8
    jmp sub_100B0CED
    shl shl esi, 4
    add add esi, edi
    jne sub_100B0D6A
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax + 0100h]
    push push 010117880h
    push push 011B5h
    push push dword ptr [ecx + 60]
    push push eax
    call sub_1008B1A4
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_100B0DAE
    mov mov esi, 0101A4000h
    push push esi
    lea lea eax, [ebp - 36]
L5:
    push push eax
    mov mov ecx, ebx
    call sub_100A7ECE
L6:
    test test eax, eax
    jne sub_100B0DA5
    mov mov esi, 0101A4010h
    push push esi
    lea lea eax, [ebp - 36]
    push push eax
    mov mov ecx, ebx
    call sub_100A7EE3
    test test eax, eax
    jne sub_100B0DBA
    mov mov edi, 0101A3FF0h
    push push edi
    lea lea eax, [ebp - 36]
    push push eax
    mov mov ecx, ebx
    call sub_100A7EF8
    test test eax, eax
    je sub_100B0DCF
    mov mov eax, dword ptr [ebp + 16]
    and and eax, 0F0000h
    cmp cmp eax, 080000h
    jne sub_100B0DDE
    mov mov esi, edi
    push push 16
    xor xor edx, edx
    pop pop ecx
    mov mov eax, esi
    mov mov esi, dword ptr [eax]
    shl shl esi, cl
    add add eax, 4
    or or edx, esi
    inc inc ecx
    inc inc ecx
    cmp cmp ecx, 24
    jb sub_100B0DFE
    mov mov eax, dword ptr [ebp + 20]
    mov mov dword ptr [eax], edx
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 16
FUN_100b0b4e ENDP
END
