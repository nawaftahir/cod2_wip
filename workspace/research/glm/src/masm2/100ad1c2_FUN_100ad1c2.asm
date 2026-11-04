.686
.MODEL FLAT, C
EXTRN sub_1008B256:PROC
EXTRN sub_100AD3B4:PROC
EXTRN sub_100AD3BA:PROC
EXTRN sub_100AD420:PROC
EXTRN sub_100AD425:PROC
EXTRN sub_100AD42F:PROC
EXTRN sub_100AD437:PROC
EXTRN sub_100AD438:PROC
EXTRN sub_100AD439:PROC
EXTRN sub_100AD43B:PROC
EXTRN sub_100AD442:PROC
EXTRN sub_100AD487:PROC
EXTRN sub_100AD49E:PROC
EXTRN sub_100AD4A4:PROC
EXTRN sub_100AD4D0:PROC
EXTRN sub_100AD4EE:PROC
.CODE
FUN_100ad1c2 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    push push ebx
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 16], eax
    push push esi
    push push edi
    mov mov dword ptr [ebp - 16], ecx
    mov mov dword ptr [ebp - 4], eax
    jbe L12
    mov mov ecx, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ecx + eax*4]
    xor xor edi, edi
    cmp cmp ecx, edi
    mov mov dword ptr [ebp - 8], ecx
    je L14
    mov mov eax, dword ptr [ecx]
    cmp cmp eax, edi
    je L15
    mov mov edx, eax
    and and edx, 0FFF00000h
    and and eax, 0FFFFFh
    cmp cmp edx, 060000000h
    je L0
    cmp cmp edx, 060500000h
    je L2
    cmp cmp edx, 060A00000h
    je L3
    cmp cmp edx, 060F00000h
    je L4
    cmp cmp edx, 072100000h
    je L6
    cmp cmp dword ptr [ebp + 24], edi
    jbe sub_100AD3B4
    mov mov eax, dword ptr [ecx + 4]
    and and dword ptr [ebp - 8], 0
    test test eax, eax
    jbe L7
    mov mov eax, dword ptr [ebp + 20]
    mov mov esi, dword ptr [eax + edi*4]
    mov mov edx, dword ptr [ecx + 8]
    mov mov eax, dword ptr [edx]
    cmp cmp eax, esi
    je L1
    mov mov ebx, dword ptr [ebp - 16]
    mov mov ebx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ebx + eax*4]
    cmp cmp dword ptr [eax + 56], esi
    jne L9
    mov mov eax, dword ptr [ebp + 12]
    mov mov ebx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax + ebx*4]
    test test eax, eax
    je L10
    mov mov ebx, dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp + 8], ebx
    jae L11
    mov mov eax, dword ptr [eax]
    test test eax, eax
    je L13
    and and eax, 0FFF00000h
    cmp cmp eax, 011000000h
    jne sub_100AD420
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ecx + 4]
    add add edx, 4
    cmp cmp dword ptr [ebp - 8], eax
    jb L8
    inc inc edi
    cmp cmp edi, dword ptr [ebp + 24]
    jb L5
    jmp sub_100AD420
    cmp cmp edx, 072100000h
    jne sub_100AD3B4
    xor xor ebx, ebx
    jmp sub_100AD3BA
    mov mov ebx, eax
    xor xor edx, edx
    cmp cmp dword ptr [ebp + 24], edi
    mov mov dword ptr [ebp - 20], edx
    jbe sub_100AD438
    mov mov eax, dword ptr [ecx + 4]
    cmp cmp ebx, eax
    mov mov dword ptr [ebp - 12], ebx
    jae sub_100AD439
    mov mov eax, dword ptr [ebp + 20]
    mov mov edi, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [ecx + 8]
    lea lea edx, [eax + ebx*4]
    mov mov esi, dword ptr [edx]
    cmp cmp esi, edi
    jne sub_100AD425
    mov mov eax, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax + ecx*4]
    test test eax, eax
    je sub_100AD42F
    mov mov ecx, dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp + 8], ecx
    jae sub_100AD437
    cmp cmp dword ptr [eax], 0
    jne sub_100AD487
    mov mov ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 16]
    mov mov eax, dword ptr [eax + 20]
    mov mov eax, dword ptr [eax + esi*4]
    test test byte ptr [eax + 62], 31
L2:
    jne sub_100AD49E
    cmp cmp dword ptr [eax + 56], -1
    jne sub_100AD4A4
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ecx + 4]
    add add edx, 4
    cmp cmp dword ptr [ebp - 12], eax
L4:
    jb sub_100AD442
    mov mov edx, dword ptr [ebp - 20]
    inc inc edx
    cmp cmp edx, dword ptr [ebp + 24]
    mov mov dword ptr [ebp - 20], edx
    jb sub_100AD43B
    mov mov eax, dword ptr [ebp - 4]
L7:
    inc inc eax
    cmp cmp eax, dword ptr [ebp + 16]
    mov mov dword ptr [ebp - 4], eax
    jb L12
    xor xor eax, eax
L9:
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 20
    xor xor eax, eax
    inc inc eax
    jmp sub_100AD4D0
    push push 0101172FCh
    push push 012C6h
    push push 0
    push push dword ptr [ebp - 16]
L13:
    call sub_1008B256
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_100AD4EE
FUN_100ad1c2 ENDP
END
