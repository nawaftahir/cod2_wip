.686
.MODEL FLAT, C
EXTRN sub_1008B15E:PROC
EXTRN sub_100C4D37:PROC
EXTRN sub_100C7B80:PROC
EXTRN sub_100C98D5:PROC
.CODE
FUN_100a5127 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    cmp dword ptr [esi + 000000158h], 0
    je L0
    xor eax, eax
    jmp L6
L0:
    push 00200001Fh
    mov ecx, esi
    call sub_100C98D5
    test eax, eax
    jl L6
    push edi
    mov edi, dword ptr [ebp + 8]
    mov eax, dword ptr [edi + 60]
    cmp eax, 000200000h
    jne L2
    push 090000000h
L1:
    mov ecx, esi
    call sub_100C7B80
    test eax, eax
    jl L5
    mov ecx, dword ptr [edi + 12]
    mov eax, dword ptr [esi]
    push 0
    and ecx, 0000007FFh
    or ecx, 0A0000800h
    push 0000F0000h
    push ecx
    mov ecx, esi
    call dword ptr [eax + 0x64]
    test eax, eax
    jl L5
    mov ecx, esi
    call sub_100C4D37
    test eax, eax
    jl L5
    xor eax, eax
    jmp L5
L2:
    cmp eax, 000400000h
    jne L3
    push 0A0000000h
    jmp L1
L3:
    cmp eax, 000800000h
    jne L4
    push 098000000h
    jmp L1
L4:
    push 010115C80h
    push 0000012CEh
    push 0
    push esi
    call sub_1008B15E
    add esp, 16
    mov eax, 080004005h
L5:
    pop edi
L6:
    pop esi
    pop ebp
    ret 4
FUN_100a5127 ENDP
END
