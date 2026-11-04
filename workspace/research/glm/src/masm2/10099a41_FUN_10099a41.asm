.686
.MODEL FLAT, C
EXTRN sub_100995DE:PROC
EXTRN sub_10099AB5:PROC
EXTRN sub_10099AB6:PROC
EXTRN sub_10099ACB:PROC
EXTRN sub_10099ADD:PROC
EXTRN sub_10099AFD:PROC
EXTRN sub_10099B13:PROC
.CODE
FUN_10099a41 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    push push edi
    mov mov edi, ecx
    test test esi, esi
    je L7
    mov mov eax, dword ptr [esi + 4]
    cmp cmp eax, 1
    jne L2
    push push dword ptr [esi + 8]
    mov mov ecx, edi
    call L0
L0:
    test test eax, eax
    jne L6
    mov mov esi, dword ptr [esi + 12]
    jmp L1
    sub sub eax, 6
    je sub_10099AB6
    dec dec eax
    dec dec eax
    je sub_10099AB5
    dec dec eax
    je sub_10099ADD
L1:
    dec dec eax
    dec dec eax
    jne sub_10099ACB
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
    jmp sub_10099AFD
    push push 01010F7B0h
    push push 0
L5:
    push push 0
    push push edi
    call sub_100995DE
    add add esp, 16
    xor xor eax, eax
    jmp sub_10099B13
    mov mov eax, dword ptr [esi + 32]
    and and eax, 0200h
    pop pop edi
    pop pop esi
    pop pop ebp
L6:
    ret ret 4
FUN_10099a41 ENDP
END
