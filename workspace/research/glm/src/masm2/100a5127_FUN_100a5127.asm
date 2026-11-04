.686
.MODEL FLAT, C
EXTRN sub_1008B15E:PROC
EXTRN sub_100A51EF:PROC
EXTRN sub_100A51F1:PROC
EXTRN sub_100A51FD:PROC
EXTRN sub_100A5205:PROC
EXTRN sub_100A5222:PROC
EXTRN sub_100A5232:PROC
EXTRN sub_100A5244:PROC
EXTRN sub_100A524E:PROC
EXTRN sub_100A524F:PROC
EXTRN sub_100A5253:PROC
EXTRN sub_100C4D37:PROC
EXTRN sub_100C7B80:PROC
EXTRN sub_100C98D5:PROC
.CODE
FUN_100a5127 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    mov mov esi, ecx
    cmp cmp dword ptr [esi + 0158h], 0
    je L0
    xor xor eax, eax
    jmp sub_100A51F1
    push push 0200001Fh
    mov mov ecx, esi
    call sub_100C98D5
    test test eax, eax
    jl sub_100A5205
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    mov mov eax, dword ptr [edi + 60]
    cmp cmp eax, 0200000h
    jne L1
    push push 090000000h
    mov mov ecx, esi
    call sub_100C7B80
    test test eax, eax
    jl sub_100A5222
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
    jl sub_100A5244
    mov mov ecx, esi
    call sub_100C4D37
    test test eax, eax
    jl sub_100A524F
    xor xor eax, eax
    jmp sub_100A5253
    cmp cmp eax, 0400000h
    jne sub_100A5232
    push push 0A0000000h
    jmp sub_100A51EF
    cmp cmp eax, 0800000h
    jne sub_100A524E
    push push 098000000h
    jmp sub_100A51FD
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
FUN_100a5127 ENDP
END
