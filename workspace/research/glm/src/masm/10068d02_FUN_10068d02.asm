.686
.MODEL FLAT, C
EXTRN sub_10067C78:PROC
EXTRN sub_10067D6A:PROC
.CODE
FUN_10068d02 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 16]
    and eax, 00000FFFFh
    dec eax
    je L1
    dec eax
    je L0
    sub eax, 3
    je L1
    dec eax
    jne L2
L0:
    mov eax, dword ptr [ebp + 20]
    push esi
    push dword ptr [ebp + 24]
    mov esi, dword ptr [ebp + 28]
    push 010193358h
    add eax, 000001388h
    push eax
    push dword ptr [esi + 48]
    push dword ptr [esi]
    call sub_10067C78
    add esp, 20
    mov dword ptr [esi + 76], 1
    pop esi
    jmp L2
L1:
    push dword ptr [ebp + 24]
    mov eax, dword ptr [ebp + 20]
    push 010193358h
    add eax, 000001388h
    push eax
    mov eax, dword ptr [ebp + 28]
    push dword ptr [eax + 48]
    push dword ptr [eax]
    call sub_10067D6A
    add esp, 20
L2:
    xor eax, eax
    pop ebp
    ret 24
FUN_10068d02 ENDP
END
