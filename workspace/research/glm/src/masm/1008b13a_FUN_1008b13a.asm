.686
.MODEL FLAT, C
EXTRN sub_10067D77:PROC
EXTRN sub_100F61DC:PROC
.CODE
FUN_1008b13a PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000100h
    lea eax, [ebp + 24]
    push eax
    push dword ptr [ebp + 20]
    lea eax, [ebp - 000000100h]
    push 000000100h
    push eax
    call sub_100F61DC
    mov ecx, dword ptr [ebp + 12]
    xor eax, eax
    add esp, 16
    cmp ecx, eax
    mov byte ptr [ebp - 1], al
    je L2
    mov edx, dword ptr [ecx + 4]
    cmp edx, 3
    je L1
    cmp edx, 6
    je L0
    cmp edx, 13
    jne L2
    lea eax, [ecx + 48]
    jmp L2
L0:
    mov eax, dword ptr [ecx + 20]
    add eax, 16
    jmp L2
L1:
    lea eax, [ecx + 16]
L2:
    lea ecx, [ebp - 000000100h]
    push ecx
    push 010193358h
    push dword ptr [ebp + 16]
    push eax
    mov eax, dword ptr [ebp + 8]
    push dword ptr [eax + 0000000C4h]
    call sub_10067D77
    add esp, 20
    xor eax, eax
    leave
    ret
FUN_1008b13a ENDP
END
