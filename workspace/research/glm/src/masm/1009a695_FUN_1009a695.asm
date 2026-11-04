.686
.MODEL FLAT, C
EXTRN sub_100650BF:PROC
EXTRN sub_10065165:PROC
EXTRN sub_1008291C:PROC
EXTRN sub_1008297C:PROC
EXTRN sub_100831B5:PROC
EXTRN sub_1009951C:PROC
EXTRN sub_10099AFD:PROC
EXTRN sub_1009A690:PROC
.CODE
FUN_1009a695 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push edi
    mov edi, dword ptr [ebp + 12]
    test edi, edi
    mov dword ptr [ebp - 4], ecx
    je L1
    mov eax, dword ptr [edi + 24]
    imul eax, dword ptr [edi + 20]
    cmp eax, 1
    jne L0
    push dword ptr [edi + 16]
    call sub_10099AFD
    test eax, eax
    jne L1
L0:
    push 01011499Ch
    push 000000BCBh
    add edi, 48
    push edi
    push dword ptr [ebp - 4]
    call sub_1009951C
    add esp, 16
    xor eax, eax
    jmp L16
L1:
    push esi
    push 36
    call sub_100650BF
    test eax, eax
    je L2
    mov ecx, eax
    call sub_100831B5
    mov esi, eax
    jmp L3
L2:
    xor esi, esi
L3:
    test esi, esi
    jne L4
    xor eax, eax
    jmp L15
L4:
    cmp dword ptr [ebp + 16], 0
    mov ecx, dword ptr [ebp + 8]
    push ebx
    mov ebx, dword ptr [ebp + 20]
    mov dword ptr [esi + 16], 3
    jne L6
    test ecx, ecx
    jne L5
    mov dword ptr [esi + 16], 4
    jmp L7
L5:
    cmp ecx, ebx
    jne L6
    mov dword ptr [esi + 16], 5
    xor ecx, ecx
L6:
    test ecx, ecx
    je L7
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    test eax, eax
    mov dword ptr [esi + 20], eax
    je L13
L7:
    test edi, edi
    je L8
    mov eax, dword ptr [edi]
    mov ecx, edi
    call dword ptr [eax + 4]
    test eax, eax
    mov dword ptr [esi + 24], eax
    je L13
L8:
    test ebx, ebx
    je L9
    mov eax, dword ptr [ebx]
    mov ecx, ebx
    call dword ptr [eax + 4]
    test eax, eax
    mov dword ptr [esi + 28], eax
    je L13
L9:
    cmp dword ptr [ebp + 16], 0
    je L10
    push dword ptr [ebp + 16]
    mov ecx, dword ptr [ebp - 4]
    call sub_1009A690
    test eax, eax
    je L13
    push eax
    push dword ptr [esi + 28]
    call sub_1008291C
    mov dword ptr [esi + 28], eax
L10:
    push 20
    call sub_10065165
    test eax, eax
    je L11
    push 010114734h
    push 0
    push esi
    mov ecx, eax
    call sub_1008297C
    jmp L12
L11:
    xor eax, eax
L12:
    test eax, eax
    jne L14
L13:
    xor eax, eax
L14:
    pop ebx
L15:
    pop esi
L16:
    pop edi
    leave
    ret 16
FUN_1009a695 ENDP
END
