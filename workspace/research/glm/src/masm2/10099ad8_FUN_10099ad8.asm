.686
.MODEL FLAT, C
EXTRN sub_100995DE:PROC
EXTRN sub_10099B62:PROC
EXTRN sub_10099B6D:PROC
EXTRN sub_10099B72:PROC
EXTRN sub_10099B91:PROC
EXTRN sub_10099B98:PROC
EXTRN sub_10099BAA:PROC
EXTRN sub_10099BB1:PROC
.CODE
FUN_10099ad8 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    push push edi
    mov mov edi, ecx
    test test esi, esi
    je L6
    mov mov eax, dword ptr [esi + 4]
    cmp cmp eax, 1
    jne L2
    push push dword ptr [esi + 8]
    mov mov ecx, edi
    call L0
L0:
    test test eax, eax
    je sub_10099B6D
    mov mov esi, dword ptr [esi + 12]
    jmp L1
    sub sub eax, 6
    je L8
    dec dec eax
    dec dec eax
    je L7
    dec dec eax
    je sub_10099B72
L1:
    dec dec eax
    dec dec eax
    jne sub_10099B62
    mov mov esi, dword ptr [esi + 32]
    jmp L3
    mov mov esi, dword ptr [esi + 16]
L2:
    jmp L4
    mov mov esi, dword ptr [esi + 24]
    jmp L5
    xor xor eax, eax
L3:
    inc inc eax
    jmp sub_10099B98
    push push 01010F7B0h
    push push 0
L5:
    push push 0
    push push edi
    call sub_100995DE
    add add esp, 16
    jmp sub_10099BAA
    mov mov esi, dword ptr [esi + 16]
    test test esi, esi
    jl sub_10099BB1
    cmp cmp esi, 2
    jle sub_10099B91
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebp
L7:
    ret ret 4
FUN_10099ad8 ENDP
END
