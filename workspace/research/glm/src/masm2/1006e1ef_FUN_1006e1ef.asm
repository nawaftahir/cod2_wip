.686
.MODEL FLAT, C
EXTRN sub_1006DD03:PROC
EXTRN sub_1006E26E:PROC
EXTRN sub_1006E281:PROC
EXTRN sub_1006E288:PROC
EXTRN sub_1006E28D:PROC
EXTRN sub_1006E2B0:PROC
EXTRN sub_1006E2B7:PROC
EXTRN sub_1006E2C9:PROC
EXTRN sub_1006E2D0:PROC
.CODE
FUN_1006e1ef PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    mov mov ebx, ecx
    test test esi, esi
    je L6
    mov mov eax, dword ptr [esi + 4]
    cmp cmp eax, 1
    jne L2
    push push dword ptr [esi + 8]
    mov mov ecx, ebx
    call L0
L0:
    test test eax, eax
    je sub_1006E288
    mov mov esi, dword ptr [esi + 12]
    jmp L1
    sub sub eax, 6
    je L8
    dec dec eax
    dec dec eax
    je L7
    dec dec eax
    je sub_1006E28D
L1:
    dec dec eax
    dec dec eax
    je sub_1006E26E
    dec dec eax
    dec dec eax
    jne sub_1006E281
    mov mov esi, dword ptr [esi + 16]
    jmp L3
    mov mov esi, dword ptr [esi + 32]
    jmp L4
    mov mov esi, dword ptr [esi + 24]
    jmp L5
    xor xor eax, eax
L3:
    inc inc eax
    jmp sub_1006E2B7
    push push 01010F7B0h
    push push 0
L5:
    push push 0
    push push ebx
    call sub_1006DD03
    add add esp, 16
    jmp sub_1006E2C9
    mov mov esi, dword ptr [esi + 16]
    test test esi, esi
    jl sub_1006E2D0
    cmp cmp esi, 2
    jle sub_1006E2B0
L7:
    xor xor eax, eax
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 4
FUN_1006e1ef ENDP
END
