.686
.MODEL FLAT, C
EXTRN sub_100650C3:PROC
EXTRN sub_10082EA3:PROC
EXTRN sub_10099562:PROC
EXTRN sub_1009957B:PROC
EXTRN sub_100A0803:PROC
EXTRN sub_100A0815:PROC
.CODE
FUN_100a0aba PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    test edi, edi
    mov esi, ecx
    je L2
    lea eax, [ebp + 12]
    push eax
    push dword ptr [ebp + 12]
    call sub_100A0803
    test eax, eax
    jl L1
    lea eax, [ebp + 8]
    push eax
    push dword ptr [ebp + 16]
    mov ecx, esi
    call sub_100A0815
    test eax, eax
    jl L1
    cmp dword ptr [ebp + 12], 1
    jb L0
    cmp dword ptr [ebp + 12], 4
    ja L0
    cmp dword ptr [ebp + 8], 1
    jb L0
    cmp dword ptr [ebp + 8], 4
    ja L0
    push 36
    call sub_100650C3
    test eax, eax
    je L2
    push 0
    push dword ptr [ebp + 8]
    mov ecx, eax
    push dword ptr [ebp + 12]
    push dword ptr [edi + 20]
    push 2
    call sub_10082EA3
    jmp L3
L0:
    push 4
    push 010115288h
    push 000000BEDh
    lea eax, [esi + 32]
    push eax
    push esi
    call sub_10099562
    add esp, 20
    jmp L2
L1:
    push 010115250h
    push 000000BF5h
    lea eax, [esi + 32]
    push eax
    push esi
    call sub_1009957B
    add esp, 16
L2:
    xor eax, eax
L3:
    pop edi
    pop esi
    pop ebp
    ret 12
FUN_100a0aba ENDP
END
