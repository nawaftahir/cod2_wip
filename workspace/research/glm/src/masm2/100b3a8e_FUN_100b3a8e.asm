.686
.MODEL FLAT, C
EXTRN sub_1008B15E:PROC
EXTRN sub_100B3B56:PROC
EXTRN sub_100B3B58:PROC
EXTRN sub_100B3B64:PROC
EXTRN sub_100B3B6C:PROC
EXTRN sub_100B3B89:PROC
EXTRN sub_100B3B99:PROC
EXTRN sub_100B3BAB:PROC
EXTRN sub_100B3BB5:PROC
EXTRN sub_100B3BB6:PROC
EXTRN sub_100B3BBA:PROC
EXTRN sub_100C4D37:PROC
EXTRN sub_100C7B80:PROC
EXTRN sub_100C98D5:PROC
.CODE
FUN_100b3a8e PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    mov mov esi, ecx
    cmp cmp dword ptr [esi + 0158h], 0
    je L0
    xor xor eax, eax
    jmp sub_100B3B58
    push push 0200001Fh
    mov mov ecx, esi
    call sub_100C98D5
    test test eax, eax
    jl sub_100B3B6C
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    mov mov eax, dword ptr [edi + 60]
    cmp cmp eax, 0200000h
    jne L1
    push push 090000000h
    mov mov ecx, esi
    call sub_100C7B80
    test test eax, eax
    jl sub_100B3B89
    mov mov ecx, dword ptr [edi + 12]
    mov mov eax, dword ptr [esi]
    push push 0
    and and ecx, 07FFh
    or or ecx, 0A0000800h
    push push 0F0000h
    push push ecx
    mov mov ecx, esi
    call call dword ptr [eax + 100]
    test test eax, eax
    jl sub_100B3BAB
    mov mov ecx, esi
    call sub_100C4D37
    test test eax, eax
    jl sub_100B3BB6
    xor xor eax, eax
    jmp sub_100B3BBA
    cmp cmp eax, 0400000h
    jne sub_100B3B99
    push push 0A0000000h
    jmp sub_100B3B56
    cmp cmp eax, 0800000h
    jne sub_100B3BB5
    push push 098000000h
    jmp sub_100B3B64
    push push 010115C80h
    push push 012CEh
    push push 0
    push push esi
    call sub_1008B15E
    add add esp, 16
    mov mov eax, 080004005h
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret 4
FUN_100b3a8e ENDP
END
