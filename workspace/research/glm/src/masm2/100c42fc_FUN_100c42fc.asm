.686
.MODEL FLAT, C
EXTRN sub_1008B19B:PROC
EXTRN sub_100C4460:PROC
EXTRN sub_100C4464:PROC
EXTRN sub_100C4472:PROC
EXTRN sub_100C4479:PROC
EXTRN sub_100C447D:PROC
EXTRN sub_100C4480:PROC
EXTRN sub_100C4484:PROC
EXTRN sub_100C4487:PROC
EXTRN sub_100C44B7:PROC
EXTRN sub_100C450B:PROC
EXTRN sub_100C4512:PROC
EXTRN sub_100C4521:PROC
EXTRN sub_100C4527:PROC
EXTRN sub_100C456C:PROC
EXTRN sub_100C4574:PROC
EXTRN sub_100C4579:PROC
.CODE
FUN_100c42fc PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    mov mov edx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [edx]
    push push ebx
    push push esi
    mov mov esi, ecx
    push push edi
    mov mov edi, dword ptr [esi + 20]
    mov mov eax, dword ptr [edi + eax*4]
    mov mov eax, dword ptr [eax + 60]
    xor xor ecx, ecx
    test test ah, 4
    mov mov dword ptr [ebp - 8], ecx
    mov mov dword ptr [ebp - 4], ecx
    je L0
    mov mov dword ptr [ebp - 4], 01000000h
    jmp L3
    test test ah, 8
    je L1
    mov mov dword ptr [ebp - 4], 02000000h
    jmp L5
    test test ah, 16
    je L2
    mov mov dword ptr [ebp - 4], 03000000h
    jmp L6
    test test ah, 32
    je L4
    mov mov dword ptr [ebp - 4], 0F000000h
    jmp L8
    test test ah, 64
    je L7
    mov mov dword ptr [ebp - 4], 0E000000h
    jmp L9
    test test ah, ah
    jns L10
    mov mov dword ptr [ebp - 4], 0D000000h
L1:
    test test ah, 2
    je L11
    or or byte ptr [ebp - 2], 16
    cmp cmp dword ptr [ebp + 20], ecx
    je L12
    mov mov dword ptr [ebp - 8], 0F0000h
    jmp sub_100C447D
    xor xor edi, edi
    cmp cmp dword ptr [ebp + 12], ecx
L2:
    jbe sub_100C4484
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [edx + edi*4]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 16]
    xor xor ecx, ecx
    xor xor ebx, ebx
    sub sub eax, ecx
L3:
    je sub_100C4464
    dec dec eax
    je sub_100C4460
    dec dec eax
    je L13
L4:
    dec dec eax
    jne sub_100C4472
    mov mov ebx, 080000h
    jmp sub_100C4479
    mov mov ebx, 040000h
    jmp sub_100C4480
    mov mov ebx, 020000h
    jmp sub_100C4487
    mov mov ebx, 010000h
    test test dword ptr [ebp - 8], ebx
    je sub_100C44B7
L8:
    mov mov eax, dword ptr [esi + 0100h]
    push push 010115D0Ch
    push push 012D5h
    push push dword ptr [eax + 60]
    push push esi
    call sub_1008B19B
    mov mov edx, dword ptr [ebp + 8]
    add add esp, 16
    xor xor ecx, ecx
    or or dword ptr [ebp - 8], ebx
    inc inc edi
    cmp cmp edi, dword ptr [ebp + 12]
    jb sub_100C4484
    test test byte ptr [esi + 110], 080h
    je sub_100C4512
    test test byte ptr [ebp - 6], 8
    jne sub_100C450B
    mov mov dword ptr [ebp - 8], 070000h
    jmp sub_100C4521
    test test byte ptr [ebp - 6], 7
    je sub_100C4527
    mov mov dword ptr [ebp - 8], 0F0000h
    test test byte ptr [esi + 0CCh], 1
    je sub_100C456C
    cmp cmp dword ptr [esi + 0124h], ecx
    je sub_100C4574
    cmp cmp dword ptr [ebp + 12], ecx
    jbe sub_100C4579
    mov mov eax, dword ptr [esi + 0128h]
    mov mov ebx, dword ptr [edx + ecx*4]
    mov mov edi, dword ptr [esi + 0124h]
    lea lea eax, [eax + eax*2]
    lea lea eax, [ecx + eax*2]
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp + 12]
    mov mov dword ptr [edi + eax*4 - 16], ebx
    jb sub_100C4579
    mov mov eax, dword ptr [ebp - 4]
    or or eax, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp + 16]
    pop pop edi
    pop pop esi
    mov mov dword ptr [ecx], eax
    xor xor eax, eax
    pop pop ebx
    leave leave
    ret ret 16
FUN_100c42fc ENDP
END
