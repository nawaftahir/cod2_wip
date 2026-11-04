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
EXTRN sub_1009A7B1:PROC
EXTRN sub_1009A7C2:PROC
EXTRN sub_1009A7CE:PROC
EXTRN sub_1009A7DF:PROC
EXTRN sub_1009A7F4:PROC
EXTRN sub_1009A801:PROC
EXTRN sub_1009A817:PROC
EXTRN sub_1009A825:PROC
EXTRN sub_1009A852:PROC
EXTRN sub_1009A85A:PROC
EXTRN sub_1009A864:PROC
EXTRN sub_1009A876:PROC
EXTRN sub_1009A88B:PROC
EXTRN sub_1009A89C:PROC
EXTRN sub_1009A8AF:PROC
EXTRN sub_1009A8BB:PROC
.CODE
FUN_1009a695 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push edi
    mov mov edi, dword ptr [ebp + 12]
    test test edi, edi
    mov mov dword ptr [ebp - 4], ecx
    je L1
    mov mov eax, dword ptr [edi + 24]
    imul imul eax, dword ptr [edi + 20]
    cmp cmp eax, 1
    jne L0
    push push dword ptr [edi + 16]
    call sub_10099AFD
    test test eax, eax
    jne L2
    push push 01011499Ch
    push push 0BCBh
    add add edi, 48
    push push edi
    push push dword ptr [ebp - 4]
    call sub_1009951C
    add add esp, 16
    xor xor eax, eax
    jmp sub_1009A7F4
    push push esi
    push push 36
    call sub_100650BF
    test test eax, eax
    je L3
    mov mov ecx, eax
    call sub_100831B5
    mov mov esi, eax
    jmp L4
    xor xor esi, esi
    test test esi, esi
    jne L5
    xor xor eax, eax
    jmp sub_1009A817
    cmp cmp dword ptr [ebp + 16], 0
    mov mov ecx, dword ptr [ebp + 8]
    push push ebx
    mov mov ebx, dword ptr [ebp + 20]
    mov mov dword ptr [esi + 16], 3
    jne sub_1009A7B1
    test test ecx, ecx
    jne L6
    mov mov dword ptr [esi + 16], 4
    jmp sub_1009A7CE
    cmp cmp ecx, ebx
    jne sub_1009A7C2
    mov mov dword ptr [esi + 16], 5
    xor xor ecx, ecx
    test test ecx, ecx
    je sub_1009A7DF
    mov mov eax, dword ptr [ecx]
    call call dword ptr [eax + 4]
    test test eax, eax
    mov mov dword ptr [esi + 20], eax
    je sub_1009A852
    test test edi, edi
    je sub_1009A801
    mov mov eax, dword ptr [edi]
    mov mov ecx, edi
    call call dword ptr [eax + 4]
    test test eax, eax
    mov mov dword ptr [esi + 24], eax
    je sub_1009A864
    test test ebx, ebx
    je sub_1009A825
    mov mov eax, dword ptr [ebx]
    mov mov ecx, ebx
    call call dword ptr [eax + 4]
    test test eax, eax
    mov mov dword ptr [esi + 28], eax
    je sub_1009A876
    cmp cmp dword ptr [ebp + 16], 0
L5:
    je sub_1009A85A
    push push dword ptr [ebp + 16]
    mov mov ecx, dword ptr [ebp - 4]
    call sub_1009A690
    test test eax, eax
    je sub_1009A88B
    push push eax
    push push dword ptr [esi + 28]
    call sub_1008291C
    mov mov dword ptr [esi + 28], eax
    push push 20
    call sub_10065165
    test test eax, eax
    je sub_1009A89C
    push push 010114734h
    push push 0
    push push esi
    mov mov ecx, eax
    call sub_1008297C
    jmp sub_1009A8AF
    xor xor eax, eax
    test test eax, eax
    jne sub_1009A8BB
    xor xor eax, eax
    pop pop ebx
    pop pop esi
    pop pop edi
    leave leave
    ret ret 16
FUN_1009a695 ENDP
END
