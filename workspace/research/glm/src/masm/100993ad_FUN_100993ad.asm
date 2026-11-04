.686
.MODEL FLAT, C
EXTRN sub_10067C99:PROC
EXTRN sub_10067D60:PROC
EXTRN sub_100F61EF:PROC
EXTRN sub_100F793D:PROC
EXTRN sub_100F7979:PROC
.CODE
FUN_100993ad PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000100h
    push esi
    mov esi, dword ptr [ebp + 12]
    push edi
    push 13
    mov edi, 01010C5E8h
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L0
    lea eax, [ebp + 16]
    push eax
    push dword ptr [ebp + 12]
    lea eax, [ebp - 000000100h]
    push 000000100h
    push eax
    call sub_100F61EF
    mov esi, dword ptr [ebp + 8]
    lea eax, [ebp - 000000100h]
    push eax
    push 010193358h
    push 0
    lea eax, [esi + 32]
    push eax
    mov eax, dword ptr [esi + 4]
    add eax, 24
    push eax
    mov byte ptr [ebp - 1], 0
    call sub_10067C99
    add esp, 36
    jmp L13
L0:
    mov esi, dword ptr [ebp + 8]
    cmp dword ptr [esi + 64], 0
    jne L13
    lea edi, [esi + 32]
    mov eax, dword ptr [edi]
    cmp eax, 9
    jg L6
    je L4
    test eax, eax
    je L3
    cmp eax, 1
    je L2
    jle L7
    cmp eax, 4
    jle L1
    cmp eax, 8
    jg L7
    push 010114700h
    jmp L11
L1:
    push 0101146ECh
    jmp L11
L2:
    lea eax, [esi + 40]
    push eax
    jmp L5
L3:
    push 01010CAE4h
    jmp L11
L4:
    push dword ptr [esi + 40]
L5:
    push 01010CA78h
    lea eax, [ebp - 000000100h]
    push 000000100h
    push eax
    call sub_100F793D
    add esp, 16
    jmp L12
L6:
    sub eax, 10
    je L10
    dec eax
    dec eax
    je L9
    dec eax
    je L8
L7:
    push 01010CA48h
    jmp L11
L8:
    push 01010CA50h
    jmp L11
L9:
    push 01010CA5Ch
    jmp L11
L10:
    push 01010CA68h
L11:
    lea eax, [ebp - 000000100h]
    push 000000100h
    push eax
    call sub_100F7979
    add esp, 12
L12:
    lea eax, [ebp - 000000100h]
    push eax
    mov eax, dword ptr [esi + 4]
    push 0101146D0h
    push 000000BB8h
    add eax, 24
    push edi
    push eax
    call sub_10067D60
    add esp, 20
L13:
    pop edi
    mov dword ptr [esi + 64], 1
    pop esi
    leave
    ret
FUN_100993ad ENDP
END
