.686
.MODEL FLAT, C
EXTRN sub_10068CE7:PROC
EXTRN sub_1006A889:PROC
EXTRN sub_100C4DA1:PROC
EXTRN sub_100C7BCF:PROC
EXTRN sub_100C7BE1:PROC
EXTRN sub_100C7BF3:PROC
EXTRN sub_100C7C01:PROC
EXTRN sub_100C991B:PROC
EXTRN sub_100C9E21:PROC
EXTRN sub_100C9E38:PROC
EXTRN sub_100C9E4C:PROC
EXTRN sub_100C9E5E:PROC
EXTRN sub_100C9E6C:PROC
EXTRN sub_100C9E7A:PROC
EXTRN sub_100C9E85:PROC
EXTRN sub_100C9E90:PROC
EXTRN sub_100C9E94:PROC
EXTRN sub_100C9EC4:PROC
EXTRN sub_100F600B:PROC
.CODE
FUN_100c9c78 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    push push ebx
    mov mov ebx, ecx
    cmp cmp dword ptr [ebx + 0158h], 0
    push push esi
    jne L6
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp eax, 0800h
    jae L0
    and and eax, 07FFh
    or or eax, 0A0000000h
    jmp L2
    cmp cmp eax, 01000h
    jae L1
    and and eax, 07FFh
    or or eax, 0B0000800h
    jmp L4
    cmp cmp eax, 01800h
    jae L3
    and and eax, 07FFh
    or or eax, 0C0000800h
    jmp L5
    and and eax, 07FFh
    or or eax, 0D0000800h
    push push 81
    mov mov ecx, ebx
    mov mov esi, eax
    call sub_100C991B
    test test eax, eax
    jl sub_100C9E21
    mov mov eax, dword ptr [ebx]
    push push 0
    push push 0F0000h
    push push esi
    mov mov ecx, ebx
    call call dword ptr [eax + 100]
    test test eax, eax
    jl sub_100C9E38
    mov mov esi, dword ptr [ebp + 12]
    push push dword ptr [esi]
L2:
    mov mov ecx, ebx
    call sub_100C7BCF
    test test eax, eax
    jl sub_100C9E4C
    push push dword ptr [esi + 4]
    mov mov ecx, ebx
    call sub_100C7BE1
    test test eax, eax
    jl sub_100C9E5E
    push push dword ptr [esi + 8]
    mov mov ecx, ebx
L5:
    call sub_100C7BF3
    test test eax, eax
    jl sub_100C9E6C
    push push dword ptr [esi + 12]
    mov mov ecx, ebx
    call sub_100C7C01
    test test eax, eax
    jl sub_100C9E7A
    mov mov eax, dword ptr [ebx]
    mov mov ecx, ebx
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100C9E85
    mov mov ecx, ebx
    call sub_100C4DA1
    test test eax, eax
    jl sub_100C9E90
    xor xor eax, eax
    jmp sub_100C9E94
    push push edi
    push push dword ptr [ebp + 8]
    lea lea eax, [ebp - 32]
    push push 01011A7CCh
    push push eax
    call sub_100F600B
    add add esp, 12
    xor xor edi, edi
    inc inc edi
    push push edi
L6:
    push push dword ptr [ebp + 8]
    lea lea eax, [ebp - 32]
    lea lea esi, [ebx + 01B4h]
    push push eax
    mov mov ecx, esi
    call sub_1006A889
    test test eax, eax
    jl sub_100C9EC4
    lea lea eax, [ebp - 32]
    push push eax
    mov mov ecx, esi
    call sub_10068CE7
    mov mov esi, dword ptr [ebp + 12]
    mov mov dword ptr [eax + 12], edi
    lea lea edi, [eax + 16]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    inc inc dword ptr [ebx + 01F4h]
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
FUN_100c9c78 ENDP
END
