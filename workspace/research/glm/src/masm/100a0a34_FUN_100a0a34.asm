.686
.MODEL FLAT, C
EXTRN sub_100650BA:PROC
EXTRN sub_10082E99:PROC
EXTRN sub_10099511:PROC
EXTRN sub_10099558:PROC
EXTRN sub_100A07FF:PROC
.CODE
FUN_100a0a34 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    test esi, esi
    push edi
    mov edi, ecx
    je L2
    lea eax, [ebp + 8]
    push eax
    push dword ptr [ebp + 12]
    call sub_100A07FF
    test eax, eax
    jge L0
    push 010115218h
    push 000000BF4h
    lea eax, [edi + 32]
    push eax
    push edi
    call sub_10099511
    add esp, 16
    jmp L2
L0:
    cmp dword ptr [ebp + 8], 1
    jb L1
    cmp dword ptr [ebp + 8], 4
    ja L1
    push 36
    call sub_100650BA
    test eax, eax
    je L2
    push 0
    push dword ptr [ebp + 8]
    mov ecx, eax
    push 1
    push dword ptr [esi + 20]
    push 1
    call sub_10082E99
    jmp L3
L1:
    push 4
    push 0101151ECh
    push 000000BECh
    lea eax, [edi + 32]
    push eax
    push edi
    call sub_10099558
    add esp, 20
L2:
    xor eax, eax
L3:
    pop edi
    pop esi
    pop ebp
    ret 8
FUN_100a0a34 ENDP
END
